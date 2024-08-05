package Controllers.CustomerReviews;

import DAO.ReviewDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reviewId = request.getParameter("reviewId");
        int id = Integer.parseInt(reviewId);
        ReviewDAO rdao = new ReviewDAO();
        
        //delete Review
        boolean deletedReview = rdao.deleteReview(id);
        if (deletedReview) {
            request.setAttribute("successMess", "Gỡ đánh giá thành công");
        } else {
            request.setAttribute("errorMess", "Gỡ đánh giá thất bại");
        }
        request.getRequestDispatcher("Views/client/edit-review.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
