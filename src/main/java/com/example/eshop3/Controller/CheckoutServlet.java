package com.example.eshop3.Controller;

import com.example.eshop3.Model.Customer;
import com.example.eshop3.Model.Order;
import com.example.eshop3.Model.OrderItem;
import com.example.eshop3.Model.User;
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
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    private IUserService userService = new UserService();
    private IOrderItemService orderItemService = new OrderItemService();
    private IOrderService orderService = new OrderService();
    private ICustomerService customerService = new CustomerService();

    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showlist(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        thanhtoan(req,resp);
    }

    protected void showlist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        req.setAttribute("carts", orderItems);
        req.setAttribute("total", total);
        req.setAttribute("totalFee", total+10);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/checkout.jsp");
        dispatcher.forward(req, resp);
    }


    protected void thanhtoan(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        ----------insert Customer
        System.out.println("tien hanh insert Customer");
        String idCustomer = "CU" + System.currentTimeMillis() / 1000;
        String name = req.getParameter("namecustomer");
        String email = req.getParameter("emailcustomer");
        int phone = Integer.parseInt((req.getParameter("phonecustomer")));
        String address = req.getParameter("addresscustomer");
        LocalDateTime createdTime = LocalDateTime.now();
        Customer customer = new Customer(idCustomer, name, email, phone, address,createdTime);
        customerService.insertCustomer(customer);
        System.out.println("insert Customer xong");

//        ------------ OrderItem
        System.out.println("lay thong tin orderitem");
        HttpSession httpSessioncart = req.getSession();
        List<OrderItem> orderItems = new ArrayList<>();
        if (httpSessioncart.getAttribute("carts") != null) {
            orderItems = (List<OrderItem>) httpSessioncart.getAttribute("carts");
        }
        //        xử lí trừ số lượng trong kho
        int total = 0;
        int quantityProduct = 0;
        for (OrderItem o : orderItems) {
            quantityProduct = productService.getQuantityProductById(o.getProductId());
            System.out.println("quantityProduct:" + quantityProduct);
            System.out.println("o.getQuantity(): " + o.getQuantity());
            productService.setUpdateProductQuantity(quantityProduct-o.getQuantity(),o.getProductId());
            total += (o.getPrice() * o.getQuantity());
        }
        System.out.println("lay xong thong tin orderitem");


//        ------ insert Order
        System.out.println("lay thong tin order");
        Order order = new Order();
        String idOder = "OD" + System.currentTimeMillis() / 1000;
        order.setId(idOder);
        System.out.println("idOder" + order.getId());
        order.setCreatedTime(LocalDateTime.now());
        System.out.println(order.getCreatedTime());
        order.setGrandTotal(total);
        System.out.println(order.getGrandTotal());
        order.setStatusId(1);
        System.out.println(order.getStatusId());
        order.setCustomerId(customer.getId());
        System.out.println(order.getCustomerId());

        HttpSession httpSession = req.getSession();
        User user = null;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
            order.setUserId(user.getId());
            orderService.insertOrderWithUserID(order);
        } else {
            orderService.insertOrder(order);
            System.out.println("lay xong thong tin order");
        }


        //        ---------- insert OrderITem
        System.out.println("insert OrderITem");
        for (OrderItem o : orderItems) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProductId(o.getProductId());
            orderItem.setPrice(o.getPrice());
            orderItem.setQuantity(o.getQuantity());
            orderItem.setOrderId(order.getId());
            orderItemService.insertOrderItem(orderItem);
        }

        System.out.println("insert OrderITem xong");
        httpSessioncart.removeAttribute("carts");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/customer/success.jsp");
        requestDispatcher.forward(req, resp);
    }



}
