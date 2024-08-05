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
public class Change_CapchaServlet extends HttpServlet {

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
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Captcha has expired.");
            } else {
                request.setAttribute("capcha", captchaInfo.getCaptcha());
                request.setAttribute("email", captchaInfo.getEmail());
                request.setAttribute("encodedCaptcha", encodedCaptcha);
                request.getRequestDispatcher("Views/Login/change_capcha.jsp").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid captcha.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String passworda = request.getParameter("passworda");
        String password = request.getParameter("password");
        String captcha = request.getParameter("captcha");
        String email = request.getParameter("email");
        String encodedCaptcha = request.getParameter("encodedCaptcha");
        LoginValidator log = new LoginValidator();
        boolean valiNewPass = log.validatePasswordStaff(password);
        AddStaffDAO staffDAO = new AddStaffDAO();
        if (captcha == null || !CaptchaStore.getInstance().get(encodedCaptcha).getCaptcha().equals(captcha) || !CaptchaStore.getInstance().get(encodedCaptcha).getEmail().equals(email)) {
            String message = URLEncoder.encode("Captcha sai", "UTF-8");
            response.sendRedirect("/HotelBooking/change_capcha?encodedCaptcha=" + encodedCaptcha + "&message=" + message);
            return;
        }
        if (!valiNewPass) {
            String message = URLEncoder.encode("Mật khảu phải có 6-15 kí tự bao gồm tự hoa và số", "UTF-8");

            response.sendRedirect("/HotelBooking/change_capcha?encodedCaptcha=" + encodedCaptcha + "&message=" + message);
            return;
        }
        // Check if passwords match
        if (!password.equals(passworda)) {
            String message = URLEncoder.encode("Mật khẩu nhập lại không khớp", "UTF-8");
            response.sendRedirect("/HotelBooking/change_capcha?encodedCaptcha=" + encodedCaptcha + "&message=" + message);
            return;
        }

        boolean passwordChanged = staffDAO.changePasswordByEmail(email, password);

        if (passwordChanged) {
            captchaStore.remove(captcha);
            request.setAttribute("message1", "Đổi mật khẩu thành công");
            request.getRequestDispatcher("Views/Login/change_capcha.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add staff.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
