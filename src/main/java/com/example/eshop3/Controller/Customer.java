package com.example.eshop3.Controller;

import com.example.eshop3.Model.OrderItem;
import com.example.eshop3.Model.Product;
import com.example.eshop3.Model.User;
import com.example.eshop3.Servlet.IProductService;
import com.example.eshop3.Servlet.implement.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", urlPatterns = {"/trangchu", ""})


public class Customer extends HttpServlet {
    private IProductService ProductService;

    @Override
    public void init() throws ServletException {
        ProductService = new ProductService();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = null;
        String action = request.getParameter("action");
        List<String> values = new ArrayList<>();
        values.add("ascending");
        values.add("descending");
        request.setAttribute("values", values);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "ascending":
                ascending(request, response);
                break;
            case "descending":
                descending(request, response);
                break;
            default:
                products = ProductService.selectAllProduct();
                request.setAttribute("products", products);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/home.jsp");
                dispatcher.forward(request, response);
                break;
        }
    }

    private void ascending(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = "";
        if (request.getParameter("inputSearch") != null) {
            System.out.println("search not null");
            search = request.getParameter("inputSearch");
        }
        List<Product> products = ProductService.sortSearchASC(search);
        request.setAttribute("info", "ascending");
        request.setAttribute("searchStr", search);
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/home.jsp");
        dispatcher.forward(request, response);
    }

    private void descending(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = "";
        if (request.getParameter("inputSearch") != null) {
            System.out.println("search not null");
            search = request.getParameter("inputSearch");
        }
        List<Product> products = ProductService.sortSearchDESC(search);
        request.setAttribute("info", "descending");
        request.setAttribute("searchStr", search);
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addtocart":
                addtocart(req, resp);
                break;
            case "search":
                search(req, resp);
                break;
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> values = new ArrayList<>();
        values.add("ascending");
        values.add("descending");
        req.setAttribute("values", values);

        String searchStr = req.getParameter("inputSearch");
        List<Product> productListSearch = ProductService.searchProduct(searchStr);
        req.setAttribute("products", productListSearch);
        req.setAttribute("searchStr", searchStr);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/home.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void addtocart(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession httpSession = req.getSession();
        User user = null;
        if (httpSession.getAttribute("user") != null) {
            user = (User) httpSession.getAttribute("user");
        }
        List<Product> products;
        List<String> values = new ArrayList<>();
        values.add("ascending");
        values.add("descending");
        req.setAttribute("values", values);


        String id = req.getParameter("id");
        System.out.println("run add to cart");
        Product product = ProductService.selectProduct(id);
        HttpSession httpSessioncart = req.getSession();
        List<OrderItem> orderItemslist = new ArrayList<>();
        if (httpSessioncart.getAttribute("carts") != null) {
            orderItemslist = (List<OrderItem>) httpSessioncart.getAttribute("carts");
        }
        int flag = 0;
        if (orderItemslist != null) {
            for (OrderItem o : orderItemslist) {
                if (o.getProductId().equals(id)) {
                    int quantity = o.getQuantity();
                    o.setQuantity(quantity + 1);
                    flag++;
                }
            }
            if (flag == 0) {
                orderItemslist.add(new OrderItem(product.getId(), product.getName(), product.getPrice(), 1, product.getImage()));
            }
        } else {
            orderItemslist.add(new OrderItem(product.getId(), product.getName(), product.getPrice(), 1, product.getImage()));
            System.out.println(orderItemslist.size());
        }
        req.setAttribute("message", "added to cart");
        httpSessioncart.setAttribute("carts", orderItemslist);
        String search = req.getParameter("search");
        String valueOption = req.getParameter("option");

        if (search != null) {

        }



        if (valueOption.equals("ascending")) {
            products = ProductService.sortASC();
            req.setAttribute("info", "ascending");
        } else if (valueOption.equals("descending")) {
            products = ProductService.sortDESC();
            req.setAttribute("info", "ascending");
        } else {
            products = ProductService.selectAllProduct();
        }


        req.setAttribute("products", products);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/home.jsp");
        dispatcher.forward(req, resp);
    }


}

