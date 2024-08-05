/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Acer
 */
public class NewsDetail {

    private int newsDetailId;
    private News news;
    private String content;

    public NewsDetail() {
    }

    public NewsDetail(int newsDetailId, News news, String content) {
        this.newsDetailId = newsDetailId;
        this.news = news;
        this.content = content;
    }

    public int getNewsDetailId() {
        return newsDetailId;
    }

    public void setNewsDetailId(int newsDetailId) {
        this.newsDetailId = newsDetailId;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
