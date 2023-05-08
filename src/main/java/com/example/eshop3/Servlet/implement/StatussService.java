package com.example.eshop3.Servlet.implement;

import com.example.eshop3.Model.Statuss;
import com.example.eshop3.Servlet.IStatussService;
import utils.AppUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StatussService extends DatabaseContext implements IStatussService {


    private static final String SELECT_STATUS_BY_ID = "SELECT * FROM statuss WHERE id =?;";
    private static final String SELECT_ALL_STATUS = "SELECT * FROM statuss;";

    @Override
    public Statuss selectStatus(int id) {
        try {
            Connection connection =  getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STATUS_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int statusId = rs.getInt("id");
                String type = rs.getString("type");
                return new Statuss(statusId, type);
            }
        } catch (SQLException ex) {
            AppUtils.printSQLException(ex);
        }
        return null;
    }

    @Override
    public List<Statuss> selectAllStatus() {
        List<Statuss> statusList = new ArrayList<>();
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STATUS);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(this.getClass() + " selectAllSTATUS " + preparedStatement);
            while (rs.next()){
                int id = rs.getInt("id");
                String type = rs.getString("type");
                Statuss status = new Statuss(id, type);
                statusList.add(status);
            }
        }catch (SQLException ex){
            AppUtils.printSQLException(ex);
        }
        return statusList;
    }
}
