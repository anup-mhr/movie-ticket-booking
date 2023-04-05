/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Movie;
import Model.Screens;
import Model.ShowTime;
import Model.ShowtimeMovieScreen;
import Service.Impl.AdminServiceImpl;
import Service.Impl.MovieServiceImpl;
import Service.Impl.ScreensServiceImpl;
import Service.Impl.ShowtimeServiceImpl;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anup
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String page = request.getParameter("page");

        if (page.equalsIgnoreCase("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            AdminServiceImpl adminservice = new AdminServiceImpl();

            if (!adminservice.getAdmin(username, password)) {
                RequestDispatcher rd = request.getRequestDispatcher("/Admin/login.jsp");
                rd.forward(request, response);
            }

            HttpSession session = request.getSession();     //Creating session
            session.setAttribute("username", username);

            List<Movie> movies = new MovieServiceImpl().getMovies();

            request.setAttribute("username", username);
            request.setAttribute("movies", movies);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/home.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("dashboard")) {
            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/home.jsp");
            rd.forward(request, response);
        }

        //MOVIES START
        if (page.equalsIgnoreCase("movies-add")) {

            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/movies-add.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("movies-added")) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String director = request.getParameter("director");
            String casts = request.getParameter("casts");
            String releaseDate = request.getParameter("releaseDate");
            String duration = request.getParameter("duration");
            String genre = request.getParameter("genre");
            String trailer_url = request.getParameter("trailer_url");
            String picture = request.getParameter("picture");
            String poster = request.getParameter("poster");

            Movie movie = new Movie();
            movie.setTitle(title);
            movie.setCast(casts);
            movie.setDescription(description);
            movie.setDirector(director);
            movie.setDuration(duration);
            movie.setRelease_date(releaseDate);
            movie.setVideo_url(trailer_url);
            movie.setGene(genre);
            movie.setPicture(picture);
            movie.setPoster(poster);

            new MovieServiceImpl().addMovie(movie);
            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/movies-add.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("movies-edit")) {
            Movie movie = new MovieServiceImpl().getMovieById(1);

            request.setAttribute("movie", movie);

            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/movies-edit.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("movies-remove")) {
            List<Movie> movies = new MovieServiceImpl().getMovies();

            request.setAttribute("movies", movies);
            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/movies-remove.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("movies-removed")) {
            int movie_id = Integer.parseInt(request.getParameter("movieId"));
            new MovieServiceImpl().deleteMovieById(movie_id);

            List<Movie> movies = new MovieServiceImpl().getMovies();

            request.setAttribute("movies", movies);
            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/movies-remove.jsp");
            rd.forward(request, response);
        }

        //SHOWTIME START
        if (page.equalsIgnoreCase("showtime-add")) {
            List<Movie> movies = new MovieServiceImpl().getMovies();
            List<Screens> screens = new ScreensServiceImpl().getScreenList();
            getHeaderInfo(request, response);

            request.setAttribute("movies", movies);
            request.setAttribute("screens", screens);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/showtime-add.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("showtime-added")) {
            int movie_id = Integer.parseInt(request.getParameter("movie"));
            int screen_id = Integer.parseInt(request.getParameter("screen"));
            String start_time = request.getParameter("start_time");
            String end_time = request.getParameter("end_time");

            ShowTime showtime = new ShowTime();
            showtime.setMovie_id(movie_id);
            showtime.setScreen_id(screen_id);
            showtime.setStart_time(start_time);
            showtime.setEnd_time(end_time);

            new ShowtimeServiceImpl().addShowtime(showtime);

            List<Movie> movies = new MovieServiceImpl().getMovies();
            List<Screens> screens = new ScreensServiceImpl().getScreenList();

            getHeaderInfo(request, response);

            request.setAttribute("movies", movies);
            request.setAttribute("screens", screens);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/showtime-add.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("showtime-remove")) {
            List<ShowtimeMovieScreen> showtimeList = new ShowtimeServiceImpl().getShowtimeDetailsList();
            getHeaderInfo(request, response);

            request.setAttribute("showtimeList", showtimeList);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/showtime-remove.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("showtime-removed")) {
            int showtime_id = Integer.parseInt(request.getParameter("showtime_id"));

            new ShowtimeServiceImpl().deleteShowtimeById(showtime_id);

            List<ShowtimeMovieScreen> showtimeList = new ShowtimeServiceImpl().getShowtimeDetailsList();
            getHeaderInfo(request, response);

            request.setAttribute("showtimeList", showtimeList);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/showtime-remove.jsp");
            rd.forward(request, response);
        }

        //TRANSACTION START
        if (page.equalsIgnoreCase("transactions-movie")) {
            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/transactions-movie.jsp");
            rd.forward(request, response);
        }

        //PROFILE START
        if (page.equalsIgnoreCase("UserProfile")) {
            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/users-profile.jsp");
            rd.forward(request, response);
        }

        //incomplete
        if (page.equalsIgnoreCase("changePassword")) {
            String password = request.getParameter("password");
            String newpassword = request.getParameter("newpassword");
//            String renewpassword = request.getParameter("renewpassword");

            HttpSession session = request.getSession(true);
            String username = (String) session.getAttribute("username");

            Boolean status = new AdminServiceImpl().getAdmin(username, password);
            if (!status) {
                String statusMessage = "Your current password is Incorrect ";
                request.setAttribute("statusMessage", statusMessage);

                getHeaderInfo(request, response);

                RequestDispatcher rd = request.getRequestDispatcher("/Admin/users-profile.jsp");
                rd.forward(request, response);
            }

            new AdminServiceImpl().UpdateAdminPassword(newpassword, username);

            String changeMessage = "Password Changed";
            request.setAttribute("changeMessage", changeMessage);

            getHeaderInfo(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/users-profile.jsp");
            rd.forward(request, response);
        }

        //LOGOUT START
        if (page.equalsIgnoreCase("signout")) {

            HttpSession session = request.getSession(false);
            session.invalidate();

            RequestDispatcher rd = request.getRequestDispatcher("/Admin/login.jsp");
            rd.forward(request, response);
        }
    }

    private static void getHeaderInfo(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String username = (String) session.getAttribute("username");

        List<Movie> movies = new MovieServiceImpl().getMovies();

        request.setAttribute("username", username);
        request.setAttribute("movies", movies);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
