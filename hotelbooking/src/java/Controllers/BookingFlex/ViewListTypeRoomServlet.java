/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.BookingFlex;

import DAO.EventDAO;
import DAO.RoomDAO;
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
public class ViewListTypeRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet ViewListTypeRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewListTypeRoomServlet at " + request.getContextPath() + "</h1>");
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
        List<RoomType> listTR = trDao.getTypeRoomHasRoomActive();
        request.setAttribute("listTR", listTR);
        request.getRequestDispatcher("Views/client/BookingType.jsp").forward(request, response);
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);
        try {
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);
            Date currentDate = new Date();

            if (startDate.before(currentDate)) {
                request.setAttribute("messErr", "Ngày nhận phòng phải lớn hơn hoặc bằng ngày hiện tại.");
                TypeRoomDAO trDao = new TypeRoomDAO();
                List<RoomType> listTR = trDao.getTypeRoomHasRoomActive();
                request.setAttribute("listTR", listTR);
                request.getRequestDispatcher("Views/client/BookingType.jsp").forward(request, response);
            } else if (startDate.after(endDate)) {
                request.setAttribute("messErr", "Ngày nhận phòng phải nhỏ hơn hoặc bằng ngày trả phòng.");
                TypeRoomDAO trDao = new TypeRoomDAO();
                List<RoomType> listTR = trDao.getTypeRoomHasRoomActive();
                request.setAttribute("listTR", listTR);
                request.getRequestDispatcher("Views/client/BookingType.jsp").forward(request, response);
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
                            String numberStr = request.getParameter(param);
                            int number = Integer.parseInt(numberStr);
                            if (number != 0) {
                                Booking listBookingItem = new Booking();
                                EventDAO eventDAO = new EventDAO();
                                Customer cusObj = (Customer) session.getAttribute("cusObj");
                                List<Service> listService = new ArrayList<>();
                                listBookingItem.setEvent(eventDAO.getDiscountPercent(startDate));
                                listBookingItem.setCustomer(cusObj);
                                listBookingItem.setStartDate(startDate);
                                for (Event event : eventDAO.getDiscountPercent(startDate)) {
                                    out.println(event.getEventId());
                                }
                                listBookingItem.setEndDate(endDate);
                                for (Room i : rDao.getBookingNumer(type.getRoomTypeId(), number)) {
                                    Item newItem = new Item(cusObj, i, listService, i.getRoomType().getRoomTypePrice());
                                    listBookingItem.addItem(newItem);                                  
                                }
                                
                                listBookingItem.setTotalPrice(listBookingItem.calculateTotalPrice());
                                listBookingFlex.add(listBookingItem);
                            }
                        }

                        if (listBookingFlex.isEmpty()) {
                            request.setAttribute("messErr", "Phải chọn ít nhất 1 phòng để tiền hành đặt.");
                            request.setAttribute("listTR", listTR);
                            request.getRequestDispatcher("Views/client/BookingType.jsp").forward(request, response);
                        } else {
                            session.setAttribute("listBookingFlex", listBookingFlex);
                            request.getRequestDispatcher("Views/client/BookingType2.jsp").forward(request, response);
                        }
                    } catch (NumberFormatException e) {
                    }
                }
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
