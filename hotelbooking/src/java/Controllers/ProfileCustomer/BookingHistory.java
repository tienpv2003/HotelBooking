/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.ProfileCustomer;

import DAO.HistoryBookingDAO;
import DAO.InvoiceCustomerDAO;
import Models.Booking;
import Models.Customer;
import Models.HistoryBooking;
import Models.Item;
import Models.InvoiceCustomer;
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
 * @author admin
 */
public class BookingHistory extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet BookingHistory</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingHistory at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HistoryBookingDAO historyBookingDAO = new HistoryBookingDAO();
        HttpSession session = request.getSession(false); 
        Customer customer = (Customer) session.getAttribute("cusObj");
        request.setAttribute("listHistory", historyBookingDAO.getHistoryByCustomer(customer));
//        for (HistoryBooking historyBooking : historyBookingDAO.getHistoryByCustomer(customer)) {
//            for (Booking object : historyBooking.getListBooking()) {
//                for (Item item : object.getListItem()) {
//                    out.println(item.getRoom().getRoomId());
//                }
//            }
//        }
        if (session != null) {
            Customer cus = (Customer) session.getAttribute("cusObj");
            if (cus != null) {
                int cusId = cus.getCustomerId();
                InvoiceCustomerDAO invoiceCustomerDAO = new InvoiceCustomerDAO();
                List<InvoiceCustomer> invoiceList = invoiceCustomerDAO.findByCustomerId(cusId);
                request.setAttribute("list", invoiceList);
            } else {
                request.setAttribute("error", "Customer not found in session.");
            }
        } else {
            request.setAttribute("error", "Session is null.");
        }
        request.getRequestDispatcher("Views/client/bill-history.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
