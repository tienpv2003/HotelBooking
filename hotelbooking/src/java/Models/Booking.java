/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import Models.Event;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author admin
 */
public class Booking {

    private List<Item> listItem;
    private Customer customer;
    private Date startDate;
    private Date endDate;
    private List<Event> event;
    private float discountPercent;
    private float totalPrice;
    private float invoicePrice;

    public float getInvoicePrice() {
        return invoicePrice;
    }

    public void setInvoicePrice(float invoicePrice) {
        this.invoicePrice = invoicePrice;
    }
    public float getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(float discountPercent) {
        this.discountPercent = discountPercent;
    }

    public List<Event> getEvent() {
        return event;
    }

    public List<Item> getListItem() {

        return listItem;
    }

    public void setListItem(List<Item> listItem) {
        this.listItem = listItem;
    }

    public Booking() {
        listItem = new ArrayList<>();
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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

    public void setEvent(List<Event> event) {
        this.event = event;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Booking(List<Item> listItem, Customer customer, Date startDate, Date endDate, List<Event> event, float totalPrice) {
        this.listItem = listItem;
        this.customer = customer;
        this.startDate = startDate;
        this.endDate = endDate;
        this.event = event;
        this.totalPrice = totalPrice;
    }

    

    public void addItem(Item item) {
        listItem.add(item);
    }

    public void removeItem(Item item) {
        listItem.remove(item);
    }

    public float calculateTotalPrice() {
        totalPrice = 0;
        float totalDiscountEvent = 0;
        for (Item item : listItem) {
            totalPrice += item.getPrice();
        }
        long durationInMillis = endDate.getTime() - startDate.getTime();
        long durationInDays = TimeUnit.DAYS.convert(durationInMillis, TimeUnit.MILLISECONDS);
        totalPrice = totalPrice * (durationInDays + 1);
        if (!event.isEmpty()) {
            for (Event item : event) {
                totalDiscountEvent += item.getDiscountPercent();
            }
        }
        totalPrice -= totalPrice * 
                    ((totalDiscountEvent + customer.getTypeCustomer().getDiscount()) / 100) ;
        return (float) (totalPrice + totalPrice * 0.1);
    }
    
    public float calculateTotalPriceNotEvent() {
        totalPrice = 0;
        for (Item item : listItem) {
            totalPrice += item.getPrice();
        }
        long durationInMillis = endDate.getTime() - startDate.getTime();
        long durationInDays = TimeUnit.DAYS.convert(durationInMillis, TimeUnit.MILLISECONDS);
        totalPrice = totalPrice * (durationInDays + 1);
        return totalPrice;
    }
    public float calculateTotalPriceNotEvent1() {
        float totalPrice1 = 0;
        for (Item item : listItem) {
            totalPrice1 += item.getPrice();
        }
        long durationInMillis = endDate.getTime() - startDate.getTime();
        long durationInDays = TimeUnit.DAYS.convert(durationInMillis, TimeUnit.MILLISECONDS);
        totalPrice1 = totalPrice1 * (durationInDays + 1);
        return totalPrice1;
    }
    public float calculateDiscountEvent() {
        float totalDiscountEvent = 0;
        if (!event.isEmpty()) {
            for (Event item : event) {
                totalDiscountEvent += item.getDiscountPercent();
            }
        }
        return totalDiscountEvent;
    }
}
