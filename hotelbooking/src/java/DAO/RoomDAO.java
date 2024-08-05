package DAO;

import Models.Convenient;
import Models.Room;
import Models.RoomConvenient;
import Models.RoomType;
import Models.Service;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO extends DBContext {

    TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
    ServiceDAO sdao = new ServiceDAO();

    public void updateRoomStatus() {
        String sql = "UPDATE Room "
                + "SET room_status = 'active' "
                + "WHERE room_status = 'booked' "
                + "AND room_id IN ( "
                + "    SELECT rr.room_id "
                + "    FROM Room_reserved rr "
                + "    JOIN Reservation r ON rr.reservation_id = r.reservation_id "
                + "    WHERE r.end_date <= GETDATE() "
                + "    AND NOT EXISTS ( "
                + "        SELECT 1 "
                + "        FROM Room_reserved rr2 "
                + "        JOIN Reservation r2 ON rr2.reservation_id = r2.reservation_id "
                + "        WHERE rr2.room_id = rr.room_id "
                + "        AND r2.end_date >= GETDATE() "
                + "    )"
                + ")";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //cong
    public List<Room> getAllRoom() {
        updateRoomStatus();
        List<Room> result = new ArrayList<>();
        String sql = "SELECT TOP (1000) * FROM [Room]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            TypeRoomDAO typeDao = new TypeRoomDAO();
            while (rs.next()) {
                Room newRoom = new Room(
                        rs.getInt("room_id"),
                        typeDao.getRoomTypeById(rs.getInt("room_type_id")),
                        rs.getString("room_name"),
                        rs.getString("room_status")
                );
                result.add(newRoom);
            }
        } catch (SQLException e) {
            System.out.println("Loi");
        }
        return result;
    }

    public List<Room> getAllRooms() {
        updateRoomStatus();
        List<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomId = rs.getInt("room_id");
                String roomName = rs.getString("room_name");
                String status = rs.getString("room_status");

                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String statusTypeRoom = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = typeRoomDAO.getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, statusTypeRoom, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                Room room = new Room(roomId, roomType, roomName, status);
                roomList.add(room);
            }
        } catch (SQLException e) {
        }
        return roomList;
    }

    public boolean deleteRoom(int roomId) {
        String sql = "DELETE FROM Room WHERE room_id = ?";
        String updateQuantitySql = """
        UPDATE Room_type
        SET quantity = quantity - 1
        WHERE room_type_id = (
            SELECT room_type_id
            FROM Room
            WHERE room_id = ?
        );
    """;

        try {
            PreparedStatement updateQuantityStatement = connection.prepareStatement(updateQuantitySql);
            updateQuantityStatement.setInt(1, roomId);
            updateQuantityStatement.executeUpdate();

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roomId);
            statement.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println("Lỗi: " + e.getMessage());
        }
        return false;
    }

    public void updateRoomStatus(int roomId, String status) {
        String sql = "UPDATE Room SET room_status = ? WHERE room_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setInt(2, roomId);
            statement.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Room> getAllInActiveRooms() {
        updateRoomStatus();
        List<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'inactive' ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomId = rs.getInt("room_id");
                String roomName = rs.getString("room_name");
                String status = rs.getString("room_status");

                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String statusTypeRoom = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = typeRoomDAO.getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, statusTypeRoom, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                Room room = new Room(roomId, roomType, roomName, status);
                roomList.add(room);
            }
        } catch (SQLException e) {
        }
        return roomList;
    }

    public List<Room> getAllActiveRooms(int pageNumber, int pageSize, int roomTypeID) {
        updateRoomStatus();
        List<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'active' ";
        if (roomTypeID > 0) {
            sql += " and r.room_type_id = ? ";
        }
        sql += "ORDER BY r.room_id "
                + "OFFSET ? ROWS "
                + "FETCH FIRST ? ROWS ONLY";

        try {
            int startRow = (pageNumber - 1) * pageSize;

            PreparedStatement statement = connection.prepareStatement(sql);
            int index = 1;
            if (roomTypeID > 0) {
                statement.setInt(index++, roomTypeID);
            }
            statement.setInt(index++, startRow);
            statement.setInt(index++, pageSize);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomId = rs.getInt("room_id");
                String roomName = rs.getString("room_name");
                String status = rs.getString("room_status");

                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String statusTypeRoom = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = typeRoomDAO.getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, statusTypeRoom, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                Room room = new Room(roomId, roomType, roomName, status);
                roomList.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Get all active rooms: " + e);
        }
        return roomList;
    }

    public List<Room> getAllActiveRoomsAcount(int roomTypeID) {
        updateRoomStatus();
        List<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'active'  ";
        if (roomTypeID > 0) {
            sql += " and r.room_type_id = ? ";
        }
        sql += "ORDER BY r.room_id ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            if (roomTypeID > 0) {
                statement.setInt(1, roomTypeID);
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomId = rs.getInt("room_id");
                String roomName = rs.getString("room_name");
                String status = rs.getString("room_status");

                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String statusTypeRoom = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = typeRoomDAO.getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, statusTypeRoom, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                Room room = new Room(roomId, roomType, roomName, status);
                roomList.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Get all active rooms: " + e);
        }
        return roomList;
    }

    public List<Room> getAllBookedRooms() {
        updateRoomStatus();
        List<Room> roomList = new ArrayList<>();
        String sql = "SELECT * FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'booked'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomId = rs.getInt("room_id");
                String roomName = rs.getString("room_name");
                String status = rs.getString("room_status");

                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String statusTypeRoom = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = typeRoomDAO.getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, statusTypeRoom, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                Room room = new Room(roomId, roomType, roomName, status);
                roomList.add(room);
            }
        } catch (SQLException e) {
        }
        return roomList;
    }

    public boolean createRoom(Room room) {
        String roomSql = """
            INSERT INTO Room (room_type_id, room_name, room_status)
            VALUES (?, ?, ?);
        """;

        try {
            PreparedStatement roomStatement = connection.prepareStatement(roomSql, PreparedStatement.RETURN_GENERATED_KEYS);
            roomStatement.setInt(1, room.getRoomType().getRoomTypeId());
            roomStatement.setString(2, room.getRoomName());
            roomStatement.setString(3, room.getStatus());
            roomStatement.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("loi");
        }
        return false;
    }

    public boolean incrementRoomTypeQuantity(int roomTypeId) {
        String sql = "UPDATE Room_type SET quantity = quantity + 1 WHERE room_type_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, roomTypeId);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isRoomNameExists(int roomTypeId, String roomName) {
        String sql = "SELECT COUNT(*) FROM Room WHERE room_name = ? AND room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, roomName);
            statement.setInt(2, roomTypeId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Room getRoomById(int roomId) {
        updateRoomStatus();
        String sql = "Select * from Room where room_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TypeRoomDAO typeDao = new TypeRoomDAO();
                return new Room(rs.getInt(1), typeDao.getRoomTypeById(rs.getInt(2)),
                        rs.getString(3), rs.getString(4));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updateRoom(Room room) {
        String sql = "UPDATE Room SET room_type_id = ?, room_name = ?, room_status = ? WHERE room_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, room.getRoomType().getRoomTypeId());
            statement.setString(2, room.getRoomName());
            statement.setString(3, room.getStatus());
            statement.setInt(4, room.getRoomId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("loi");
        }
    }

    public List<Room> getBookingNumer(int typeRoomId, int number) {
        updateRoomStatus();
        List<Room> result = new ArrayList<>();
        String sql = "SELECT TOP " + number + " [room_id], [room_type_id], [room_name], [room_status] "
                + "FROM [Room] WHERE [room_type_id] = ? AND [room_status] = 'active'";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, typeRoomId);
            try (ResultSet rs = st.executeQuery()) {
                TypeRoomDAO tDao = new TypeRoomDAO();
                while (rs.next()) {
                    Room newRoom = new Room(rs.getInt(1), tDao.getRoomTypeById(rs.getInt(2)),
                            rs.getString(3), rs.getString(4));
                    result.add(newRoom);
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
        }

        return result;
    }

    public int getNumberActiveRooms(int roomTypeId) {
        updateRoomStatus();
        String sql = "SELECT Count(*) FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'active' and r.room_type_id = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roomTypeId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getActiveRoom() {
        updateRoomStatus();
        String sql = "SELECT Count(*) FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'active'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getInActiveRoom() {
        updateRoomStatus();
        String sql = "SELECT Count(*) FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'inactive'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getBookedRoom() {
        updateRoomStatus();
        String sql = "SELECT Count(*) FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id WHERE r.room_status = 'booked'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getAllRoomEx() {
        updateRoomStatus();
        String sql = "SELECT Count(*) FROM Room r JOIN Room_type rt ON r.room_type_id = rt.room_type_id";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int getBookedRoomsCountByType(int roomTypeId) {
        updateRoomStatus();
        String sql = "SELECT COUNT(r.room_id) AS booked_rooms_count "
                + "FROM Room r "
                + "WHERE r.room_status = 'booked' AND r.room_type_id = ?";
        int bookedRoomsCount = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roomTypeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bookedRoomsCount = rs.getInt("booked_rooms_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookedRoomsCount;
    }

    public static void main(String[] args) {
        RoomDAO rdao = new RoomDAO();
        System.out.println(rdao.getActiveRoom());
        int roomTypeId = 4;
        int bookedRoomsCount = rdao.getBookedRoomsCountByType(roomTypeId);
        System.out.println("Number of booked rooms for room type ID " + roomTypeId + ": " + bookedRoomsCount);
    }
}
