/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Staff;

import DAL.Add_StaffDao;
import Utils.CaptchaStore;
import DAL.LoginDAO;
import Models.CaptchaInfo;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
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
            /* TODO output your page here. You may use following sample code. */
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
        Add_StaffDao staffDAO = new Add_StaffDao();
        Staff staff = staffDAO.getStaffByEmail(email);
        String staffPassword = staff.getPassword();
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
        if (staff == null) {
            request.setAttribute("message", "Email này không tồn tại");
            request.getRequestDispatcher("Views/Login/send.jsp").forward(request, response);
            return;
        }

        if (!isValidGmailFormat(email)) {
            request.setAttribute("message", "Không phải email");
            request.getRequestDispatcher("Views/Login/send.jsp").forward(request, response);
            return;
        }

        if (loginDAO.isStaffEmail(email) == false) {
            request.setAttribute("message", "Email này không phải email staff hoặc bị cấm");
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
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                msg.setSubject("Staff Account Details");
                String captcha = generateCaptcha();
                String encodedCaptcha = Base64.getEncoder().encodeToString(captcha.getBytes());

                long expiryTime = System.currentTimeMillis() + (3 * 60 * 1000);
                captchaStore.put(encodedCaptcha, new CaptchaInfo(captcha, email, expiryTime));
                
                String emailContent = "Hello,\n\n";
                emailContent += "Here are the credentials for the new staff account:\n";
                emailContent += "Email: " + email + "\n";
                emailContent += "Password: " +staffPassword  + "\n\n";
                emailContent += "Please use the following link to change the password:\n";
                emailContent += "http://localhost:9999/HotelBooking/change_pass_staff?encodedCaptcha=" + encodedCaptcha;
                emailContent += "\nBest regards,\nHotel Management";
//                PrintWriter out = response.getWriter();
//                out.print(hashpassword);
                msg.setText(emailContent, "UTF-8");
                Transport.send(msg);
                request.setAttribute("message", "Sent mail suscess");
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

        String gmailRegex = "\\b[A-Za-z0-9._%+-]+@gmail\\.com\\b";
        return email.matches(gmailRegex);
    }
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedHash = digest.digest(password.getBytes());

        StringBuilder hexString = new StringBuilder(2 * encodedHash.length);
        for (byte b : encodedHash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        return hexString.toString();
    }
    
    /*
    private Staff authenticateStaff(String email,String password) throws  SQLException,NoSuchAlgorithmException{
        LoginDAO loginDAO = new LoginDAO();
        Staff staff = loginDAO.findByEmailStaff(email);
        if (staff != null) {
            String passwordHashed = hashPassword(password);
            if(staff.getPassword().equals(passwordHashed)){
                return  staff;
            }
        }
        return null;
    }
    */
    private Staff authenticateStaff(String email, String password) throws SQLException, NoSuchAlgorithmException {
        LoginDAO loginDAO = new LoginDAO();
        Staff staff = loginDAO.findByEmailStaff(email);
        if (staff != null) {
            String passwordHashed = hashPassword(password);
            //System.out.println("Hashed Password: " + passwordHashed); // Debugging log
            if (staff.getPassword().equals(passwordHashed)) {
                return staff;
            }
        }
        return null;
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
