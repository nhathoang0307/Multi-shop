package com.example.eshop3.Servlet;

import com.example.eshop3.Model.Customer;

import java.awt.*;
import java.util.List;

public interface ICustomerService {
     void insertCustomer(Customer customer);

      List<Customer> selectAllCustomer();

     List<Customer> selectAllNewCustomer();
}
