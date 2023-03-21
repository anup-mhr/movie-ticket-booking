/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Service;

import Model.Book;
import java.util.List;

/**
 *
 * @author Anup
 */
public interface BookingService {
    public List<Book> getMoviesByShowtime(int showtime_id);
}
