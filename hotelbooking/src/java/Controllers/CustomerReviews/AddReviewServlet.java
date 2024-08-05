package Controllers.CustomerReviews;

import DAO.ReviewDAO;
import DAO.TypeRoomDAO;
import Models.Customer;
import Models.Review;
import Utils.ReviewsValidator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddReviewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String roomtypeIdRaw = request.getParameter("roomTypeId");
        int roomTypeId = Integer.parseInt(roomtypeIdRaw);
        request.setAttribute("roomTypeId", roomTypeId);
        request.getRequestDispatcher("Views/client/review.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String description = request.getParameter("description");
        String status = "active";
        String roomtypeIdRaw = request.getParameter("roomTypeId");
        int roomTypeId = Integer.parseInt(roomtypeIdRaw);
        String errorMess, successMess = null;

        // Validate the review input
        if (!ReviewsValidator.validateReviewInput(description)) {
            errorMess = "Không được nhập toàn khoảng trắng.";
            request.setAttribute("errorMess", errorMess);
            request.getRequestDispatcher("Views/client/review.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(false);
        if (session != null) {
            Customer customer = (Customer) session.getAttribute("cusObj");
            if (customer != null) {
                ReviewDAO rdao = new ReviewDAO();
                TypeRoomDAO trdao = new TypeRoomDAO();
                Review review = new Review(customer, description, status,
                        trdao.getRoomTypeById(roomTypeId));
                boolean addedSuccess = rdao.addReview(review);
                if (addedSuccess) {
                    successMess = "Thêm đánh giá thành công";
                    request.setAttribute("successMess", successMess);
                } else {
                    errorMess = "Thêm đánh giá thất bại";
                    request.setAttribute("errorMess", errorMess);
                }
                request.setAttribute("cus", customer);
                request.getRequestDispatcher("Views/client/review.jsp").forward(request, response);
            }
        }
    }
}
