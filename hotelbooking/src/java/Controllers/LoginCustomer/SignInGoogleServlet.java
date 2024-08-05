/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.LoginCustomer;

import Utils.Constants;
import DAO.CustomerDAO;
import DAO.TypeCustomerDAO;
import Models.Customer;
import Models.UserGoogle;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;


public class SignInGoogleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogle user = getUserInfo(accessToken);
        CustomerDAO cdao = new CustomerDAO();
        Customer existingCustomer = cdao.findByEmail(user.getEmail());
        TypeCustomerDAO tcdao = new TypeCustomerDAO();
        if (existingCustomer == null) {
            // User doesn't exist, so create a new customer
            Customer newCustomer = new Customer();
            newCustomer.setFirstName(user.getFamily_name());
            newCustomer.setLastName(user.getGiven_name());
            newCustomer.setEmail(user.getEmail());
            newCustomer.setTypeCustomer(tcdao.getTypeById("1"));
            newCustomer.setPassword(user.getId().substring(0, 7));
            newCustomer.setStatus("active");
            boolean insertStatus = false;
            insertStatus = cdao.insert(newCustomer);
            if (insertStatus) {
                request.getSession().setAttribute("cusObj", newCustomer);
                request.getRequestDispatcher("home").forward(request, response);
        }
    }else {
            // User exists, log them in
            request.getSession().setAttribute("cusObj", existingCustomer);
            request.getRequestDispatcher("home").forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
