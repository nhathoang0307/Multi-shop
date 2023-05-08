package com.example.eshop3.Servlet.implement;

import com.example.eshop3.Model.OrderItem;
import com.example.eshop3.Servlet.IOrderItemService;
import utils.AppUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderItemService extends DatabaseContext implements IOrderItemService {

    private static final String INSERT_ORDER_ITEM =
            "INSERT INTO order_item(product_id, price, quantity, order_id) VALUE (?,?,?,?);";

    private static final String SELECT_ORDER_ITEM_BY_ORDER_ID =
            "SELECT * FROM order_item WHERE order_id = ?;";
    @Override
    public void insertOrderItem(OrderItem orderItem) {
        try  {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_ITEM);
            preparedStatement.setString(1, orderItem.getProductId());
            preparedStatement.setInt(2, orderItem.getPrice());
            preparedStatement.setInt(3,orderItem.getQuantity());
            preparedStatement.setString(4,orderItem.getOrderId());
            System.out.println(this.getClass() + " insertOrderItem " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
    }



    @Override
    public List<OrderItem> selectOrderItemByOrderId(String orderId) {
        List<OrderItem> orderItemList = new ArrayList<>();
        try  {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_ITEM_BY_ORDER_ID);
            preparedStatement.setString(1, orderId);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectOrderItemByOrderId " + preparedStatement);
            while (rs.next()) {
                OrderItem orderItem = getOrderItemFromResultSet(rs);
                orderItemList.add(orderItem);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return orderItemList;
    }

    private OrderItem getOrderItemFromResultSet(ResultSet rs) throws SQLException {
        String productId = rs.getString("product_id");
        int price = rs.getInt("price");
        int quantity = rs.getInt("quantity");
        String orderId = rs.getString("order_id");
        OrderItem orderItem = new OrderItem(productId, price, quantity, orderId);
        return orderItem;
    }
}
