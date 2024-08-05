/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Utils.DBContext;
import Models.Review;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PhạmVinhTiến
 */
public class ReviewDAO extends DBContext {

    public List<Review> getAllReviews() {
        List<Review> result = new ArrayList<>();
        String sql = "SELECT * FROM [Review] Order by review_id DESC";
        try {
            TypeRoomDAO rtdao = new TypeRoomDAO();
            CustomerDAO cDao = new CustomerDAO();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review newReview = new Review(rs.getInt("review_id"),
                        cDao.findById(rs.getInt("customer_id")),
                        rs.getString("description"),
                        rs.getString("status"),
                        rtdao.getRoomTypeById(rs.getInt("room_type_id")));
                result.add(newReview);
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public List<Review> getReviewsActive() {
        List<Review> result = new ArrayList<>();
        String sql = "SELECT * FROM [Review] "
                + "where status = N'active' "
                + "Order by review_id DESC";
        try {
            TypeRoomDAO rtdao = new TypeRoomDAO();
            CustomerDAO cDao = new CustomerDAO();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review newReview = new Review(rs.getInt("review_id"),
                        cDao.findById(rs.getInt("customer_id")),
                        rs.getString("description"),
                        rs.getString("status"),
                        rtdao.getRoomTypeById(rs.getInt("room_type_id")));
                result.add(newReview);
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public Review getReviewById(int id) {
        ReviewDAO dao = new ReviewDAO();
        for (Review review : dao.getAllReviews()) {
            if (review.getReviewId() == id) {
                return review;
            }
        }
        return null;
    }

    public boolean addReview(Review review) {
        String sql = "INSERT INTO Review (customer_id, description, status, room_type_id) VALUES (?, ?, ?,?)";
        boolean isSuccess = false;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, review.getCustomer().getCustomerId());
            statement.setString(2, review.getDescription());
            statement.setString(3, review.getStatus());
            statement.setInt(4, review.getRoomType().getRoomTypeId());

            int rowsAffected = statement.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public boolean updateReview(Review review) {
        String sql = "UPDATE Review SET customer_id = ?,"
                + "description = ?, status = ?, room_type_id = ?"
                + "WHERE review_id = ?";
        boolean isSuccess = false;

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, review.getCustomer().getCustomerId());
            statement.setString(2, review.getDescription());
            statement.setString(3, review.getStatus());
            statement.setInt(4, review.getRoomType().getRoomTypeId());
            statement.setInt(5, review.getReviewId());

            int rowsAffected = statement.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public boolean deleteReview(int reviewId) {
        String sql = "DELETE FROM Review WHERE review_id = ?";
        boolean isSuccess = false;

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, reviewId);

            int rowsAffected = statement.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public boolean updateStatus(Review review) {
        String sql = "UPDATE Review SET status = ? WHERE review_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, review.getStatus());
            statement.setInt(2, review.getReviewId());

            statement.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean updateDescription(Review review) {
        String sql = "UPDATE Review SET description = ? WHERE review_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, review.getDescription());
            statement.setInt(2, review.getReviewId());

            statement.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public int getNumberTotalReview(int roomTypeId) {
        String sql = "SELECT COUNT(*) FROM Review WHERE status = N'active' AND room_type_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roomTypeId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Hoặc ghi vào log
        }
        return 0;
    }

    public List<Review> getTwoReviews(int roomTypeId, int index) {
        List<Review> list = new ArrayList<>();
        String sql = "select * from Review where status = N'active' and room_type_id = ?"
                + " order by review_id desc "
                + "offset ? rows fetch next 2 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roomTypeId);
            ps.setInt(2, (index - 1) * 2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CustomerDAO cdao = new CustomerDAO();
                TypeRoomDAO rtdao = new TypeRoomDAO();
                Review review = new Review(rs.getInt("review_id"),
                        cdao.findById(rs.getInt("customer_id")),
                        rs.getString("description"),
                        rs.getString("status"),
                        rtdao.getRoomTypeById(rs.getInt("room_type_id")));
                list.add(review);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public static void main(String[] args) {
        ReviewDAO rdao = new ReviewDAO();
//        CustomerDAO cdao = new CustomerDAO();
//        Customer customer = cdao.findById(2);
//        List<Review> list = rdao.getTwoReviews(1, 2);
//        for (Review review : list) {
//            System.out.println(review.getDescription());
//        }
//        System.out.println(rdao.getNumberTotalReview(1));
        System.out.println(rdao.getReviewsActive());
    }
}
