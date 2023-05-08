package com.example.eshop3.Servlet.implement;

import com.example.eshop3.Model.Product;
import com.example.eshop3.Servlet.IProductService;
import utils.AppUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProductService extends DatabaseContext implements IProductService {


    private static final String INSERT_PRODUCT = " insert into product(id, name, price, quantity, description, image, created_time) VALUE (?,?,?,?,?,?,?);";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where id =?;";
    private static final String SELECT_ALL_PRODUCTS = "select * from product;";
    private static final String SORT_ALL_PRICE_ASC = "SELECT * FROM product ORDER BY price;";
    private static final String SORT_SEARCH_ALL_PRICE_ASC = "SELECT * FROM product where `name` like ? ORDER BY price;";
    private static final String SORT_SEARCH_ALL_PRICE_DESC = "SELECT * FROM product where `name` like ? ORDER BY price DESC;";
    private static final String SORT_ALL_PRICE_DESC = "SELECT * FROM product ORDER BY price DESC;";
    private static final String DELETE_PRODUCT = "delete from product where id = ?;";
    private static final String UPDATE_PRODUCT = "update product set name =?, price=?, quantity =?, description =?, image=?, updated_time=? where id = ?;";

    private static final String CHECK_NAME_EXISTS = "SELECT * FROM product where name = ?";
    private static final String SEARCH_PRODUCT = "SELECT * FROM product WHERE  name LIKE ? ;";
    private static final String UPDATE_PRODUCT_QUANTITY = "UPDATE product SET quantity =? WHERE id =?;";

    private static final String SELECT_QUANTITY_PRODUCT = "select quantity from product WHERE id =?;";


//    @Override
//    public void setUpdateProductQuantity(int quantity, String id){
//        try (Connection connection = databaseContext.getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_QUANTITY)) {
//            preparedStatement.setInt(1, quantity);
//            preparedStatement.setString(2, id);
//            System.out.println(this.getClass() + " setUpdateProductQuantity " + preparedStatement);
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            AppUtils.printSQLException(e);
//        }
//    }

    @Override
    public void insertProduct(Product product) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setInt(3, product.getPrice());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.setString(6, product.getImage());
            preparedStatement.setString(7, AppUtils.localDateTimeToString(product.getCreatedTime()));
            System.out.println(this.getClass() + " insertProduct " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
    }

    @Override
    public Product selectProduct(String id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectProduct: " + preparedStatement);
            while (rs.next()) {
                String productId = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Product product = new Product(productId, name, price, quantity, description, image);
                LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
                product.setCreatedTime(createdTime);
                if (rs.getString("updated_time") != null) {
                    LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
                    product.setUpdatedTime(updatedTime);
                }
                return product;
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return null;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllProduct " + preparedStatement);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Product product = new Product(id, name, price, quantity, description, image);
                LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
                product.setCreatedTime(createdTime);
                if (rs.getString("updated_time") != null) {
                    LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
                    product.setUpdatedTime(updatedTime);
                }
                products.add(product);
                System.out.println(preparedStatement);
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return products;
    }

    @Override
    public boolean deleteProduct(String id) {
        boolean rowDeleted = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setString(1, id);
            System.out.println(this.getClass() + " deleteProduct " + preparedStatement);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return rowDeleted;
    }

    //
    @Override
    public boolean updateProduct(Product product) {
        boolean rowUpdated = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getDescription());
            preparedStatement.setString(5, product.getImage());
            preparedStatement.setString(6, AppUtils.localDateTimeToString(product.getUpdatedTime()));
            preparedStatement.setString(7, product.getId());
            System.out.println(this.getClass() + " updateProduct " + preparedStatement);
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return rowUpdated;
    }

    //
    @Override
    public boolean checkNameExits(String productName) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_NAME_EXISTS);
            preparedStatement.setString(1, productName);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return false;
    }

    @Override
    public List<Product> searchProduct(String searchStr) {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCT);
            preparedStatement.setString(1, "%" + searchStr + "%");
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " searchProduct " + preparedStatement);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Product product = new Product(id, name, price, quantity, description, image);
                LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
                product.setCreatedTime(createdTime);
                if (rs.getString("updated_time") != null) {
                    LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
                    product.setUpdatedTime(updatedTime);
                }
                products.add(product);
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return products;
    }

    @Override
    public void setUpdateProductQuantity(int quantity, String id){
        try  {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_QUANTITY);
            preparedStatement.setInt(1, quantity);
            preparedStatement.setString(2, id);
            System.out.println(this.getClass() + " setUpdateProductQuantity " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
    }
    public int getQuantityProductById(String id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_QUANTITY_PRODUCT);
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            int quantity;
            System.out.println(this.getClass() + " selectProduct: " + preparedStatement);
            while (rs.next()) {
                 quantity = rs.getInt("quantity");
                return quantity;
                }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return 0;
    }

    @Override
    public List<Product> sortASC() {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_ALL_PRICE_ASC);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllProduct " + preparedStatement);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Product product = new Product(id, name, price, quantity, description, image);
                LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
                product.setCreatedTime(createdTime);
                if (rs.getString("updated_time") != null) {
                    LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
                    product.setUpdatedTime(updatedTime);
                }
                products.add(product);
                System.out.println(preparedStatement);
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return products;
    }
    @Override
    public List<Product> sortDESC() {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_ALL_PRICE_DESC);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllProduct " + preparedStatement);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Product product = new Product(id, name, price, quantity, description, image);
                LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
                product.setCreatedTime(createdTime);
                if (rs.getString("updated_time") != null) {
                    LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
                    product.setUpdatedTime(updatedTime);
                }
                products.add(product);
                System.out.println(preparedStatement);
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return products;
    }

    @Override
    public List<Product> sortSearchASC(String sort) {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_SEARCH_ALL_PRICE_ASC);
            preparedStatement.setString(1, "%" + sort + "%");
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllProduct " + preparedStatement);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Product product = new Product(id, name, price, quantity, description, image);
                LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
                product.setCreatedTime(createdTime);
                if (rs.getString("updated_time") != null) {
                    LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
                    product.setUpdatedTime(updatedTime);
                }
                products.add(product);
                System.out.println(preparedStatement);
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return products;
    }

    @Override
    public List<Product> sortSearchDESC(String sort) {
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_SEARCH_ALL_PRICE_DESC);
            preparedStatement.setString(1, "%" + sort + "%");
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllProduct " + preparedStatement);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String image = rs.getString("image");
                Product product = new Product(id, name, price, quantity, description, image);
                LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
                product.setCreatedTime(createdTime);
                if (rs.getString("updated_time") != null) {
                    LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
                    product.setUpdatedTime(updatedTime);
                }
                products.add(product);
                System.out.println(preparedStatement);
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return products;
    }

}
