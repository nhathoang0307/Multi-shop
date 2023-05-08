package com.example.eshop3.Servlet;

import com.example.eshop3.Model.Order;

import java.util.List;

public interface IOrderService {
    void insertOrder(Order order);

     void insertOrderWithUserID(Order order);

     List<Order> showAllOrder();

    Order selectOrderById(String orderId);

     void UpdateStatus(Order order);

    List<Order> selectOrderByUserId(String UserId);

    boolean checkOrderExit(String userid);
}
