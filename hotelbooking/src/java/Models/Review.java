/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author PhạmVinhTiến
 */
public class Review {

    private int reviewId;
    private Customer customer;
    private String description;
    private String status;
    private RoomType roomType;

    public Review() {
    }

    public Review(int reviewId, Customer customer, String description, String status, RoomType roomType) {
        this.reviewId = reviewId;
        this.customer = customer;
        this.description = description;
        this.status = status;
        this.roomType = roomType;
    }

    public Review(Customer customer, String description, String status, RoomType roomType) {
        this.customer = customer;
        this.description = description;
        this.status = status;
        this.roomType = roomType;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }
}
