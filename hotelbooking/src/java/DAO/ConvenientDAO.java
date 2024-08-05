package DAO;

import Models.Convenient;
import Utils.DBContext;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;

public class ConvenientDAO extends DBContext implements BaseDAO<Convenient> {

    @Override
    public Convenient findById(int id) {
        try {
            String sql = "SELECT * FROM Convenient "
                    + "WHERE convenient_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Convenient c = new Convenient();
                c.setConvenientId(rs.getInt("convenient_id"));
                c.setConvenientName(rs.getString("convenient_name"));
                c.setStatus(rs.getString("status"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Convenient> getAll() {
        List<Convenient> list = new ArrayList<>();
        String sql = "select * from Convenient "
                + "order by convenient_id desc;";
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Convenient c = new Convenient();
                c.setConvenientId(rs.getInt("convenient_id"));
                c.setConvenientName(rs.getString("convenient_name"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Convenient> getAllConvenientActive() {
        List<Convenient> list = new ArrayList<>();
        String sql = "select * from Convenient "
                + "where status = 'active' "
                + "order by convenient_id desc;";
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Convenient c = new Convenient();
                c.setConvenientId(rs.getInt("convenient_id"));
                c.setConvenientName(rs.getString("convenient_name"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean insert(Convenient obj) {
        try {
            String sql = "INSERT INTO Convenient (convenient_name, status) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getConvenientName());
            ps.setString(2, obj.getStatus());
            int row = ps.executeUpdate();
            return row > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Convenient obj) {
        boolean result = false;
        try {
            String sql = "UPDATE Convenient SET convenient_name = ?, status = ? WHERE convenient_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, obj.getConvenientName());
            ps.setString(2, obj.getStatus());
            ps.setInt(3, obj.getConvenientId());
            int row = ps.executeUpdate();

            // Nếu trạng thái của Convenient được đặt thành inactive, cập nhật trạng thái của RoomConvenient
            if ("inactive".equals(obj.getStatus())) {
                String sql2 = "UPDATE Room_Convenient SET status = ? WHERE convenient_id = ?";
                PreparedStatement psRoomConvenient = connection.prepareStatement(sql2);
                psRoomConvenient.setString(1, "inactive");
                psRoomConvenient.setInt(2, obj.getConvenientId());
                psRoomConvenient.executeUpdate();
            }
            result = row > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return result;
    }

    public static void main(String[] args) {
        ConvenientDAO cdao = new ConvenientDAO();
        System.out.println(cdao.getAllConvenientActive());
        System.out.println(cdao.getAll());
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
