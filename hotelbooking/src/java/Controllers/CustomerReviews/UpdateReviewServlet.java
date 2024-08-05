/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.CustomerReviews;

import DAO.ReviewDAO;
import Models.Review;
import Utils.ReviewsValidator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author PhạmVinhTiến
 */
public class UpdateReviewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("id");
        int id = Integer.parseInt(idRaw);
        ReviewDAO rdao = new ReviewDAO();
        Review review = rdao.getReviewById(id);
        request.setAttribute("review", review);
        request.getRequestDispatcher("Views/admin/edit-review.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("id");
        int id = Integer.parseInt(idRaw);
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        
        if (!ReviewsValidator.validateReviewInput(description)) {
                request.setAttribute("errorMess", "Không được nhập toàn khoảng trắng.");
                request.getRequestDispatcher("Views/admin/edit-review.jsp").forward(request, response);
                return;
            }
        
        ReviewDAO rdao = new ReviewDAO();
        Review review = rdao.getReviewById(id);
        
        boolean updatedReview = false;
        updatedReview = rdao.updateReview(review);
        
        if (updatedReview) {
            request.setAttribute("successMess", "Cập nhật thành công");
        } else {
            request.setAttribute("errorMess", "Cập nhật thất bại");
        }
        request.getRequestDispatcher("Views/admin/edit-review.jsp").forward(request, response);
    }

}
