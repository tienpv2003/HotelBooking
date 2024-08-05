/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers.StaffReviews;

import DAO.ReviewDAO;
import Models.Review;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author PhạmVinhTiến
 */
public class StatusReviewServlet extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String status = request.getParameter("status");
        String reviewId = request.getParameter("reviewId");
        int id = Integer.parseInt(reviewId);
        ReviewDAO dao = new ReviewDAO();
        Review review = dao.getReviewById(id);
        if (status.equals("inactive")) {
            review.setStatus("active");
        } else if (status.equals("active")) {
            review.setStatus("inactive");
        }
        dao.updateStatus(review);
        request.setAttribute("mess", "Trạng thái đánh giá đã được cập nhật!");
        List<Review> listReview = dao.getAllReviews();
        request.setAttribute("listReview", listReview);
        request.getRequestDispatcher("Views/admin/all-review.jsp").forward(request, response);

    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
