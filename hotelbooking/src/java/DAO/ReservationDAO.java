package DAO;

import Models.Customer;
import Models.Event;
import Models.Reservation;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReservationDAO extends DBContext {

    public List<Reservation> getTop10() {
        List<Reservation> list = new ArrayList<>();
        String q = "SELECT TOP 10 r.reservation_id, r.customer_id, r.start_date, r.end_date, "
                + "r.discountpercent_level, r.total_price, r.quantity, "
                + "c.first_name, c.last_name, c.email, c.phone, c.address "
                + "FROM Reservation r "
                + "JOIN Customer c ON r.customer_id = c.customer_id "
                + "ORDER BY r.start_date DESC;";

        try {
            PreparedStatement statement = connection.prepareStatement(q);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int resId = rs.getInt("reservation_id");
                int customerId = rs.getInt("customer_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");

                Customer customer = new Customer(customerId, firstName, lastName, email, phone, address);
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                float discount = rs.getFloat("discountpercent_level");
                float total = rs.getFloat("total_price");
                int quantity = rs.getInt("quantity");

                Reservation reservation = new Reservation(resId, customer, startDate, endDate, discount, total, quantity);
                list.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log exception to understand any SQL issues
        }
        return list;
    }

    public List<Reservation> getAll() {
        List<Reservation> list = new ArrayList<>();
        String q = "SELECT r.reservation_id, r.customer_id, r.start_date, r.end_date, "
                + "r.discountpercent_level, r.total_price, r.quantity, "
                + "c.first_name, c.last_name, c.email, c.phone, c.address "
                + "FROM Reservation r "
                + "JOIN Customer c ON r.customer_id = c.customer_id; ";

        try {
            PreparedStatement statement = connection.prepareStatement(q);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int resId = rs.getInt("reservation_id");
                int customerId = rs.getInt("customer_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");

                Customer customer = new Customer(customerId, firstName, lastName, email, phone, address);
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                float discount = rs.getFloat("discountpercent_level");
                float total = rs.getFloat("total_price");
                int quantity = rs.getInt("quantity");

                Reservation reservation = new Reservation(resId, customer, startDate, endDate, discount, total, quantity);
                list.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log exception to understand any SQL issues
        }
        return list;
    }

    public Reservation getReservationById(int id) {
        Reservation reservation = null;
        String q = "SELECT r.reservation_id, r.customer_id, r.start_date, r.end_date, "
                + "r.discountpercent_level, r.total_price, r.quantity, "
                + "c.first_name, c.last_name, c.email, c.phone, c.address "
                + "FROM Reservation r "
                + "JOIN Customer c ON r.customer_id = c.customer_id "
                + "WHERE r.reservation_id = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int resId = rs.getInt("reservation_id");
                int customerId = rs.getInt("customer_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");

                Customer customer = new Customer(customerId, firstName, lastName, email, phone, address);
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                float discount = rs.getFloat("discountpercent_level");
                float total = rs.getFloat("total_price");
                int quantity = rs.getInt("quantity");

                reservation = new Reservation(resId, customer, startDate, endDate, discount, total, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservation;
    }

    public Reservation getReservationByID(int id) {
        Reservation reservation = null;
        String q = """
                   SELECT r.reservation_id, r.customer_id, r.start_date, r.end_date, 
                                   r.discountpercent_level, r.total_price, r.quantity, r.event_id,
                                   c.first_name, c.last_name, c.email, c.phone, c.address 
                                   FROM Reservation r 
                                   JOIN Customer c ON r.customer_id = c.customer_id 
                                   WHERE r.reservation_id = ?;""";

        try {
            PreparedStatement statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                EventDAO eventDAO = new EventDAO();
                int resId = rs.getInt("reservation_id");
                int customerId = rs.getInt("customer_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                
                Customer customer = new Customer(customerId, firstName, lastName, email, phone, address);
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                float discount = rs.getFloat("discountpercent_level");
                float total = rs.getFloat("total_price");
                int quantity = rs.getInt("quantity");
                Event newEvent = eventDAO.getById(rs.getInt("event_id"));
                reservation = new Reservation(resId, customer, startDate, endDate, discount, newEvent,total, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservation;
    }

    public static void main(String[] args) {
        ReservationDAO reservationDAO = new ReservationDAO();
        List<Reservation> list = reservationDAO.getAll();
        for (Reservation reservation : list) {
            System.out.println(reservation);
        }
        System.out.println(reservationDAO.getReservationById(2).getStartDate());
    }
}
