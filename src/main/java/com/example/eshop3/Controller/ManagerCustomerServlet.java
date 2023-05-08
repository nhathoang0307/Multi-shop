package com.example.eshop3.Controller;

import com.example.eshop3.Model.Customer;
import com.example.eshop3.Servlet.*;
import com.example.eshop3.Servlet.implement.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "manager-customer-servlet", urlPatterns = {"/manager-customer"})
public class ManagerCustomerServlet extends HttpServlet {
    private IOrderItemService orderItemService = new OrderItemService();
    private IOrderService orderService = new OrderService();
    private IStatussService StatussService = new StatussService();
    private ICustomerService customerService = new CustomerService();
    private IUserService userService = new UserService();

    private IProductService productService = new ProductService();

    public void init() {
        System.out.println("init manager Customer............................................");
        if (this.getServletContext().getAttribute("listUser") == null) {
            this.getServletContext().setAttribute("listUser", userService.selectAllUser());
        }
        System.out.println("size user: " + userService.selectAllUser().size());
        if (this.getServletContext().getAttribute("listProduct") == null) {
            this.getServletContext().setAttribute("listProduct", productService.selectAllProduct());
        }
        System.out.println("size product: " +productService.selectAllProduct().size());
        if (this.getServletContext().getAttribute("listOrder") == null) {
            this.getServletContext().setAttribute("listOrder", orderService.showAllOrder());
        }
        System.out.println("size order: " + orderService.showAllOrder().size());
        if (this.getServletContext().getAttribute("listCustomer") == null) {
            this.getServletContext().setAttribute("listCustomer", customerService.selectAllCustomer());
        } else {
            updateListCustomer();
        }
        System.out.println("size Customer: " + customerService.selectAllCustomer().size());

    }

    private void updateListCustomer() {
        this.getServletContext().removeAttribute("listCustomer");
        this.getServletContext().setAttribute("listCustomer", customerService.selectAllCustomer());
        System.out.println("size Customer: " + customerService.selectAllCustomer().size());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        init();
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        RequestDispatcher requestDispatcher;
        switch (action) {
            case "listcustomer":
                List<Customer> customerList = customerService.selectAllCustomer();
                req.setAttribute("customerList", customerList);
                requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/customer/view.jsp");
                requestDispatcher.forward(req, resp);
                break;
            case "listNewcustomer":
                List<com.example.eshop3.Model.Customer> customerListNew = customerService.selectAllNewCustomer();
                req.setAttribute("customerListNew", customerListNew);
                requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/customer/viewNew.jsp");
                requestDispatcher.forward(req, resp);
                break;
        }
    }
}
