package com.example.eshop3.Controller;

import com.example.eshop3.Servlet.*;
import com.example.eshop3.Servlet.implement.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})

public class HomeServlet extends HttpServlet {

    private IOrderItemService orderItemService = new OrderItemService();
    private IOrderService orderService = new OrderService();
    private IStatussService StatussService = new StatussService();
    private ICustomerService customerService = new CustomerService();
    private IUserService userService = new UserService();

    private IProductService productService = new ProductService();

    public void init() {
        System.out.println("init............................................");
        if (this.getServletContext().getAttribute("listUser") == null) {
            this.getServletContext().setAttribute("listUser", userService.selectAllUser());
            System.out.println(userService.selectAllUser().size());
        } else {
            this.getServletContext().removeAttribute("listUser");
            this.getServletContext().setAttribute("listUser", userService.selectAllUser());
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


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        init();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/home.jsp");
        requestDispatcher.forward(request, response);


    }
}
