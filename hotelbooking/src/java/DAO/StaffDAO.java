/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Utils.DBContext;
import Models.Role;
import Models.Staff;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class StaffDAO extends DBContext {

    public List<Staff> getActiveStaff() {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM Staff WHERE status = 'active'";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                int staff_type_id = rs.getInt("staff_type_id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String status = rs.getString("status");
                Role role = getRoleById(staff_type_id);
                Staff staff = new Staff(staff_id, role, email, password, status);
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

    private Role getRoleById(int staff_type_id) {
        String sql = "SELECT * FROM Role WHERE staff_type_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, staff_type_id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("staff_type_id");
                String type = rs.getString("type");
                return new Role(id, type);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Staff> getInactiveStaff() {
        List<Staff> staffList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Staff WHERE status = 'inactive'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Staff staff = new Staff();
                staff.setStaff_id(rs.getInt("staff_id"));
                staff.setEmail(rs.getString("email"));
                staff.setPassword(rs.getString("password"));
                staff.setStatus(rs.getString("status"));
                staff.setStaff_type_id(getRoleById(rs.getInt("staff_type_id")));
                staffList.add(staff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return staffList;
    }

    public boolean insert(Staff staff) throws Exception {
        String sql = "INSERT INTO Staff (staff_type_id, email, password, status) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, staff.getStaff_type_id().getStaff_type_id());
            pst.setString(2, staff.getEmail());
            pst.setString(3, staff.getPassword());
            pst.setString(4, staff.getStatus());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<>();
        String sql = "SELECT * FROM Role";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("staff_type_id");
                String type = rs.getString("type");
                roles.add(new Role(id, type));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roles;
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

    public boolean updateStaff(int staffId, String email, String password) {
        String sql = "UPDATE Staff SET email = ?, password = ? WHERE staff_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setInt(3, staffId);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean banStaff(int staffId) {
        String sql = "UPDATE Staff SET status = 'ban' WHERE staff_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, staffId);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Staff> BannedStaffList() {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM Staff WHERE status = 'ban'";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                int staff_type_id = rs.getInt("staff_type_id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String status = rs.getString("status");
                Role role = getRoleById(staff_type_id);
                Staff staff = new Staff(staff_id, role, email, password, status);
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }

    public boolean updateStaffByEmail(String email, String role) {
        String sql = "UPDATE Staff SET staff_type_id = (SELECT staff_type_id FROM Role WHERE type = ?) WHERE email = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, role);
            pst.setString(2, email);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean UnbanStaff(int staffId) {
        String sql = "UPDATE Staff SET status = 'active' WHERE staff_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, staffId);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Staff getStaffById(int id) {
        String sql = "SELECT * FROM Staff WHERE [staff_id] = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                int staff_type_id = rs.getInt("staff_type_id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String status = rs.getString("status");
                Role role = getRoleById(staff_type_id);
                Staff staff = new Staff(staff_id, role, email, password, status);
                return staff;
            }
        } catch (SQLException e) {
        }
        return null;
    } 
    
    public List<Staff> getActiveStaffByRole() {
        List<Staff> staffList = new ArrayList<>();
        String sql = "SELECT * FROM Staff WHERE status = 'active'AND staff_type_id = 2";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int staff_id = rs.getInt("staff_id");
                int staff_type_id = rs.getInt("staff_type_id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String status = rs.getString("status");
                Role role = getRoleById(staff_type_id);
                Staff staff = new Staff(staff_id, role, email, password, status);
                staffList.add(staff);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffList;
    }
}
