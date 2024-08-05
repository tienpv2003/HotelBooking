/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.CustomerNews;

import DAO.NewsDAO;
import Models.Comment;
import Models.Customer;
import Models.NewsDetail;
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
public class AddCommentServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCommentServlet at " + request.getContextPath() + "</h1>");
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
        String content = request.getParameter("content");
        String detailId = request.getParameter("detailId");
        HttpSession session = request.getSession(false);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (session != null && session.getAttribute("cusObj") != null && content.trim().length() != 0) {
            NewsDAO dao = new NewsDAO();
            Customer cus = (Customer) session.getAttribute("cusObj");
            Date cmtDate = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = dateFormat.format(cmtDate);
            int id = Integer.parseInt(detailId);
            NewsDetail newDetail = dao.getNewsDetail(id);
            Comment cmt = new Comment(0, cus, newDetail, content, cmtDate, "active");
            int commentId = dao.insertComment(cmt);

            // Trả về phản hồi JSON
            String jsonResponse = String.format(
                    "{\"status\":\"success\", \"customerName\":\"%s %s\", \"commentDate\":\"%s\", \"content\":\"%s\", \"commentId\":\"%d\", \"isOwner\":%b}",
                    cus.getFirstName(), cus.getLastName(), formattedDate, content, commentId, true
            );
            out.print(jsonResponse);
        } else {
            // Trả về phản hồi thất bại
            out.print("{\"status\":\"failure\"}");
        }
        out.flush();
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
