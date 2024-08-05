/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.TypeRoom;

import DAO.TypeRoomDAO;
import Models.RoomType;
import Models.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateTypeRoomServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateTypeRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateTypeRoomServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int typeId = Integer.parseInt(request.getParameter("id"));
        TypeRoomDAO dao = new TypeRoomDAO();
        RoomType roomType = dao.getRoomTypeById(typeId);
        request.setAttribute("roomType", roomType);
        request.getRequestDispatcher("Views/admin/update-type-room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int typeId = Integer.parseInt(request.getParameter("Typeid"));
        String typeName = request.getParameter("nametype");
        String description = request.getParameter("des");
        String status = request.getParameter("status");
        String title = request.getParameter("title");
        String contentdescription = request.getParameter("contentdescription");

        TypeRoomDAO trDao = new TypeRoomDAO();

        // Lấy ảnh chính
        Part mainPart = request.getPart("filename");
        String realPart = request.getServletContext().getRealPath("/Views/client/img");
        String filename = mainPart.getSubmittedFileName();
        mainPart.write(realPart + "/" + filename);

        // Tạo danh sách hình ảnh và thêm ảnh chính vào đầu danh sách
        List<String> roomImages = new ArrayList<>();
        roomImages.add(filename);

        // Lấy danh sách hình ảnh phụ
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getName().equals("filenames")) {
                String roomImgFilename = part.getSubmittedFileName();
                String roomImgRealPath = realPart + "/" + roomImgFilename;
                part.write(roomImgRealPath);
                roomImages.add(roomImgFilename);
            }
        }

        try {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float currentPrice = Float.parseFloat(request.getParameter("currentPrice"));
            List<Service> listSer = new ArrayList<>();
            // Cập nhật RoomType và hình ảnh
            RoomType updatedRoomType = new RoomType(typeId, typeName, status, quantity, filename, 
                    title, description, contentdescription, 
                    currentPrice, roomImages, listSer);
            trDao.updateRoomType(updatedRoomType);

            request.setAttribute("message", "Chỉnh sửa thành công");
            request.getRequestDispatcher("Views/admin/update-type-room.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message1", "Chỉnh sửa thất bại");
            request.getRequestDispatcher("Views/admin/update-type-room.jsp").forward(request, response);
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
