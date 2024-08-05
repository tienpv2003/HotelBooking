/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.CustomerNews;

import DAO.NewsDAO;
import Models.Comment;
import Models.Customer;
import Models.NewsDetail;
import Models.Reply;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Acer
 */
public class AddReplyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddReplyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddReplyServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("cusObj") != null) {
            Customer custommerId = (Customer) session.getAttribute("cusObj");
            String replyContent = request.getParameter("replyContent");
            String commentIdStr = request.getParameter("commentId");
            if (!replyContent.trim().isEmpty()) {
                NewsDAO dao = new NewsDAO();
                int commentId = Integer.parseInt(commentIdStr);
                Comment comment = dao.getCommentById(commentId);
                Date replyDate = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = dateFormat.format(replyDate);
                int replyId = dao.insertReply(new Reply(0, custommerId, comment,
                        replyContent, replyDate, "active"));
                String htmlRespone = "<li>"
                        + "<div class='comment_container'>"
                        + "<div class='comment'>"
                        + "<div class='com_author_photo'>"
                        + "<img src='Views/client/img/default-avt.jpg' alt=''>"
                        + "</div>"
                        + "<div class='col-md-12 col-sm-12'>"
                        + "<div class='comment_details'>"
                        + "<h3>" + custommerId.getFirstName() + " " + custommerId.getLastName() + "<span class='comm_time'>" + formattedDate + "</span></h3>"
                        + "<p>" + replyContent + "</p>"
                        + "<a href='delete_reply_customer?replyId=" + replyId + "&commentId=" + commentIdStr + "' class='reply delete-reply' data-reply-id='"+ replyId+"' data-comment-id='"+commentIdStr+"'>Gỡ bình luận</a>"
                        + "</div>"
                        + "</div>"
                        + "</div>"
                        + "</div>"
                        + "</li>";
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(htmlRespone);
            } else {
                response.getWriter().write("error");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
