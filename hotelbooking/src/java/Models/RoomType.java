package Models;

import java.util.List;

public class RoomType {
    private int roomTypeId;
    private String typeName;
    private String status;
    private int quantity;
    private String roomtype_img;
    private String titleDescripsion;
    private String roomTypedescripsion;
    private String contentDescripsion;
    private float roomTypePrice;
    private List<String> roomImages;
    private List<Service> listService;

    public RoomType() {
    }

    public RoomType(int roomTypeId, String typeName, String status, int quantity, String roomtype_img, String titleDescripsion, String roomTypedescripsion, String contentDescripsion, float roomTypePrice, List<String> roomImages, List<Service> listService) {
        this.roomTypeId = roomTypeId;
        this.typeName = typeName;
        this.status = status;
        this.quantity = quantity;
        this.roomtype_img = roomtype_img;
        this.titleDescripsion = titleDescripsion;
        this.roomTypedescripsion = roomTypedescripsion;
        this.contentDescripsion = contentDescripsion;
        this.roomTypePrice = roomTypePrice;
        this.roomImages = roomImages;
        this.listService = listService;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public String getStatus() {
        return status;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getRoomtype_img() {
        return roomtype_img;
    }

    public String getTitleDescripsion() {
        return titleDescripsion;
    }

    public String getRoomTypedescripsion() {
        return roomTypedescripsion;
    }

    public String getContentDescripsion() {
        return contentDescripsion;
    }

    public float getRoomTypePrice() {
        return roomTypePrice;
    }

    public List<String> getRoomImages() {
        return roomImages;
    }

    public List<Service> getListService() {
        return listService;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setRoomtype_img(String roomtype_img) {
        this.roomtype_img = roomtype_img;
    }

    public void setTitleDescripsion(String titleDescripsion) {
        this.titleDescripsion = titleDescripsion;
    }

    public void setRoomTypedescripsion(String roomTypedescripsion) {
        this.roomTypedescripsion = roomTypedescripsion;
    }

    public void setContentDescripsion(String contentDescripsion) {
        this.contentDescripsion = contentDescripsion;
    }

    public void setRoomTypePrice(float roomTypePrice) {
        this.roomTypePrice = roomTypePrice;
    }

    public void setRoomImages(List<String> roomImages) {
        this.roomImages = roomImages;
    }

    public void setListService(List<Service> listService) {
        this.listService = listService;
    }
    
}