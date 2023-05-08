//package com.example.eshop3.Controller;
//
//import com.example.eshop3.Model.Role;
//import com.example.eshop3.Servlet.IRoleService;
//import com.example.eshop3.Servlet.implement.RoleService;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(name = "UserServlet", urlPatterns = "/user")
//public class UserServlet extends HttpServlet {
//
//
//    private IRoleService roleService = new RoleService();
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        session.getAttribute("user");
//        List<Role> role = roleService.selectAllRole();
//        request.setAttribute("listRole",role);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/info/view.jsp");
//        dispatcher.forward(request, response);
//    }
//}


package com.example.eshop3.Controller;

import com.example.eshop3.Model.Order;
import com.example.eshop3.Model.User;
import com.example.eshop3.Servlet.*;
import com.example.eshop3.Servlet.implement.*;
import utils.AppUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    private IOrderItemService orderItemService = new OrderItemService();
    private IOrderService orderService = new OrderService();
    private ICustomerService customerService = new CustomerService();
    private IUserService userService = new UserService();

    private IRoleService roleService = new RoleService();
    private IProductService productService = new ProductService();

    private IStatussService StatussService = new StatussService();


    public void init() {
        System.out.println("init............................................");
        if (this.getServletContext().getAttribute("listUser") == null) {
            this.getServletContext().setAttribute("listUser", userService.selectAllUser());
            System.out.println(userService.selectAllUser().size());
        }
        else {
            updateListUser();
        }
        if (this.getServletContext().getAttribute("listProduct") == null) {
            this.getServletContext().setAttribute("listProduct", productService.selectAllProduct());
            System.out.println(productService.selectAllProduct().size());
        }
        if (this.getServletContext().getAttribute("listOrder") == null) {
            this.getServletContext().setAttribute("listOrder", orderService.showAllOrder());
            System.out.println(orderService.showAllOrder().size());
        }
        if (this.getServletContext().getAttribute("listCustomer") == null) {
            this.getServletContext().setAttribute("listCustomer", customerService.selectAllCustomer());
            System.out.println(customerService.selectAllCustomer().size());
        }
    }

    private void updateListUser() {
        this.getServletContext().removeAttribute("listUser");
        this.getServletContext().setAttribute("listUser", userService.selectAllUser());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        init();
        HttpSession httpSession = request.getSession();
        User user = null;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (user.getRole() == 1) {
            switch (action) {
                case "create":
                    showCreate(request, response);
                    break;
                case "editInfo":
                    showEditInfo(request, response);
                    break;
                case "edituser":
                    showEditUser(request, response);
                    break;
                case "view":
                    showView(request, response);
                    break;
                case "removeuser":
                    removeuser(request, response);
                    break;
                case "changepass":
//                showChangePassForm(request, response);
                    break;
                default:
                    listUserPagging(request, response);
                    break;
            }
        } else {
            switch (action) {
                case "editInfo":
                    showEditInfoFromUser(request, response);
                    break;
                case "view":
                    showViewInfoFromUser(request, response);
                    break;
                case "viewHistoryOrder":
                    showViewHistoryOrder(request, response);
                    break;
            }
        }
    }

    private void showViewHistoryOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        User user = null;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
        }
        List<Order> orders = orderService.selectOrderByUserId(user.getId());
        req.setAttribute("orders", orders);

        req.setAttribute("statuss", StatussService.selectAllStatus());
        req.setAttribute("customers", customerService.selectAllCustomer());
        req.setAttribute("users", userService.selectAllUser());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/historyOrder.jsp");
        dispatcher.forward(req, resp);
    }

    private void removeuser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        User user = userService.selectUser(id);
        if (user != null && orderService.checkOrderExit(id) == true) {
            request.setAttribute("message", "User ordered, cannot be deleted");
        } else if (user != null && orderService.checkOrderExit(id) == false) {
            userService.deleteUser(id);
            updateListUser();
            request.setAttribute("message", "Remove User Success");
        } else if (user == null) {
            request.setAttribute("message", "User không tồn tại");
        }

