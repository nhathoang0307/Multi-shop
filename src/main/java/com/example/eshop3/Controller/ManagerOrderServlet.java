package com.example.eshop3.Controller;

import com.example.eshop3.Model.Order;
import com.example.eshop3.Model.OrderItem;
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

@WebServlet(name = "manager-oder-Servlet", urlPatterns = {"/manager-oder"})
public class ManagerOrderServlet extends HttpServlet {

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
        }
        if (this.getServletContext().getAttribute("listProduct") == null) {
            this.getServletContext().setAttribute("listProduct", productService.selectAllProduct());
            System.out.println(productService.selectAllProduct().size());
        }
        if (this.getServletContext().getAttribute("listOrder") == null) {
            this.getServletContext().setAttribute("listOrder", orderService.showAllOrder());
            System.out.println(orderService.showAllOrder().size());
        }
        else {
            updateListOrder();
        }
        if (this.getServletContext().getAttribute("listCustomer") == null) {
            this.getServletContext().setAttribute("listCustomer", customerService.selectAllCustomer());
            System.out.println(customerService.selectAllCustomer().size());
        }
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
            case "listorderTransport":
                listorderTransport(req, resp);
                break;
            case "listorderDone":
                listorderDone(req, resp);
                break;
            case "vieworderItem":
                vieworderItem(req, resp);
                break;
            case "vieworderItemFromUser":
                vieworderItemFromUser(req, resp);
                break;
            case "orderapproval":
                orderapproval(req, resp);
                break;
            case "confrimdelivered":
                confrimdelivered(req, resp);
                break;
            default:
                showListOrder(req, resp);
        }
    }

    private void vieworderItemFromUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        RequestDispatcher requestDispatcher;
        Order order = orderService.selectOrderById(id);
        System.out.println(order.getStatusId());
        List<OrderItem> orderItems = orderItemService.selectOrderItemByOrderId(id);
        System.out.println(orderItems.size());
        req.setAttribute("order", order);
        req.setAttribute("orderItems", orderItems);
        req.setAttribute("products", productService.selectAllProduct());
        System.out.println(productService.selectAllProduct().size());
        requestDispatcher = req.getRequestDispatcher("/WEB-INF/customer/vieworderitem.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void confrimdelivered(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Order order = orderService.selectOrderById(id);
        order.setStatusId(4);
        orderService.UpdateStatus(order);
        System.out.println("đã update");
        req.setAttribute("message", "order delivered");
        listorderTransport(req, resp);
        //        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/order/listorderTransport.jsp");
//        requestDispatcher.forward(req, resp);
    }

    private void orderapproval(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Order order = orderService.selectOrderById(id);
        order.setStatusId(3);
        orderService.UpdateStatus(order);
        System.out.println("đã update");
        req.setAttribute("message", "Order approved,shipping");
        showListOrder(req, resp);
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/order/listorderview.jsp");
//        requestDispatcher.forward(req, resp);

    }

    private void vieworderItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        RequestDispatcher requestDispatcher;
        Order order = orderService.selectOrderById(id);
        System.out.println(order.getStatusId());
        List<OrderItem> orderItems = orderItemService.selectOrderItemByOrderId(id);
        System.out.println(orderItems.size());
        req.setAttribute("order", order);
        req.setAttribute("orderItems", orderItems);
        req.setAttribute("products", productService.selectAllProduct());
        System.out.println(productService.selectAllProduct().size());
        requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/order/vieworderitem.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void listorderDone(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orders = orderService.showAllOrder();
        req.setAttribute("orders", orders);
        req.setAttribute("statuss", StatussService.selectAllStatus());
        req.setAttribute("customers", customerService.selectAllCustomer());
        req.setAttribute("users", userService.selectAllUser());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/order/listorderDone.jsp");
        dispatcher.forward(req, resp);
    }

    private void listorderTransport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orders = orderService.showAllOrder();
        req.setAttribute("orders", orders);
        req.setAttribute("statuss", StatussService.selectAllStatus());
        req.setAttribute("customers", customerService.selectAllCustomer());
        req.setAttribute("users", userService.selectAllUser());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/order/listorderTransport.jsp");
        dispatcher.forward(req, resp);
    }

    private void showListOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orders = orderService.showAllOrder();
        req.setAttribute("orders", orders);
        req.setAttribute("statuss", StatussService.selectAllStatus());
        req.setAttribute("customers", customerService.selectAllCustomer());
        req.setAttribute("users", userService.selectAllUser());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/admin/order/listorderview.jsp");
        dispatcher.forward(req, resp);

    }

    private void updateListOrder() {
        this.getServletContext().removeAttribute("listOrder");
        this.getServletContext().setAttribute("listOrder", orderService.showAllOrder());
        System.out.println(orderService.showAllOrder().size());
    }
}
