/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Booking;

import DAO.ReviewDAO;
import DAO.TypeRoomDAO;
import Models.RoomType;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
public class RoomTypeDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexStr = request.getParameter("index");
        String idStr = request.getParameter("id");
        int index = 1;
        if (indexStr != null && !indexStr.trim().isEmpty()) {
            index = Integer.parseInt(indexStr);
        }

        ReviewDAO rdao = new ReviewDAO();
        // Count number of pages
        int id = Integer.parseInt(idStr);
        int count = rdao.getNumberTotalReview(id);
        int pageSize = 2;
        int endPage = count / pageSize;
        if (count % pageSize != 0) {
            endPage++;
        }

        try {
            TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
            RoomType roomType = typeRoomDAO.getRoomTypeById(id);
            List<RoomType> top4 = typeRoomDAO.getTopRoomTypesWithActiveRooms(id);

            request.setAttribute("roomType", roomType);
            request.setAttribute("top4", top4);
            // Phân trang review
            request.setAttribute("currentPage", index);
            request.setAttribute("endPage", endPage);
            request.setAttribute("listReview", rdao.getTwoReviews(id,index));
            request.getRequestDispatcher("Views/client/room-details.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
