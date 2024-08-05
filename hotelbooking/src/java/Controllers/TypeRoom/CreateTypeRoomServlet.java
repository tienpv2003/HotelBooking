package Controllers.TypeRoom;

import DAO.TypeRoomDAO;
import Models.RoomType;
import Models.Service;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class CreateTypeRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/admin/add-type-room.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nametype = request.getParameter("nametype");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String title = request.getParameter("title");
        String contentdescription = request.getParameter("contentdescription");

        TypeRoomDAO trDao = new TypeRoomDAO();

        // Lấy hình ảnh chính
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
            float currentPrice = Float.parseFloat(request.getParameter("currentPrice"));

            if (trDao.isRoomTypeNameExists(nametype)) {
                request.setAttribute("message1", "Loại phòng này đã tồn tại");
            } else {
                List<Service> listSer = new ArrayList<>();
                RoomType newRoomType = new RoomType(0, nametype, status, 0, filename, title, description, contentdescription, currentPrice, roomImages, listSer);
                boolean success = trDao.insertRoomType(newRoomType);
                if (success) {
                    request.setAttribute("message", "Thêm loại phòng thành công");
                } else {
                    request.setAttribute("message1", "Thêm loại phòng thất bại");
                }
            }
            request.getRequestDispatcher("Views/admin/add-type-room.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
