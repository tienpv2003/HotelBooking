/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.StaffBooking;

import DAO.CustomerDAO;
import DAO.TypeRoomDAO;
import Models.Customer;
import Models.RoomType;
import Utils.LoginValidator;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Acer
 */
public class BookingInfoOldServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TypeRoomDAO trDao = new TypeRoomDAO();
        List<RoomType> listTR = trDao.getTypeRoomHasRoomActive();
        request.setAttribute("listTypeRoom", listTR);
        request.getRequestDispatcher("Views/admin/booking-info.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LoginValidator validator = new LoginValidator();
        String email = request.getParameter("email");
        String valiEmail = validator.validateEmail(email);
        TypeRoomDAO dao = new TypeRoomDAO();
        if (valiEmail == null) {
            CustomerDAO daoCus = new CustomerDAO();
            HttpSession session = request.getSession(false);
            Customer customer = daoCus.findByEmail(email);
            if (session != null && session.getAttribute("cusBooking") != null) {
                session.removeAttribute("cusBooking");
            }
            if (customer == null) {
                request.setAttribute("notExist", "notExist");
                request.setAttribute("email", email);
                request.getRequestDispatcher("Views/admin/booking-info.jsp").forward(request, response);
            } else {
                session = request.getSession(false);
                request.setAttribute("listTypeRoom", dao.getTypeRoomHasRoomActive());
                session.setAttribute("cusBooking", customer);
                request.getRequestDispatcher("Views/admin/booking-info.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("messError", valiEmail);
            request.setAttribute("email", email);
            request.getRequestDispatcher("Views/admin/booking-info.jsp").forward(request, response);
        }
    }

}
