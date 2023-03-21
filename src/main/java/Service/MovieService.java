/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import Model.Movie;
import java.util.List;

/**
 *
 * @author Anup
 */
public interface MovieService {
    public List<Movie> getMovies(); 
    public List<Movie> getMoviesAfterRelease();
    public List<Movie> getMoviesBeforeRelease();
    public Movie getMovieById(int movie_id);
}
