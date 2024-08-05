/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author Acer
 */
public class Reply {
    private int reply_id;
    private Customer customer_id;
    private Comment commment_id;
    private String content;
    private Date rely_date;
    private String status;

    public Reply() {
    }

    public Reply(int reply_id, Customer customer_id, Comment commment_id, String content, Date rely_date, String status) {
        this.reply_id = reply_id;
        this.customer_id = customer_id;
        this.commment_id = commment_id;
        this.content = content;
        this.rely_date = rely_date;
        this.status = status;
    }

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }

    public Customer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Customer customer_id) {
        this.customer_id = customer_id;
    }

    public Comment getCommment_id() {
        return commment_id;
    }

    public void setCommment_id(Comment commment_id) {
        this.commment_id = commment_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRely_date() {
        return rely_date;
    }

    public void setRely_date(Date rely_date) {
        this.rely_date = rely_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
}
