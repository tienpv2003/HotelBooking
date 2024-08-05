<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
        <!-- start breadcrumb -->
        <section class="breadcrumb_main_area margin-bottom-80">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb_main" style="
                         padding-top: 20px;
                         padding-bottom: 0px;
                         ">
                        <h2 style="color: #313a45">Tin tức</h2>
                    </div>
                </div>
            </div>            
        </section>
        <!-- end breadcrumb -->

        <section class="blog_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="clearfix blog_inner" data-uk-grid>
                            <c:forEach items="${listNews}" var="news">
                                <c:if test="${news.status == 'active'}">
                                    <div class="col-md-4 col-sm-6 col-xs-12 margin-bottom-30">
                                        <div class="single_blog_style1">
                                            <div class="style_blog_img_box">
                                                <img src="Views/admin/assets/img/product/${news.img}" alt="img" class="responsive-img" />
                                                <a class="style_b_link" href="#"><i class="fa fa-link"></i></a>
                                            </div>
                                            <div class="at_love"><i class="fa fa-heart"></i></div>
                                            <div class="blog_text_box">
                                                <h5>${news.title}</h5>
                                                <ul class="clearfix">
                                                    <li>Bởi 
                                                        <c:choose>
                                                            <c:when test="${fn:contains(news.staff.email, '@')}">
                                                                ${fn:substringBefore(news.staff.email, '@')}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${news.staff.email}
                                                            </c:otherwise>
                                                        </c:choose>
                                                        |
                                                    </li>
                                                    <li>${news.createDate}  |</li>
                                                </ul>
                                                <p>${news.description}</p>
                                                <a href="news_detail_customer?newId=${news.newsId}">Đọc thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <jsp:include page="layout/footer.jsp"></jsp:include>
    <style>
        /* Existing Styles */
        .breadcrumb_main_area {
            margin-bottom: 80px;
        }

        .breadcrumb_main img {
            width: 100%;
            height: auto;
        }

        .margin-bottom-30 {
            margin-bottom: 30px;
        }

        .clearfix::after {
            content: "";
            display: table;
            clear: both;
        }

        /* Enhanced Styles */
        .single_blog_style1 {
            border: 1px solid #ededed;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .single_blog_style1:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .style_blog_img_box {
            position: relative;
            width: 100%;
            height: 200px; /* Set a consistent height for all images */
            overflow: hidden;
            flex-shrink: 0;
        }

        .style_blog_img_box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .style_blog_img_box:hover img {
            transform: scale(1.1);
        }

        .style_b_link {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 10px;
            border-radius: 50%;
            transition: background-color 0.3s ease;
        }

        .style_b_link:hover {
            background-color: rgba(0, 0, 0, 0.7);
        }

        .at_love {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            color: #fe5d5d;
            padding: 5px;
            border-radius: 50%;
        }

        .blog_text_box {
            padding: 15px;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
        }

        .blog_text_box h5 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .blog_text_box ul {
            padding: 0;
            margin: 0;
            list-style: none;
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .blog_text_box ul li {
            display: inline;
            margin-right: 5px;
        }

        .blog_text_box p {
            font-size: 14px;
            color: #444;
            margin-bottom: 10px;
            flex-grow: 1;
        }

        .blog_text_box a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            align-self: flex-end;
            transition: color 0.3s ease;
        }

        .blog_text_box a:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        .responsive-img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

    </style>
</html>
