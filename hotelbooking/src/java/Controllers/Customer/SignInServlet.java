package Controllers.Customer;

import DAL.CustomerDAO;
import DAL.LoginDAO;
import Models.Customer;
import Models.Staff;
import java.io.IOException;
import java.security.MessageDigest;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class SignInServlet
 */
public class SignInServlet extends HttpServlet {

    private int count = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        try {
            CustomerDAO dao = new CustomerDAO();
            LoginDAO loginDAO = new LoginDAO();
            if (dao.findByEmail(email) != null) {
                Customer cus = authenticateCustomer(email, password);
                if (cus != null) {
                    String remember = request.getParameter("remember");

                    if (remember != null) {
                        Cookie cRemember = new Cookie("cookrem", remember.trim());
                        Cookie cEmail = new Cookie("cookuser", cus.getEmail());
                        Cookie cPassword = new Cookie("cookpass", password);
                        // Set thời gian sống của cookie là 30 ngày
                        cEmail.setMaxAge(60 * 60 * 24 * 30);
                        cPassword.setMaxAge(60 * 60 * 24 * 30);
                        cRemember.setMaxAge(60 * 60 * 24 * 30);
                        response.addCookie(cEmail);
                        response.addCookie(cPassword);
                        response.addCookie(cRemember);
                    }
                    session.setAttribute("cusObj", cus);
                    request.getRequestDispatcher("Views/client/index.jsp").forward(request, response);
                } else {
                    request.setAttribute("email", email);
                    request.setAttribute("errorMessage", "Mật khẩu không chính xác!");
                    count++;
                    if (count >= 6) {
                        count = 0;
                        request.setAttribute("email", email);
                        request.getRequestDispatcher("Views/Login/forgot.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
                    }
                }
            } else if (loginDAO.findByEmailStaff(email) != null) {
                Staff staff = authenticateStaff(email, password);
                
                if (staff == null) {
                    session.invalidate();
                    request.setAttribute("errorMessage", "Sai mật khẩu");
                    request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
                } else {
//                    PrintWriter out = response.getWriter();
//                    out.print(staff.getPassword());

                    session.setAttribute("emailStaff", staff);
                    if (staff.getStaff_type_id().getStaff_type_id() == 1) {
                        response.sendRedirect("HomeAdminController");
                    } else if (staff.getStaff_type_id().getStaff_type_id() == 2) {
                        response.sendRedirect("HomeAdminController");
                    }else  {
                         request.setAttribute("errorMessage", "Sai mật khẩu ");
                    }

                }
            } else {
                request.setAttribute("errorMessage", "Tên đăng nhập không chính xác!");
                request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Đã xảy ra lỗi. Vui lòng thử lại.");
            request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(SignInServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Phương thức hash mật khẩu
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
    // Phương thức xác thực khách hàng
    private Customer authenticateCustomer(String email, String password) throws SQLException, NoSuchAlgorithmException {
        CustomerDAO cdao = new CustomerDAO();
        Customer cus = cdao.findByEmail(email);

        if (cus != null) {
            String passwordHashed = hashPassword(password);
            if (cus.getPassword().equals(passwordHashed)) {
                return cus;
            }
        }
        return null;
    }
    
}
