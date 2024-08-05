/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.BookingFlex;

import DAO.ServiceDAO;
import Models.Booking;
import Models.Customer;
import Models.Item;
import Models.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class BookingType3Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingType3Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingType3Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        float total = 0, event = 0, endTotal = 0;
        if (session != null && session.getAttribute("listBookingFlex") != null && session.getAttribute("cusObj") != null) {
            Customer cus = (Customer) session.getAttribute("cusObj");
            List<Booking> listBookingFlex = (List<Booking>) session.getAttribute("listBookingFlex");
            for (Booking listBooking : listBookingFlex) {
                total += listBooking.calculateTotalPriceNotEvent();
                if (listBooking.getEvent().size() != 0) {
                    event = listBooking.getEvent().get(0).getDiscountPercent();
                }
            }
            endTotal = total - (total) * (event + cus.getTypeCustomer().getDiscount()) / 100;
            endTotal = (float) (endTotal + endTotal * 0.1);
            request.setAttribute("total", total);
            request.setAttribute("event", event);
            request.setAttribute("endTotal", endTotal);
        }
        request.getRequestDispatcher("Views/client/BookingType3.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
