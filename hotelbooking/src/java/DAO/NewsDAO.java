/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Utils.DBContext;
import Models.Comment;
import Models.News;
import Models.NewsDetail;
import Models.Reply;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Acer
 */
public class NewsDAO extends DBContext implements BaseDAO<News> {

    public List<News> getAllNews() {
        List<News> result = new ArrayList<>();
        String sql = "SELECT * FROM [News] Order by news_id DESC";
        try {
            StaffDAO sDao = new StaffDAO();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News nNews = new News(rs.getInt(1), sDao.getStaffById(rs.getInt(2)),
                        rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getString(6), rs.getString(7));
                result.add(nNews);
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public boolean addNews(News news, String content) {
        String sql = """
                 INSERT INTO "News" ("staff_id", "img", "title", "create_date", "desccription", "status") VALUES
                 (?, ?, ?, ?, ?, ?);""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, news.getStaff().getStaff_id());
            st.setString(2, news.getImg());
            st.setString(3, news.getTitle());
            java.util.Date utilDate = news.getCreateDate();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            st.setDate(4, sqlDate);
            st.setString(5, news.getDescription());
            st.setString(6, news.getStatus());
            int rowsInserted = st.executeUpdate();

            if (rowsInserted > 0) {
                String sql2 = """
                          SELECT TOP 1 [news_id]
                            FROM [dbo].[News]
                            ORDER BY [news_id] DESC;""";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                ResultSet rs = st2.executeQuery();
                if (rs.next()) {
                    int newsId = rs.getInt(1);
                    String sql3 = """
                              INSERT INTO [dbo].[Detail_news]
                                         ([news_id]
                                         ,[content])
                                   VALUES
                                         (? ,?)""";
                    PreparedStatement st3 = connection.prepareStatement(sql3);
                    st3.setInt(1, newsId);
                    st3.setString(2, content);
                    st3.executeUpdate();
                    return true; // Successfully added news and its details
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return false; // Failed to add news or its details
    }

    @Override
    public News findById(int id) {
        NewsDAO dao = new NewsDAO();
        for (News news : dao.getAllNews()) {
            if (news.getNewsId() == id) {
                return news;
            }
        }
        return null;
    }

    public NewsDetail getNewsDetail(int newsId) {
        String sql = "SELECT * FROM Detail_news WHERE news_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, newsId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    NewsDAO dao = new NewsDAO();
                    News news = dao.findById(newsId);
                    return new NewsDetail(rs.getInt(1), news, rs.getString(3));
                }
            }
        } catch (SQLException e) {
            System.out.println("loi");
        }
        return null;
    }

    public String getNewsContent(int newsId) {
        String sql = "SELECT content FROM Detail_news WHERE news_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, newsId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("content");
                }
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean updateNews(News news, NewsDetail newsDetail) {
        String sql1 = "UPDATE News SET staff_id = ?, img = ?, title = ?, create_date = ?, desccription = ?, status = ? WHERE news_id = ?";
        String sql2 = "UPDATE Detail_news SET content = ? WHERE news_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql1);
            statement.setInt(1, news.getStaff().getStaff_id());
            statement.setString(2, news.getImg());
            statement.setString(3, news.getTitle());
            java.util.Date utilDate = news.getCreateDate();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            statement.setDate(4, sqlDate);
            statement.setString(5, news.getDescription());
            statement.setString(6, news.getStatus());
            statement.setInt(7, news.getNewsId());
            statement.executeUpdate();

            PreparedStatement st = connection.prepareStatement(sql2);
            st.setString(1, newsDetail.getContent());
            st.setInt(2, news.getNewsId());
            st.executeUpdate();

            return true;
        } catch (SQLException e) {

        }
        return false;
    }

    public List<Comment> getCommentByNewsId(int newsDetailId) {
        List<Comment> result = new ArrayList<>();
        String sql = "select * from Comment where detai_new_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newsDetailId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CustomerDAO dao = new CustomerDAO();
                Comment newComment = new Comment(rs.getInt(1), dao.findById(rs.getInt(2)),
                        getNewsDetail(rs.getInt(3)), rs.getString(4), rs.getDate(5), rs.getString(6));
                result.add(newComment);
            }
        } catch (Exception e) {
            System.out.println("loi");
        }
        return result;
    }

    public Comment getCommentById(int newsDetailId) {
        String sql = "select * from Comment where comment_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, newsDetailId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CustomerDAO dao = new CustomerDAO();
                return new Comment(rs.getInt(1), dao.findById(rs.getInt(2)),
                        getNewsDetail(rs.getInt(3)), rs.getString(4), rs.getDate(5), rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("loi");
        }
        return null;
    }

    public List<Reply> getReplyByCommentId(int commentId) {
        List<Reply> result = new ArrayList<>();
        String sql = "select * from Reply where comment_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CustomerDAO dao = new CustomerDAO();
                Reply newReply = new Reply(rs.getInt(1), dao.findById(rs.getInt(2)),
                        getCommentById(rs.getInt(3)), rs.getString(4), rs.getDate(5), rs.getString(6));
                result.add(newReply);
            }
        } catch (Exception e) {
            System.out.println("loiREp");
        }
        return result;
    }

    //-------------------------------------------------------------------------//
    // Insert comment 
    public int insertComment(Comment comment) {
        String sql = """
                     INSERT INTO [dbo].[Comment]
                                ([customer_id]
                                ,[detai_new_id]
                                ,[content]
                                ,[comment_date]
                                ,[status])
                          VALUES
                                (?, ?, ?, ?, ?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment.getCustomer_id().getCustomerId());
            st.setInt(2, comment.getDetail_new_id().getNewsDetailId());
            st.setString(3, comment.getContent());
            java.util.Date utilDate = comment.getComment_date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            st.setDate(4, sqlDate);
            st.setString(5, comment.getStatus());
            st.executeUpdate();
            String sql1 = """
                          SELECT top 1 [comment_id]
                            FROM [Comment]
                            order by [comment_id] desc""";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("loi");
        }
        return 0;
    }

    // Insert reply comment 
    public int insertReply(Reply reply) {
        String sql = """
                     INSERT INTO [dbo].[Reply]
                                ([customer_id]
                                ,[comment_id]
                                ,[content]
                                ,[reply_date]
                                ,[status])
                          VALUES
                                (?, ?, ?, ?, ?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reply.getCustomer_id().getCustomerId());
            st.setInt(2, reply.getCommment_id().getComment_id());
            st.setString(3, reply.getContent());
            java.util.Date utilDate = reply.getRely_date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            st.setDate(4, sqlDate);
            st.setString(5, reply.getStatus());
            st.executeUpdate();
            String sql1 = """
                          SELECT TOP 1 [reply_id]
                            FROM [Reply] 
                            ORDER BY [reply_id] DESC""";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<News> getTop5News() {
        List<News> result = new ArrayList<>();
        String sql = """
                     select TOP 5 * from News n
                     Join Detail_news d on n.news_id = d.news_id 
                     where n.status = N'active' 
                     order by n.news_id desc""";
        try {
            StaffDAO sDao = new StaffDAO();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News nNews = new News(rs.getInt(1), sDao.getStaffById(rs.getInt(2)),
                        rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getString(6), rs.getString(7));
                result.add(nNews);
            }
        } catch (Exception e) {
        }
        return result;
    }

    public List<News> getTop3News() {
        List<News> result = new ArrayList<>();
        String sql = """
                     select TOP 3 * from News n
                     Join Detail_news d on n.news_id = d.news_id 
                     where n.status = N'active' 
                     order by n.news_id desc""";
        try {
            StaffDAO sDao = new StaffDAO();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                News nNews = new News(rs.getInt(1), sDao.getStaffById(rs.getInt(2)),
                        rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getString(6), rs.getString(7));
                result.add(nNews);
            }
        } catch (Exception e) {
        }
        return result;
    }

    public boolean deleteComment(String commentId) {
        String sql = """
                     UPDATE [dbo].[Comment]
                        SET 
                           [status] = 'inactive'
                      WHERE [comment_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, commentId);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean deleteReply(String replyId) {
        String sql = """
                     UPDATE [dbo].[Reply]
                        SET 
                           [status] = 'inactive'
                      WHERE [reply_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, replyId);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean unDeleteComment(String commentId) {
        String sql = """
                     UPDATE [dbo].[Comment]
                        SET 
                           [status] = 'active'
                      WHERE [comment_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, commentId);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean unDeleteReply(String replyId) {
        String sql = """
                     UPDATE [dbo].[Reply]
                        SET 
                           [status] = 'active'
                      WHERE [reply_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, replyId);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<News> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean insert(News obj) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(News news) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    //check
    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        NewsDAO nDao = new NewsDAO();
        CustomerDAO cusDao = new CustomerDAO();
        System.out.println(nDao.unDeleteReply("36"));
        //test top 5 news
    }
}
