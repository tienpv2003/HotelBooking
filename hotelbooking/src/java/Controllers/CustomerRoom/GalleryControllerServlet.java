/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.CustomerRoom;

import DAO.RoomDAO;
import DAO.TypeRoomDAO;
import Models.Room;
import Models.RoomType;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author PhạmVinhTiến
 */
public class GalleryControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int pageNumber = 1;
            int pageSize = 3;

            String pageParam = request.getParameter("page");
            String roomType = request.getParameter("typeRoom");
            RoomDAO roomDao = new RoomDAO();
            TypeRoomDAO typeRoomDao = new TypeRoomDAO();
            List<RoomType> roomTypes = typeRoomDao.getAllRoomType();
            int roomTypeNumber = 0;
            if (pageParam != null) {
                try {
                    pageNumber = Integer.parseInt(pageParam);
                } catch (Exception e) {
                    roomTypeNumber = 0;
                }
            }
            if (roomType != null) {
                try {
                    roomTypeNumber = Integer.parseInt(roomType);
                } catch (Exception e) {
                    roomTypeNumber = 0;
                }
            }
            int totalRooms = roomDao.getAllActiveRoomsAcount(roomTypeNumber).size();
            int totalPages = (int) Math.ceil((double) totalRooms / pageSize);
            if (pageNumber <= 0 || pageNumber > totalPages) {
                pageNumber = 1;
            }
            List<Room> rooms = roomDao.getAllActiveRooms(pageNumber, pageSize, roomTypeNumber);

            if (roomTypeNumber > 0) {
                request.setAttribute("roomTypeCurrent", roomType);
            }
            request.setAttribute("currentPage", pageNumber);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("rooms", rooms);
            request.setAttribute("roomTypes", roomTypes);
            request.getRequestDispatcher("Views/client/gallery.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
