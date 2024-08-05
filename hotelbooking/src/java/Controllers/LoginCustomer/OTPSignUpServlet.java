package Controllers.LoginCustomer;

import java.io.IOException;
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

public class OTPSignUpServlet extends HttpServlet {

    private LocalDateTime sendTime;
    private LocalDateTime receiveTime;
    private final String otpStr = generateRandomIntString(6);
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("cusMail");

        // Set the properties for the mail session
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587"); // Port for STARTTLS

        // Get the mail session
        Session s = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("hathanhcong11b11@gmail.com", "frip ftip ibfx dxxd"); // Sender's email and app-specific password
            }
        });

        try {
            // Compose the message
            MimeMessage message = new MimeMessage(s);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // Recipient's email
            message.setSubject("Kích hoạt tài khoản."); // Email subject
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
                    + "</html>", "text/html; charset=UTF-8"); // Email content in HTML

            // Send the message
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

        sendTime = LocalDateTime.now();
        request.setAttribute("check", "true");
        request.getRequestDispatcher("Views/Login/otp.jsp").forward(request, response);
    }

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
