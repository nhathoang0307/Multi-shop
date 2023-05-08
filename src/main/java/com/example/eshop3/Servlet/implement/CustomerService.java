package com.example.eshop3.Servlet.implement;

import com.example.eshop3.Model.Customer;
import com.example.eshop3.Servlet.ICustomerService;
import utils.AppUtils;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CustomerService extends DatabaseContext implements ICustomerService {
    private static final String INSERT_CUSTOMER =
            "INSERT INTO customer(id, full_name, email, phone_number, address, createdTime) VALUE (?,?,?,?,?,?);";


    private static final String SELECTALL_CUSTOMER = "select * from customer;";

    private static final String SELECTALLNEW_CUSTOMER = "select * from customer where datediff(now(), customer.createdTime) <= 1;";

    @Override
    public void insertCustomer(Customer customer) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setString(2, customer.getFullName());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setInt(4, customer.getPhoneNumber());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.setString(6, AppUtils.localDateTimeToString(customer.getCreatedTime()));
            System.out.println(this.getClass() + " insertCustomer " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
    }

    @Override
    public List<Customer> selectAllCustomer() {
        java.util.List<Customer> customerList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECTALL_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllCustomer " + preparedStatement);
            while (rs.next()) {
                Customer customer = getCustomerFromResultSet(rs);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return customerList;
    }

    @Override
    public List<Customer> selectAllNewCustomer() {
        java.util.List<Customer> customerList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECTALLNEW_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllCustomer " + preparedStatement);
            while (rs.next()) {
                Customer customer = getCustomerFromResultSet(rs);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return customerList;
    }

    private Customer getCustomerFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String fullName = rs.getString("full_name");
        String email = rs.getString("email");
        int phoneNumber = rs.getInt("phone_number");
        String address = rs.getString("address");
        Customer customer = new Customer(id, fullName, email, phoneNumber, address);
        LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("createdTime"));
        customer.setCreatedTime(createdTime);
        if (rs.getString("updatedTime") != null) {
            LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updatedTime"));
            customer.setUpdatedTime(updatedTime);
        }
        return customer;
    }


}
