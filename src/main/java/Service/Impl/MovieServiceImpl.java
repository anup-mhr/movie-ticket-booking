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

    public void addMovie(Movie movie) {
        String query = "insert into movies(title, description, release_date, video_url, cast, duration, gene, director, picture, poster) values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getDescription());
            preparedStatement.setString(3, movie.getRelease_date());
            preparedStatement.setString(4, movie.getVideo_url());
            preparedStatement.setString(5, movie.getCast());
            preparedStatement.setString(6, movie.getDuration());
            preparedStatement.setString(7, movie.getGene());
            preparedStatement.setString(8, movie.getDirector());
            preparedStatement.setString(9, movie.getPicture());
            preparedStatement.setString(10, movie.getPoster());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteMovieById(int movie_id) {
        String query = "delete from movies where movie_id=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setInt(1, movie_id);
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
