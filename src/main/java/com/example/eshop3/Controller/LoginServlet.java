package com.example.eshop3.Controller;

import com.example.eshop3.Model.Product;
import com.example.eshop3.Model.User;
import com.example.eshop3.Servlet.*;
import com.example.eshop3.Servlet.implement.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    private IUserService iUserService = new UserService();
    private IProductService productService = new ProductService();

    private IOrderItemService orderItemService = new OrderItemService();
    private IOrderService orderService = new OrderService();
    private IStatussService StatussService = new StatussService();
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/login.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        HttpSession httpSessionmess = req.getSession();
        User user;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
        }
//            if (user.getRole() == 1) {
//                resp.sendRedirect("/home");
//            } else {
//                System.out.println(user.getImage());
//                resp.sendRedirect("/trangchu");
//            }
//        } else {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        RequestDispatcher requestDispatcher;
        user = iUserService.checklogin(email, password);
        System.out.println(user);
        if (iUserService.checkEmail(email) == true && iUserService.checkPassword(password) == false) {
            req.setAttribute("errors", "Wrong Password");
            requestDispatcher = req.getRequestDispatcher("/WEB-INF/login.jsp");
            requestDispatcher.forward(req, resp);
        } else if (iUserService.checkEmail(email) == false && iUserService.checkPassword(password) == true) {
            req.setAttribute("errors", "Wrong email");
            requestDispatcher = req.getRequestDispatcher("/WEB-INF/login.jsp");
            requestDispatcher.forward(req, resp);
        } else if (iUserService.checkEmail(email) == false && iUserService.checkPassword(password) == false) {
            req.setAttribute("errors", "The account does not exist in the system, You need to register");
            requestDispatcher = req.getRequestDispatcher("/WEB-INF/login.jsp");
            requestDispatcher.forward(req, resp);
        } else if (iUserService.checkEmail(email) == true && iUserService.checkPassword(password) == true) {
            httpSession.setAttribute("user", user);
            if (user.getRole() == 1) {
                req.setAttribute("message", "Logged in successfully");
                total();
                requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/home.jsp");
                requestDispatcher.forward(req, resp);
//                resp.sendRedirect("/home");
            } else {
                if (httpSessionmess.getAttribute("usermess") != null) {
                    req.setAttribute("message", "Sign Up Success");
                    httpSessionmess.removeAttribute("usermess");
                } else {
                    req.setAttribute("message", "Logged in successfully");
                }
                List<Product> products = productService.selectAllProduct();
                req.setAttribute("products", products);
                requestDispatcher = req.getRequestDispatcher("/WEB-INF/home.jsp");
                requestDispatcher.forward(req, resp);
//                    resp.sendRedirect("/trangchu");
            }
        }
    }

    public void total() {
        if (this.getServletContext().getAttribute("listUser") == null) {
            this.getServletContext().setAttribute("listUser", iUserService.selectAllUser());
            System.out.println(iUserService.selectAllUser().size());
        } else {
            this.getServletContext().removeAttribute("listUser");
            this.getServletContext().setAttribute("listUser", iUserService.selectAllUser());
        }
        if (this.getServletContext().getAttribute("listProduct") == null) {
            this.getServletContext().setAttribute("listProduct", productService.selectAllProduct());
            System.out.println(productService.selectAllProduct().size());
        } else {
            this.getServletContext().removeAttribute("listProduct");
            this.getServletContext().setAttribute("listProduct", productService.selectAllProduct());
        }
        if (this.getServletContext().getAttribute("listOrder") == null) {
            this.getServletContext().setAttribute("listOrder", orderService.showAllOrder());
            System.out.println(orderService.showAllOrder().size());
        } else {
            this.getServletContext().removeAttribute("listOrder");
            this.getServletContext().setAttribute("listOrder", orderService.showAllOrder());
        }
        if (this.getServletContext().getAttribute("listCustomer") == null) {
            this.getServletContext().setAttribute("listCustomer", customerService.selectAllCustomer());
            System.out.println(customerService.selectAllCustomer().size());
        } else {
            this.getServletContext().removeAttribute("listCustomer");
            this.getServletContext().setAttribute("listCustomer", customerService.selectAllCustomer());
        }
    }
}
