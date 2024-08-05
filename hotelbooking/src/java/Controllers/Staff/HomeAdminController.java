/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Staff;

import DAO.InvoiceCustomerDAO;
import DAO.ReservationDAO;
import DAO.RoomDAO;
import Models.InvoiceCustomer;
import Models.Reservation;
import Models.Staff;
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
 * @author admin
 */
public class HomeAdminController extends HttpServlet {

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
            out.println("<title>Servlet HomeAdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeAdminController at " + request.getContextPath() + "</h1>");
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
        RoomDAO roomDAO = new RoomDAO();
        ReservationDAO reservationDAO = new ReservationDAO();
        InvoiceCustomerDAO invoiceCustomerDAO = new InvoiceCustomerDAO();
        
        if (session != null) {
            Staff staff = (Staff) session.getAttribute("emailStaff");
            request.setAttribute("staff", staff);
            
        }
        List<Reservation> list = reservationDAO.getTop10();
        //doanh thu theo tháng
        double month01 = invoiceCustomerDAO.getMonthlyRevenue(2024, 1);
        double month02 = invoiceCustomerDAO.getMonthlyRevenue(2024, 2);
        double month03 = invoiceCustomerDAO.getMonthlyRevenue(2024, 3);
        double month04 = invoiceCustomerDAO.getMonthlyRevenue(2024, 4);
        double month05 = invoiceCustomerDAO.getMonthlyRevenue(2024, 5);
        double month06 = invoiceCustomerDAO.getMonthlyRevenue(2024, 6);
        double month07 = invoiceCustomerDAO.getMonthlyRevenue(2024, 7);
        double month08 = invoiceCustomerDAO.getMonthlyRevenue(2024, 8);
        double month09 = invoiceCustomerDAO.getMonthlyRevenue(2024, 9);
        double month10 = invoiceCustomerDAO.getMonthlyRevenue(2024, 10);
        double month11 = invoiceCustomerDAO.getMonthlyRevenue(2024, 11);
        double month12 = invoiceCustomerDAO.getMonthlyRevenue(2024, 12);
        //số phòng đã đặt theo loại phòng
        int phongDon = roomDAO.getBookedRoomsCountByType(1);
        int phongDoi = roomDAO.getBookedRoomsCountByType(2);
        int phongGiaDinh = roomDAO.getBookedRoomsCountByType(3);
        int phongVIP = roomDAO.getBookedRoomsCountByType(4);
        int phongSuite = roomDAO.getBookedRoomsCountByType(5);
        
        request.setAttribute("month01", month01);
        request.setAttribute("month02", month02);
        request.setAttribute("month03", month03);
        request.setAttribute("month04", month04);
        request.setAttribute("month05", month05);
        request.setAttribute("month06", month06);
        request.setAttribute("month07", month07);
        request.setAttribute("month08", month08);
        request.setAttribute("month09", month09);
        request.setAttribute("month10", month10);
        request.setAttribute("month11", month11);
        request.setAttribute("month12", month12);
        
        request.setAttribute("phongDon", phongDon);
        request.setAttribute("phongDoi", phongDoi);
        request.setAttribute("phongGiaDinh", phongGiaDinh);
        request.setAttribute("phongVIP", phongVIP);
        request.setAttribute("phongSuite", phongSuite);
        
        request.setAttribute("listRoomActive", roomDAO.getActiveRoom());
        request.setAttribute("listRoomInActive", roomDAO.getInActiveRoom());
        request.setAttribute("listBookedRoom", roomDAO.getBookedRoom());
        request.setAttribute("listAllRoom", roomDAO.getAllRoomEx());
        request.setAttribute("listTop10", list);
        request.getRequestDispatcher("Views/admin/index.jsp").forward(request, response);
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
