package com.example.eshop3.Controller;

import com.example.eshop3.Model.OrderItem;
import com.example.eshop3.Servlet.*;
import com.example.eshop3.Servlet.implement.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    private IUserService userService = new UserService();
    private IOrderItemService orderItemService = new OrderItemService();
    private IOrderService orderService = new OrderService();
    private ICustomerService customerService = new CustomerService();
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addmoreitem(req, resp);
                break;
            case "sub":
                subitem(req, resp);
                break;
            case "removeOne":
                removeOne(req, resp);
                break;
            default:
                listitem(req, resp);
                break;
        }
    }

    private void removeAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String id = req.getParameter("id");
//        HttpSession httpSessioncart = req.getSession();
//        List<OrderItem> orderItems = new ArrayList<>();
        int total = 0;
//        if (httpSessioncart.getAttribute("carts") != null) {
//            orderItems = (List<OrderItem>) httpSessioncart.getAttribute("carts");
//        }
//        for (OrderItem o : orderItems) {
//                orderItems.remove(o);
//            if (orderItems.size() == 0) {
//                break;
//            }
//        }
//            httpSessioncart.setAttribute("carts", orderItems);
//            req.setAttribute("carts", orderItems);
//        req.setAttribute("total", total);
//        req.setAttribute("totalFee", total+10);
//            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/shopping-cart.jsp");
//            dispatcher.forward(req, resp);
        }



    private void removeOne(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        HttpSession httpSessioncart = req.getSession();
        List<OrderItem> orderItems = new ArrayList<>();
        if (httpSessioncart.getAttribute("carts") != null) {
            orderItems = (List<OrderItem>) httpSessioncart.getAttribute("carts");
        }
        System.out.println(orderItems.size());
        int total = 0;
        for (OrderItem o : orderItems) {
            if (o.getProductId().equals(id)) {
                orderItems.remove(o);
                break;
            }
        }
        for (OrderItem o : orderItems) {
            total += (o.getPrice() * o.getQuantity());
        }
        httpSessioncart.setAttribute("carts", orderItems);
        req.setAttribute("carts", orderItems);
        req.setAttribute("total", total);
        req.setAttribute("totalFee", total+10);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/shopping-cart.jsp");
        dispatcher.forward(req, resp);
    }

    private void listitem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSessioncart = req.getSession();
        List<OrderItem> orderItems = new ArrayList<>();
        if (httpSessioncart.getAttribute("carts") != null) {
            orderItems = (List<OrderItem>) httpSessioncart.getAttribute("carts");
        }
        req.setAttribute("carts", orderItems);
        int total = 0;
        for (OrderItem o : orderItems) {
            total += (o.getPrice() * o.getQuantity());
        }
        req.setAttribute("total", total);
        req.setAttribute("totalFee", total+10);
//        req.setAttribute("quantityOrderItem", orderItems.size());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/shopping-cart.jsp");
        dispatcher.forward(req, resp);
    }


    private void subitem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        HttpSession httpSessioncart = req.getSession();
        List<OrderItem> orderItems = new ArrayList<>();
        if (httpSessioncart.getAttribute("carts") != null) {
            orderItems = (List<OrderItem>) httpSessioncart.getAttribute("carts");
        }
        int total = 0;
        for (OrderItem o : orderItems) {
            if (o.getProductId().equals(id)) {
                int quantity = o.getQuantity();
                o.setQuantity(quantity - 1);
            }
            if (o.getQuantity() == 0) {
                orderItems.remove(o);
                break;
            }
            total += (o.getPrice() * o.getQuantity());
        }
        httpSessioncart.setAttribute("carts", orderItems);
        req.setAttribute("carts", orderItems);
        req.setAttribute("total", total);
        req.setAttribute("totalFee", total+10);
//        req.setAttribute("quantityOrderItem", orderItems.size());

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/shopping-cart.jsp");
        dispatcher.forward(req, resp);
    }

    private void addmoreitem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        HttpSession httpSessioncart = req.getSession();
        List<OrderItem> orderItems = new ArrayList<>();
        if (httpSessioncart.getAttribute("carts") != null) {
            orderItems = (List<OrderItem>) httpSessioncart.getAttribute("carts");
        }
        int total = 0;
        for (OrderItem o : orderItems) {
            if (o.getProductId().equals(id)) {
                int quantity = o.getQuantity();
                o.setQuantity(quantity + 1);
            }
            total += (o.getPrice() * o.getQuantity());
        }
        httpSessioncart.setAttribute("carts", orderItems);
        req.setAttribute("carts", orderItems);
        req.setAttribute("total", total);
        req.setAttribute("totalFee", total+10);
//        req.setAttribute("quantityOrderItem", orderItems.size());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/shopping-cart.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }


}
