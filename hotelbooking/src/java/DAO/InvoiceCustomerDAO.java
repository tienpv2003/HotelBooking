/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.InvoiceCustomer;
import Models.RoomReserved;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PhạmVinhTiến
 */
public class InvoiceCustomerDAO extends DBContext implements BaseDAO<InvoiceCustomer> {

    public double getMonthlyRevenue(int year, int month) {
        String sql = "SELECT SUM(invoice_amount) AS monthly_revenue "
                + "FROM Invoice_customer "
                + "WHERE YEAR(ts_paid) = ? AND MONTH(ts_paid) = ?";
        double monthlyRevenue = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                monthlyRevenue = rs.getDouble("monthly_revenue");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return monthlyRevenue;
    }

    @Override
    public List<InvoiceCustomer> getAll() {
        String sql = "select * from Invoice_customer";
        List<InvoiceCustomer> result = new ArrayList<>();
        try {
            CustomerDAO cdao = new CustomerDAO();
            ReservationDAO rdao = new ReservationDAO();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                InvoiceCustomer newInvoiceCustomer = new InvoiceCustomer(rs.getInt(1),
                        cdao.findById(rs.getInt(2)),
                        rdao.getReservationById(rs.getInt(3)),
                        rs.getFloat(4), rs.getDate(5));
                result.add(newInvoiceCustomer);
            }
        } catch (SQLException e) {
        }
        return result;
    }

    @Override
    public InvoiceCustomer findById(int id) {
        InvoiceCustomerDAO dao = new InvoiceCustomerDAO();
        for (InvoiceCustomer invoiceCustomer : dao.getAll()) {
            if (invoiceCustomer.getInvoiceCustomerId() == id) {
                return invoiceCustomer;
            }
        }
        return null;
    }
    
    public List<InvoiceCustomer> findByCustomerId(int customerId) {
        List<InvoiceCustomer> invoiceCustomers = new ArrayList<>();
        String sql = "SELECT ic.invoice_customer_id, ic.customer_id, ic.reservation_id, ic.invoice_amount, ic.ts_paid, " +
                     "rr.room_id, rr.price " +
                     "FROM Invoice_customer ic " +
                     "JOIN Room_reserved rr ON ic.reservation_id = rr.reservation_id " +
                     "WHERE ic.customer_id = ?";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                InvoiceCustomer invoiceCustomer = new InvoiceCustomer();
                invoiceCustomer.setInvoiceCustomerId(rs.getInt("invoice_customer_id"));
                invoiceCustomer.setCustomerId(new CustomerDAO().findById(rs.getInt("customer_id")));
                invoiceCustomer.setReservationId(new ReservationDAO().getReservationById(rs.getInt("reservation_id")));
                invoiceCustomer.setInvoiceAmount(rs.getFloat("invoice_amount"));
                invoiceCustomer.setPaid(rs.getTimestamp("ts_paid"));
                
                RoomReserved roomReserved = new RoomReserved();
                ReservationDAO reservationDAO = new ReservationDAO();
                RoomDAO roomDAO = new RoomDAO();
                roomReserved.setReservationId(reservationDAO.getReservationById(rs.getInt("reservation_id")));
                roomReserved.setRoomId(roomDAO.getRoomById(rs.getInt("room_id")));
                roomReserved.setPrice(rs.getFloat("price"));
                
             // invoiceCustomer.addRoomReserved(roomReserved);
                invoiceCustomers.add(invoiceCustomer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return invoiceCustomers;
    }

    @Override
    public boolean insert(InvoiceCustomer obj) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(InvoiceCustomer obj) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        InvoiceCustomerDAO dao = new InvoiceCustomerDAO();
        System.out.println(dao.getAll().get(3).getInvoiceAmount());
        double revenue = dao.getMonthlyRevenue(2024, 7);
        System.out.println("Revenue for July 2024: " + revenue);
    }
}
