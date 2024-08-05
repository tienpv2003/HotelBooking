/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Payment;

import DAO.BookingDAO;
import Models.Booking;
import Models.Item;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author admin
 */
public class ResultPayment extends HttpServlet {

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
            out.println("<title>Servlet ResultPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResultPayment at " + request.getContextPath() + "</h1>");
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
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        if ("00".equals(vnp_ResponseCode)) {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("listBooking") != null) {
                Booking booking = (Booking) session.getAttribute("listBooking");
                BookingDAO bdao = new BookingDAO();
                bdao.addNewBooking(booking);
                String from = "DuongHNHHE172270@fpt.edu.vn";
                String password = "jyor qphe gomb kvgt";

                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");

                Authenticator auth = new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                };

                Session session1 = Session.getInstance(props, auth);

                try {
                    MimeMessage msg = new MimeMessage(session1);
                    msg.setFrom(new InternetAddress(from));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(booking.getCustomer().getEmail()));
                  
                    msg.setSubject("=?UTF-8?B?" + Base64.getEncoder().encodeToString("Hóa đơn thanh toán".getBytes("UTF-8")) + "?=");
                    
                    NumberFormat currencyFormatter = NumberFormat.getInstance();
                    currencyFormatter.setGroupingUsed(true);

                    SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
                    String paymentDate = dateFormatter.format(new java.util.Date());

                    String startDate = dateFormatter.format(booking.getStartDate());
                    String endDate = dateFormatter.format(booking.getEndDate());

                    StringBuilder emailContent = new StringBuilder();
                    emailContent.append("<!DOCTYPE html>")
                            .append("<html lang=\"en\">")
                            .append("<head>")
                            .append("<meta charset=\"UTF-8\">")
                            .append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">")
                            .append("<title>Hóa đơn thanh toán</title>")
                            .append("<style>")
                            .append("body { font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333; margin: 0; padding: 20px; }")
                            .append(".container { max-width: 600px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }")
                            .append("h1 { color: #007BFF; }")
                            .append("p { font-size: 16px; line-height: 1.5; }")
                            .append(".details { margin-bottom: 20px; }")
                            .append(".details p { margin: 5px 0; }")
                            .append(".total-price { font-size: 24px; color: #FF5733; font-weight: bold; }")
                            .append("</style>")
                            .append("</head>")
                            .append("<body>")
                            .append("<div class=\"container\">")
                            .append("<h1>Hóa đơn thanh toán</h1>")
                            .append("<p>Chào ").append(booking.getCustomer().getFirstName()).append(" ").append(booking.getCustomer().getLastName()).append(",</p>")
                            .append("<p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Dưới đây là chi tiết hóa đơn của bạn:</p>")
                            .append("<div class=\"details\">")
                            .append("<p><strong>Email:</strong> ").append(booking.getCustomer().getEmail()).append("</p>")
                            .append("<p><strong>Phòng đã đặt:</strong></p>");

                    for (Item item : booking.getListItem()) {
                        emailContent.append("<p>").append(item.getRoom().getRoomName())
                                .append(" - Giá: ").append(currencyFormatter.format(item.getPrice())).append("</p>");
                    }

                    emailContent.append("<p><strong>Ngày nhận phòng:</strong> ").append(startDate).append("</p>")
                            .append("<p><strong>Ngày trả phòng:</strong> ").append(endDate).append("</p>")
                            .append("<p><strong>Ngày thanh toán:</strong> ").append(paymentDate).append("</p>")
                            .append("</div>")
                            .append("<p class=\"total-price\">Tổng tiền: ").append(currencyFormatter.format(booking.calculateTotalPrice())).append("</p>")
                            .append("<p>Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi!</p>")
                            .append("</div>")
                            .append("</body>")
                            .append("</html>");

                    msg.setContent(emailContent.toString(), "text/html; charset=UTF-8");

                    Transport.send(msg);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Failed to send email.");
                }
            }
            
            request.setAttribute("msgPayment", vnp_TxnRef);
            session.removeAttribute("listBooking");
            request.getRequestDispatcher("Views/client/result-payment.jsp").forward(request, response);

        } else {
            request.setAttribute("msgPayment", vnp_ResponseCode);
            request.getRequestDispatcher("Views/client/result-payment.jsp").forward(request, response);
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
        processRequest(request, response);
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
