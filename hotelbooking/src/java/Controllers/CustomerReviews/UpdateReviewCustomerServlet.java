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

/**
 *
 * @author PhạmVinhTiến
 */
public class UpdateReviewCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("reviewId");
        int id = Integer.parseInt(idRaw);
        ReviewDAO rdao = new ReviewDAO();
        Review review = rdao.getReviewById(id);
        request.setAttribute("review", review);
        request.getRequestDispatcher("Views/client/edit-review.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idRaw = request.getParameter("reviewId");
        int id = Integer.parseInt(idRaw);
        String description = request.getParameter("description");
        if (ReviewsValidator.validateReviewInput(description) == false) {
            request.setAttribute("errorMess", "Không được nhập toàn khoảng trắng.");
            request.getRequestDispatcher("Views/client/edit-review.jsp").forward(request, response);
            return;
        }

        ReviewDAO rdao = new ReviewDAO();
        Review review = rdao.getReviewById(id);
        review.setDescription(description);
        boolean updatedReview = rdao.updateDescription(review);
        if (updatedReview) {
            request.setAttribute("successMess", "Cập nhật đánh giá thành công");
        } else {
            request.setAttribute("errorMess", "Cập nhật đánh giá thất bại, Thử lại");
        }
        request.getRequestDispatcher("Views/client/edit-review.jsp").forward(request, response);
    }

}
