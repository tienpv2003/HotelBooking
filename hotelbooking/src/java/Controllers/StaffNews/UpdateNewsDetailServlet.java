package Controllers.StaffNews;

import DAO.NewsDAO;
import Models.News;
import Models.NewsDetail;
import Models.Staff;
import Utils.NewsValidator;
import java.io.IOException;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author PhạmVinhTiến
 */
@MultipartConfig
public class UpdateNewsDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newsIdParam = request.getParameter("news_id");
        if (newsIdParam != null) {
            int newsId = Integer.parseInt(newsIdParam);
            NewsDAO newsDAO = new NewsDAO();
            News news = newsDAO.findById(newsId);
            NewsDetail newsDetail = newsDAO.getNewsDetail(newsId);
            request.setAttribute("news", news);
            request.setAttribute("newsDetail", newsDetail);
        }
        request.getRequestDispatcher("Views/admin/edit-blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            NewsDAO dao = new NewsDAO();
            String newsIdParam = request.getParameter("news_id");
            int newsId = Integer.parseInt(newsIdParam);
            String title = request.getParameter("title");
            String status = request.getParameter("status");
            String description = request.getParameter("description");
            String content = request.getParameter("content");
            Part part = request.getPart("filename");
            Date createDate = new Date();

            if (!NewsValidator.validateNewsInput(title, status, description, content)) {
                request.setAttribute("errorMess", "Không được nhập toàn khoảng trắng.");
                request.getRequestDispatcher("Views/admin/edit-blog.jsp").forward(request, response);
                return;
            }
            
            String realPath = request.getServletContext().getRealPath("/Views/admin/assets/img/product");
            String filename = part.getSubmittedFileName();
            if (filename.isEmpty()) {
                filename = dao.findById(newsId).getImg();
            }
            part.write(realPath + "/" + filename);
            HttpSession session = request.getSession(false);
            if (session != null) {
                Staff staff = new Staff();
                staff = (Staff) session.getAttribute("emailStaff");
                NewsDAO newsDAO = new NewsDAO();
                News news = new News(newsId, staff, filename, title, createDate, description, status);
                NewsDetail newsDetail = new NewsDetail(0, news, content);

                boolean updateStatus = newsDAO.updateNews(news, newsDetail);
                if (updateStatus) {
                    request.setAttribute("successMess", "Cập nhật thành công");
                } else {
                    request.setAttribute("errorMess", "Cập nhật thất bại");
                }
                request.getRequestDispatcher("Views/admin/edit-blog.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMess", "Đăng nhập lại để tiếp tục");
                request.getRequestDispatcher("signin").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e);
            request.setAttribute("errorMess", "Đã xảy ra lỗi !!! ");
            request.getRequestDispatcher("Views/admin/edit-blog.jsp").forward(request, response);
        }
    }
}
