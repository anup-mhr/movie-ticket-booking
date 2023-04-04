/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Api;

import com.google.protobuf.Message;
import com.mysql.cj.Session;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anup
 */
@WebServlet(name = "forgotPassowrd", urlPatterns = {"/forgotPassowrd"})
public class forgotPassowrd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the user's email address or username from the form
        String email = request.getParameter("email");

        // Send an email to the user's registered email address with a link containing the token
//        sendForgotPasswordEmail(email, "sdd");

        // Redirect the user to a confirmation page
        response.sendRedirect("/forgotPasswordConfirmation.jsp");
    }

 

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
