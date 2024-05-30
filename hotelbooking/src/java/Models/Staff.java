/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Staff {
    private int staff_id;
    private Role staff_type_id;
    private String email;
    private String password;
    private String status;

    public Staff() {
    }

    public Staff(int staff_id, Role staff_type_id, String email, String password, String status) {
        this.staff_id = staff_id;
        this.staff_type_id = staff_type_id;
        this.email = email;
        this.password = password;
        this.status = status;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public Role getStaff_type_id() {
        return staff_type_id;
    }

    public void setStaff_type_id(Role staff_type_id) {
        this.staff_type_id = staff_type_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
