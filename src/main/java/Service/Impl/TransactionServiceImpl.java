/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Impl;

import DBConnection.DBConnection;
import Model.Transaction;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Anup
 */
public class TransactionServiceImpl {

    public void addTransaction(Transaction transaction) {
        String query = "insert into transaction(username, movie_name, screen, seats, date, start_time, total_price) values(?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, transaction.getUsername());
            preparedStatement.setString(2, transaction.getMovie_name());
            preparedStatement.setString(3, transaction.getScreen());
            preparedStatement.setString(4, transaction.getSeats());
            preparedStatement.setString(5, transaction.getDate());
            preparedStatement.setString(6, transaction.getStart_time());
            preparedStatement.setString(7, transaction.getTotal_price());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