//        response.sendRedirect("/user");
        listUserPagging(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        User user = null;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (user.getRole() == 1) {
            switch (action) {
                case "create":
                    createUser(request, response);
                    break;
                case "edituser":
                    editUser(request, response);
                    break;
                case "editInfo":
                    editInfoAdmin(request, response);
                case "search":
//                searchUser(request, response);
                    break;
                case "changepass":
//                changePassword(request, response);
                    break;
            }
        } else {
            switch (action) {
                case "editInfo":
                    editInfoUser(request, response);
                    break;
            }
        }
    }

    private void showEditUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        RequestDispatcher requestDispatcher;
        User user = userService.selectUser(id);
        request.setAttribute("user", user);
        request.setAttribute("listRole", roleService.selectAllRole());
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/user/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showEditInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.getAttribute("user");
        request.setAttribute("listRole", roleService.selectAllRole());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/info/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditInfoFromUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.getAttribute("user");
        request.setAttribute("listRole", roleService.selectAllRole());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/customer/edit.jsp");
        dispatcher.forward(request, response);
    }


    private void editInfoAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        User user = null;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
        }
        String id = request.getParameter("id");
        String fullName = request.getParameter("fullName");
        LocalDate birthDay = AppUtils.stringToLocalDate(request.getParameter("birthDay"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        String password = request.getParameter("password");
        user.setId(id);
        user.setFullName(fullName);
        user.setBirthDay(birthDay);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setAddress(address);
        user.setImage(image);
        user.setPassword(password);
        user.setUpdatedTime(LocalDateTime.now());
        userService.updateUser(user);
        httpSession.setAttribute("user", user);
        request.setAttribute("listRole", roleService.selectAllRole());
        request.setAttribute("message","Edit Success");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/info/view.jsp");
        dispatcher.forward(request, response);
    }

    private void editInfoUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        User user = null;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
        }
        System.out.println("Role" + user.getRole());
        String id = request.getParameter("id");
        String fullName = request.getParameter("fullName");
        LocalDate birthDay = AppUtils.stringToLocalDate(request.getParameter("birthDay"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        String password = request.getParameter("password");
        user.setId(id);
        user.setFullName(fullName);
        user.setBirthDay(birthDay);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setAddress(address);
        user.getRole();
        user.setImage(image);
        user.setPassword(password);
        user.setUpdatedTime(LocalDateTime.now());
        userService.updateUser(user);
        httpSession.setAttribute("user", user);
        request.setAttribute("listRole", roleService.selectAllRole());
        request.setAttribute("message","Edit Success");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/customer/view.jsp");
        dispatcher.forward(request, response);



    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User newUser = new User();
        RequestDispatcher requestDispatcher;
        List<String> errors = new ArrayList<>();
        String id = request.getParameter("id");
        newUser.setFullName(id);
        int role;
        String fullName = request.getParameter("fullName");
        newUser.setFullName(fullName);
        LocalDate birthDay = null;
        birthDay = AppUtils.stringToLocalDate(request.getParameter("birthDay"));
        newUser.setBirthDay(birthDay);
        String phoneNumber = request.getParameter("phoneNumber");
        newUser.setPhoneNumber(phoneNumber);
        String email = request.getParameter("email");
        newUser.setEmail(email);
        String address = request.getParameter("address");
        newUser.setAddress(address);
        role = Integer.parseInt(request.getParameter("role"));
        newUser.setRole(role);
        String image = request.getParameter("image");
        newUser.setImage(image);
        String password = request.getParameter("password");
        newUser.setPassword(password);
        User user = new User(id, fullName, birthDay, phoneNumber, email, address, image, role, password);
        user.setUpdatedTime(LocalDateTime.now());
        userService.updateUser(user);
        request.setAttribute("user", user);
        request.setAttribute("listRole", roleService.selectAllRole());
        request.setAttribute("message", "Edit Success User");
        listUserPagging(request,response);

//        requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/user/edit.jsp");
//        requestDispatcher.forward(request, response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User newUser = new User();
        RequestDispatcher requestDispatcher;
        List<String> errors = new ArrayList<>();
        String id = "US" + System.currentTimeMillis() / 1000;
        int role = -1;
        String fullName = request.getParameter("fullName");
        newUser.setFullName(fullName);
        LocalDate birthDay = null;
        birthDay = AppUtils.stringToLocalDate(request.getParameter("birthDay"));
        newUser.setBirthDay(birthDay);
        String phoneNumber = request.getParameter("phoneNumber");
        newUser.setPhoneNumber(phoneNumber);
        String email = request.getParameter("email");
        newUser.setEmail(email);
        String address = request.getParameter("address");
        newUser.setAddress(address);
        role = Integer.parseInt(request.getParameter("role"));
        newUser.setRole(role);
        String image = request.getParameter("image");
        newUser.setImage(image);
        String password = request.getParameter("password");
        newUser.setPassword(password);
        User user = new User(id, fullName, birthDay, phoneNumber, email, address, image, role, password);
        user.setCreatedTime(LocalDateTime.now());
        userService.insertUser(user);
        updateListUser();
        request.setAttribute("message", "Create User Success ");
        listUserPagging(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.getAttribute("user");
        request.setAttribute("listRole", roleService.selectAllRole());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/info/view.jsp");
        dispatcher.forward(request, response);
    }

    private void showViewInfoFromUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.getAttribute("user");
        request.setAttribute("listRole", roleService.selectAllRole());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/customer/view.jsp");
        dispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userService.selectAllUser();
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/user/view.jsp");
        dispatcher.forward(request, response);
    }


    private void listUserPagging(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 3;

        List<Integer> numberOflines = new ArrayList<>();
        numberOflines.add(3);
        numberOflines.add(10);
        numberOflines.add(25);
        numberOflines.add(50);
        numberOflines.add(100);


        System.out.println(request.getParameter("table4_length"));
        if (request.getParameter("table4_length") != null) {
            recordsPerPage = Integer.parseInt(request.getParameter("table4_length"));
            System.out.println("recordsPerPage" + recordsPerPage);
        }

        String q = "";
        if (request.getParameter("q") != null) {
            System.out.println("aaaaaaaaaa");
            q = request.getParameter("q");
        }

        if (request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));

        List<User> listUser = userService.selectUsersPagging((page - 1) * recordsPerPage, recordsPerPage, q);
        int noOfRecords = userService.getNoOfRecords();
        System.out.println("noOfRecords" + noOfRecords);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        System.out.println("noOfPages" + noOfPages);
        int start;
        int end;
        if (noOfPages == 2) {
            start = page == 1 ? 1 : page == noOfPages ? page - 1 : page - 1;
            end = page == noOfPages ? noOfPages : page == 1 ? page + 1 : page + 1;
            System.out.println("start :" + start);
            System.out.println("end: " + end);
        } else {
            start = page == 1 ? 1 : page == noOfPages ? page - 2 : page - 1;
            end = page == noOfPages ? noOfPages : page == 1 ? page + 2 : page + 1;
            System.out.println("start :" + start);
            System.out.println("end: " + end);
        }

        request.setAttribute("numberOflines", numberOflines);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("users", listUser);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("currentPage", page);
        request.setAttribute("q", q);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/user/view.jsp");
        view.forward(request, response);
    }

}


