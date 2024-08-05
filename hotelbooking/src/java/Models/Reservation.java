/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;
import java.util.List;

/**
 *
 * @author admin
 */
public class Reservation {

    private int reservationId;
    private Customer customerId;
    private Date startDate;
    private Date endDate;
    private float discountPercent;
    private Event eventId;
    private float totalPrice;
    private int quantity;
    private List<Service> serviceReserved;
    private List<Room> roomReserved;

    public Reservation() {
    }

    public Reservation(int reservationId, Customer customerId, Date startDate, Date endDate, float discountPercent, float totalPrice, int quantity) {
        this.reservationId = reservationId;
        this.customerId = customerId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.discountPercent = discountPercent;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }

    public Reservation(int reservationId, Customer customerId, Date startDate, Date endDate, float discountPercent, Event eventId, float totalPrice, int quantity) {
        this.reservationId = reservationId;
        this.customerId = customerId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.discountPercent = discountPercent;
        this.eventId = eventId;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public float getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(float discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Event getEventId() {
        return eventId;
    }

    public void setEventId(Event eventId) {
        this.eventId = eventId;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public List<Service> getServiceReserved() {
        return serviceReserved;
    }

    public void setServiceReserved(List<Service> serviceReserved) {
        this.serviceReserved = serviceReserved;
    }

    public List<Room> getRoomReserved() {
        return roomReserved;
    }

    public void setRoomReserved(List<Room> roomReserved) {
        this.roomReserved = roomReserved;
    }

}
