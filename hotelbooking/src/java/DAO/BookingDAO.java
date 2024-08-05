/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Booking;
import Models.Customer;
import Models.Event;
import Models.Item;
import Models.Room;
import Models.Service;
import Models.Staff;
import Utils.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Acer
 */
public class BookingDAO extends DBContext {

    public int addNewBooking(Booking booking) {
        int result = 0;
        String sqlReservation = """
                     INSERT INTO [Reservation]
                                ([customer_id]
                                ,[start_date]
                                ,[end_date]
                                ,[discountpercent_level]
                                ,[event_id]
                                ,[total_price]
                                ,[quantity])
                          VALUES
                                (?, ?, ?, ?, ?, ?, ?);""";
        try {
            PreparedStatement st = connection.prepareStatement(sqlReservation);
            st.setInt(1, booking.getCustomer().getCustomerId());
            Date startDate = new Date(booking.getStartDate().getTime());
            Date endDate = new Date(booking.getEndDate().getTime());
            st.setDate(2, startDate);
            st.setDate(3, endDate);
            st.setFloat(4, booking.getCustomer().getTypeCustomer().getDiscount());
            if (!booking.getEvent().isEmpty()) {
                st.setInt(5, booking.getEvent().get(0).getEventId());
            } else {
                st.setString(5, null);
            }
            st.setFloat(6, booking.calculateTotalPriceNotEvent());
            st.setInt(7, booking.getListItem().size());
            st.executeUpdate();

            String sqlMaxId = "SELECT TOP (1) [reservation_id] FROM [Reservation] ORDER BY [reservation_id] DESC";
            PreparedStatement st1 = connection.prepareStatement(sqlMaxId);
            ResultSet rs = st1.executeQuery();
            int reservationId;

            if (rs.next()) {
                reservationId = rs.getInt(1);
                result = reservationId;
            } else {
                return 0;
            }
            RoomDAO rDao = new RoomDAO();
            Room updateBooked = new Room();
            for (Item i : booking.getListItem()) {
                updateBooked = rDao.getRoomById(i.getRoom().getRoomId());
                updateBooked.setStatus("booked");
                rDao.updateRoom(updateBooked);
                addRoomReserved(reservationId, i.getRoom().getRoomId(), i.getPrice());
                if (i.getListService() != null) {
                    for (Service s : i.getListService()) {
                        addServiceRevserved(reservationId, s.getServiceId(), i.getRoom().getRoomId());
                    }
                }
            }

            // Add invoice customer
            addInvoiceCustomer(booking, reservationId, reservationId);
            updateCustomerLevel(booking, reservationId);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return result;
    }

    public boolean addRoomReserved(int reserId, int roomId, float price) {
        String sql = """
                     INSERT INTO [Room_reserved]
                                  ([reservation_id]
                                  ,[room_id]
                                  ,[price])
                            VALUES
                                  (? ,? ,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reserId);
            st.setInt(2, roomId);
            st.setFloat(3, price);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean addServiceRevserved(int reserId, int serviceId, int roomId) {
        String sql = """
                     INSERT INTO [Service_reserved]
                                ([reservation_id]
                                ,[service_id]
                                ,[room_id]) VALUES (?,?,?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reserId);
            st.setInt(2, serviceId);
            st.setInt(3, roomId);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean addInvoiceCustomer(Booking booking, int bookingId, int reserId) {
        String sql = """
                     INSERT INTO [dbo].[Invoice_customer]
                                ([customer_id]
                                ,[reservation_id]
                                ,[invoice_amount]           
                                ,[book_id]
                                ,[ts_paid])
                          VALUES
                                (? ,?, ?, ?, ?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, booking.getCustomer().getCustomerId());
            st.setInt(2, reserId);
            st.setFloat(3, booking.calculateTotalPrice());
            st.setInt(4, bookingId);
            LocalDate localDate = LocalDate.now();
            Date sqlDate = Date.valueOf(localDate);
            st.setDate(5, sqlDate);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

     public boolean addInvoiceCustomer1(Booking booking, int bookingId, int reserId) {
        String sql = """
                     INSERT INTO [dbo].[Invoice_customer]
                                ([customer_id]
                                ,[reservation_id]
                                ,[invoice_amount]           
                                ,[book_id]
                                ,[ts_paid])
                          VALUES
                                (? ,?, ?, ?, ?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, booking.getCustomer().getCustomerId());
            st.setInt(2, reserId);
            st.setFloat(3, booking.getTotalPrice());
            st.setInt(4, bookingId);
            LocalDate localDate = LocalDate.now();
            Date sqlDate = Date.valueOf(localDate);
            st.setDate(5, sqlDate);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    public boolean updateCustomerLevel(Booking booking, int reserId) {
        String sql = """
                     INSERT INTO [Level_customer]
                                ([customer_id]
                                ,[reservation_id]
                                ,[total])
                          VALUES
                                (? , ? , ?)""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, booking.getCustomer().getCustomerId());
            st.setInt(2, reserId);
            st.setFloat(3, booking.calculateTotalPrice());
            st.executeUpdate();
            String sql1 = """
                          SELECT SUM(total) AS total_sum
                          FROM [Level_customer]
                          WHERE customer_id = ?;""";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setInt(1, booking.getCustomer().getCustomerId());
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                if (total > booking.getCustomer().getTypeCustomer().getMoneyLevel() && booking.getCustomer().getTypeCustomer().getTypeCustomerId() < 5) {
                    CustomerDAO cdao = new CustomerDAO();
                    TypeCustomerDAO tcdao = new TypeCustomerDAO();
                    Customer customer = booking.getCustomer();
                    int newTypeId = customer.getTypeCustomer().getTypeCustomerId() + 1;
                    String typeId = String.valueOf(newTypeId);
                    customer.setTypeCustomer(tcdao.getTypeById(typeId));
                    cdao.updateProfile(customer);
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    public boolean addNewBookingByStaff(Booking booking, Staff staff, int bookingId, float discountCus) {
        String sqlReservation = """
                     INSERT INTO [Reservation]
                                ([customer_id]
                                ,[start_date]
                                ,[end_date]
                                ,[discountpercent_level]
                                ,[event_id]
                                ,[total_price]
                                ,[quantity]
                                ,[staff_id])
                          VALUES
                                (?, ?, ?, ?, ?, ?, ?, ?);""";
        try {
            PreparedStatement st = connection.prepareStatement(sqlReservation);
            st.setInt(1, booking.getCustomer().getCustomerId());
            Date startDate = new Date(booking.getStartDate().getTime());
            Date endDate = new Date(booking.getEndDate().getTime());
            st.setDate(2, startDate);
            st.setDate(3, endDate);
            st.setFloat(4, discountCus);
            if (!booking.getEvent().isEmpty()) {
                st.setInt(5, booking.getEvent().get(0).getEventId());
            } else {
                st.setString(5, null);
            }
            st.setFloat(6, booking.calculateTotalPriceNotEvent1());
            st.setInt(7, booking.getListItem().size());
            st.setInt(8, staff.getStaff_id());
            st.executeUpdate();

            String sqlMaxId = "SELECT TOP (1) [reservation_id] FROM [Reservation] ORDER BY [reservation_id] DESC";
            PreparedStatement st1 = connection.prepareStatement(sqlMaxId);
            ResultSet rs = st1.executeQuery();
            int reservationId;

            if (rs.next()) {
                reservationId = rs.getInt(1);
            } else {
                return false;
            }
            RoomDAO rDao = new RoomDAO();
            Room updateBooked = new Room();
            for (Item i : booking.getListItem()) {
                updateBooked = rDao.getRoomById(i.getRoom().getRoomId());
                updateBooked.setStatus("booked");
                rDao.updateRoom(updateBooked);
                addRoomReserved(reservationId, i.getRoom().getRoomId(), i.getPrice());
                if (i.getListService() != null) {
                    for (Service s : i.getListService()) {
                        addServiceRevserved(reservationId, s.getServiceId(), i.getRoom().getRoomId());
                    }
                }
            }

            // Add invoice customer
            addInvoiceCustomer1(booking, bookingId,reservationId);
            updateCustomerLevel(booking, reservationId);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    
    public int addNewBookingByStaffSingle(Booking booking, Staff staff) {
        int result = 0;
        String sqlReservation = """
                     INSERT INTO [Reservation]
                                ([customer_id]
                                ,[start_date]
                                ,[end_date]
                                ,[discountpercent_level]
                                ,[event_id]
                                ,[total_price]
                                ,[quantity]
                                ,[staff_id])
                          VALUES
                                (?, ?, ?, ?, ?, ?, ?, ?);""";
        try {
            PreparedStatement st = connection.prepareStatement(sqlReservation);
            st.setInt(1, booking.getCustomer().getCustomerId());
            Date startDate = new Date(booking.getStartDate().getTime());
            Date endDate = new Date(booking.getEndDate().getTime());
            st.setDate(2, startDate);
            st.setDate(3, endDate);
            st.setFloat(4, booking.getCustomer().getTypeCustomer().getDiscount());
            if (!booking.getEvent().isEmpty()) {
                st.setInt(5, booking.getEvent().get(0).getEventId());
            } else {
                st.setString(5, null);
            }
            st.setFloat(6, booking.calculateTotalPriceNotEvent());
            st.setInt(7, booking.getListItem().size());
            st.setInt(8, staff.getStaff_id());
            st.executeUpdate();

            String sqlMaxId = "SELECT TOP (1) [reservation_id] FROM [Reservation] ORDER BY [reservation_id] DESC";
            PreparedStatement st1 = connection.prepareStatement(sqlMaxId);
            ResultSet rs = st1.executeQuery();
            int reservationId;

            if (rs.next()) {
                reservationId = rs.getInt(1);
                result = reservationId;
            } else {
                return 0;
            }
            RoomDAO rDao = new RoomDAO();
            Room updateBooked = new Room();
            for (Item i : booking.getListItem()) {
                updateBooked = rDao.getRoomById(i.getRoom().getRoomId());
                updateBooked.setStatus("booked");
                rDao.updateRoom(updateBooked);
                addRoomReserved(reservationId, i.getRoom().getRoomId(), i.getPrice());
                if (i.getListService() != null) {
                    for (Service s : i.getListService()) {
                        addServiceRevserved(reservationId, s.getServiceId(), i.getRoom().getRoomId());
                    }
                }
            }

            // Add invoice customer
            addInvoiceCustomer(booking, reservationId, reservationId);
            updateCustomerLevel(booking, reservationId);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
        return result;
    }
    
    public boolean addNewBookingFlex(Booking booking, int bookingId, float discountCus) {
        String sqlReservation = """
                     INSERT INTO [Reservation]
                                ([customer_id]
                                ,[start_date]
                                ,[end_date]
                                ,[discountpercent_level]
                                ,[event_id]
                                ,[total_price]
                                ,[quantity])
                          VALUES
                                (?, ?, ?, ?, ?, ?, ?);""";
        try {
            PreparedStatement st = connection.prepareStatement(sqlReservation);
            st.setInt(1, booking.getCustomer().getCustomerId());
            Date startDate = new Date(booking.getStartDate().getTime());
            Date endDate = new Date(booking.getEndDate().getTime());
            st.setDate(2, startDate);
            st.setDate(3, endDate);
            st.setFloat(4, discountCus);
            if (!booking.getEvent().isEmpty()) {
                st.setInt(5, booking.getEvent().get(0).getEventId());
            } else {
                st.setString(5, null);
            }
            st.setFloat(6, booking.calculateTotalPriceNotEvent1());
            st.setInt(7, booking.getListItem().size());
            st.executeUpdate();

            String sqlMaxId = "SELECT TOP (1) [reservation_id] FROM [Reservation] ORDER BY [reservation_id] DESC";
            PreparedStatement st1 = connection.prepareStatement(sqlMaxId);
            ResultSet rs = st1.executeQuery();
            int reservationId;

            if (rs.next()) {
                reservationId = rs.getInt(1);
            } else {
                return false;
            }
            RoomDAO rDao = new RoomDAO();
            Room updateBooked = new Room();
            for (Item i : booking.getListItem()) {
                updateBooked = rDao.getRoomById(i.getRoom().getRoomId());
                updateBooked.setStatus("booked");
                rDao.updateRoom(updateBooked);
                addRoomReserved(reservationId, i.getRoom().getRoomId(), i.getPrice());
                if (i.getListService() != null) {
                    for (Service s : i.getListService()) {
                        addServiceRevserved(reservationId, s.getServiceId(), i.getRoom().getRoomId());
                    }
                }
            }
            // Add invoice customer
            addInvoiceCustomer1(booking, bookingId ,reservationId);
            updateCustomerLevel(booking, reservationId);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        BookingDAO bDao = new BookingDAO();

        CustomerDAO cDAO = new CustomerDAO();
        Customer newCus = cDAO.getCustomerByMail("vinhtien@gmail.com");

        Date startDate = Date.valueOf("2024-07-10");
        Date endDate = Date.valueOf("2024-07-11");

        List<Event> events = new ArrayList<>();
        EventDAO eDAO = new EventDAO();
        Event newEvent = eDAO.getById(5);
        events.add(newEvent);

        List<Item> listItem = new ArrayList<>();
        RoomDAO rDAO = new RoomDAO();
        Room newRoom = rDAO.getRoomById(1);

        List<Service> services = new ArrayList<>();
        ServiceDAO sdao = new ServiceDAO();
        Service service = sdao.getById(1);
        services.add(service);
        Item newItem = new Item(newCus, newRoom, services, 0);
        listItem.add(newItem);

        Booking booking = new Booking(listItem, newCus, startDate, endDate, events, 0);
        System.out.println(bDao.addNewBooking(booking));
    }
}
