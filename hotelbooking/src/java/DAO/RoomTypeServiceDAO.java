package DAO;

import Models.RoomType;
import Models.Service;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoomTypeServiceDAO extends DBContext {

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
   
   
    }

}
