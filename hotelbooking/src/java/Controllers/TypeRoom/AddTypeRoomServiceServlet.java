/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.TypeRoom;

import DAO.RoomTypeServiceDAO;
import DAO.ServiceDAO;
import DAO.TypeRoomDAO;
import Models.RoomType;
import Models.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.List;

/**
 *
 * @author admin
 */
public class AddTypeRoomServiceServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AddTypeRoomServiceServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTypeRoomServiceServlet at " + request.getContextPath () + "</h1>");
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
        TypeRoomDAO typeRoomDao = new TypeRoomDAO();
        ServiceDAO serviceDAO = new ServiceDAO();
        List<RoomType> roomType = typeRoomDao.getAllRoomType();
        List<Service> listService = serviceDAO.listService();
        request.setAttribute("listService", listService);
        request.setAttribute("roomType", roomType);
        request.getRequestDispatcher("Views/admin/add-room-type-service.jsp").forward(request, response);
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
        String roomTypeStr = request.getParameter("roomTypeId");
        String[] selectedServices = request.getParameterValues("service");
        RoomTypeServiceDAO roomServiceDAO = new RoomTypeServiceDAO();
        try {
            int roomType = Integer.parseInt(roomTypeStr);
            List<Integer> existingServiceIds = roomServiceDAO.getAllServiceId(roomType);
            if (roomType != 0 && selectedServices != null) {
                TypeRoomDAO typeRoomDao = new TypeRoomDAO();
                for (String serviceIdStr : selectedServices) {
                    int serviceId = Integer.parseInt(serviceIdStr);
                    if (!existingServiceIds.contains(serviceId)) {
                        typeRoomDao.addServiceToRoomType(roomType, serviceIdStr);
                    }
                }
                String message = URLEncoder.encode("Thành công", "UTF-8");
                response.sendRedirect("add_type_room_service?message=" + message);
            } else {
                String message = URLEncoder.encode("Thất bại", "UTF-8");
                response.sendRedirect("add_type_room_service?message1=" + message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
