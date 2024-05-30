/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Role {
    private int staff_type_id;
    private String type;

    public Role() {
    }

    public Role(int staff_type_id, String type) {
        this.staff_type_id = staff_type_id;
        this.type = type;
    }

    public int getStaff_type_id() {
        return staff_type_id;
    }

    public void setStaff_type_id(int staff_type_id) {
        this.staff_type_id = staff_type_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
}
