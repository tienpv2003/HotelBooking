package Controllers.TypeRoom;

import DAO.RoomTypeServiceDAO;
import DAO.ServiceDAO;
import DAO.TypeRoomDAO;
import Models.RoomType;
import Models.Service;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateTypeRoomService extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        TypeRoomDAO typeRoomDao = new TypeRoomDAO();
        ServiceDAO serviceDAO = new ServiceDAO();
        RoomTypeServiceDAO RoomTypeServiceDAO = new RoomTypeServiceDAO();

        List<RoomType> roomTypeList = typeRoomDao.getAllRoomType();
        List<Service> serviceList = serviceDAO.listService();

        // Fetch selected services for the selected room type
        int roomTypeId = 0;
        if (request.getParameter("roomTypeId") != null) {
            roomTypeId = Integer.parseInt(request.getParameter("roomTypeId"));
        } else if (!roomTypeList.isEmpty()) {
            roomTypeId = roomTypeList.get(0).getRoomTypeId();
        }
        
        List<Integer> selectedServiceIds = RoomTypeServiceDAO.getAllServiceId(roomTypeId);

        request.setAttribute("selectedServiceIds", selectedServiceIds);
        request.setAttribute("selectedRoomTypeId", roomTypeId);
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("roomTypeList", roomTypeList);
        request.getRequestDispatcher("Views/admin/update-type-room-service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String roomTypeStr = request.getParameter("roomTypeId");
        String[] selectedServices = request.getParameterValues("services");
        RoomTypeServiceDAO RoomTypeServiceDAO = new RoomTypeServiceDAO();

        try {
            int roomType = Integer.parseInt(roomTypeStr);
            List<Integer> existingServiceIds = RoomTypeServiceDAO.getAllServiceId(roomType);

            if (roomType != 0) {
                RoomTypeServiceDAO typeRoomDao = new RoomTypeServiceDAO();

                // Convert selected services to a Set for easy checking
                Set<Integer> selectedServiceIdSet = selectedServices != null
                        ? Set.of(selectedServices).stream().map(Integer::parseInt).collect(Collectors.toSet())
                        : Set.of();

                // Remove services that are not selected
                for (Integer serviceId : existingServiceIds) {
                    if (!selectedServiceIdSet.contains(serviceId)) {
                        typeRoomDao.removeServiceFromRoomType(roomType, serviceId);
                    }
                }

                // Add selected services that are not already present
                for (Integer serviceId : selectedServiceIdSet) {
                    if (!existingServiceIds.contains(serviceId)) {
                        typeRoomDao.addServiceToRoomType(roomType, String.valueOf(serviceId));
                    }
                }

                String message = URLEncoder.encode("Cập nhật thành công", "UTF-8");
                response.sendRedirect("update_type_room_service?message=" + message);
            } else {
                String message = URLEncoder.encode("Cập nhật thất bại", "UTF-8");
                response.sendRedirect("update_type_room_service?message1=" + message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for updating room type services";
    }
}
