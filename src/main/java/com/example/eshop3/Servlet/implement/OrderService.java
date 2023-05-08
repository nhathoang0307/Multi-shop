package com.example.eshop3.Servlet.implement;

import com.example.eshop3.Model.Order;
import com.example.eshop3.Servlet.IOrderService;
import utils.AppUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrderService extends DatabaseContext implements IOrderService {

    private static final String INSERT_ORDER =
            "INSERT INTO `order`(id, create_time, grand_total, status_id, customer_id) VALUE (?,?,?,?,?);";
    private static final String INSERT_ORDERWITHID =
            "INSERT INTO `order`(id, create_time, grand_total, status_id, customer_id,user_id) VALUE (?,?,?,?,?,?);";

    private static final String SELECT_ALL_ORDERS =
            "SELECT * FROM `order`;";

    private static final String SELECT_ORDER =

            "select * from `order` where id  = ?";
    private static final String UPDATE_STATUS =
            "UPDATE `order` SET `status_id` = ? WHERE id = ?";

    private static final String SELECT_ORDER_BYUSERID =

            "select * from `order` where user_id  = ?";


    public void UpdateStatus(Order order){
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS);
            preparedStatement.setInt(1, order.getStatusId());
            preparedStatement.setString(2, order.getId());
            System.out.println(this.getClass() + " UpdateStatusbyId " + preparedStatement);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException sqlException) {
            printSQLException(sqlException);
        }

    }


    @Override
    public void insertOrder(Order order) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setString(1, order.getId());
            preparedStatement.setString(2, AppUtils.localDateTimeToString(order.getCreatedTime()));
            preparedStatement.setInt(3, order.getGrandTotal());
            preparedStatement.setInt(4, order.getStatusId());
            preparedStatement.setString(5, order.getCustomerId());
            System.out.println(this.getClass() + " insertUser " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
    }

    @Override
    public void insertOrderWithUserID(Order order) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDERWITHID);
            preparedStatement.setString(1, order.getId());
            preparedStatement.setString(2, AppUtils.localDateTimeToString(order.getCreatedTime()));
            preparedStatement.setInt(3, order.getGrandTotal());
            preparedStatement.setInt(4, order.getStatusId());
            preparedStatement.setString(5, order.getCustomerId());
            preparedStatement.setString(6, order.getUserId());
            System.out.println(this.getClass() + " insertUser " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
    }

    @Override
    public List<Order> showAllOrder() {
        List<Order> orderList = new ArrayList<>();
        try  {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDERS);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllOrder " + preparedStatement);
            while (rs.next()) {
                Order order = getOrderFromResultSet(rs);
                orderList.add(order);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return orderList;
    }

    @Override
     public Order selectOrderById(String orderId) {
        Order order = new Order();
        try  {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER);
            preparedStatement.setString(1, orderId);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllOrder " + preparedStatement);
            while (rs.next()) {
                 order = getOrderFromResultSet(rs);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return order;
    }

    @Override
    public List<Order> selectOrderByUserId(String UserId) {
        List<Order> orderList = new ArrayList<>();
        try  {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BYUSERID);
            preparedStatement.setString(1, UserId);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllOrder " + preparedStatement);
            while (rs.next()) {
               Order order = getOrderFromResultSet(rs);
               orderList.add(order);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return orderList;
    }

    @Override
    public boolean checkOrderExit(String userid) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BYUSERID);
            preparedStatement.setString(1, userid);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return false;
    }

    private Order getOrderFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("create_time"));
        int grandTotal = rs.getInt("grand_total");
        int statusId = rs.getInt("status_id");
        String customerId = rs.getString("customer_id");
        Order order = new Order(id, createdTime, grandTotal, statusId, customerId);
        if (rs.getString("user_id") != null) {
            String userId = rs.getString("user_id");
            order.setUserId(userId);
        }
        return order;
    }
}
