package com.example.eshop3.Servlet.implement;

import com.example.eshop3.Model.User;
import com.example.eshop3.Servlet.IUserService;
import utils.AppUtils;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserService extends DatabaseContext implements IUserService {

    private static final String SELECT_USER_BY_EMAIL_PASSWORD =
            "SELECT * FROM user WHERE email = ? AND password = ?";

    private static final String SELECT_USER_BY_EMAIL =
            "SELECT * FROM user WHERE email =?;";

    private static final String SELECT_USER_BY_PASSWORD =
            "SELECT * FROM user WHERE password =?;";

    private static final String SELECT_ALL_USERS =
            "SELECT * FROM user;";

    private static final String INSERT_USER =
            "INSERT INTO user(id, full_name, birthday, phone_number, email, address, image, role_id, password, created_time) VALUE (?,?,?,?,?,?,?,?,?,?);";
    private static final String UPDATE_USER =
            "UPDATE user SET full_name =?, birthday =?, phone_number =?, email =?, address =?, image=?, role_id=?,password=?, updated_time=? WHERE id = ?;";

    private static final String SELECT_USER_BY_ID =
            "SELECT * FROM user WHERE id =?;";

    private static final String SELECT_USER_BY_PHONE_NUMBER =
            "SELECT * FROM user WHERE phone_number =?;";

    private static final String DELETE_USER =
            "DELETE FROM user WHERE id = ?;";

    private int noOfRecords;

    private static final String SELECT_ALL_USER_PAGGING_FILLTER_ALL =
            "SELECT SQL_CALC_FOUND_ROWS * FROM user WHERE id LIKE ? OR full_name LIKE ? OR birthday LIKE ? OR phone_number LIKE ? OR email LIKE ? OR address LIKE ? limit ?,?;";

    @Override
    public boolean updateUser(User user) {
        boolean rowUpdated = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, AppUtils.localDateToString(user.getBirthDay()));
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getImage());
            preparedStatement.setInt(7, user.getRole());
            preparedStatement.setString(8, user.getPassword());
            preparedStatement.setString(9, AppUtils.localDateTimeToString(user.getUpdatedTime()));
            preparedStatement.setString(10, user.getId());
            System.out.println(this.getClass() + " updateUser " + preparedStatement);
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return rowUpdated;
    }

    @Override
    public User selectUserByPhoneNumber(String phoneNumber) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_PHONE_NUMBER);
            preparedStatement.setString(1, phoneNumber);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectUserByPhoneNumber: " + preparedStatement);
            while (rs.next()) {
                return getUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return null;
    }

    @Override
    public User selectUserByEmail(String emailStr) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL);
            preparedStatement.setString(1, emailStr);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectUserByEmail: " + preparedStatement);
            while (rs.next()) {
                return getUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return null;
    }

    public User checklogin(String email, String password) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL_PASSWORD);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            System.out.println(this.getClass() + " checklogin: " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return getUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    public boolean checkEmail(String emailStr) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL);
            preparedStatement.setString(1, emailStr);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " checkEmail: " + preparedStatement);
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return false;
    }

    public boolean checkPassword(String password) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_PASSWORD);
            preparedStatement.setString(1, password);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " checkEmail: " + preparedStatement);
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return false;
    }


    private User getUserFromResultSet(ResultSet rs) throws SQLException {
        String id = rs.getString("id");
        String fullName = rs.getString("full_name");
        LocalDate birthDay = AppUtils.stringToLocalDate(rs.getString("birthday"));
        String phoneNumber = rs.getString("phone_number");
        String email = rs.getString("email");
        String address = rs.getString("address");
        int role = rs.getInt("role_id");
        String image = rs.getString("image");
        String password = rs.getNString("password");
        User user = new User(id, fullName, birthDay, phoneNumber, email, address, image, role, password);
        LocalDateTime createdTime = AppUtils.stringToLocalDateTime(rs.getString("created_time"));
        user.setCreatedTime(createdTime);
        if (rs.getString("updated_time") != null) {
            LocalDateTime updatedTime = AppUtils.stringToLocalDateTime(rs.getString("updated_time"));
            user.setUpdatedTime(updatedTime);
        }
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllUser " + preparedStatement);
            while (rs.next()) {
                User user = getUserFromResultSet(rs);
                userList.add(user);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return userList;
    }

    @Override
    public void insertUser(User user) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getId());
            preparedStatement.setString(2, user.getFullName());
            preparedStatement.setString(3, AppUtils.localDateToString(user.getBirthDay()));
            preparedStatement.setString(4, user.getPhoneNumber());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getImage());
            preparedStatement.setInt(8, user.getRole());
            preparedStatement.setString(9, user.getPassword());
            preparedStatement.setString(10, AppUtils.localDateTimeToString(user.getCreatedTime()));
            System.out.println(this.getClass() + " insertUser " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
    }

    @Override
    public User selectUser(String id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectUser: " + preparedStatement);
            while (rs.next()) {
                return getUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return null;
    }

    public boolean deleteUser(String id) {
        boolean rowDeleted = false;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);
            preparedStatement.setString(1, id);
            System.out.println(this.getClass() + " deleteUser " + preparedStatement);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            AppUtils.printSQLException(e);
        }
        return rowDeleted;
    }

    @Override
    public List<User> selectUsersPagging(int offset, int noOfRecords) {
        String query = "select SQL_CALC_FOUND_ROWS * from users limit "
                + offset + ", " + noOfRecords;
        List<User> list = new ArrayList<>();
        User user;

        Connection connection = null;
        Statement stmt = null;
        try {
            connection = getConnection();
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                user = getUserFromResultSet(rs);
                list.add(user);
            }
            rs.close();
            rs = stmt.executeQuery("SELECT FOUND_ROWS()");
            if (rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public List<User> selectUsersPagging(int offset, int noOfRecords, String q) {

        List<User> list = new ArrayList<>();
        User user;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareCall(SELECT_ALL_USER_PAGGING_FILLTER_ALL);
            preparedStatement.setString(1, "%" + q + "%");
            preparedStatement.setString(2, "%" + q + "%");
            preparedStatement.setString(3, "%" + q + "%");
            preparedStatement.setString(4, "%" + q + "%");
            preparedStatement.setString(5, "%" + q + "%");
            preparedStatement.setString(6, "%" + q + "%");
            preparedStatement.setInt(7, offset);
            preparedStatement.setInt(8, noOfRecords);
            System.out.println(this.getClass() + " selectAllUsersPaggingFilter " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                 user = getUserFromResultSet(rs);
                list.add(user);
            }
            rs = preparedStatement.executeQuery("SELECT FOUND_ROWS();");
            if (rs.next())
                this.noOfRecords = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}

