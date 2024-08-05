<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="event" class="Models.Event" scope="request" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sự kiện</title>
    <link rel="stylesheet" href="css/style.css"> 
</head>
<body>

<jsp:include page="layout/header.jsp"></jsp:include>

<section class="breadcrumb_main_area margin-bottom-80">
    <div class="container-fluid">
        <div class="row">
            <div class="breadcrumb_main" style="padding-top: 20px; padding-bottom: 0px;">
                <h2 style="color: #313a45">Chi tiết sự kiện</h2>
            </div>
        </div>
    </div>            
</section>

<section class="single_blog_area margin-bottom-150">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="single_blog_post_area">
                    <div class="sing_blog_photo">
                        <img src="Views/client/img/${event.image}" alt="${event.titleEvent}">
                    </div>
                    <div class="sing_blog_content">
                        <div class="sing_blog_heading">
                            <h2>${event.titleEvent}</h2>
                            <ul>
                                <li>Thời gian: ${event.startDate} - ${event.endDate}</li>
                                <li>Chi tiết: ${event.detail}</li>
                                <li>Mô tả: ${event.description}</li>
                                <li>Giảm giá: ${event.discountPercent}%</li>
                            </ul>
                        </div>
                            <a href="#" onclick="history.go(-1); return false;">Quay lại</a>
                    </div>
                            
                </div>
            </div>

            <div class="col-md-3">
                <aside>
                    <!-- Các widget phụ trợ (tương tự như phần tin tức) -->
                </aside>
            </div>
        </div>
    </div>
</section>

<jsp:include page="layout/footer.jsp"></jsp:include>

</body>
</html>