/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Customer;

import static Controllers.ForgotPass.OTPServlet.generateRandomIntString;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Acer
 */
public class OTPSignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet OTPSignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OTPSignUpServlet at " + request.getContextPath() + "</h1>");
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
    private LocalDateTime sendTime;
    private LocalDateTime receiveTime;
    private String otpStr = generateRandomIntString(6);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("cusMail");
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", 587);

        // get Session
        Session s = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("hathanhcong11b11@gmail.com", "jlid evsq nogf atpn"); // Mat khau mail người gửi 
            }
        });
        // compose message
        try {
            MimeMessage message = new MimeMessage(s);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // Mail người nhận
            message.setSubject("Kích hoạt tài khoản."); // Tiêu đề mail
            message.setContent("<!DOCTYPE html>"
                    + "<html lang=\"en\">"
                    + "<head>"
                    + "<meta charset=\"UTF-8\">"
                    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
                    + "<title>Random Integer String</title>"
                    + "<style>"
                    + "body {"
                    + "    font-family: Arial, sans-serif;"
                    + "    background-color: #f4f4f4;"
                    + "    color: #333;"
                    + "    margin: 0;"
                    + "    padding: 20px;"
                    + "}"
                    + ".container {"
                    + "    max-width: 600px;"
                    + "    margin: 0 auto;"
                    + "    background-color: #fff;"
                    + "    padding: 20px;"
                    + "    border-radius: 8px;"
                    + "    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);"
                    + "}"
                    + "h1 {"
                    + "    color: #007BFF;"
                    + "}"
                    + "p {"
                    + "    font-size: 16px;"
                    + "    line-height: 1.5;"
                    + "}"
                    + ".random-int {"
                    + "    font-size: 24px;"
                    + "    color: #FF5733;"
                    + "    font-weight: bold;"
                    + "}"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class=\"container\">"
                    + "<h1>Mã OTP xác minh tài khoản</h1>"
                    + "<p>Chào bạn,</p>"
                    + "<p>Mã OTP xác minh tài khoản vui lòng không chia sẻ cho bất kì ai.</p>"
                    + "<p class=\"random-int\">" + otpStr + "</p>"
                    + "<p>Cảm ơn quá khách đã sử dụng dịch vụ của chúng tôi!</p>"
                    + "</div>"
                    + "</body>"
                    + "</html>", "text/html; charset=UTF-8"); // Nội dung mail
            // send message
            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        sendTime = LocalDateTime.now();
        request.setAttribute("check", "true");
        request.getRequestDispatcher("Views/Login/otp.jsp").forward(request, response);
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
        String otp = request.getParameter("otp");
        receiveTime = LocalDateTime.now();
        Duration duration = Duration.between(sendTime, receiveTime);
        if (duration.toMinutes() > 3 || duration.toHours() >= 1 || duration.toDays() >= 1) {
            request.setAttribute("messErr", "Mã OTP đã hết hạn");
            request.setAttribute("otp", otp);
            request.getRequestDispatcher("Views/Login/otp.jsp").forward(request, response);
        } else {
            if (otp.equals(otpStr)) {
                request.setAttribute("check", "true");
                request.getRequestDispatcher("Views/Login/signup.jsp").forward(request, response);
            } else {
                request.setAttribute("check", "true");
                request.setAttribute("otp", otp);
                request.setAttribute("messErr", "Mã OTP không chính xác");
                request.getRequestDispatcher("Views/Login/otp.jsp").forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @param length
     * @return a String containing servlet description
     */
    public static String generateRandomIntString(int length) {
        StringBuilder result = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int randomDigit = random.nextInt(10); // Số ngẫu nhiên từ 0 đến 9
            result.append(randomDigit);
        }
        return result.toString();
    }
}
