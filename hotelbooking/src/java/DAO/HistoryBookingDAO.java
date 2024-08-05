/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Booking;
import Models.Customer;
import Utils.DBContext;
import java.util.ArrayList;
import java.util.List;
import Models.Booking;
import Models.Customer;
import Models.Event;
import Models.HistoryBooking;
import Models.InvoiceCustomer;
import Models.Item;
import Models.Reservation;
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
public class HistoryBookingDAO extends DBContext {

    public List<InvoiceCustomer> getInvoiceByCustomer(Customer customer) {
        List<InvoiceCustomer> listBooking = new ArrayList<>();
        String sql = "SELECT * FROM [Invoice_customer] where customer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customer.getCustomerId());
            ResultSet resultInvoice = st.executeQuery();
            ReservationDAO reservationDAO = new ReservationDAO();
            while (resultInvoice.next()) {
                InvoiceCustomer newInvoice = new InvoiceCustomer(resultInvoice.getInt(1), customer,
                        reservationDAO.getReservationById(resultInvoice.getInt(3)), resultInvoice.getFloat(4), resultInvoice.getInt(5), resultInvoice.getDate(6));
                listBooking.add(newInvoice);
            }
        } catch (Exception e) {
            System.out.println("loi");
        }

        return listBooking;
    }

    public List<HistoryBooking> getHistoryByCustomer(Customer customer) {
        List<InvoiceCustomer> listInvoice = getInvoiceByCustomer(customer);
        List<HistoryBooking> historyBooking = new ArrayList<>();
        try {
            ReservationDAO reservationDAO = new ReservationDAO();
          
            RoomDAO roomDAO = new RoomDAO();
            int i = 0;
            while (i < listInvoice.size()) {
                List<Booking> listBooking = new ArrayList<>();
                List<Integer> listReser = new ArrayList<>();
                listReser.add(listInvoice.get(i).getReservationId().getReservationId());
                float totalInvoice = listInvoice.get(i).getInvoiceAmount();
                Date dateInvoice = (Date) listInvoice.get(i).getPaid();
                while (i + 1 < listInvoice.size() && listInvoice.get(i).getBookingId() == listInvoice.get(i + 1).getBookingId()) {
                    i++;
                    listReser.add(listInvoice.get(i).getReservationId().getReservationId());
                    totalInvoice += listInvoice.get(i).getInvoiceAmount();
                }
                float totalNoDiscount = 0;
                float event = 0, discount = 0;
                for (Integer reservationId : listReser) {
                    Reservation reservation = reservationDAO.getReservationByID(reservationId);
                    Booking booking = new Booking();
                    booking.setStartDate(reservation.getStartDate());
                    booking.setEndDate(reservation.getEndDate());
                    List<Event> listEvent = new ArrayList<>();
                    listEvent.add(reservation.getEventId());
                    booking.setEvent(listEvent);
                    booking.setTotalPrice(reservation.getTotalPrice());
                    booking.setDiscountPercent(reservation.getDiscountPercent());
                    totalNoDiscount += reservation.getTotalPrice();
                    event = reservation.getEventId().getDiscountPercent();
                    discount = reservation.getDiscountPercent();
                    List<Item> listItem = new ArrayList<>();
                    List<Room> listRoom = getRoomByReservationId(reservationId);
                    for (Room room : listRoom) {
                        List<Service> listService = getServiceByRoomAndReserId(room.getRoomId(), reservationId);
                        Item item = new Item();
                        item.setListService(listService);
                        item.setRoom(room);
                        listItem.add(item);
                    }
                    booking.setListItem(listItem);
                    listBooking.add(booking);
                }
                HistoryBooking newHistoryBooking = new HistoryBooking(listBooking, totalNoDiscount, totalInvoice, dateInvoice, event, discount);
                historyBooking.add(newHistoryBooking);
                i++;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return historyBooking;
    }

    public List<Room> getRoomByReservationId(int id) {
        List<Room> result = new ArrayList<>();
        String sql = """
                     SELECT TOP (1000) [reservation_id]
                           ,[room_id]
                           ,[price]
                       FROM [Room_reserved] where [reservation_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            RoomDAO roomDAO = new RoomDAO();
            while (rs.next()) {
                Room newRoom = roomDAO.getRoomById(rs.getInt(2));
                result.add(newRoom);
            }
        } catch (Exception e) {
            System.out.println("loi");
        }
        return result;
    }

    public List<Service> getServiceByRoomAndReserId(int roomId, int reserId) {
        List<Service> result = new ArrayList<>();
        String sql = """
                     SELECT TOP (1000) [reservation_id]
                           ,[service_id]
                           ,[room_id]
                       FROM [Service_reserved] where [reservation_id] = ? and [room_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, reserId);
            st.setInt(2, roomId);
            ResultSet rs = st.executeQuery();
            ServiceDAO serviceDAO = new ServiceDAO();
            while (rs.next()) {
                Service newService = serviceDAO.getById(rs.getInt(2));
                result.add(newService);
            }
        } catch (Exception e) {
            System.out.println("loi");
        }
        return result;
    }

    public static void main(String[] args) {
        HistoryBookingDAO hisDao = new HistoryBookingDAO();
        CustomerDAO cusDao = new CustomerDAO();
        Customer customer = cusDao.getCustomerByMail("zzhtc1907@gmail.com");
//        List<InvoiceCustomer> listInvoice = hisDao.getInvoiceByCustomer(customer);
//        int i = 0;
//        while (i < listInvoice.size()) {
//            List<Integer> listReser = new ArrayList<>();
//            listReser.add(listInvoice.get(i).getReservationId().getReservationId());
//
//            while (i + 1 < listInvoice.size() && listInvoice.get(i).getBookingId() == listInvoice.get(i + 1).getBookingId()) {
//                i++;
//                listReser.add(listInvoice.get(i).getReservationId().getReservationId());
//            }
//
//            for (Integer reservationId : listReser) {
//                List<Room> listRoom = hisDao.getRoomByReservationId(reservationId);
//                for (Room room : listRoom) {
//                    List<Service> listService = hisDao.getServiceByRoomAndReserId(room.getRoomId(), reservationId);
//                    for (Service service : listService) {
//                        System.out.println(service.getServiceId());
//                    }
//                }
//            }
//            System.out.println();
//            System.out.println("---------------------");
//
//            i++;
//        }
    
       List<HistoryBooking> reBookings = hisDao.getHistoryByCustomer(customer);
       
        for (HistoryBooking reBooking : reBookings) {
         
            for (Booking booking : reBooking.getListBooking()) {
                
                System.out.println(booking.getStartDate());
                System.out.println(booking.getEndDate());
                System.out.println(booking.getDiscountPercent());
                System.out.println(booking.getTotalPrice());
                
                
            }
        }
    }

}
