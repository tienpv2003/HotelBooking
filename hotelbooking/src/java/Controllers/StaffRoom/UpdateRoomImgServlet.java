///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package Controllers.StaffRoom;
//
//import DAO.RoomDAO;
//import DAO.TypeRoomDAO;
//import Models.Room;
//import Models.RoomType;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;
//import java.io.File;
//import java.net.URLEncoder;
//import java.util.List;
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
//public class UpdateRoomImgServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UpdateRoomImgServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UpdateRoomImgServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int roomId = Integer.parseInt(request.getParameter("id"));
//        RoomDAO roomDao = new RoomDAO();
//        Room room = roomDao.getRoomById(roomId);
//        List<String> roomDetailImages = roomDao.getRoomDetailImages(roomId);
//        TypeRoomDAO trDao = new TypeRoomDAO();
//        List<RoomType> roomTypes = trDao.getAllRoomType();
//        request.setAttribute("room", room);
//        request.setAttribute("roomTypes", roomTypes);
//        request.setAttribute("roomDetailImages", roomDetailImages);
//        request.getRequestDispatcher("Views/admin/update-room-img.jsp").forward(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int roomId = Integer.parseInt(request.getParameter("roomId"));
//        RoomDAO roomDao = new RoomDAO();
//        roomDao.deleteRoomDetailImage(roomId);
//        String realPath = request.getServletContext().getRealPath("/Views/client/img");
//        
//        // Thêm ảnh mới
//        List<Part> fileParts = (List<Part>) request.getParts().stream().filter(part -> "filenames".equals(part.getName())).toList();
//        if (!new File(realPath).exists()) {
//            new File(realPath).mkdirs();
//        }
//
//        for (Part part : fileParts) {
//            String filename = part.getSubmittedFileName();
//            part.write(realPath + "/" + filename);
//            roomDao.addRoomDetailImage(roomId, filename);
//        }
//        response.sendRedirect("update_room_img?id=" + roomId + "&message=" + URLEncoder.encode("Ảnh phòng đã được chỉnh sửa thành công.", "UTF-8"));
//    }
//
///**
// * Returns a short description of the servlet.
// *
// * @return a String containing servlet description
// */
//@Override
//public String getServletInfo
//        
//        
//            () {
//        return "Short description";
//        }// </editor-fold>
//
//    }
