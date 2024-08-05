/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Room {
    private int roomId;
    private RoomType roomType;
    private String roomName;
    private String status;

    public Room() {
    }

    public Room(int roomId, RoomType roomType, String roomName, String status) {
        this.roomId = roomId;
        this.roomType = roomType;
        this.roomName = roomName;
        this.status = status;
    }

    public int getRoomId() {
        return roomId;
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public String getRoomName() {
        return roomName;
    }

    public String getStatus() {
        return status;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
   
}