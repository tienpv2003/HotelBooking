/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class RoomServiceDAO extends DBContext{
    public List<Integer> getAllServiceId(int roomTypeId) {
        List<Integer> list = new ArrayList<>();
        String query = "SELECT service_id FROM Room_service WHERE room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, roomTypeId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("service_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void addServiceToRoomType(int roomTypeId, String serviceId) {
        String query = "INSERT INTO Room_service (room_type_id, service_id) VALUES (?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, roomTypeId);
            statement.setInt(2, Integer.parseInt(serviceId));
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void removeServiceFromRoomType(int roomTypeId, int serviceId) {
        String query = "DELETE FROM Room_service WHERE room_type_id = ? AND service_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, roomTypeId);
            statement.setInt(2, serviceId);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        RoomServiceDAO roomServiceDAO = new RoomServiceDAO();
        System.out.println(roomServiceDAO.getAllServiceId(1));
    }
}
