package com.example.eshop3.Controller;

import com.example.eshop3.Model.User;
import com.example.eshop3.Servlet.IUserService;
import com.example.eshop3.Servlet.implement.UserService;
import utils.AppUtils;
import utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

@WebServlet(name = "SignupServlet", urlPatterns = "/signup")
public class SignupServlet extends HttpServlet {
    private IUserService userService = new UserService();

    private LoginServlet loginServlet = new LoginServlet();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Server path: " + this.getServletContext().getRealPath("/"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/signup.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        User newUser = new User();
        RequestDispatcher requestDispatcher;
        List<String> errors = new ArrayList<>();
        String id = "US" + System.currentTimeMillis() / 1000;
        newUser.setId(id);
        validateFullName(request, errors, newUser);
        validateBirthday(request, errors, newUser);
        validatePhonenumber(request, errors, newUser);
        validateEmail(request, errors, newUser);
        String address = request.getParameter("address");
        newUser.setAddress(address);
        int role = 2;
        newUser.setRole(role);
        validatePassword(request, errors, newUser);
        newUser.setCreatedTime(LocalDateTime.now());
        String image = request.getParameter("file");
        for (Part part : request.getParts()) {
            System.out.println("Content type of Part: " + part.getContentType());
            System.out.println("Name of Part: " + part.getName());
            if (part.getName().equals("file")) {
                String fileName = extractFileName(part);
                fileName = new File(fileName).getName();
//                part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
                if (fileName.isEmpty()) {
                    newUser.setImage("image\\avatar.jpg");
                } else {
                    String servletPath = ("image\\" +fileName);
                    part.write("G:\\Module3\\Exercise\\Servlet\\eshop5\\src\\main\\webapp\\image\\" +fileName);
                    String servletRealPath = this.getServletContext().getRealPath("/") + "\\image\\" + fileName;
                    System.out.println("servletRealPath...................: " + servletRealPath);
                    part.write(servletRealPath);
                    newUser.setImage(servletPath);
                }
            }
        }


        if (errors.isEmpty()) {
            userService.insertUser(newUser);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("user",newUser);
            HttpSession httpSessionmess = request.getSession();
            httpSessionmess.setAttribute("usermess",newUser);
            request.setAttribute("message", "Sign Up Success");
            loginServlet.doPost(request,resp);
//            requestDispatcher = request.getRequestDispatcher("/WEB-INF/login.jsp");
//            requestDispatcher.forward(request, resp);
        } else {
            request.setAttribute("newUser", newUser);
            request.setAttribute("errors", errors);
            requestDispatcher = request.getRequestDispatcher("/WEB-INF/signup.jsp");
            requestDispatcher.forward(request, resp);

        }

    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    public File getFolderUpload() {
        File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
        System.out.println(System.getProperty("user.home") + "/Uploads");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    private void validatePassword(HttpServletRequest request, List<String> errors, User newUser) {
        String password = request.getParameter("password");
        String password1 = request.getParameter("password1");
        if (!ValidateUtils.isPasswordValid(password)) {
            errors.add("Mật khẩu không đúng định dạng. Mật khẩu bao gồm 1 chữ hoa, 1 số, và 1 kí tự đặc biệt");
        }
        if (!password.equals(password1)) {
            errors.add("Mật khẩu không trùng");
        }
        newUser.setPassword(password);
    }

    private void validateEmail(HttpServletRequest request, List<String> errors, User newUser) {
        String email = request.getParameter("email");
        if (!ValidateUtils.isEmailValid(email))
            errors.add("Email không hợp lệ (Ví dụ: hoang123@gmail.com)");
        if (userService.selectUserByEmail(email) != null)
            errors.add("Email đã tồn tại trong hệ thống");
        newUser.setEmail(email);
    }

    private void validatePhonenumber(HttpServletRequest request, List<String> errors, User newUser) {
        String phoneNumber = request.getParameter("phoneNumber");
        try {
            if (!ValidateUtils.isPhoneValid(phoneNumber))
                errors.add("Số điện thoại không hợp lệ (Số điện thoại bao gồm 10 chữ số, bắt đầu từ số 0)");
            if (userService.selectUserByPhoneNumber(phoneNumber) != null)
                errors.add("Số điện thoại đã tồn tại trong hệ thống");
            newUser.setPhoneNumber(phoneNumber);
        } catch (NumberFormatException e) {
            errors.add("Số điện thoại không đúng định dạng");
        }

    }

    private void validateBirthday(HttpServletRequest request, List<String> errors, User newUser) {

        try {
            LocalDate birthDay = null;
            birthDay = AppUtils.stringToLocalDate(request.getParameter("birthDay"));
            newUser.setBirthDay(birthDay);
        } catch (Exception e) {
            errors.add("Định dạng ngày sinh không hợp lệ");
            newUser.setBirthDay(LocalDate.now());
        }
    }

    private void validateFullName(HttpServletRequest request, List<String> errors, User newUser) {
        String fullName = request.getParameter("fullName");
        if (!ValidateUtils.isFullNameValid(fullName)) {
            errors.add("Họ và tên có từ 8-20 kí tự. Viết hoa chữ cái đầu tiên. ví dụ: Tran Nhat Hoang");
        }
        newUser.setFullName(fullName);
    }
}
