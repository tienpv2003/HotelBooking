package Controllers.Staff;

import DAO.StaffDAO;
import Models.Role;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.List;

/**
 *
 * @author admin
 */
public class CreateStaffServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateStaffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateStaffServlet at " + request.getContextPath() + "</h1>");
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
        StaffDAO staffDAO = new StaffDAO();
        List<Role> roles = staffDAO.getAllRoles();

        List<Staff> inactiveStaffList = staffDAO.getInactiveStaff();
        request.setAttribute("staffList", inactiveStaffList);
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("Views/admin/create-staff.jsp").forward(request, response);
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
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("sellist1"));

        try {
            if (!isValidGmailFormat(email)) {
                String failureMessage = URLEncoder.encode("Không phải email", "UTF-8");
                response.sendRedirect("create_staff?message1=" + failureMessage);
                return;
            }
            Staff newStaff = new Staff(0, new Role(roleId, ""), email, password, "inactive");
            StaffDAO staffDAO = new StaffDAO();
            boolean success = staffDAO.insert(newStaff);
            if (success) {
                String successMessage = URLEncoder.encode("Thành công", "UTF-8");
                response.sendRedirect("create_staff?message=" + successMessage);
            } else {
                String failureMessage = URLEncoder.encode("Thất bại", "UTF-8");
                response.sendRedirect("create_staff?message1=" + failureMessage);
            }
        } catch (Exception e) {
            response.sendRedirect("path-to-error-page");
        }
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
