/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Impl;

import DBConnection.DBConnection;
import Model.User;
import Service.UserService;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Anup
 */
public class UserServiceImpl implements UserService {

    @Override
    public boolean isUserExist(String name) {
        User user = null;
        user = getUserByname(name);
        return user != null;
    }

    private static User getUserByname(String name) {
        User User = null;
        String query = "select * from customers where name=?";
        DBConnection dbConnect = new DBConnection();
        try {
            PreparedStatement preparedStatement = dbConnect.getStatement(query);

            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User = new User();
                User.setCustomer_id(resultSet.getInt("customer_id"));
                User.setName(resultSet.getString("name"));
                User.setEmail(resultSet.getString("email"));
                User.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
        return User;
    }

    @Override
    public User getUser(String name) {
        User User = null;
        String query = "select * from customers where name=?";
        DBConnection dbConnect = new DBConnection();
        PreparedStatement preparedStatement = dbConnect.getStatement(query);
        try {
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User = new User();
                User.setCustomer_id(resultSet.getInt("customer_id"));
                User.setName(resultSet.getString("name"));
                User.setEmail(resultSet.getString("email"));
                User.setPassword(resultSet.getString("password"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
        return User;
    }

    @Override
    public void insertUser(User User) {
        String query = "insert into customers(name, email, password) values(?,?,?)";
        DBConnection dbConnect = new DBConnection();
        PreparedStatement preparedStatement = dbConnect.getStatement(query);
        try {
            preparedStatement.setString(1, User.getName());
            preparedStatement.setString(2, User.getEmail());
            preparedStatement.setString(3, User.getPassword());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
    }

    @Override
    public List<User> getUserList() {
        List<User> users = new ArrayList<User>();
        String query = "select * from customers";
        DBConnection dbConnect = new DBConnection();
        PreparedStatement preparedStatement = dbConnect.getStatement(query);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setCustomer_id(resultSet.getInt("customer_id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
        return users;
    }

    @Override
    public void deleteUser(int customer_id) {
        String query = "delete from customers where customer_id = ?";
        DBConnection dbConnect = new DBConnection();
        PreparedStatement preparedStatement = dbConnect.getStatement(query);
        try {
            preparedStatement.setInt(1, customer_id);
            preparedStatement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
    }

    public void changePasswword(String username, String password) {
        String query = "update customers set password=? where name=?";
        DBConnection dbConnect = new DBConnection();
        PreparedStatement preparedStatement = dbConnect.getStatement(query);
        try {
            preparedStatement.setString(1, password);
            preparedStatement.setString(2, username);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
    }
}
