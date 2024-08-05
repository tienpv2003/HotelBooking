/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.Services;

import DAO.ServiceDAO;
import Models.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
public class ActiveServiceServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ActiveServiceServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActiveServiceServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

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
        try {
            String serviceIdStr = request.getParameter("idService");
            if (serviceIdStr == null || serviceIdStr.isEmpty()) {
                throw new NumberFormatException("Service ID is null or empty");
            }

            int service = Integer.parseInt(serviceIdStr);
            ServiceDAO serviceDAO = new ServiceDAO();
            boolean isInactive = serviceDAO.activeService(service);

            if (isInactive) {
                request.setAttribute("msgActiveService", "Thành công.");
            } else {
                request.setAttribute("msgActiveService", "Không thành công.");
            }

           
            List<Service> listService = serviceDAO.getAllInActive();
            request.setAttribute("listServiceInactive", listService);
            request.getRequestDispatcher("Views/admin/all-service-inactive.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("msgInactiveService", "Lỗi định dạng ID.");
            request.getRequestDispatcher("Views/admin/all-service-inactive.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msgInactiveService", "Xảy ra lỗi, vui lòng thử lại.");
            request.getRequestDispatcher("Views/admin/all-service-inactive.jsp").forward(request, response);
        }
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
