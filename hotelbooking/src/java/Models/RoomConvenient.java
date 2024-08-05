package Models;

import java.util.List;

public class RoomConvenient {
    private Room room;
    private List<Convenient> conveniences;
    private String status;

    public RoomConvenient(Room room, List<Convenient> conveniences, String status) {
        this.room = room;
        this.conveniences = conveniences;
        this.status = status;
    }

    // Getters and setters
    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public List<Convenient> getConveniences() {
        return conveniences;
    }

    public void setConveniences(List<Convenient> conveniences) {
        this.conveniences = conveniences;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
