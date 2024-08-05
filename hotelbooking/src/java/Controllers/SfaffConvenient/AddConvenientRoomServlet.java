package Controllers.SfaffConvenient;

import DAO.ConvenientDAO;
import DAO.RoomConvenientDAO;
import DAO.RoomDAO;
import Models.Convenient;
import Models.Room;
import Models.RoomConvenient;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class AddConvenientRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdStr = request.getParameter("roomId");
        int roomId = Integer.parseInt(roomIdStr);
        RoomConvenientDAO rdao = new RoomConvenientDAO();
        ConvenientDAO cdao = new ConvenientDAO();
        request.setAttribute("convenients", cdao.getAll());
        request.setAttribute("roomConvenients", rdao.getRoomConvenientByRoomId(roomId));
        request.getRequestDispatcher("Views/admin/add-convenient-room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdStr = request.getParameter("roomId");
        String[] convenientIds = request.getParameterValues("convenientId");
        String status = request.getParameter("status");

        if (roomIdStr == null || convenientIds == null || status == null) {
            request.setAttribute("errorMess", "Vui lòng chọn phòng, tiện ích và trạng thái.");
            request.getRequestDispatcher("Views/admin/add-convenient-room.jsp").forward(request, response);
            return;
        }

        int roomId = Integer.parseInt(roomIdStr);
        RoomDAO rdao = new RoomDAO();
        RoomConvenientDAO rcdao = new RoomConvenientDAO();
        ConvenientDAO cdao = new ConvenientDAO();
        boolean added = false;

        try {
            // Delete all existing room convenients for the room
            rcdao.deleteRoomConvenientsByRoomId(roomId);

            // Add new room convenients based on selected convenientIds
            List<Convenient> conveniences = new ArrayList<>();
            for (String convenientIdStr : convenientIds) {
                int convenientId = Integer.parseInt(convenientIdStr);
                Convenient convenient = cdao.findById(convenientId);
                conveniences.add(convenient);
            }

            Room room = rdao.getRoomById(roomId);
            //Nếu status của room convenient là: process -> status room la : inactive
            if (status.equalsIgnoreCase("process")) {
                room.setStatus("inactive");
            }
            RoomConvenient rc = new RoomConvenient(room, conveniences, status);
            added = rcdao.addRoomConvenient(rc);

            if (added) {
                request.setAttribute("successMess", "Đã thêm tiện ích vào phòng");
            } else {
                request.setAttribute("errorMess", "Thêm tiện ích vào phòng bị lỗi");
            }
        } catch (Exception e) {
            request.setAttribute("errorMess", "Đã xảy ra lỗi: " + e.getMessage());
        }

        request.getRequestDispatcher("Views/admin/add-convenient-room.jsp").forward(request, response);
    }
}
