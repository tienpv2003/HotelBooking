/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.LoginCustomer;

import DAO.CustomerDAO;
import Utils.LoginValidator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EmailSignUpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Login/email_signup.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        //validate Email
        LoginValidator validator = new LoginValidator();
        String errorMessage = validator.validateEmail(email);
        if (!(errorMessage == null)) {
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("email", email);
            request.getRequestDispatcher("Views/Login/email_signup.jsp").forward(request, response);
            return;
        } else {
            CustomerDAO cusDao = new CustomerDAO();
            if (cusDao.findByEmail(email) != null) {
                request.setAttribute("errorMessage", "Email này đã được đăng ký");
                request.setAttribute("email", email);
                request.getRequestDispatcher("Views/Login/email_signup.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("cusMail", email);
                response.sendRedirect("otp_signup");
            }
        }
    }
}