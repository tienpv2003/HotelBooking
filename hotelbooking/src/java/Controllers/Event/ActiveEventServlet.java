/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.Event;

import DAO.EventDAO;
import Models.Event;
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
public class ActiveEventServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ActiveEventServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActiveEventServlet at " + request.getContextPath () + "</h1>");
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
        try {
            String eventIdStr = request.getParameter("inEventId");
            if (eventIdStr == null || eventIdStr.isEmpty()) {
                throw new NumberFormatException("Event ID is null or empty");
            }

            int eventId = Integer.parseInt(eventIdStr);
            EventDAO eventDAO = new EventDAO();
            boolean isActive = eventDAO.activeEvent(eventId);

            if (isActive) {
                request.setAttribute("msgInactive", "Thành công.");
            } else {
                request.setAttribute("msgInactive", "Không thành công.");
            }

            // Tải lại danh sách sự kiện không hoạt động sau khi cập nhật
            List<Event> listEventInactive = eventDAO.getAllInactive();  // Giả sử bạn có phương thức này trong EventDAO
            request.setAttribute("listEventInactive", listEventInactive);

            request.getRequestDispatcher("Views/admin/all-event-inactive.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("msgInactive", "Lỗi định dạng ID.");
            request.getRequestDispatcher("Views/admin/all-event-inactive.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msgInactive", "Xảy ra lỗi, vui lòng thử lại.");
            request.getRequestDispatcher("Views/admin/all-event-inactive.jsp").forward(request, response);
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
