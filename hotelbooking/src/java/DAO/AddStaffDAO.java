/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Utils.DBContext;
import Models.Customer;
import Models.Role;
import Models.Staff;
import Models.TypeCustomer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AddStaffDAO extends DBContext {

    private Role getRoleById(int staff_type_id) {
        String sql = "Select * from Role where staff_type_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, staff_type_id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("staff_type_id");
                String type = rs.getString("type");
                return new Role(id, type);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addStaff(String email, String password) {
    String sql = "INSERT INTO Staff (staff_type_id, email, password, status) VALUES (2, ?, ?, 'active')";
    try {
        // Hash the password before storing it
        String hashedPassword = hashPassword(password);

        PreparedStatement ps = connection.prepareStatement(sql);
        
        ps.setString(1, email);
        ps.setString(2, hashedPassword);
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0; // If rowsAffected > 0, insertion successful
    } catch (SQLException ex) {
        ex.printStackTrace();
        return false; // Insertion failed
    } catch (Exception e) {
        e.printStackTrace();
        return false; // Hashing failed
    }
}

    private String hashPassword(String password) throws Exception {
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
    public ArrayList<Customer> getAllCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        String sql = "SELECT c.customer_id, c.first_name, c.last_name, c.email, c.phone, c.address, c.status, tc.type_customer, tc.type_customer_name, tc.money_level, tc.discount "
                + "FROM Customer c "
                + "JOIN Type_customer tc ON c.type_customer = tc.type_customer";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setCustomerId(rs.getInt("customer_id"));
                c.setFirstName(rs.getString("first_name"));
                c.setLastName(rs.getString("last_name"));
                c.setEmail(rs.getString("email"));
                c.setPhone(rs.getString("phone"));
                c.setAddress(rs.getString("address"));
                c.setStatus(rs.getString("status"));

                TypeCustomer t = new TypeCustomer();
                t.setTypeCustomerId(rs.getInt("type_customer"));
                t.setTypeCustomerName(rs.getString("type_customer_name"));
                t.setMoneyLevel(rs.getFloat("money_level"));
                t.setDiscount(rs.getFloat("discount"));

                c.setTypeCustomer(t);

                customers.add(c);
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return customers;
    }

    public Staff getStaffByEmail(String email) {
        String sql = "SELECT * FROM Staff WHERE email = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                int staff_type_id = rs.getInt("staff_type_id");
                String _password = rs.getString("password");
                String status = rs.getString("status");
                Role role = getRoleById(staff_type_id);
                Staff staff = new Staff(staff_id, role, email, _password, status);

                return staff;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isCustomerEmail(String customerEmail) {
        String sql = "SELECT * FROM Customer WHERE email = ? AND status = 'active'";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, customerEmail);
            ResultSet rs = pst.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getPasswordByEmail(String email) {
        String sql = "SELECT password FROM Staff WHERE email = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getString("password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

   public boolean changePasswordByEmail(String email, String newPassword) {
    String sql = "UPDATE Staff SET password = ? WHERE email = ?";
    try {
        // Hash the new password before storing it
        String hashedPassword = hashPassword(newPassword);

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, hashedPassword);
        ps.setString(2, email);
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    } catch (Exception e) {
        e.printStackTrace();
        return false; // Hashing failed
    }
}

    public void banEmail(String email) {
        String sql = "UPDATE Staff SET status = 'banned' WHERE email = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, email);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateStatusByEmail(String email, String status) {
    String sql = "UPDATE Staff SET status = ? WHERE email = ?";
    try {
        PreparedStatement pst = connection.prepareStatement(sql);
        pst.setString(1, status);
        pst.setString(2, email);
        pst.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
   
    public static void main(String[] args) throws NoSuchAlgorithmException, Exception { 
        AddStaffDAO d = new AddStaffDAO();
        System.out.println(d.getAllCustomers());
        
    }
}
