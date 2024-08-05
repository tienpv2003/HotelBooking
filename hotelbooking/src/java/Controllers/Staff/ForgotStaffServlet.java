/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Staff;

import DAO.AddStaffDAO;
import Utils.CaptchaStore;
import DAO.LoginDAO;
import Models.CaptchaInfo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
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
public class ForgotStaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";

    private ConcurrentHashMap<String, CaptchaInfo> captchaStore = CaptchaStore.getInstance();

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotStaffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotStaffServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Views/Login/send.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        LoginDAO loginDAO = new LoginDAO();
        AddStaffDAO staffDAO = new AddStaffDAO();
        HttpSession session1 = request.getSession();

        Integer count = (Integer) session1.getAttribute("emailCount");
        if (count == null) {
            count = 1;
        }
        String previousEmail = (String) session1.getAttribute("previousEmail");
        if (previousEmail == null || !previousEmail.equals(email)) {
            count = 1; // Reset count về 1
            session1.setAttribute("previousEmail", email);
        } else {
            count++;
        }

        if (count > 5) {
            staffDAO.banEmail(email);
            request.setAttribute("message", "Tài khoản của bạn đã bị cấm");
            request.getRequestDispatcher("Views/Login/send.jsp").forward(request, response);
            return;
        }
        session1.setAttribute("emailCount", count);

        if (!isValidGmailFormat(email)) {
            request.setAttribute("message1", "Không phải email");
            request.getRequestDispatcher("Views/Login/send.jsp").forward(request, response);
            return;
        }

        if (loginDAO.isStaffEmail(email) == false) {
            request.setAttribute("message1", "Email bị cấm");
            request.getRequestDispatcher("Views/Login/send.jsp").forward(request, response);
        } else {
            final String from = "DuongHNHHE172270@fpt.edu.vn";
            final String password = "jyor qphe gomb kvgt";

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

            Session session = Session.getInstance(props, auth);

            final String to = email;
            MimeMessage msg = new MimeMessage(session);

            try {

                msg.setFrom(new InternetAddress(from));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                msg.setSubject("=?UTF-8?B?" + Base64.getEncoder().encodeToString("Xác nhận Email".getBytes("UTF-8"))+ "?=");

                String captcha = generateCaptcha();
                String encodedCaptcha = Base64.getEncoder().encodeToString(captcha.getBytes());

                long expiryTime = System.currentTimeMillis() + (3 * 60 * 1000);
                captchaStore.put(encodedCaptcha, new CaptchaInfo(captcha, email, expiryTime));

                String emailContent = "<!DOCTYPE html>"
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
                        + "<h1>Capcha đổi mật khẩu tài khoản</h1>"
                        + "<p>Chào bạn,</p>"
                        + "<p>Đây là mã bảo mật điền Capcha để đổi mật khẩu.</p>"
                        + "<p class=\"random-int\">" + captcha + "</p>"
                        + "<p>Cảm ơn quá khách đã sử dụng dịch vụ của chúng tôi!</p>"
                        + "</div>"
                        + "</body>"
                        + "</html>";
                emailContent += "Vui lòng truy cập vào đường link sau để xác nhận:\n";
                emailContent += "http://localhost:9999/HotelBooking/change_capcha?encodedCaptcha=" + encodedCaptcha;

                msg.setContent(emailContent, "text/html; charset=UTF-8");

                Transport.send(msg);
                request.setAttribute("message", "Gửi mail thành công");
                request.getRequestDispatcher("Views/Login/send.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    public static String generateCaptcha() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int length = 6;
        StringBuilder captcha = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            captcha.append(characters.charAt(random.nextInt(characters.length())));
        }
        return captcha.toString();
    }

    private boolean isValidGmailFormat(String email) {

        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$";
        return email.matches(emailRegex);
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
