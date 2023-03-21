/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Service;

import Model.ShowTime;
import java.util.List;

/**
 *
 * @author Anup
 */
public interface ShowtimeService {
     public List<ShowTime> getShowtimeByMovieId(int movie_id);
}
