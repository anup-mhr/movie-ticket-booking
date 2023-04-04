package Api;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Model.Book;
import Service.Impl.BookingServiceImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

/**
 *
 * @author Anup
 */
@WebServlet(urlPatterns = {"/getBooked"})
public class getBooked extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        
        int showtime_id = Integer.parseInt(request.getParameter("showtime_id"));
        
        Book book = new Book();
        List<Book> books = new BookingServiceImpl().getMoviesByShowtime(showtime_id);
        int[] seatIds = new int[books.size()];
        // iterate over each book object in the list
        for (int i = 0; i < books.size(); i++) {
            seatIds[i] = books.get(i).getSeat_id(); // get the seat_id attribute from the book object and store it in the array
        }
        System.out.println(seatIds);
        String json = new Gson().toJson(seatIds);
        response.getWriter().write(json);

//        response.getWriter().write(books.iterator().next().getSeat_id());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
