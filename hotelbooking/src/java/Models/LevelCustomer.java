/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */

public class LevelCustomer {
    private int levelId;
    private Customer customerId;
    private Reservation reservationId;
    private float total;

    public LevelCustomer() {
    }

    public LevelCustomer(int levelId, Customer customerId, Reservation reservationId, float total) {
        this.levelId = levelId;
        this.customerId = customerId;
        this.reservationId = reservationId;
        this.total = total;
    }

    public int getLevelId() {
        return levelId;
    }

    public void setLevelId(int levelId) {
        this.levelId = levelId;
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

    public double getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
}
