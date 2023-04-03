/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Book;
import Model.Movie;
import Model.Screens;
import Model.Seats;
import Model.ShowTime;
import Model.ShowtimeMovieScreen;
import Model.User;
import Programs.SaltedMD5;
import Service.Impl.BookingServiceImpl;
import Service.Impl.MovieServiceImpl;
import Service.Impl.ScreensServiceImpl;
import Service.Impl.SeatServiceImpl;
import Service.Impl.ShowtimeServiceImpl;
import Service.Impl.UserServiceImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.time.LocalDate;
import java.time.LocalTime;
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
import org.json.JSONArray;

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

        //FORGOT PASSWORD PROCESS
        if (page.equalsIgnoreCase("forgotpassword")) {

        }

        // SIGNUP PROCESS
        if (page.equalsIgnoreCase("register")) {
            try {
                String name = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirm_password = request.getParameter("confirm_password");

                String hashedPassword = get_hash(password);

                User user = new User();
                user.setName(name);
                user.setEmail(email);
                user.setPassword(hashedPassword);

                new UserServiceImpl().insertUser(user);

                get_home_info(request, response);

                RequestDispatcher rd = request.getRequestDispatcher("/Pages/home.jsp");
                rd.forward(request, response);

            } catch (NoSuchAlgorithmException | NoSuchProviderException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            }
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

        if (page.equalsIgnoreCase("bookingConfirm")) {
            HttpSession session = request.getSession(true);
            String username = (String) session.getAttribute("username");

            int showtime_id = Integer.parseInt(request.getParameter("showtime_id"));

            User customer = new UserServiceImpl().getUser(username);
            System.out.println(customer.getCustomer_id());

            String selectedSeatsParam = request.getParameter("selectedSeats");
            JSONArray selectedSeats = new JSONArray(URLDecoder.decode(selectedSeatsParam, "UTF-8"));

            //Inserting the booking valu
            float final_price = 0;
            for (int i = 0; i < selectedSeats.length(); i++) {
                int seat = Integer.parseInt(selectedSeats.getString(i));
                Book booking = new Book();
                booking.setCustomer_id(customer.getCustomer_id());
                booking.setShowtime_id(showtime_id);
                booking.setTotal_price(150);
                booking.setSeat_id(seat);

                final_price = final_price + 150;

                new BookingServiceImpl().insertBooking(booking);
            }

            ShowtimeMovieScreen showtime_detaiils = new ShowtimeServiceImpl().getShowtimeDetailsById(showtime_id);
            LocalDate currentDate = LocalDate.now();
            LocalTime currentTime = LocalTime.now();

//            request.setAttribute("selectedSeats",selectedSeats);
            request.setAttribute("showtime_detaiils", showtime_detaiils);
            request.setAttribute("totalSeats", selectedSeats.length());
            request.setAttribute("final_price", final_price);
            request.setAttribute("currentDate", currentDate);
            request.setAttribute("currentTime", currentTime);

            RequestDispatcher rd = request.getRequestDispatcher("/Pages/booking-confirm.jsp");
            rd.forward(request, response);
        }

        if (page.equalsIgnoreCase("bookingBilling")) {
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/booking-billing.jsp");
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
        String hashedPassword = get_hash(password);

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

    // Hash Password function
    private static String get_hash(String password) throws NoSuchAlgorithmException, NoSuchProviderException {
        String hash = new SaltedMD5().getHash(password);
        return hash;
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
