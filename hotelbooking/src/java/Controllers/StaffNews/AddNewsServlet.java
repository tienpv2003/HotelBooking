/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.StaffNews;

import DAO.NewsDAO;
import Models.News;
import Models.Staff;
import Utils.NewsValidator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.Date;

/**
 *
 * @author Acer
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)

public class AddNewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/admin/add-blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String status = request.getParameter("status");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        Part part = request.getPart("filename");

        if (!NewsValidator.validateNewsInput(title, status, description, content)) {
            request.setAttribute("errorMess", "Không được nhập toàn khoảng trắng.");
            request.getRequestDispatcher("Views/admin/add-blog.jsp").forward(request, response);
            return;
        }

        Date createDate = new Date();
        String realPart = request.getServletContext().getRealPath("/Views/admin/assets/img/product");
        String filename = part.getSubmittedFileName();
        part.write(realPart + "/" + filename);
        HttpSession session = request.getSession(false);
        if (session != null) {
            Staff staff = (Staff) session.getAttribute("emailStaff");
            News newsObj = new News(0, staff, filename, title, createDate, description, status);
            NewsDAO dao = new NewsDAO();

            boolean isSuccess = false;
            try {
                isSuccess = dao.addNews(newsObj, content);
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (isSuccess) {
                request.setAttribute("successMess", "Thêm tin tức thành công");
            } else {
                request.setAttribute("errorMess", "Thêm tin tức thất bại");
            }

            request.getRequestDispatcher("Views/admin/add-blog.jsp").forward(request, response);
        }
    }
}
