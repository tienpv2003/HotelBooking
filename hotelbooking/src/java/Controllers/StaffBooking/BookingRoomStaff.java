/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.StaffBooking;

import DAO.EventDAO;
import DAO.RoomDAO;
import DAO.TypeRoomDAO;
import Models.Booking;
import Models.Customer;
import Models.Item;
import Models.Room;
import Models.RoomType;
import Models.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class BookingRoomStaff extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String idStr = request.getParameter("id");
//        try {
//            int id = Integer.parseInt(idStr);
//
//            TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
//            RoomType roomType = typeRoomDAO.getRoomTypeById(id);
//            RoomDAO roomDAO = new RoomDAO();
//            int getNumberRoomActive = roomDAO.getNumberActiveRooms(id);
//            request.setAttribute("getNumberRoomActive", getNumberRoomActive);
//            request.setAttribute("roomType", roomType);
//            request.getRequestDispatcher("Views/admin/booking-infor1.jsp").forward(request, response);
//
//        } catch (ServletException | IOException | NumberFormatException e) {
//        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String numberStr = request.getParameter("roomNumber");
        String typeIdStr = request.getParameter("id");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);
        try {
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);
            Date currentDate = new Date();

            if (startDate.before(currentDate)) {
                request.setAttribute("messErr", "Ngày nhận phòng phải lớn hơn hoặc bằng ngày hiện tại.");
                int id = Integer.parseInt(typeIdStr);
                TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
                RoomType roomType = typeRoomDAO.getRoomTypeById(id);
                request.setAttribute("roomType", roomType);
                RoomDAO roomDAO = new RoomDAO();
                int getNumberRoomActive = roomDAO.getNumberActiveRooms(id);
                request.setAttribute("getNumberRoomActive", getNumberRoomActive);
                request.getRequestDispatcher("Views/admin/booking-infor1.jsp").forward(request, response);
            } else if (startDate.after(endDate)) {
                request.setAttribute("messErr", "Ngày nhận phòng phải nhỏ hơn hoặc bằng ngày trả phòng.");
                int id = Integer.parseInt(typeIdStr);
                TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
                RoomType roomType = typeRoomDAO.getRoomTypeById(id);
                RoomDAO roomDAO = new RoomDAO();
                int getNumberRoomActive = roomDAO.getNumberActiveRooms(id);
                request.setAttribute("getNumberRoomActive", getNumberRoomActive);
                request.setAttribute("roomType", roomType);
                request.getRequestDispatcher("Views/admin/booking-infor1.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("listBookingFlex") != null) {
                    session.removeAttribute("listBookingFlex");
                }
                if (session != null && session.getAttribute("listBooking") == null) {
                    TypeRoomDAO trDao = new TypeRoomDAO();
                    RoomDAO rDao = new RoomDAO();
                    List<RoomType> listTR = trDao.getTypeRoomHasRoomActive();
                    try {
                        List<Booking> listBookingFlex = new ArrayList<>();
                        for (RoomType type : listTR) {
                            String param = "type" + type.getRoomTypeId();
                            String numStr = request.getParameter(param);
                            int number = Integer.parseInt(numStr);
                            if (number != 0) {
                                Booking listBookingItem = new Booking();
                                EventDAO eventDAO = new EventDAO();
                                Customer cusObj = (Customer) session.getAttribute("cusBooking");
                                List<Service> listService = new ArrayList<>();
                                listBookingItem.setEvent(eventDAO.getDiscountPercent(startDate));
                                listBookingItem.setCustomer(cusObj);
                                listBookingItem.setStartDate(startDate);
                                listBookingItem.setEndDate(endDate);
                                for (Room i : rDao.getBookingNumer(type.getRoomTypeId(), number)) {
                                    Item newItem = new Item(cusObj, i, listService, i.getRoomType().getRoomTypePrice());
                                    listBookingItem.addItem(newItem);
                                }
                                listBookingItem.setTotalPrice(listBookingItem.calculateTotalPrice());
                                listBookingFlex.add(listBookingItem);
                            }
                        }
                        session.setAttribute("listBookingFlex", listBookingFlex);
                        request.getRequestDispatcher("Views/admin/booking-infor2.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                    }
                }
//                request.getRequestDispatcher("Views/admin/booking-infor2.jsp").forward(request, response);
            }
        } catch (ParseException e) {
            System.out.println("Định dạng ngày không hợp lệ.");
        }
    }

}
