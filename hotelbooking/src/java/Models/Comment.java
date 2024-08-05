/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Acer
 */
public class Comment {
    private int comment_id;
    private Customer customer_id;
    private NewsDetail detail_new_id;
    private String content;
    private Date comment_date;
    private String status;
    private List<Reply> replies;

    public Comment() {
    }

    public Comment(int comment_id, Customer customer_id, NewsDetail detail_new_id, String content, Date comment_date, String status) {
        this.comment_id = comment_id;
        this.customer_id = customer_id;
        this.detail_new_id = detail_new_id;
        this.content = content;
        this.comment_date = comment_date;
        this.status = status;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public Customer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Customer customer_id) {
        this.customer_id = customer_id;
    }

    public NewsDetail getDetail_new_id() {
        return detail_new_id;
    }

    public void setDetail_new_id(NewsDetail detail_new_id) {
        this.detail_new_id = detail_new_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Reply> getReplies() {
        return replies;
    }

    public void setReplies(List<Reply> replies) {
        this.replies = replies;
    }
    
}
