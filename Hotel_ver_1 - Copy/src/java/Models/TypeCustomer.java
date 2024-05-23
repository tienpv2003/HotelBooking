/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Acer
 */
public class TypeCustomer {
    public int type_customer;
    public String type_customer_name;
    public float money_level;
    public float discount;

    public TypeCustomer() {
    }

    public TypeCustomer(int type_customer, String type_customer_name, float money_level, float discount) {
        this.type_customer = type_customer;
        this.type_customer_name = type_customer_name;
        this.money_level = money_level;
        this.discount = discount;
    }

    public int getType_customer() {
        return type_customer;
    }

    public void setType_customer(int type_customer) {
        this.type_customer = type_customer;
    }

    public String getType_customer_name() {
        return type_customer_name;
    }

    public void setType_customer_name(String type_customer_name) {
        this.type_customer_name = type_customer_name;
    }

    public float getMoney_level() {
        return money_level;
    }

    public void setMoney_level(float money_level) {
        this.money_level = money_level;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }
    
}
