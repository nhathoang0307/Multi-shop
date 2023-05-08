package com.example.eshop3.Servlet;

import com.example.eshop3.Model.Product;


import java.util.List;

public interface IProductService {
//    void setUpdateProductQuantity(int quantity, String id);
//
    void insertProduct(Product product);

    Product selectProduct(String id);

    List<Product> selectAllProduct();

     boolean deleteProduct(String id);

//
    boolean updateProduct(Product product);

    boolean checkNameExits(String productName);
//
    List<Product> searchProduct(String searchStr);

    void setUpdateProductQuantity(int quantity, String id);

    int getQuantityProductById(String id);

    List<Product> sortASC();
    List<Product> sortDESC();

     List<Product> sortSearchASC(String sort);

    List<Product> sortSearchDESC(String sort);
}
