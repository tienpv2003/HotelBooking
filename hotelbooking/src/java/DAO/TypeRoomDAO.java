package DAO;

import Models.RoomType;
import Models.Service;
import Utils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeRoomDAO extends DBContext {

    public ServiceDAO sdao = new ServiceDAO();

    public List<String> getRoomImagesByRoomTypeId(int roomTypeId) {
        List<String> roomImages = new ArrayList<>();
        String sql = "SELECT img FROM Room_Images WHERE room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roomTypeId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String img = rs.getString("img");
                roomImages.add(img);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomImages;
    }

    public List<RoomType> getAllRoomType() {
        List<RoomType> roomTypeList = new ArrayList<>();
        String sql = "SELECT * FROM Room_type";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                roomTypeList.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomTypeList;
    }

    public List<RoomType> getAllInActiveRoomType() {
        List<RoomType> roomTypeList = new ArrayList<>();
        String sql = "SELECT * FROM Room_type WHERE status = 'inactive'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                roomTypeList.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomTypeList;
    }

    public List<RoomType> getAllActiveRoomType() {
        List<RoomType> roomTypeList = new ArrayList<>();
        String sql = "SELECT * FROM Room_type WHERE status = 'active'";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                roomTypeList.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomTypeList;
    }

    public boolean insertRoomType(RoomType roomType) {
        String sql = "INSERT INTO Room_type(type_name, status, quantity, roomtype_img, title_descripsion, roomtype_descripsion, content_descripsion, room_type_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            statement.setString(1, roomType.getTypeName());
            statement.setString(2, roomType.getStatus());
            statement.setInt(3, roomType.getQuantity());
            statement.setString(4, roomType.getRoomtype_img());
            statement.setString(5, roomType.getTitleDescripsion());
            statement.setString(6, roomType.getRoomTypedescripsion());
            statement.setString(7, roomType.getContentDescripsion());
            statement.setFloat(8, roomType.getRoomTypePrice());

            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                return false;
            }

            // Lấy ID của Room_type vừa chèn
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int roomTypeId = generatedKeys.getInt(1);
                insertRoomImages(roomTypeId, roomType.getRoomImages());
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void insertRoomImages(int roomTypeId, List<String> roomImages) {
        String sql = "INSERT INTO Room_Images(room_type_id, img) VALUES (?, ?)";
        try {
            for (String image : roomImages) {
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, roomTypeId);
                statement.setString(2, image);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isRoomTypeNameExists(String typeName) {
        String sql = "SELECT COUNT(*) FROM Room_type WHERE type_name = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, typeName);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateRoomTypeStatus(int roomTypeId, String status) {
        String sql = "UPDATE Room_type SET status = ? WHERE room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setInt(2, roomTypeId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getIdByName(String typeName) {
        String sql = "SELECT room_type_id FROM Room_type WHERE type_name = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, typeName);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("room_type_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean deleteRoomType(int roomTypeId) {
        String sql = "DELETE FROM Room_type WHERE room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roomTypeId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addServiceToRoomType(int roomTypeId, String service) {
        String query = "INSERT INTO Room_service(room_type_id, service_id) VALUES (?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, roomTypeId);
            statement.setString(2, service);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public RoomType getRoomTypeById(int id) {
        RoomType roomType = null;
        String query = "SELECT * FROM Room_type WHERE room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomType;
    }

    public void updateRoomType(RoomType roomType) {
        String sql = "UPDATE Room_type SET type_name = ?, status = ?, quantity = ?, roomtype_img = ?, title_descripsion = ?, roomtype_descripsion = ?, content_descripsion = ?, room_type_price = ? WHERE room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, roomType.getTypeName());
            statement.setString(2, roomType.getStatus());
            statement.setInt(3, roomType.getQuantity());
            statement.setString(4, roomType.getRoomtype_img());
            statement.setString(5, roomType.getTitleDescripsion());
            statement.setString(6, roomType.getRoomTypedescripsion());
            statement.setString(7, roomType.getContentDescripsion());
            statement.setFloat(8, roomType.getRoomTypePrice());
            statement.setInt(9, roomType.getRoomTypeId());
            statement.executeUpdate();

            // Xóa các hình ảnh cũ
            deleteRoomImages(roomType.getRoomTypeId());

            // Chèn các hình ảnh mới
            insertRoomImages(roomType.getRoomTypeId(), roomType.getRoomImages());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteRoomImages(int roomTypeId) {
        String sql = "DELETE FROM Room_Images WHERE room_type_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roomTypeId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countActiveRoomsByRoomTypeId(int roomTypeId) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Room WHERE room_type_id = ? AND room_status = 'active'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomTypeId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<RoomType> topFourTypeRoom() {
        List<RoomType> result = new ArrayList<>();
        String sql = "SELECT TOP (4) * FROM Room_type WHERE status = 'active'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = countActiveRoomsByRoomTypeId(roomTypeId);
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                result.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<RoomType> getTopRoomTypesWithActiveRooms(int excludeRoomTypeId) {
        List<RoomType> result = new ArrayList<>();
        String sql = "SELECT TOP 3 rt.* "
                + "FROM Room_type rt "
                + "WHERE rt.status = 'active' "
                + "AND EXISTS (SELECT 1 FROM Room r WHERE r.room_type_id = rt.room_type_id AND r.room_status = 'active') "
                + "AND rt.room_type_id != ? "
                + "ORDER BY rt.room_type_id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, excludeRoomTypeId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = countActiveRoomsByRoomTypeId(roomTypeId);
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                result.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<RoomType> getRoomTypeByQuantity() {
        List<RoomType> roomTypeList = new ArrayList<>();
        String sql = "SELECT * FROM Room_type where status = 'active' order by quantity DESC";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = rs.getInt("quantity");
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                roomTypeList.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomTypeList;
    }

    public List<RoomType> getTypeRoomHasRoomActive() {
        List<RoomType> result = new ArrayList<>();
        String sql = "SELECT * FROM Room_type WHERE status = 'active'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roomTypeId = rs.getInt("room_type_id");
                String typeName = rs.getString("type_name");
                String status = rs.getString("status");
                int quantity = countActiveRoomsByRoomTypeId(roomTypeId);
                String img = rs.getString("roomtype_img");
                String titleDescription = rs.getString("title_descripsion");
                String roomTypeDescription = rs.getString("roomtype_descripsion");
                String contentDescription = rs.getString("content_descripsion");
                float roomTypePrice = rs.getFloat("room_type_price");

                List<String> roomImages = getRoomImagesByRoomTypeId(roomTypeId);
                List<Service> listSer = sdao.getListServiceByRoomTypeId(roomTypeId);
                RoomType roomType = new RoomType(roomTypeId, typeName, status, quantity,
                        img, titleDescription, roomTypeDescription,
                        contentDescription, roomTypePrice, roomImages, listSer);
                result.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        TypeRoomDAO typeRoomDao = new TypeRoomDAO();
        List<RoomType> roomTypes = typeRoomDao.getTopRoomTypesWithActiveRooms(2);
        for (RoomType roomType : roomTypes) {
            System.out.println(roomType.getRoomTypeId());
        }
    }
}
