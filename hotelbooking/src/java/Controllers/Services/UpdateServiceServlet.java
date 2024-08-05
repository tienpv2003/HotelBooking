/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class UpdateServiceServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateServiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServiceServlet at " + request.getContextPath() + "</h1>");
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
        String idServiceStr = request.getParameter("id");
        try {
            int idService = Integer.parseInt(idServiceStr);
            ServiceDAO serviceDAO = new ServiceDAO();
            Service service = serviceDAO.getById(idService);
            request.setAttribute("service", service);
            request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
        } catch (Exception e) {
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

        int serviceId = Integer.parseInt(request.getParameter("service_id"));
        String nameService = request.getParameter("name_service");
        String titleService = request.getParameter("title");
        String description = request.getParameter("description");
        Part part = request.getPart("filename");
        String realPart = request.getServletContext().getRealPath("/Views/client/img");
        String filename = part.getSubmittedFileName();
        String errorMess = "";
        String successMess = "";

        String status = request.getParameter("status");
        String priceStr = request.getParameter("price");
        if (!ServiceValidator.validateServiceName(nameService)) {
            errorMess = "Tên dịch vụ không hợp lệ";
            request.setAttribute("messageServiceError", errorMess);
            request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
            return;
        }

        if (!ServiceValidator.validateServiceTitle(titleService)) {
            errorMess = "Tiêu đề dịch vụ không hợp lệ";
            request.setAttribute("errorMess", errorMess);
            request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
            return;
        }
        if (!ServiceValidator.validateServiceDescription(description)) {
            errorMess = "Mô tả dịch vụ không hợp lệ";
            request.setAttribute("errorMess", errorMess);
            request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
            return;
        }
        float price = 0;
        try {
            price = Float.parseFloat(priceStr);
            if (priceStr == null) {
                request.setAttribute("messageServiceError", "Chưa nhập giá dịch vụ");
                request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("messageServiceError", "Giá dịch vụ không hợp lệ");
            request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
            return;
        }
        Service service = new Service(serviceId, nameService, titleService, description, filename, status, price);

        ServiceDAO serviceDAO = new ServiceDAO();
        boolean updated = serviceDAO.update(service);

        if (updated) {
            request.setAttribute("messageService", "Cập nhật dịch vụ thành công");
            request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
        } else {
            request.setAttribute("messageServiceError", "Cập nhật dịch vụ thất bại");
            request.getRequestDispatcher("Views/admin/edit-service.jsp").forward(request, response);
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
