//package Controllers.StaffRoom;
//
//import DAO.RoomDAO;
//import Models.Room;
//import java.io.File;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;
//import java.net.URLEncoder;
//
///**
// *
// * @author admin
// */
//@MultipartConfig(
//        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
//        maxFileSize = 1024 * 1024 * 10, // 10 MB
//        maxRequestSize = 1024 * 1024 * 100 // 100 MB
//)
//public class AddRoomImgServlet extends HttpServlet {
//   
//    /** 
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AddRoomImgServlet</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddRoomImgServlet at " + request.getContextPath () + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    } 
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /** 
//     * Handles the HTTP <code>GET</code> method.
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        RoomDAO roomDao = new RoomDAO();
//        List<Room> rooms = roomDao.getAllRooms();
//        request.setAttribute("rooms", rooms);
//        request.getRequestDispatcher("Views/admin/add-roomimg-detail.jsp").forward(request, response);
//    } 
//
//    /** 
//     * Handles the HTTP <code>POST</code> method.
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        int roomId = Integer.parseInt(request.getParameter("roomId"));
//        List<Part> fileParts = (List<Part>) request.getParts().stream().filter(part -> "filenames".equals(part.getName())).toList();
//        String realPath = request.getServletContext().getRealPath("/Views/client/img");
//        
//        if (!new File(realPath).exists()) {
//            new File(realPath).mkdirs();
//        }
//        
//        RoomDAO roomDao = new RoomDAO();
//        
//        for (Part part : fileParts) {
//            String filename = part.getSubmittedFileName();
//            part.write(realPath + "/" + filename);
//            roomDao.addRoomDetailImage(roomId, filename);
//        }
//        String message = URLEncoder.encode("Ảnh phòng đã được thêm thành công.", "UTF-8");  
//        response.sendRedirect("/HotelBooking/add_room_img?message="+message);
//    }
//
//    /** 
//     * Returns a short description of the servlet.
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}