/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Movie;
import Model.Screens;
import Model.Seats;
import Model.ShowTime;
import Model.User;
import Programs.SaltedMD5;
import Service.Impl.MovieServiceImpl;
import Service.Impl.ScreensServiceImpl;
import Service.Impl.SeatServiceImpl;
import Service.Impl.ShowtimeServiceImpl;
import Service.Impl.UserServiceImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    //VARIABLES FOR LIMITING THE LOGIN ATTEMPT
    //----------------------------------
    private static final int MAX_ATTEMPTS = 3;
    private static final long LOCKOUT_TIME = 60000; // 1 minute in milliseconds
    private static Map<String, Integer> loginAttempts = new HashMap<>();
    private static Map<String, Long> lockoutTimes = new HashMap<>();
    //-------------------------

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String page = request.getParameter("page");

        if (page.equalsIgnoreCase("home")) {
            get_home_info(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("register")) {
            RequestDispatcher rd = request.getRequestDispatcher("");
            rd.forward(request, response);
        }

        //lOGIN PROCESS
        if (page.equalsIgnoreCase("existing")) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username == null || username.isEmpty()) {
                get_home_info(request, response);
                RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");
                rd.forward(request, response);
                return;
            }
            UserServiceImpl userservice = new UserServiceImpl();
            // Check if the username exists in the database
            if (!userservice.isUserExist(username)) {
                get_home_info(request, response);
                RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");
                rd.forward(request, response);
                return;
            }

            // Check if the user has exceeded the maximum number of login attempts
            if (loginAttempts.containsKey(username) && loginAttempts.get(username) >= MAX_ATTEMPTS) {
                // Check if the lockout time has expired
                long lockoutTime = lockoutTimes.getOrDefault(username, 0L);
                if (System.currentTimeMillis() - lockoutTime < LOCKOUT_TIME) {
                    // User is still locked out, show an error message or redirect to a lockout page
                    System.out.println("Locked");
                    response.sendRedirect("Pages/lock.jsp");
                    return;
                } else {
                    // Lockout time has expired, reset the login attempts counter
                    loginAttempts.remove(username);
                    lockoutTimes.remove(username);
                }
            }

            // Authenticate the user
            boolean isAuthenticated = false;
            try {
                isAuthenticated = authenticateUser(username, password);
            } catch (NoSuchAlgorithmException | NoSuchProviderException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (isAuthenticated) {
                // Reset the login attempts counter for this user
                loginAttempts.remove(username);
                lockoutTimes.remove(username);
                // Proceed with the login process

                HttpSession session = request.getSession();     //Creating session
                session.setAttribute("username", username);

                get_home_info(request, response);

                RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");
                rd.forward(request, response);
            } else {
                // Increment the login attempts counter for this user
                int attempts = loginAttempts.getOrDefault(username, 0) + 1;
                loginAttempts.put(username, attempts);
                // Set the lockout time if the maximum number of attempts has been reached
                if (attempts >= MAX_ATTEMPTS) {
                    lockoutTimes.put(username, System.currentTimeMillis());
                }

                get_home_info(request, response);

                RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");  //without session
                rd.forward(request, response);

            }
            response.sendRedirect("/Pages/home.jsp");    //without session
        }

        if (page.equalsIgnoreCase("home")) {

            get_home_info(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("ticketrate")) {
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/TicketRate.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("aboutus")) {
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/aboutUs.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("moviedetails")) {

            int movie_id = Integer.parseInt(request.getParameter("id"));

            Movie movie = new MovieServiceImpl().getMovieById(movie_id);
            List<Screens> screens = new ScreensServiceImpl().getScreenList();
            List<ShowTime> showtimes = new ShowtimeServiceImpl().getShowtimeByMovieId(movie_id);

            request.setAttribute("movie", movie);
            request.setAttribute("screens", screens);
            request.setAttribute("showtimes", showtimes);

            RequestDispatcher rd = request.getRequestDispatcher("/Pages/movie-detail.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("booking")) {
            int showtime_id = Integer.parseInt(request.getParameter("showtime_id"));

            List<Seats> seats = new SeatServiceImpl().getSeats();

            request.setAttribute("seats", seats);
            request.setAttribute("showtime_id", showtime_id);

            RequestDispatcher rd = request.getRequestDispatcher("/Pages/booking.jsp");
            rd.forward(request, response);
        }

        //LOGOUT PROCESS
        if (page.equalsIgnoreCase("logout")) {

            HttpSession session = request.getSession(false);
            session.invalidate();

            get_home_info(request, response);

            RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");
            rd.forward(request, response);
        }

    }

    private boolean authenticateUser(String username, String password) throws NoSuchAlgorithmException, NoSuchProviderException {
        // Authentication logic here
        boolean isValidUser = false;

        // Getting Hashed Password
        SaltedMD5 md = new SaltedMD5();
        String hashedPassword = md.getHash(password);

        User user = new UserServiceImpl().getUser(username);

        System.out.println("--------------");
        System.out.println(user.getPassword());
        System.out.println(hashedPassword);
        System.out.println("----------------");
        // Checking user password and login password
        if (user.getPassword().equalsIgnoreCase(hashedPassword)) {
            isValidUser = true;
        }
        return isValidUser;
    }

    private static void get_home_info(HttpServletRequest request, HttpServletResponse response) {
        Movie movie = new Movie();
        List<Movie> moviesList = new MovieServiceImpl().getMovies();
        List<Movie> moviesReleased = new MovieServiceImpl().getMoviesAfterRelease();
        List<Movie> moviesComming = new MovieServiceImpl().getMoviesBeforeRelease();

        request.setAttribute("movie", movie);
        request.setAttribute("moviesList", moviesList);
        request.setAttribute("moviesReleased", moviesReleased);
        request.setAttribute("moviesComming", moviesComming);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
