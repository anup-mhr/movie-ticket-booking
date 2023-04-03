/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Impl;

import DBConnection.DBConnection;
import Model.Book;
import Service.BookingService;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anup
 */
public class BookingServiceImpl implements BookingService {

    @Override
    public List<Book> getMoviesByShowtime(int showtime_id) {
        List<Book> bookings = new ArrayList<Book>();
        String query = "select * from booking where showtime_id = ?;";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setInt(1, showtime_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Book booking = new Book();
                booking.setId(resultSet.getInt("id"));
                booking.setCustomer_id(resultSet.getInt("customer_id"));
                booking.setShowtime_id(resultSet.getInt("showtime_id"));
                booking.setSeat_id(resultSet.getInt("seat_id"));
                booking.setTotal_price(resultSet.getFloat("total_price"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    public void insertBooking(Book booking) {
        String query = "insert into booking(customer_id, showtime_id, seat_id, total_price) values(?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setInt(1, booking.getCustomer_id());
            preparedStatement.setInt(2, booking.getShowtime_id());
            preparedStatement.setInt(3, booking.getSeat_id());
            preparedStatement.setFloat(4, booking.getTotal_price());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Book getBookingById(int id){
        Book booking = null;
        String query = "select * from booking where id = ?;";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                booking = new Book();
                booking.setId(resultSet.getInt("id"));
                booking.setCustomer_id(resultSet.getInt("customer_id"));
                booking.setShowtime_id(resultSet.getInt("showtime_id"));
                booking.setSeat_id(resultSet.getInt("seat_id"));
                booking.setTotal_price(resultSet.getFloat("total_price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }
}
