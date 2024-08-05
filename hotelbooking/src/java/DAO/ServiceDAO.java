/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Service;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class ServiceDAO extends DBContext {

    public List<Service> getAllActive() {
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "select * from Service where status = 'active'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int serviceId = rs.getInt("service_id");
                String nameService = rs.getString("name_service");
                String titleService = rs.getString("title_service");
                String detail = rs.getString("description");
                String image = rs.getString("img");
                String status = rs.getString("status");
                float priceService = rs.getFloat("service_price");
                list.add(new Service(serviceId, nameService, titleService, detail, image, status, priceService));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;  // Return the populated list instead of null
    }

    public List<Service> getAllInActive() {
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "select * from Service where status = 'inactive'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int serviceId = rs.getInt("service_id");
                String nameService = rs.getString("name_service");
                String titleService = rs.getString("title_service");
                String detail = rs.getString("description");
                String image = rs.getString("img");
                String status = rs.getString("status");
                float priceService = rs.getFloat("service_price");
                list.add(new Service(serviceId, nameService, titleService, detail, image, status, priceService));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;  // Return the populated list instead of null
    }
    public List<Service> getTop5ActiveServices() {
        List<Service> serviceList = new ArrayList<>();
        String sql = "SELECT TOP 5 s.service_id, s.name_service, s.title_service, s.description, s.img, s.status, s.service_price "
                + "FROM Service s "
                + "WHERE s.status = 'active' ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int serviceId = rs.getInt("service_id");
                String serviceName = rs.getString("name_service");
                String serviceTitle=rs.getString("title_service");
                String description = rs.getString("description");
                String serviceImg = rs.getString("img");
                String status = rs.getString("status");
                float servicePrice = rs.getFloat("service_price");
                
                Service service = new Service(serviceId,serviceName,serviceTitle,description,serviceImg,status,servicePrice);
                serviceList.add(service);
            }
        } catch (SQLException e) {
            System.out.println("Get top 5 service: " + e);
        }
        return serviceList;
    }

    public boolean insert(Service service) {
        try {
            String sql = "INSERT INTO Service(name_service,title_service,description,img,status,service_price) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, service.getNameService());
            statement.setString(2, service.getTitleService());
            statement.setString(3, service.getDescription());
            statement.setString(4, service.getImage());
            statement.setString(5, service.getStatus());
            statement.setFloat(6, service.getPriceService());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean inactiveService(int serviceId) {
        String sql = "UPDATE Service Set status = 'inactive' WHERE service_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, serviceId);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean activeService(int serviceId) {
        String sql = "UPDATE Service Set status = 'active' WHERE service_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, serviceId);
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public Service getById(int id) {
        String sql = "select * from Service where service_id =?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Service service = new Service(id,
                        rs.getString("name_service"),
                        rs.getString("title_service"),
                        rs.getString("description"),
                        rs.getString("img"),
                        rs.getString("status"),
                        rs.getFloat("service_price")
                );
                return service;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean update(Service service) {
        String sql = "UPDATE Service SET name_service = ?, title_service = ?, description = ?, img = ?, status = ?,service_price =? WHERE service_id = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, service.getNameService());
            pst.setString(2, service.getTitleService());
            pst.setString(3, service.getDescription());
            pst.setString(4, service.getImage());
            pst.setString(5, service.getStatus());
            pst.setFloat(6, service.getPriceService());
            pst.setInt(7, service.getServiceId());
            int rowsUpdated = pst.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
        }
        return false;
    }

    public List<Service> listService() {
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "select * from Service";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int serviceId = rs.getInt("service_id");
                String nameService = rs.getString("name_service");
                String titleService = rs.getString("title_service");
                String detail = rs.getString("description");
                String image = rs.getString("img");
                String status = rs.getString("status");
                float priceService = rs.getFloat("service_price");
                list.add(new Service(serviceId, nameService, titleService, detail, image, status, priceService));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;  // Return the populated list instead of null
    }

    public boolean isServiceNameExists(String nameService) {
        String sql = "SELECT COUNT(*) FROM Service WHERE name_service = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, nameService);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public Service getServiceById(int serviceId) {
        Service service = null;
        String sql = "SELECT * FROM Service WHERE service_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, serviceId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                service = new Service(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getFloat(7));
            }
        } catch (SQLException e) {
        }
        return service;
    }

    public List<Service> getListServiceByRoomTypeId(int id) {
        List<Service> result = new ArrayList<>();
        String sql = """
                     SELECT TOP (1000) [service_id]
                           ,[room_type_id]
                       FROM [Room_service] where [room_type_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            ServiceDAO sDao = new ServiceDAO();
            while (rs.next()) {
                Service newService = sDao.getServiceById(rs.getInt(1));
                result.add(newService);
            }
        } catch (SQLException e) {
            System.out.println("loi");
        }
        return result;
    }

    public List<Service> getServiceNoInclude(int roomTypeId) {
        List<Service> result = new ArrayList<>();
        String sql = """
                     SELECT s.*
                     FROM Service s
                     LEFT JOIN Room_service rs ON s.service_id = rs.service_id AND rs.room_type_id = ?
                     WHERE rs.service_id IS NULL and s.[status] like 'active';""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomTypeId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result.add(new Service(rs.getInt(1), rs.getString(2), rs.getString(3), 
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7)));
            }
        } catch (SQLException e) {
        }
        return result;
    }

    public static void main(String[] args) {
        ServiceDAO serviceDAO = new ServiceDAO();
        List<Service> list = serviceDAO.getServiceNoInclude(1);
        for (Service service : list) {
            System.out.println(service.getNameService());
        }
    }
}
