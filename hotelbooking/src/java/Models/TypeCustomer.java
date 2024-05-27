/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

public class TypeCustomer {
    private int typeCustomerId;
    private String typeCustomerName;
    private float moneyLevel;
    private float discount;

    public TypeCustomer() {
    }

    public TypeCustomer(int typeCustomerId, String typeCustomerName, float moneyLevel, float discount) {
        this.typeCustomerId = typeCustomerId;
        this.typeCustomerName = typeCustomerName;
        this.moneyLevel = moneyLevel;
        this.discount = discount;
    }

    public int getTypeCustomerId() {
        return typeCustomerId;
    }

    public void setTypeCustomerId(int typeCustomerId) {
        this.typeCustomerId = typeCustomerId;
    }

    public String getTypeCustomerName() {
        return typeCustomerName;
    }

    public void setTypeCustomerName(String typeCustomerName) {
        this.typeCustomerName = typeCustomerName;
    }

    public float getMoneyLevel() {
        return moneyLevel;
    }

    public void setMoneyLevel(float moneyLevel) {
        this.moneyLevel = moneyLevel;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }
}
