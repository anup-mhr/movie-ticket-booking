/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service.Impl;

import DBConnection.DBConnection;
import Model.Movie;
import Service.MovieService;
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
public class MovieServiceImpl implements MovieService {

    @Override
    public List<Movie> getMovies() {
        List<Movie> movies = new ArrayList<Movie>();
        String query = "select * from movies";
        DBConnection dbConnect = new DBConnection();
        try {
            PreparedStatement preparedStatement = dbConnect.getStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setMovie_id(resultSet.getInt("movie_id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setDescription(resultSet.getString("description"));
                movie.setRelease_date(resultSet.getString("release_date"));
                movie.setVideo_url(resultSet.getString("video_url"));
                movie.setCast(resultSet.getString("cast"));
                movie.setDuration(resultSet.getString("duration"));
                movie.setGene(resultSet.getString("gene"));
                movie.setDirector(resultSet.getString("director"));
                movie.setPicture(resultSet.getString("picture"));
                movie.setPoster(resultSet.getString("poster"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
        return movies;
    }

    @Override
    public List<Movie> getMoviesAfterRelease() {
        List<Movie> movies = new ArrayList<Movie>();
        String query = "select * from movies where release_date<=now();";
        DBConnection dbConnect = new DBConnection();
        try {
            PreparedStatement preparedStatement = dbConnect.getStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setMovie_id(resultSet.getInt("movie_id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setDescription(resultSet.getString("description"));
                movie.setRelease_date(resultSet.getString("release_date"));
                movie.setVideo_url(resultSet.getString("video_url"));
                movie.setCast(resultSet.getString("cast"));
                movie.setDuration(resultSet.getString("duration"));
                movie.setGene(resultSet.getString("gene"));
                movie.setDirector(resultSet.getString("director"));
                movie.setPicture(resultSet.getString("picture"));
                movie.setPoster(resultSet.getString("poster"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
        return movies;
    }

    @Override
    public List<Movie> getMoviesBeforeRelease() {
        List<Movie> movies = new ArrayList<Movie>();
        String query = "select * from movies where release_date>=now();";
        DBConnection dbConnect = new DBConnection();
        try {
            PreparedStatement preparedStatement = dbConnect.getStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setMovie_id(resultSet.getInt("movie_id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setDescription(resultSet.getString("description"));
                movie.setRelease_date(resultSet.getString("release_date"));
                movie.setVideo_url(resultSet.getString("video_url"));
                movie.setCast(resultSet.getString("cast"));
                movie.setDuration(resultSet.getString("duration"));
                movie.setGene(resultSet.getString("gene"));
                movie.setDirector(resultSet.getString("director"));
                movie.setPicture(resultSet.getString("picture"));
                movie.setPoster(resultSet.getString("poster"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
        return movies;
    }

    @Override
    public Movie getMovieById(int movie_id) {
        Movie movie = null;
        String query = "select * from movies where movie_id = ?;";
        DBConnection dbConnect = new DBConnection();
        try {
            PreparedStatement preparedStatement = dbConnect.getStatement(query);
            preparedStatement.setInt(1, movie_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                movie = new Movie();
                movie.setMovie_id(resultSet.getInt("movie_id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setDescription(resultSet.getString("description"));
                movie.setRelease_date(resultSet.getString("release_date"));
                movie.setVideo_url(resultSet.getString("video_url"));
                movie.setCast(resultSet.getString("cast"));
                movie.setDuration(resultSet.getString("duration"));
                movie.setGene(resultSet.getString("gene"));
                movie.setDirector(resultSet.getString("director"));
                movie.setPicture(resultSet.getString("picture"));
                movie.setPoster(resultSet.getString("poster"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            dbConnect.CloseConnection();
        }
        return movie;
    }

}
