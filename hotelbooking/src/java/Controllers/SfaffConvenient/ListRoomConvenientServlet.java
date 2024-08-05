package Controllers.SfaffConvenient;

import DAO.RoomConvenientDAO;
import Models.RoomConvenient;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ListRoomConvenientServlet extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RoomConvenientDAO rdao = new RoomConvenientDAO();
        List<RoomConvenient> roomConvenients = rdao.getAllRoomConvenient();
        request.setAttribute("roomConvenients", roomConvenients);
        request.getRequestDispatcher("Views/admin/all-room-convenient.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
}
