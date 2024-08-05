/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Booking;

import DAO.EventDAO;
import DAO.RoomDAO;
import DAO.ServiceDAO;
import DAO.TypeRoomDAO;
import Models.Booking;
import Models.Customer;
import Models.Event;
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
 * @author Acer
 */
public class BookingStep1Servlet extends HttpServlet {

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
            out.println("<title>Servlet BookingStep1Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingStep1Servlet at " + request.getContextPath() + "</h1>");
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
        String typeId = request.getParameter("typeId");
        try {
            int id = Integer.parseInt(typeId);
            TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
            RoomType roomType = typeRoomDAO.getRoomTypeById(id);
            RoomDAO roomDAO = new RoomDAO();
            int getNumberRoomActive = roomDAO.getNumberActiveRooms(id);
            request.setAttribute("getNumberRoomActive", getNumberRoomActive);
            request.setAttribute("roomType", roomType);
            request.getRequestDispatcher("Views/client/booking.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
        }
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
        PrintWriter out = response.getWriter();
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String numberStr = request.getParameter("roomNumber");
        String typeIdStr = request.getParameter("typeId");
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
                request.getRequestDispatcher("Views/client/booking.jsp").forward(request, response);
            } else if (startDate.after(endDate)) {
                request.setAttribute("messErr", "Ngày nhận phòng phải nhỏ hơn hoặc bằng ngày trả phòng.");
                int id = Integer.parseInt(typeIdStr);
                TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
                RoomType roomType = typeRoomDAO.getRoomTypeById(id);
                RoomDAO roomDAO = new RoomDAO();
                int getNumberRoomActive = roomDAO.getNumberActiveRooms(id);
                request.setAttribute("getNumberRoomActive", getNumberRoomActive);
                request.setAttribute("roomType", roomType);
                request.getRequestDispatcher("Views/client/booking.jsp").forward(request, response);
            } else {
                RoomDAO rDao = new RoomDAO();
                int number = Integer.parseInt(numberStr);
                int typeId = Integer.parseInt(typeIdStr);
                HttpSession session = request.getSession(false);
                if (session != null && session.getAttribute("listBooking") != null) {
                    session.removeAttribute("listBooking");
                }
                if (session != null && session.getAttribute("listBooking") == null) {
                    Booking listBooking = new Booking();
                    EventDAO eventDAO = new EventDAO();
                    Customer cusObj = (Customer) session.getAttribute("cusObj");
                    List<Service> listService = new ArrayList<>();
                    listBooking.setEvent(eventDAO.getDiscountPercent(startDate));
                    listBooking.setCustomer(cusObj);
                    listBooking.setStartDate(startDate);
                    listBooking.setEndDate(endDate);
                    for (Room i : rDao.getBookingNumer(typeId, number)) {
                        Item newItem = new Item(cusObj, i, listService, i.getRoomType().getRoomTypePrice());
                        listBooking.addItem(newItem);
                    }
                    listBooking.setTotalPrice(listBooking.calculateTotalPrice());
                    session.setAttribute("listBooking", listBooking);
                }

                request.getRequestDispatcher("Views/client/booking2.jsp").forward(request, response);
            }
        } catch (ParseException e) {
            System.out.println("Định dạng ngày không hợp lệ.");
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
