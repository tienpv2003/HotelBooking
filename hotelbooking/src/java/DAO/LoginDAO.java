/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Utils.DBContext;
import Models.Role;
import Models.Staff;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class LoginDAO extends DBContext {

    public Staff login(String email, String password) {
        String sql = "Select * from Staff where email = ? and password = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                int staff_type_id = rs.getInt("staff_type_id");
                String _email = rs.getString("email");
                String _password = rs.getString("password");
                String status = rs.getString("status");
                Role role = getRoleById(staff_type_id);
                
                Staff staff = new Staff(staff_id, role, _email, _password, status);
                return staff;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

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
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // If rowsAffected > 0, insertion successful
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false; // Insertion failed
        }
    }
  
    public Staff findByEmailStaff(String email) {
        String query = "select * from staff where email=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int staff_id = rs.getInt("staff_id");
                    int staff_type_id = rs.getInt("staff_type_id");

                    String _password = rs.getString("password");
                    String status = rs.getString("status");
                    Role role = getRoleById(staff_type_id);

                    Staff staff = new Staff(staff_id, role, email, _password, status);
                    return staff;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean isStaffEmail(String staffEmail) {
        String sql = "SELECT * FROM Staff WHERE email = ? AND status = 'active'";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, staffEmail);
            ResultSet rs = pst.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
