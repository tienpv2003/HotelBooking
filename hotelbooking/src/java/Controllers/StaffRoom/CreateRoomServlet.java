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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.List;

/**
 *
 * @author admin
 */
public class CreateRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateRoomServlet at " + request.getContextPath() + "</h1>");
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
        TypeRoomDAO trDao = new TypeRoomDAO();
        List<RoomType> roomTypes = trDao.getAllRoomType();
        request.setAttribute("roomTypes", roomTypes);
        request.getRequestDispatcher("Views/admin/add-room.jsp").forward(request, response);
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
            int roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
            TypeRoomDAO trDao = new TypeRoomDAO();
            RoomDAO roomDao = new RoomDAO();
            if (roomDao.isRoomNameExists(roomTypeId, roomName)) {
                String error = URLEncoder.encode("Tên phòng đã tồn tại trong loại phòng này", "UTF-8");
                response.sendRedirect("/HotelBooking/create_room?error=" + error);
                return;
            }
            RoomType roomType = trDao.getRoomTypeById(roomTypeId);
            Room room = new Room(roomTypeId, roomType, roomName, status);

            if (roomDao.createRoom(room)) {
                if (roomDao.incrementRoomTypeQuantity(roomTypeId)) {
                    String message = URLEncoder.encode("Phòng đã được thêm thành công.", "UTF-8");
                    response.sendRedirect("/HotelBooking/create_room?message=" + message);
                } else {
                    request.setAttribute("error", "Có lỗi xảy ra khi cập nhật số lượng phòng.");
                    request.getRequestDispatcher("Views/admin/add-room.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại.");
                request.getRequestDispatcher("Views/admin/add-room.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Giá tiền hoặc loại phòng không hợp lệ.");
            request.getRequestDispatcher("Views/admin/add-room.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            request.setAttribute("error", "Có lỗi xảy ra, vui lòng thử lại.");
            request.getRequestDispatcher("Views/admin/add-room.jsp").forward(request, response);
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
