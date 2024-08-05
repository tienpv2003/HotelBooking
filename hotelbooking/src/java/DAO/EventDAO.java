/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Event;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class EventDAO extends DBContext {

    public List<Event> getAllActive() {
        ArrayList<Event> list = new ArrayList<>();
        try {
            String sql = "select * from Event_id where status = 'active'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                String title = rs.getString("title_event");
                String image = rs.getString("img");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String detail = rs.getString("detail");
                float discount = rs.getFloat("discount_percent");
                String description = rs.getString("description");
                String status = rs.getString("status");
                list.add(new Event(eventID, title, image, startDate, endDate, detail, discount, description, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;  // Return the populated list instead of null
    }

    public List<Event> getAllInactive() {
        ArrayList<Event> list = new ArrayList<>();
        try {
            String sql = "select * from Event_id where status = 'inactive'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                String title = rs.getString("title_event");
                String image = rs.getString("img");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String detail = rs.getString("detail");
                float discount = rs.getFloat("discount_percent");
                String description = rs.getString("description");
                String status = rs.getString("status");
                list.add(new Event(eventID, title, image, startDate, endDate, detail, discount, description, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;  // Return the populated list instead of null
    }
    public List<Event> getAllEvent() {
        ArrayList<Event> list = new ArrayList<>();
        try {
            String sql = "select * from Event_id ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                String title = rs.getString("title_event");
                String image = rs.getString("img");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String detail = rs.getString("detail");
                float discount = rs.getFloat("discount_percent");
                String description = rs.getString("description");
                String status = rs.getString("status");
                list.add(new Event(eventID, title, image, startDate, endDate, detail, discount, description, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;  // Return the populated list instead of null
    }
     public Event getEventDetails(int eventId) {
        Event event = null;
        try {
            String sql = "select * from Event_id WHERE event_id = ?" ;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, eventId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("event_id");
                String title = rs.getString("title_event");
                String image = rs.getString("img");
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String detail = rs.getString("detail");
                float discount = rs.getFloat("discount_percent");
                String description = rs.getString("description");
                String status = rs.getString("status");
               event = new Event(eventID, title, image, startDate, endDate, detail, discount, description, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return event;  // Return the populated list instead of null
    }

    public boolean insert(Event event) {
        try {
            // Kiểm tra sự kiện đã tồn tại hay chưa
            if (isEventExists(event.getDetail())) {
                return false; // Nếu tồn tại, không thêm và trả về false
            }

            String sql = "INSERT INTO Event_id (title_event,img,start_date, end_date, detail, discount_percent, description, status) VALUES (?,?,?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, event.getTitleEvent());
            statement.setString(2, event.getImage());
            statement.setDate(3, new java.sql.Date(event.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(event.getEndDate().getTime()));
            statement.setString(5, event.getDetail());
            statement.setFloat(6, event.getDiscountPercent());
            statement.setString(7, event.getDescription());
            statement.setString(8, event.getStatus());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Event getById(int id) {
        String sql = "SELECT * FROM Event_id WHERE event_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Event event = new Event(
                        id,
                        rs.getString("title_event"),
                        rs.getString("img"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date"),
                        rs.getString("detail"),
                        rs.getFloat("discount_percent"),
                        rs.getString("description"),
                        rs.getString("status")
                );
                return event;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update(Event event) {
        try {
            String sql = "UPDATE Event_id SET title_event=?,img=?,start_date=?, end_date=?, detail=?, discount_percent=?, description=?, status=? WHERE event_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, event.getTitleEvent());
            statement.setString(2, event.getImage());
            statement.setDate(3, new java.sql.Date(event.getStartDate().getTime()));
            statement.setDate(4, new java.sql.Date(event.getEndDate().getTime()));
            statement.setString(5, event.getDetail());
            statement.setFloat(6, event.getDiscountPercent());
            statement.setString(7, event.getDescription());
            statement.setString(8, event.getStatus());
            statement.setInt(9, event.getEventId());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean inactiveEvent(int eventId) {
        String sql = "UPDATE Event_id SET status = 'inactive' WHERE event_id = ? ";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, eventId);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean activeEvent(int eventId) {
        String sql = "UPDATE Event_id SET status = 'active' WHERE event_id = ? ";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, eventId);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
// Kiểm tra sự kiện có tồn tại trong cơ sở dữ liệu dựa trên tên

    public boolean isEventExists(String eventName) {
        String sql = "SELECT COUNT(*) AS count FROM Event_id WHERE detail = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, eventName);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt("count");
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Event getByName(String eventName) throws SQLException {
        String query = "SELECT * FROM events WHERE detail = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, eventName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return extractEventFromResultSet(rs);
            }
        }
        return null;
    }
    // Hàm trợ giúp để chuyển dữ liệu từ ResultSet thành đối tượng Event

    private Event extractEventFromResultSet(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        // Lấy các trường thông tin của sự kiện từ ResultSet và trả về đối tượng Event
        return new Event(id, rs.getString("title_event"), rs.getString("img"), rs.getDate("start_date"), rs.getDate("end_date"), rs.getString("detail"),
                rs.getFloat("discount_percent"), rs.getString("description"), rs.getString("status"));
    }

     public List<Event> getDiscountPercent(java.util.Date date) {
        String sql = """
                     SELECT * FROM [dbo].[Event_id]
                     WHERE ? BETWEEN [start_date] AND [end_date]
                     AND [status] = 'active'""";
        List<Event> events = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, new java.sql.Date(date.getTime()));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Event newEvent = new Event(rs.getInt(1), rs.getString(2), rs.getString(3), 
                        rs.getDate(4), rs.getDate(5), rs.getString(6), 
                        rs.getFloat(7), rs.getString(8), rs.getString(9));
                events.add(newEvent);
            }
        } catch (SQLException e) {
            System.out.println("loi");
        }
        return events;
    }

    public static void main(String[] args) {
        EventDAO dao = new EventDAO();
        Date date = new Date();
        for (Event arg : dao.getDiscountPercent(date)) {
            System.out.println(arg.getDiscountPercent());
        }
    }
}
