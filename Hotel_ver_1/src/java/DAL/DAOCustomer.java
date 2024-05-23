/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import static Controllers.ForgotPass.OTPServlet.generateRandomIntString;
import Models.Customer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Acer
 */
public class DAOCustomer extends DBContext {

    public Customer getCustomerByMail(String mail) {
        DAOType daoType = new DAOType();
        String sql = """
                     SELECT [customer_id]
                           ,[type_customer]
                           ,[first_name]
                           ,[last_name]
                           ,[email]
                           ,[password]
                           ,[phone]
                           ,[address]
                           ,[status]
                       FROM [Hotel].[dbo].[Customer] where [email] like ?;""";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt(1), daoType.getTypeById(rs.getString(2)), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateCustomerPassword(String newPassword, String email) throws NoSuchAlgorithmException{
        String sql = """
                     UPDATE [dbo].[Customer]
                     SET  [password] = ? WHERE [email] like ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hashPassword(newPassword));
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Ko doi ");
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
    
    public static void main(String[] args) throws NoSuchAlgorithmException {
        DAOType t = new DAOType();
        DAOCustomer c = new DAOCustomer();
        System.out.println(c.getCustomerByMail("zzhtc1907@gmail.com").getCustomerId());
        c.updateCustomerPassword("qwerty", "zzhtc1907@gmail.com");
    }
}
