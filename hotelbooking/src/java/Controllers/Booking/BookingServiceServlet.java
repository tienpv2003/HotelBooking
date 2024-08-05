/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Booking;

import DAO.RoomConvenientDAO;
import DAO.RoomDAO;
import DAO.ServiceDAO;
import DAO.TypeRoomDAO;
import Models.Booking;
import Models.Convenient;
import Models.Item;
import Models.Room;
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
 * @author Acer
 */
public class BookingServiceServlet extends HttpServlet {

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
            out.println("<title>Servlet BookingServiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServiceServlet at " + request.getContextPath() + "</h1>");
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
        String roomIdStr = request.getParameter("roomId");
        try {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("listBooking") != null) {
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
                Booking listBooking = (Booking) session.getAttribute("listBooking");
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
                request.setAttribute("roomType", roomType);
                request.setAttribute("listService", serviceNoInclude);
                request.getRequestDispatcher("Views/client/booking2.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
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
                if (session != null && session.getAttribute("listBooking") != null) {
                    int roomId = Integer.parseInt(roomIdStr);
                    float total = 0;
                    Item newItem = new Item();
                    Booking listBooking = (Booking) session.getAttribute("listBooking");
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
                    request.setAttribute("roomType", roomType);
                    request.setAttribute("listBooking", listBooking);
                    request.getRequestDispatcher("Views/client/booking2.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("roomType", roomType);
                request.getRequestDispatcher("Views/client/booking2.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
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
