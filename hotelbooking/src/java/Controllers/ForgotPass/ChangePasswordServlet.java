/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.ForgotPass;

import DAL.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Acer
 */
public class ChangePasswordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ChangePasswordServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
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
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("cusMail") != null) {
            request.getRequestDispatcher("Views/Login/changepassword.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("Views/Login/forgot.jsp").forward(request, response);
        }
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
        String newPass = request.getParameter("password");
        String rePass = request.getParameter("repassword");
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("cusMail") != null) {
            if (newPass.equals(rePass)) {
                String cusMail = (String) session.getAttribute("cusMail");
                CustomerDAO daoCus = new CustomerDAO();

                try {
                    daoCus.updateCustomerPassword(newPass, cusMail);
                    request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                    request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                request.setAttribute("messErr", "Mật khẩu không trùng khớp");
                request.setAttribute("password", newPass);
                request.setAttribute("repassword", rePass);
                request.getRequestDispatcher("Views/Login/changepassword.jsp").forward(request, response);
            }
        } else {

            response.sendRedirect("ForgotServlet");
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
