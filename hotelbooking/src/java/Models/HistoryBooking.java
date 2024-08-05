/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Acer
 */
public class HistoryBooking {
    private List<Booking> listBooking;
    private float totalNoDiscount;
    private float total;
    private Date dateInvoice;
    private float eventDiscount;
    private float discountCustomer;

    public HistoryBooking() {
    }

    public HistoryBooking(List<Booking> listBooking, float totalNoDiscount, float total, Date dateInvoice, float eventDiscount, float discountCustomer) {
        this.listBooking = listBooking;
        this.totalNoDiscount = totalNoDiscount;
        this.total = total;
        this.dateInvoice = dateInvoice;
        this.eventDiscount = eventDiscount;
        this.discountCustomer = discountCustomer;
    }

    public List<Booking> getListBooking() {
        return listBooking;
    }

    public void setListBooking(List<Booking> listBooking) {
        this.listBooking = listBooking;
    }

    public float getTotalNoDiscount() {
        return totalNoDiscount;
    }

    public void setTotalNoDiscount(float totalNoDiscount) {
        this.totalNoDiscount = totalNoDiscount;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Date getDateInvoice() {
        return dateInvoice;
    }

    public void setDateInvoice(Date dateInvoice) {
        this.dateInvoice = dateInvoice;
    }

    public float getEventDiscount() {
        return eventDiscount;
    }

    public void setEventDiscount(float eventDiscount) {
        this.eventDiscount = eventDiscount;
    }

    public float getDiscountCustomer() {
        return discountCustomer;
    }

    public void setDiscountCustomer(float discountCustomer) {
        this.discountCustomer = discountCustomer;
    }

    
}
