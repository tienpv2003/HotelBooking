package Controllers.Staff;

import DAO.AddStaffDAO;
import Models.CaptchaInfo;
import Utils.CaptchaStore;
import Utils.LoginValidator;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author admin
 */
public class ChangePassStaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ConcurrentHashMap<String, CaptchaInfo> captchaStore = CaptchaStore.getInstance();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String encodedCaptcha = request.getParameter("encodedCaptcha");
        if (encodedCaptcha != null && captchaStore.containsKey(encodedCaptcha)) {
            CaptchaInfo captchaInfo = captchaStore.get(encodedCaptcha);

            if (captchaInfo.isExpired()) {
                captchaStore.remove(encodedCaptcha); // Remove expired captcha
                System.out.println("Captcha has expired.");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Captcha has expired.");
            } else {
                request.setAttribute("email", captchaInfo.getEmail());
                request.setAttribute("encodedCaptcha", encodedCaptcha);
                request.getRequestDispatcher("Views/Login/change_pass_staff.jsp").forward(request, response);
            }
        } else {
            System.out.println("Invalid captcha.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid captcha.");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPassword = request.getParameter("opass");
        String newPassword = request.getParameter("password");
        String newPasswordAgain = request.getParameter("passworda");
        String email = request.getParameter("email");
        String encodedCaptcha = request.getParameter("encodedCaptcha");
        LoginValidator log = new LoginValidator();
        boolean valiNewPass = log.validatePasswordStaff(newPassword);
        AddStaffDAO staffDAO = new AddStaffDAO();
        String currentPassword = staffDAO.getPasswordByEmail(email);
        if (!currentPassword.equals(oldPassword)) {
            String message1 = URLEncoder.encode("Mật khẩu cũ không đúng", "UTF-8");

            response.sendRedirect("/HotelBooking/change_pass_staff?encodedCaptcha=" + encodedCaptcha + "&message1=" + message1);
            return;
        }
        if (!valiNewPass) {
            String message1 = URLEncoder.encode("Mật khảu phải có 6-15 kí tự bao gồm tự hoa và số", "UTF-8");

            response.sendRedirect("/HotelBooking/change_pass_staff?encodedCaptcha=" + encodedCaptcha + "&message1=" + message1);
            return;
        }
        if (!newPassword.equals(newPasswordAgain)) {
            String message1 = URLEncoder.encode("Mật khẩu nhập lại không khớp", "UTF-8");

            response.sendRedirect("/HotelBooking/change_pass_staff?encodedCaptcha=" + encodedCaptcha + "&message1=" + message1);
            return;
        }
        // Cập nhật mật khẩu mới
        boolean passwordChanged = staffDAO.changePasswordByEmail(email, newPassword);
        if (passwordChanged) {
            request.setAttribute("message", "Thay đổi thành công");
        } else {
            request.setAttribute("message", "Failed to change password.");
        }

        request.getRequestDispatcher("Views/Login/change_pass_staff.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
