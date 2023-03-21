/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Impl;

import DBConnection.DBConnection;
import Model.Seats;
import Service.SeatService;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anup
 */
public class SeatServiceImpl implements SeatService {
    @Override
    public List<Seats> getSeats(){
        List<Seats> seats = new ArrayList<Seats>();
        String query = "select * from seats";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Seats seat = new Seats();
                seat.setSeat_id(resultSet.getInt("seat_id"));
                seats.add(seat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seats;
    } 
}
