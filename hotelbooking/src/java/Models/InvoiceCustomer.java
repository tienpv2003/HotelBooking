/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author admin
 */

public class InvoiceCustomer {
    private int invoiceCustomerId;
    private Customer customerId;
    private Reservation reservationId;
    private float invoiceAmount;
    private int bookingId; 
    private Date paid;

    public InvoiceCustomer() {
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public InvoiceCustomer(int invoiceCustomerId, Customer customerId, Reservation reservationId, float invoiceAmount, int bookingId, Date paid) {
        this.invoiceCustomerId = invoiceCustomerId;
        this.customerId = customerId;
        this.reservationId = reservationId;
        this.invoiceAmount = invoiceAmount;
        this.bookingId = bookingId;
        this.paid = paid;
    }

    public InvoiceCustomer(int invoiceCustomerId, Customer customerId, Reservation reservationId, float invoiceAmount, Date paid) {
        this.invoiceCustomerId = invoiceCustomerId;
        this.customerId = customerId;
        this.reservationId = reservationId;
        this.invoiceAmount = invoiceAmount;
        this.paid = paid;
    }

    public int getInvoiceCustomerId() {
        return invoiceCustomerId;
    }

    public void setInvoiceCustomerId(int invoiceCustomerId) {
        this.invoiceCustomerId = invoiceCustomerId;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Reservation getReservationId() {
        return reservationId;
    }

    public void setReservationId(Reservation reservationId) {
        this.reservationId = reservationId;
    }

    public float getInvoiceAmount() {
        return invoiceAmount;
    }

    public void setInvoiceAmount(float invoiceAmount) {
        this.invoiceAmount = invoiceAmount;
    }

    public Date getPaid() {
        return paid;
    }

    public void setPaid(Date paid) {
        this.paid = paid;
    }
    
    
}
