/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author PhạmVinhTiến
 */
public class Convenient {

    private int convenientId;
    private String convenientName;
    private String status;

    public Convenient() {
    }

    public Convenient(int convenientId, String convenientName, String status) {
        this.convenientId = convenientId;
        this.convenientName = convenientName;
        this.status = status;
    }

    public Convenient(String convenientName, String status) {
        this.convenientName = convenientName;
        this.status = status;
    }

    public int getConvenientId() {
        return convenientId;
    }

    public void setConvenientId(int convenientId) {
        this.convenientId = convenientId;
    }

    public String getConvenientName() {
        return convenientName;
    }

    public void setConvenientName(String convenientName) {
        this.convenientName = convenientName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
