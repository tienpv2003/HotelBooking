package Controllers.Staff;

import DAO.AddStaffDAO;
import Models.Staff;

import Models.CaptchaInfo;
import Utils.CaptchaStore;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Base64;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

public class Add_staffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ConcurrentHashMap<String, CaptchaInfo> captchaStore = CaptchaStore.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Add_staffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Add_staffServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/admin/add-staff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customerEmail = request.getParameter("customerEmail");
        String staffEmail = request.getParameter("staffEmail");

        AddStaffDAO staffDAO = new AddStaffDAO();
        Staff staff = staffDAO.getStaffByEmail(staffEmail);
        if (!isValidGmailFormat(customerEmail)) {
            request.setAttribute("message", "Không phải Custumer email");
            request.getRequestDispatcher("Views/admin/add-staff.jsp").forward(request, response);
            return;
        }

        if (!isValidGmailFormat(staffEmail)) {
            request.setAttribute("message", "Không phải Staff email");
            request.getRequestDispatcher("Views/admin/add-staff.jsp").forward(request, response);
            return;
        }
        if (staff != null && staff.getStatus().equals("inactive")) {
            staffDAO.updateStatusByEmail(staffEmail, "active");
            String staffPassword = staff.getPassword();
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

            Session session = Session.getInstance(props, auth);

            try {
                MimeMessage msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(from));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(customerEmail));
                msg.setSubject("=?UTF-8?B?" + Base64.getEncoder().encodeToString("Tài Khoản nhân viên".getBytes("UTF-8")) + "?=");
                String captcha = generateCaptcha();
                String encodedCaptcha = Base64.getEncoder().encodeToString(captcha.getBytes());

                long expiryTime = System.currentTimeMillis() + (60 * 60 * 1000);
                captchaStore.put(encodedCaptcha, new CaptchaInfo(captcha, staffEmail, expiryTime));

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
                        + "<h1>Tài khoản staff</h1>"
                        + "<p>Chào bạn,</p>"
                        + "<p>Đây là tài khoản của bạn, vui lòng đổi mật khẩu trước khi đăng nhập</p>"
                        + "<p class=\"random-int\"> Email: " + staffEmail + "</p>"
                        + "<p class=\"random-int\"> Mật khẩu: <span style=\"color: #15c\">" + staffPassword + " </span></p>"
                        + "<p>Cảm ơn quá khách đã sử dụng dịch vụ của chúng tôi!</p>"
                        + "</div>"
                        + "</body>"
                        + "</html>";
                emailContent += "Vui lòng truy cập vào đường link sau để xác nhận:\n";
                emailContent += "http://localhost:9999/HotelBooking/change_pass_staff?encodedCaptcha=" + encodedCaptcha;
                emailContent += "\nBest regards,\nHotel Management";

                msg.setContent(emailContent, "text/html; charset=UTF-8");

                if (!staffDAO.isCustomerEmail(customerEmail)) {
                    request.setAttribute("message", "Email Custumer không tồn tại hoặc bị cấm");
                    request.getRequestDispatcher("Views/admin/add-staff.jsp").forward(request, response);
                    return;
                }
                Transport.send(msg);
                request.setAttribute("message1", "Gửi mail thành công");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Failed to send email.");
            }
        } else {
            request.setAttribute("message", "Staff email đã tồn tại");
        }

        request.getRequestDispatcher("Views/admin/add-staff.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
