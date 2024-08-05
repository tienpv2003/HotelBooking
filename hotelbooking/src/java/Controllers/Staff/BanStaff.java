/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.Staff;

import DAO.StaffDAO;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author win
 */
public class BanStaff extends HttpServlet {
   private static final long serialVersionUID = 1L;
    private StaffDAO staffDao;

    @Override
    public void init() {
        staffDao = new StaffDAO();
    }
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
            out.println("<title>Servlet BanStaff</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BanStaff at " + request.getContextPath () + "</h1>");
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
         StaffDAO dao = new StaffDAO();
        List<Staff> bannedStaffList = dao.BannedStaffList();
        request.setAttribute("bannedStaffList", bannedStaffList);
        request.getRequestDispatcher("Views/admin/ban-staff.jsp").forward(request, response);
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
        int staffId = Integer.parseInt(request.getParameter("staffId"));

        boolean isBanned = staffDao.banStaff(staffId);

        if (isBanned) {
            request.setAttribute("successMessage", "Tài khoản đã bị cấm thành công.");
             response.sendRedirect("all_staff");
        } else {
            request.setAttribute("errorMessage", "Không thể cấm tài khoản.");
             
        }
        
    }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
 

