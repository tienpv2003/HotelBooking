/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.StaffRoom;

import DAO.RoomDAO;
import DAO.TypeRoomDAO;
import Models.Room;
import Models.RoomType;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author admin
 */
public class UpdateRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateRoomServlet at " + request.getContextPath() + "</h1>");
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
        int roomId = Integer.parseInt(request.getParameter("id"));
        RoomDAO roomDao = new RoomDAO();
        Room room = roomDao.getRoomById(roomId);
        TypeRoomDAO trDao = new TypeRoomDAO();
        List<RoomType> roomTypes = trDao.getAllRoomType();
        request.setAttribute("room", room);
        request.setAttribute("roomTypes", roomTypes);
        request.getRequestDispatcher("Views/admin/edit-room.jsp").forward(request, response);
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
        String roomName = request.getParameter("roomname");
        String status = request.getParameter("status");

        try {
            int roomId = Integer.parseInt(request.getParameter("roomid"));
            int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
            TypeRoomDAO trDao = new TypeRoomDAO();
            RoomType roomType = trDao.getRoomTypeById(roomTypeId);

            Room room = new Room(roomId, roomType, roomName, status);
            RoomDAO roomDao = new RoomDAO();
            roomDao.updateRoom(room);

            request.setAttribute("message", "Phòng đã được cập nhật thành công.");
            request.getRequestDispatcher("Views/admin/edit-room.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
        }

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