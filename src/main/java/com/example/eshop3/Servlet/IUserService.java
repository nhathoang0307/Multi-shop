package com.example.eshop3.Servlet;


import com.example.eshop3.Model.User;

import java.util.List;

public interface IUserService {

//
//    User selectUser(String id);
//
    User selectUserByPhoneNumber(String phoneNumber);
//
    User selectUserByEmail(String emailStr);
//
//    List<User> selectAllUsersPaggingFilter(int offset, int noOfRecords, String q, int roleId);
//
//    List<User> selectAllUser();
//
//    boolean deleteUser(String id);
//
//    boolean updateUser(User user);
//
//    List<User> searchUser(String searchStr);
//
//    public int getNoOfRecords();

    User checklogin(String email, String password);

     boolean checkEmail(String emailStr);

     boolean checkPassword(String emailStr);

     List<User> selectAllUser();

    void insertUser(User user);

     boolean updateUser(User user);

    User selectUser(String id);

    boolean deleteUser(String id);

     List<User> selectUsersPagging(int offset, int noOfRecords);

     List<User> selectUsersPagging(int offset, int noOfRecords, String q);

     int getNoOfRecords();
}
