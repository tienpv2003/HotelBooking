/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.StaffBooking;

import DAO.RoomConvenientDAO;
import DAO.RoomDAO;
import DAO.ServiceDAO;
import DAO.TypeRoomDAO;
import Models.Booking;
import Models.Convenient;
import Models.Item;
import Models.RoomConvenient;
import Models.RoomType;
import Models.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author admin
 */
public class BookingRoomServiceStaff extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomIdStr = request.getParameter("roomId");
        try {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("listBookingFlex") != null) {
                RoomConvenientDAO rcdao = new RoomConvenientDAO();
                RoomDAO rdao = new RoomDAO();
                TypeRoomDAO trdao = new TypeRoomDAO();
                int roomId = Integer.parseInt(roomIdStr);
                request.setAttribute("room", rdao.getRoomById(roomId));
                ServiceDAO sdao = new ServiceDAO();
                RoomConvenient roomConvenients = rcdao.getRoomConvenientByRoomId(roomId);
                List<Convenient> list = roomConvenients.getConveniences();
                int idType = rdao.getRoomById(roomId).getRoomType().getRoomTypeId();
                RoomType roomType = trdao.getRoomTypeById(idType);
                request.setAttribute("convenient", list);

                List<Service> serviceNoInclude = sdao.getServiceNoInclude(rdao.getRoomById(roomId).getRoomType().getRoomTypeId());
                List<Booking> listBookingFlex = (List<Booking>) session.getAttribute("listBookingFlex");
                for (Booking listBooking : listBookingFlex) {
                    for (Item i : listBooking.getListItem()) {
                        if (i.getRoom().getRoomId() == roomId) {
                            // Tạo một danh sách các ID từ i.getListService()
                            List<Integer> listServiceIds = i.getListService().stream()
                                    .map(Service::getServiceId)
                                    .collect(Collectors.toList());
                            Iterator<Service> iterator = serviceNoInclude.iterator();
                            while (iterator.hasNext()) {
                                Service service = iterator.next();
                                if (listServiceIds.contains(service.getServiceId())) {
                                    iterator.remove();
                                }
                            }
                        }
                    }
                }
                request.setAttribute("roomType", roomType);
                request.setAttribute("listService", serviceNoInclude);
                request.getRequestDispatcher("Views/admin/booking-infor2.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String[] idServiceStr = request.getParameterValues("services");
        String roomIdStr = request.getParameter("roomId");
        String typeId = request.getParameter("roomTypeId");
        int id = Integer.parseInt(typeId);
        TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
        RoomType roomType = typeRoomDAO.getRoomTypeById(id);
        int idService;
        try {
            if (idServiceStr != null) {
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("listBookingFlex") != null) {
                    int roomId = Integer.parseInt(roomIdStr);
                    float total = 0;
                    Item newItem = new Item();
                    List<Booking> listBookingFlex = (List<Booking>) session.getAttribute("listBookingFlex");
                    for (Booking listBooking : listBookingFlex) {
                        for (Item i : listBooking.getListItem()) {
                            if (i.getRoom().getRoomId() == roomId) {
                                newItem = i;
                            }
                        }
                        List<Service> addService = new ArrayList<>();
                        ServiceDAO sdao = new ServiceDAO();
                        for (String idSrt : idServiceStr) {
                            idService = Integer.parseInt(idSrt);
                            Service newService = sdao.getById(idService);
                            total += newService.getPriceService();
                            addService.add(newService);
                        }
                        newItem.setListService(addService);
                        listBooking.setTotalPrice(listBooking.calculateTotalPrice());
                    }
                   
              
                    request.getRequestDispatcher("Views/admin/booking-infor2.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("roomType", roomType);
                request.getRequestDispatcher("Views/admin/booking-infor2.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
        }
    }

}
