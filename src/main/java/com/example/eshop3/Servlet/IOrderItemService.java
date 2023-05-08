package com.example.eshop3.Servlet;

import com.example.eshop3.Model.OrderItem;

import java.util.List;

public interface IOrderItemService {
     void insertOrderItem(OrderItem orderItem);

    List<OrderItem> selectOrderItemByOrderId(String orderId);
}
