package DAO;

import Models.Convenient;
import Models.Room;
import Models.RoomConvenient;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RoomConvenientDAO extends DBContext {

    public List<RoomConvenient> getAllRoomConvenient() {
        List<RoomConvenient> list = new ArrayList<>();
        Map<Integer, RoomConvenient> roomConvenientMap = new HashMap<>();
        String sql = "SELECT * FROM Room r LEFT JOIN "
                + "Room_Convenient rc ON r.room_id = rc.room_id";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomId = rs.getInt("room_id");
                int convenientId = rs.getInt("convenient_id");
                String convenientStatus = rs.getString("status");

                RoomDAO rdao = new RoomDAO();
                ConvenientDAO cdao = new ConvenientDAO();

                Room room = rdao.getRoomById(roomId);
                Convenient convenient = cdao.findById(convenientId);

                RoomConvenient rc = roomConvenientMap.get(roomId);
                if (rc == null) {
                    rc = new RoomConvenient(room, new ArrayList<>(), convenientStatus);
                    roomConvenientMap.put(roomId, rc);
                    list.add(rc);
                }
                rc.getConveniences().add(convenient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public RoomConvenient getRoomConvenientByRoomId(int roomId) {
        RoomConvenient roomConvenient = null;
        String sql = "SELECT *"
                + "FROM "
                + "    Room r "
                + "LEFT JOIN "
                + "    Room_Convenient rc ON r.room_id = rc.room_id "
                + "WHERE "
                + "    r.room_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roomId);
            ResultSet rs = statement.executeQuery();
            RoomDAO rdao = new RoomDAO();
            ConvenientDAO cdao = new ConvenientDAO();

            while (rs.next()) {
                int convenientId = rs.getInt("convenient_id");
                String convenientStatus = rs.getString("status");

                Room room = rdao.getRoomById(roomId);
                Convenient convenient = cdao.findById(convenientId);

                if (roomConvenient == null) {
                    roomConvenient = new RoomConvenient(room, new ArrayList<>(), convenientStatus);
                }
                roomConvenient.getConveniences().add(convenient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomConvenient;
    }

    public List<RoomConvenient> getAllRoomConvenientActive() {
        List<RoomConvenient> list = new ArrayList<>();
        String sql = "SELECT * FROM Room_Convenient WHERE status = 'active'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                RoomDAO rdao = new RoomDAO();
                ConvenientDAO cdao = new ConvenientDAO();
                RoomConvenient rc = new RoomConvenient(
                        rdao.getRoomById(rs.getInt("room_id")),
                        new ArrayList<Convenient>() {
                    {
                        add(cdao.findById(rs.getInt("convenient_id")));
                    }
                },
                        rs.getString("status"));
                list.add(rc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addRoomConvenient(RoomConvenient roomConvenient) {
        try {
            String sql = "INSERT INTO Room_Convenient (room_id, convenient_id, status) VALUES (?, ?, ?);";
            PreparedStatement ps = connection.prepareStatement(sql);

            for (Convenient convenient : roomConvenient.getConveniences()) {
                ps.setInt(1, roomConvenient.getRoom().getRoomId());
                ps.setInt(2, convenient.getConvenientId());
                ps.setString(3, roomConvenient.getStatus());
                ps.addBatch();
            }

            int[] rows = ps.executeBatch();
            for (int row : rows) {
                if (row <= 0) {
                    return false; // if any insert failed, return false
                }
            }
            return true; // all inserts succeeded
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteRoomConvenientsByRoomId(int id) {
        boolean deleted = false;
        String sql = "DELETE FROM Room_Convenient WHERE room_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            deleted = rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public static void main(String[] args) {
        RoomConvenientDAO dao = new RoomConvenientDAO();
   //     System.out.println(dao.getRoomConvenientByRoomId(1).getConveniences());
        System.out.println(dao.getAllRoomConvenient().get(2).getRoom().getRoomName());
    }

}
