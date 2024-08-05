/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.CustomerNews;

import DAO.NewsDAO;
import Models.Comment;
import Models.Reply;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Acer
 */
public class NewsDetailCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newsIdStr = request.getParameter("newId");
        int newsId = Integer.parseInt(newsIdStr);
        NewsDAO dao = new NewsDAO();
        List<Comment> listComment = dao.getCommentByNewsId(dao.getNewsDetail(newsId).getNewsDetailId());
 //       PrintWriter out = response.getWriter();
        for (Comment comment : listComment) {
            List<Reply> replies = dao.getReplyByCommentId(comment.getComment_id());
            comment.setReplies(replies);
//            out.println(comment.getContent());
        }
        request.setAttribute("newsDetail", dao.getNewsDetail(newsId));
        request.setAttribute("listCommment", listComment);
        request.setAttribute("list5New", dao.getTop5News());
        request.getRequestDispatcher("Views/client/single-blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
