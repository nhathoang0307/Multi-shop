package com.example.eshop3.Controller;


import com.example.eshop3.Model.Product;
import com.example.eshop3.Servlet.*;
import com.example.eshop3.Servlet.implement.*;
import utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {

    private IProductService productService = new ProductService();

    private IOrderItemService orderItemService = new OrderItemService();
    private IOrderService orderService = new OrderService();
    private ICustomerService customerService = new CustomerService();
    private IUserService userService = new UserService();

    private IRoleService roleService = new RoleService();


    public void init() {
        System.out.println("init............................................");
        if (this.getServletContext().getAttribute("listUser") == null) {
            this.getServletContext().setAttribute("listUser", userService.selectAllUser());
            System.out.println(userService.selectAllUser().size());
        }
        if (this.getServletContext().getAttribute("listProduct") == null) {
            this.getServletContext().setAttribute("listProduct", productService.selectAllProduct());
            System.out.println(productService.selectAllProduct().size());
        } else {
            updateProduct();
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

    private void updateProduct() {
        this.getServletContext().removeAttribute("listProduct");
        this.getServletContext().setAttribute("listProduct", productService.selectAllProduct());
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        init();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "remove":
                    deleteProduct(request, response);
                    break;
                case "sortPriceByASC":
                    sortPriceByASC(request, response);
                    break;
                case "sortPriceByDESC":
                    sortPriceByDESC(request, response);
                    break;
                default:
                    listProduct(request, response);
                    break;
            }
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void sortPriceByDESC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.sortDESC();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/view.jsp");
        dispatcher.forward(request, response);
    }

    private void sortPriceByASC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.sortASC();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/view.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        String id = "SP" + System.currentTimeMillis() / 1000;
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        int price = Integer.parseInt((request.getParameter("price")));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String image = request.getParameter("image");

        Product newProduct = new Product();
        newProduct.setId(id);
        newProduct.setCreatedTime(LocalDateTime.now());
        newProduct.setDescription(description);
        newProduct.setName(productName);
        newProduct.setImage(image);
//            if (!ValidateUtils.isImageValid(image)) errors.add("Đường dẫn ảnh không đúng");
        newProduct.setPrice(price);
        newProduct.setQuantity(quantity);
        productService.insertProduct(newProduct);
        updateProduct();
        request.setAttribute("message", "Create Product Success ");
        listProduct(request, response);

//            if (!constraintViolations.isEmpty()) {
//                for (ConstraintViolation<Product> constraintViolation : constraintViolations) {
//                    errors.add(constraintViolation.getMessage());
//                }
//                request.setAttribute("product", newProduct);
//            } else {
//                if (productService.checkNameExits(productName)) {
//                    request.setAttribute("product", newProduct);
//                    errors.add("Sản phẩm đã tồn tại");
//                } else {
//                    productService.insertProduct(newProduct);
//                    updateListProduct();
//                    request.setAttribute("message", "Thêm sản phẩm" + " ' " + productName + " ' " + "thành công!");
//                }
//            }
//        } catch (NumberFormatException numberFormatException) {
//            errors.add("Định dạng của giá hoặc số lượng không hợp lệ\");
//        } finally {
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/dashboard/product/create.jsp");
//            request.setAttribute("errors", errors);
//            requestDispatcher.forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name, description, image;
        int price;
        int quantity;
        List<String> errors = new ArrayList<>();
        String id = request.getParameter("id");
        Product oldProduct = productService.selectProduct(id);
        try {
            name = request.getParameter("productName");
            if (!oldProduct.getName().equals(name)) {
                if (productService.checkNameExits(name)) {
                    errors.add("Sản phẩm đã" + " ' " + name + " ' " + "tồn tại trong hệ thống");
                }
            }
            if (name.trim().equals("")) errors.add("Tên sản phẩm không được để trống");
            price = Integer.parseInt((request.getParameter("price")));
            quantity = Integer.parseInt(request.getParameter("quantity"));
            description = request.getParameter("description");
            image = request.getParameter("image");
            if (!ValidateUtils.isImageValid(image)) errors.add("Đường dẫn ảnh không đúng");
            if (errors.isEmpty()) {
                Product newProduct = new Product(id, name, price, quantity, description, image);
                newProduct.setCreatedTime(oldProduct.getCreatedTime());
                newProduct.setUpdatedTime(LocalDateTime.now());
                productService.updateProduct(newProduct);
                updateListProduct();
                request.setAttribute("message", "Create Product Success");
                request.setAttribute("product", newProduct);
                response.sendRedirect("/product");
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/edit.jsp");
                request.setAttribute("errors", errors);
                requestDispatcher.forward(request, response);
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Định dạng của giá hoặc số lượng không hợp lệ");
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchStr = request.getParameter("inputSearch");
        List<Product> productListSearch = productService.searchProduct(searchStr);
        request.setAttribute("productListSearch", productListSearch);
        request.setAttribute("searchStr", searchStr);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/dashboard/product/search.jsp");
        requestDispatcher.forward(request, response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        RequestDispatcher requestDispatcher;
        Product product = productService.selectProduct(id);
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/view.jsp");
            request.setAttribute("error", "Sản phẩm không tồn tại");
            requestDispatcher.forward(request, response);
        } else {
            request.setAttribute("product", product);
            request.setAttribute("message", "Edit Product success");
            requestDispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/edit.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String id = request.getParameter("id");
        Product product = productService.selectProduct(id);
        if (product == null) {
            request.setAttribute("error", "Sản phẩm" + " ' " + id + " ' " + "không tồn tại");
        } else {
            productService.deleteProduct(id);
            request.setAttribute("message", "Delete Product Success ");
        }
        updateListProduct();
        listProduct(request,response);

//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/view.jsp");
//        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.selectAllProduct();
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/product/view.jsp");
        dispatcher.forward(request, response);
    }

    private void updateListProduct() {
        this.getServletContext().removeAttribute("products");
        this.getServletContext().setAttribute("products", productService.selectAllProduct());
    }
}