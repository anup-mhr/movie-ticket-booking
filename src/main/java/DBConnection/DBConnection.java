/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Anup
 */
public class DBConnection {
    Connection connection = null;

    public DBConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/ticket_booking";
            String name = "root";
            String password = "";
            this.connection = DriverManager.getConnection(dbUrl, name, password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DBConnection dbConnection = new DBConnection();
    }
    public void CloseConnection () {
        try{
            this.connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

    public PreparedStatement getStatement(String query){
        PreparedStatement preparedStatement = null;
        try {
            System.out.println("say why");
            preparedStatement = connection.prepareStatement(query);   
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return preparedStatement;
    }
}
