package Controllers.Services;

import DAO.ServiceDAO;
import Models.Service;
import Utils.ServiceValidator;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.net.URLEncoder;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class CreateServiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nameService = request.getParameter("name_service");
            String titleService = request.getParameter("title");
            String description = request.getParameter("description");
            Part part = request.getPart("filename");
            String realPart = request.getServletContext().getRealPath("/Views/client/img");
            String filename = part.getSubmittedFileName();
            String errorMess = "";

            part.write(realPart + "/" + filename);
            String status = request.getParameter("status");
            String priceStr = request.getParameter("price");
            float price = 0;
            if (!ServiceValidator.validateServiceName(nameService)) {
                errorMess = "Tên dịch vụ không hợp lệ";
                request.setAttribute("messageServiceError", errorMess);
                request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
                return;
            }
            if (!ServiceValidator.validateServiceTitle(titleService)) {
                errorMess = "Tiêu đề dịch vụ không hợp lệ";
                request.setAttribute("errorMess", errorMess);
                request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
                return;
            }
            if (!ServiceValidator.validateServiceDescription(description)) {
                errorMess = "Mô tả dịch vụ không hợp lệ";
                request.setAttribute("errorMess", errorMess);
                request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
                return;
            }
            if (nameService == null || titleService == null || description == null
                    || filename == null || status == null
                    || nameService.isEmpty() || titleService.isEmpty() || description.isEmpty()
                    || filename.isEmpty() || status.isEmpty()) {
                request.setAttribute("messageServiceError", "Vui lòng nhập đầy đủ thông tin");
                request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
                return;
            }
            try {
                price = Float.parseFloat(priceStr);
                if(price == 0){                    
                request.setAttribute("messageServiceError", "Chưa nhập giá dịch vụ");
                request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
                return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("messageServiceError", "Giá dịch vụ không hợp lệ");
                request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
                return;
            }
            ServiceDAO serviceDAO = new ServiceDAO();
            if (serviceDAO.isServiceNameExists(nameService)) {
                String message = URLEncoder.encode("Tên dịch vụ đã tồn tại, vui lòng chọn tên khác.", "UTF-8");
                response.sendRedirect("/HotelBooking/create_service?messageServiceError=" + message);
                return;
            }
            Service service = new Service(0, nameService, titleService, description, filename, status, price);
            boolean success = serviceDAO.insert(service);

            if (success) {
                String message = URLEncoder.encode("Thêm dịch vụ thành công.", "UTF-8");
                response.sendRedirect("/HotelBooking/create_service?messageService=" + message);
            } else {
                request.setAttribute("messageServiceError", "Thêm dịch vụ thất bại");
                request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("messageServiceError", "Xảy ra lỗi, vui lòng nhập lại!");
            request.getRequestDispatcher("Views/admin/add-service.jsp").forward(request, response);
        }
    }
}
