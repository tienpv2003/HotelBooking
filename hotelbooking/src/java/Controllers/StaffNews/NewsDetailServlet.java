/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.StaffNews;

import DAO.NewsDAO;
import DAO.StaffDAO;
import Models.Comment;
import Models.News;
import Models.Reply;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author PhạmVinhTiến
 */
public class NewsDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String new_id = request.getParameter("news_id");
        int newsId = Integer.parseInt(new_id);        
        NewsDAO newDAO = new NewsDAO();
        StaffDAO staffDAO = new StaffDAO();
        News news = newDAO.findById(newsId);
        int staffId = news.getStaff().getStaff_id();
        String email = staffDAO.getStaffById(staffId).getEmail();
        String name;
        if (email.contains("@")) {
            name = email.substring(0, email.indexOf("@")).toUpperCase();
        } else {
            name = email.toUpperCase(); // or handle the case as you prefer
        }
        PrintWriter out = response.getWriter();
        List<Comment> listComment = newDAO.getCommentByNewsId(newDAO.getNewsDetail(newsId).getNewsDetailId());
        
        for (Comment comment : listComment) {
            List<Reply> replies = newDAO.getReplyByCommentId(comment.getComment_id());
            comment.setReplies(replies);
        }
        
        String content = newDAO.getNewsContent(newsId);
        request.setAttribute("newsDetail", news);
        request.setAttribute("content", content);
        request.setAttribute("name", name);
        request.setAttribute("list5News", newDAO.getTop5News());
        request.setAttribute("listCommment", listComment);
        request.getRequestDispatcher("Views/admin/blog-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
