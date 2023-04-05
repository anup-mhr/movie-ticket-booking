/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Impl;

import DBConnection.DBConnection;
import Model.ShowTime;
import Model.ShowtimeMovieScreen;
import Service.ShowtimeService;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anup
 */
public class ShowtimeServiceImpl implements ShowtimeService {

    @Override
    public List<ShowTime> getShowtimeByMovieId(int movie_id) {
        List<ShowTime> showtimes = new ArrayList<ShowTime>();
        String query = "select * from showtime where movie_id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setInt(1, movie_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ShowTime showtime = new ShowTime();
                showtime.setShowtime_id(resultSet.getInt("showtime_id"));
                showtime.setMovie_id(resultSet.getInt("movie_id"));
                showtime.setScreen_id(resultSet.getInt("screen_id"));
                showtime.setStart_time(resultSet.getString("start_time"));
                showtime.setEnd_time(resultSet.getString("end_time"));
                showtimes.add(showtime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return showtimes;
    }

    public ShowtimeMovieScreen getShowtimeDetailsById(int showtime_id) {
        String query = "SELECT showtime.showtime_id, showtime.movie_id, showtime.screen_id, showtime.start_time, screens.name, movies.title\n"
                + "FROM showtime\n"
                + "INNER JOIN screens\n"
                + "ON showtime.screen_id = screens.screen_id\n"
                + "INNER join movies\n"
                + "ON showtime.movie_id = movies.movie_id where showtime_id=?;";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        ShowtimeMovieScreen showtime_details = null;
        try {
            preparedStatement.setInt(1, showtime_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                showtime_details = new ShowtimeMovieScreen();
                showtime_details.setShowtime_id(resultSet.getInt("showtime_id"));
                showtime_details.setMovie_id(resultSet.getInt("movie_id"));
                showtime_details.setScreen_id(resultSet.getInt("screen_id"));
                showtime_details.setName(resultSet.getString("name"));
                showtime_details.setTitle(resultSet.getString("title"));
                                showtime_details.setStart_time(resultSet.getString("start_time"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return showtime_details;
    }

    public List<ShowtimeMovieScreen> getShowtimeDetailsList() {
        List<ShowtimeMovieScreen> showtimeList = new ArrayList<ShowtimeMovieScreen>();
        String query = "SELECT showtime.showtime_id, showtime.movie_id, showtime.start_time, showtime.end_time, showtime.screen_id, screens.name, movies.picture, movies.title\n"
                + "FROM showtime\n"
                + "INNER JOIN screens\n"
                + "ON showtime.screen_id = screens.screen_id\n"
                + "INNER join movies\n"
                + "ON showtime.movie_id = movies.movie_id";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        ShowtimeMovieScreen showtime_details = null;
        try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                showtime_details = new ShowtimeMovieScreen();
                showtime_details.setShowtime_id(resultSet.getInt("showtime_id"));
                showtime_details.setMovie_id(resultSet.getInt("movie_id"));
                showtime_details.setScreen_id(resultSet.getInt("screen_id"));
                showtime_details.setName(resultSet.getString("name"));
                showtime_details.setTitle(resultSet.getString("title"));
                showtime_details.setStart_time(resultSet.getString("start_time"));
                showtime_details.setEnd_time(resultSet.getString("end_time"));
                showtime_details.setPicture(resultSet.getString("picture"));
                showtimeList.add(showtime_details);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return showtimeList;
    }

    public void addShowtime(ShowTime showtime) {
        String query = "insert into showtime(movie_id, screen_id, start_time, end_time) values(?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setInt(1, showtime.getMovie_id());
            preparedStatement.setInt(2, showtime.getScreen_id());
            preparedStatement.setString(3, showtime.getStart_time());
            preparedStatement.setString(4, showtime.getEnd_time());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteShowtimeById(int showtime_id) {
        String query = "delete from showtime where showtime_id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setInt(1, showtime_id);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
