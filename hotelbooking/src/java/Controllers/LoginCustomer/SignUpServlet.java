package Controllers.LoginCustomer;

import DAO.CustomerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Models.Customer;
import jakarta.servlet.http.HttpSession;
import Utils.LoginValidator;

public class SignUpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Login/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = (String) session.getAttribute("cusMail");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");
        String status = "active";
        String agreed = request.getParameter("agreed");
        boolean insertStatus = false;
        String errorMessage = "";
        String successMessage = "";
        
        LoginValidator validator = new LoginValidator();

        if (agreed != null) {
            String name = firstName+" "+lastName;
            if (errorMessage.isEmpty()) {
                errorMessage = validator.validateNameCustomer(name);
            }
            if (errorMessage == null) {
                errorMessage = validator.validatePassword(password);
            }
            if (errorMessage == null) {
                errorMessage = validator.validatePhoneNumber(phoneNumber);
            }
            if (errorMessage == null && !repassword.equals(password)) {
                errorMessage = "Mật khẩu không trùng khớp!";
            }

            if (errorMessage == null) {
                Customer newCustomer = new Customer(firstName, lastName, email, password, phoneNumber, address, status);
                
                CustomerDAO customerDAO = new CustomerDAO();
                insertStatus = customerDAO.insert(newCustomer);

                if (insertStatus) {
                    successMessage = "Đăng kí thành công!";
                    request.setAttribute("successMessage", successMessage);
                    request.getRequestDispatcher("Views/Login/signin.jsp").forward(request, response);
                    return;
                } else {
                    errorMessage = "Email đã tồn tại! Hãy thử lại!";
                }
            }
        } else {
errorMessage = "Vui lòng đồng ý điều khoản của chúng tôi!";
        }

        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("password", password);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("address", address);
        request.getRequestDispatcher("Views/Login/signup.jsp").forward(request, response);
    }
}