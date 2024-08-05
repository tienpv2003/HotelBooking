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
public class Item {
    private Customer customerId;
    private Room room;
    private List<Service> listService;
    private float price;

    public Item(Customer customerId, Room room, List<Service> listService, float price) {
        this.customerId = customerId;
        this.room = room;
        this.listService = listService;
        this.price = price;
    }

    public Item() {
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public List<Service> getListService() {
        return listService;
    }

    public void setListService(List<Service> listService) {
        this.listService = listService;
    }

    public float getPrice() {
        float sum = 0;
        for (Service service : listService) {
            sum += service.getPriceService();
        }
        
        return room.getRoomType().getRoomTypePrice() + sum;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
     
    
}
