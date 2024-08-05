package Controllers.Event;

import DAO.EventDAO;
import Models.Event;
import Utils.EventValidator;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
public class UpdateEventServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sEventId = request.getParameter("id");
        try {
            int eventId = Integer.parseInt(sEventId);
            EventDAO eventDao = new EventDAO();
            Event event = eventDao.getById(eventId);
            request.setAttribute("event", event);
            request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Không tìm thấy sự kiện: " + e.getMessage());
            request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String startDateStr = request.getParameter("start_date");
            String endDateStr = request.getParameter("end_date");
            String discountPercentStr = request.getParameter("discount_percent");
            String status = request.getParameter("status");
            String description = request.getParameter("description");
            String errorMess = "";            
            String idStr = request.getParameter("id");
            String detail = request.getParameter("detail");
            String title = request.getParameter("title");
            Part part = request.getPart("filename");
            String fileName = part.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("/Views/client/img");

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            if (!EventValidator.validateEventName(detail)) {
                errorMess = "Tên sự kiện không hợp lệ";
                request.setAttribute("error", errorMess);
                request.getRequestDispatcher("Views/admin/add-event.jsp").forward(request, response);
                return;
            }
            if (!EventValidator.validateEventTitle(title)) {
                errorMess = "Tiêu đề sự kiện không hợp lệ";
                request.setAttribute("error", errorMess);
                request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
                return;
            }
            if (!EventValidator.validateEventDescription(description)) {
                errorMess = "Mô tả sự kiện không hợp lệ";
                request.setAttribute("error", errorMess);
                request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
                return;
            }
            // Check if a new file is uploaded
            if (fileName != null && !fileName.isEmpty()) {
                File file = new File(uploadPath + File.separator + fileName);
                part.write(file.getAbsolutePath());
            } else {
                fileName = request.getParameter("existing_file"); // Use existing file if no new file is uploaded
            }

            // Validate parameters
            if (title == null || fileName == null || detail == null || startDateStr == null || endDateStr == null
                    || discountPercentStr == null || description == null || status == null
                    || detail.isEmpty() || startDateStr.isEmpty() || endDateStr.isEmpty()
                    || discountPercentStr.isEmpty() || description.isEmpty() || status.isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
                request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
                return;
            }

            LocalDate today = LocalDate.now();
            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);
            float discountPercent = Float.parseFloat(discountPercentStr);

            // Validate dates
            if (startDate.isBefore(today)) {
                request.setAttribute("error", "Ngày bắt đầu phải lớn hơn ngày hiện tại");
                request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
                return;
            }
            if (endDate.isBefore(startDate)) {
                request.setAttribute("error", "Ngày kết thúc phải lớn hơn ngày bắt đầu");
                request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
                return;
            }

            int id = Integer.parseInt(idStr);
            Event event = new Event(id, title, fileName, java.sql.Date.valueOf(startDate), java.sql.Date.valueOf(endDate), detail, discountPercent, description, status);
            EventDAO eventDAO = new EventDAO();
            boolean success = eventDAO.update(event);

            if (success) {
                request.setAttribute("messageEventUpdate", "Cập nhật sự kiện thành công");
            } else {
                request.setAttribute("error", "Cập nhật sự kiện thất bại");
            }
            request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Xảy ra lỗi vui lòng nhập lại! Error: " + e.getMessage());
            request.getRequestDispatcher("Views/admin/edit-event.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for updating events";
    }
}
