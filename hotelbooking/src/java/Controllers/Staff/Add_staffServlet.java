package Controllers.Staff;

import DAL.Add_StaffDao;
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

        Add_StaffDao staffDAO = new Add_StaffDao();
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
        if (staff != null && staff.getStatus().equals("unactive")) {
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
                msg.setSubject("Staff Account Details");
                String captcha = generateCaptcha();
                String encodedCaptcha = Base64.getEncoder().encodeToString(captcha.getBytes());

                long expiryTime = System.currentTimeMillis() + (3 * 60 * 1000); 
                captchaStore.put(encodedCaptcha, new CaptchaInfo(captcha, staffEmail, expiryTime));

                String emailContent = "Hello,\n\n";
                emailContent += "Here are the credentials for the new staff account:\n";
                emailContent += "Email: " + staffEmail + "\n";
                emailContent += "Password: " + staffPassword + "\n\n";
                emailContent += "Please use the following link to change the password:\n";
                emailContent += "http://localhost:9999/HotelBooking/change_pass_staff?encodedCaptcha=" + encodedCaptcha;
                emailContent += "\nBest regards,\nHotel Management";

                msg.setText(emailContent, "UTF-8");
                if (!staffDAO.isCustomerEmail(customerEmail)) {
                    request.setAttribute("message", "Email Custumer không tồn tại hoặc bị cấm");
                    request.getRequestDispatcher("Views/admin/add-staff.jsp").forward(request, response);
                    return;
                }               
                Transport.send(msg);
                request.setAttribute("message", "Sent mail suscess");
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

        String gmailRegex = "\\b[A-Za-z0-9._%+-]+@gmail\\.com\\b";
        return email.matches(gmailRegex);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
