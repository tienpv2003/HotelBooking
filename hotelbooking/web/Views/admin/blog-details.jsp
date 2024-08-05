<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <!-- Add meta tags, title, and other head elements here -->
        <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="Views/admin/assets/plugins/datatables/datatables.min.css">
        <!-- Add any other CSS files here -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $(document).on('click', '.delete-reply', function (event) {
                    event.preventDefault();
                    var replyId = $(this).data('reply-id');
                    var commentId = $(this).data('comment-id');
                    var btn = $(this);
                    $.ajax({
                        url: 'delete_reply_customer',
                        type: 'GET',
                        data: {replyId: replyId, commentId: commentId},
                        dataType: 'json',
                        success: function (response) {
                            if (response.status === 'success') {
                                btn.removeClass('btn-primary').addClass('btn-danger').text('Inactive');
                                btn.removeClass('delete-reply').addClass('un-delete-reply');
                            } else {
                                alert('Failed to delete');
                            }
                        },
                        error: function () {
                            alert('Failed to communicate with the server');
                        }
                    });
                });

                $(document).on('click', '.un-delete-reply', function (event) {
                    event.preventDefault();
                    var btn = $(this);
                    var replyId = btn.data('reply-id');
                    $.ajax({
                        url: 'un_delete_reply',
                        type: 'GET',
                        data: {replyId: replyId},
                        dataType: 'json',
                        success: function (response) {
                            if (response.status === 'success') {
                                btn.removeClass('btn-danger').addClass('btn-primary').text('Active');
                                btn.removeClass('un-delete-reply').addClass('delete-reply');
                            } else
                                alert('That bai');
                        },
                        error: function () {
                        }
                    });
                });



                $(document).on('click', '.delete-comment', function (event) {
                    event.preventDefault();
                    var btn = $(this);
                    var commentId = btn.data('comment-id');
                    $.ajax({
                        url: 'delete_comment_customer',
                        type: 'GET',
                        data: {commentId: commentId},
                        dataType: 'json',
                        success: function (response) {
                            if (response.status === 'success') {
                                btn.removeClass('btn-primary').addClass('btn-danger').text('Inactive');
                                btn.removeClass('delete-comment').addClass('un-delete-comment');
                                btn.closest('li').find('.delete-reply').removeClass('btn-primary').addClass('btn-danger').text('Inactive');
                            } else {
                                alert('Không thể cập nhật trạng thái comment.');
                            }
                        },
                        error: function () {
                            alert('Lỗi khi giao tiếp với máy chủ.');
                        }
                    });
                });


                // Xử lý click vào button Activate Comment
                $(document).ready(function () {
                    // Xử lý click vào button Activate Comment
                    $(document).on('click', '.un-delete-comment', function (event) {
                        event.preventDefault();
                        var btn = $(this);
                        var commentId = btn.data('comment-id');

                        $.ajax({
                            url: 'un_delete_comment',
                            type: 'GET',
                            data: {
                                commentId: commentId
                            },
                            dataType: 'json',
                            success: function (response) {
                                if (response.status === 'success') {
                                    // Cập nhật trạng thái của comment
                                    btn.removeClass('btn-danger').addClass('btn-primary').text('Active');
                                    btn.removeClass('un-delete-comment').addClass('delete-comment');
                                    // Cập nhật trạng thái của các reply
                                    btn.closest('li').find('ul li').each(function () {
                                        var replyBtn = $(this).find('button');
                                        var replyId = replyBtn.data('reply-id');
                                        if (response.replyStatus[replyId] === 'active') {
                                            replyBtn.removeClass('btn-danger').addClass('btn-primary').text('Active');
                                        } else {
                                            replyBtn.removeClass('btn-primary').addClass('btn-danger').text('Inactive');
                                        }
                                    });
                                } else {
                                    alert('Không thể cập nhật trạng thái comment.');
                                }
                            },
                            error: function () {
                                alert('Lỗi khi giao tiếp với máy chủ.');
                            }
                        });
                    });
                });


            });
        </script>
    </head>
    <body>
        <jsp:include page="layout/header.jsp"></jsp:include>
        <jsp:include page="layout/sidebar.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content mt-2">
                <c:if test="${newsDetail != null}">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="mt-5 d-flex justify-content-between align-items-center">
                                <a href="list_news" class="btn btn-primary" style="background-color: #007bff; width: 120px;">Quay lại</a>
                                <h4 class="card-title mt-2 text-center" style="flex-grow: 1;">Danh sách Tin tức</h4>
                                <a href="update_news?news_id=${newsDetail.newsId}" class="btn btn-primary veiwbutton">Chỉnh sửa</a>
                            </div>
                            <div class="blog-view" style="width: 100%">
                                <article class="blog blog-single-post">
                                    <h3 class="blog-title">${newsDetail.title}</h3>
                                    <h6>Xuất bản: ${newsDetail.createDate}</h6>
                                    <h6>
                                        Đăng bởi: 
                                        <c:if test="${name != null}">
                                            ${name}
                                        </c:if> 
                                    </h6>
                                    <img src="Views/admin/assets/img/product/${newsDetail.img}" class="responsive-img">
                                    <div class="blog-content mt-4">
                                        <h4>Mô tả:</h4>
                                        <br>
                                        ${newsDetail.description}
                                        <hr>
                                        <c:if test="${content != null}">
                                            <h4>Nội dung:</h4>
                                            ${content}
                                        </c:if>
                                    </div>
                                </article>
                            </div>
                            <div class="single_post_comment_area">
                                <h2 style="text-align: center">Quản lí Bình luận</h2>
                                <ul class="coments">
                                    <c:forEach var="c" items="${listCommment}">
                                        <li>
                                            <div class="d-flex">
                                                <div class="col-md-2 padding-0 col-sm-2">
                                                    <div class="com_author_photo">
                                                        <img src="Views/client/img/comment_photo_2.jpg" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-md-10 col-sm-10 d-flex align-items-center">
                                                    <div class="comment_details flex-grow-1">
                                                        <h3>${c.customer_id.firstName} ${c.customer_id.lastName}<span class="comm_time">${c.comment_date}</span></h3>
                                                        <p>${c.content}</p>
                                                    </div>
                                                    <div class="ml-2">
                                                        <p class="p-Action">Trạng thái</p>
                                                        <c:if test="${c.status == 'active'}">
                                                            <button class="btn btn-primary delete-comment" data-comment-id="${c.comment_id}">Active</button>
                                                        </c:if>
                                                        <c:if test="${c.status  == 'inactive'}">
                                                            <button class="btn btn-danger un-delete-comment" data-comment-id="${c.comment_id}">Inactive</button>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            <ul>
                                                <c:if test="${not empty c.replies}">
                                                    <c:forEach var="r" items="${c.replies}">
                                                        <li>
                                                            <div class="d-flex">
                                                                <div class="col-md-2 padding-0 col-sm-2">
                                                                    <div class="com_author_photo">
                                                                        <img src="Views/client/img/comment_photo_3.jpg" alt="">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-10 col-sm-10 d-flex align-items-center">
                                                                    <div class="comment_details flex-grow-1">
                                                                        <h3>${r.customer_id.firstName} ${r.customer_id.lastName}<span class="comm_time">${r.rely_date}</span></h3>
                                                                        <p>${r.content}</p>
                                                                    </div>
                                                                    <div class="ml-2">
                                                                        <p class="p-Action">Trạng thái</p>
                                                                        <c:if test="${r.status == 'active' && c.status == 'active'}">
                                                                            <button class="btn btn-primary delete-reply" data-reply-id="${r.reply_id}" data-comment-id="${c.comment_id}">Active</button>
                                                                        </c:if>
                                                                        <c:if test="${r.status  == 'inactive' || c.status == 'inactive'}">
                                                                            <button class="btn btn-danger un-delete-reply" data-reply-id="${r.reply_id}" data-comment-id="${c.comment_id}">Inactive</button>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                        </li>
                                                    </c:forEach>
                                                </c:if>
                                            </ul>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <aside class="col-md-4 mt-5 text-center">
                            <div class="widget search-widget">
                                <h4>Danh sách Tin tức</h4>
                                <c:forEach var="newsItem" items="${list5News}">
                                    <div class="news-item mb-3 p-3 border rounded">
                                        <div class="news-img-container">
                                            <img src="Views/admin/assets/img/product/${newsItem.img}" class="responsive-img news-img">
                                        </div>
                                        <h5 class="news-title mb-1">${newsItem.title}</h5>
                                        <p class="news-date mb-1">Xuất bản: ${newsItem.createDate}</p>
                                        <a href="news_detail?news_id=${newsItem.newsId}" class="btn btn-sm btn-primary">Xem chi tiết</a>
                                    </div>
                                </c:forEach>
                            </div>
                        </aside>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
    <script src="Views/admin/assets/js/popper.min.js"></script>
    <script src="Views/admin/assets/js/bootstrap.min.js"></script>
    <script src="Views/admin/assets/js/moment.min.js"></script>
    <script src="Views/admin/assets/js/select2.min.js"></script>
    <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="Views/admin/assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
    <script src="Views/admin/assets/js/script.js"></script>            
    <script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });
    </script>
    <style>
        .news-img-container {
            width: 100%;
            height: 150px; /* Adjust height as needed */
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .news-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .news-item {
            transition: box-shadow 0.3s ease;
            background-color: #f8f9fa;
        }

        .news-item:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .news-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #333;
        }

        .news-date {
            font-size: 0.875rem;
            color: #666;
        }

        .btn-primary,
        .btn-danger {
            width: 120px; /* Ensure both buttons have the same width */
            height: 40px; /* Ensure both buttons have the same height */
            display: inline-block;
            text-align: center;
            line-height: 40px; /* Vertically centers the text */
            color: white; /* Ensure text color is white */
            font-size: 16px; /* Adjust font size as needed */
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }


        .blog-single-post {
            width: 100%;
            margin-top: 10px;
        }

        .responsive-img {
            width: 100%;
            height: auto; /* Maintain aspect ratio */
            object-fit: cover; /* Cover the container while maintaining aspect ratio */
        }

        .single_post_comment_area {
            border: 1px solid #ededed;
            box-shadow: -5px 5px 0 #f0f0f0;
            padding: 35px 0 0;
        }

        .single_post_comment_area > h2,
        .comment_form > h2 {
            font-size: 20px;
            font-weight: 700;
            color: #444;
            font-family: 'karla';
            text-transform: inherit;
        }

        ul.coments {
            padding: 0;
            margin-top: 0;
            border-bottom: 1px solid #e3e1e1;
        }

        ul.coments li {
            overflow: hidden;
            clear: both;
            padding: 30px 0;
        }

        ul.coments li ul {
            clear: both;
            margin-bottom: -30px;
            padding-top: 30px;
        }

        ul.coments li ul li {
            border-bottom: 0 none;
            padding-left: 100px;
        }

        .comment_details h3 {
            font-size: 16px;
            font-family: 'karla';
            color: #444;
            font-weight: 700;
        }

        .comment_details h3 span.comm_time {
            font-size: 13px;
            font-family: 'karla';
            color: #fe5d5d;
            font-weight: 400;
            margin-left: 5px;
        }

        .comment_details p {
            line-height: 27px;
            font-size: 14px;
            color: #444;
        }

        .comment_details a.reply {
            font-weight: 700;
            color: #444;
            font-size: 14px;
        }

        .comment_form {
            margin-right: 45px;
        }

        .comment_form form {
            padding-top: 30px;
        }

        .comment_form form label {
            display: block;
            color: #444;
            font-size: 16px;
            font-weight: 400;
            margin-bottom: 5px;
        }

        .comment_form input,
        .comment_form textarea {
            width: 50%;
            border: 1px solid #e8e5e3;
            line-height: 40px;
            text-indent: 20px;
            margin-bottom: 15px;
        }

        .comment_form textarea {
            height: 190px;
            margin-bottom: 30px;
            width: 100%;
        }

        .comment_form input[type="submit"] {
            background: #3ac4fa;
            color: #fff;
            text-transform: uppercase;
            width: 127px;
            line-height: 47px;
            border: 0px;
            text-indent: inherit;
            margin-bottom: 0;
            border: 1px solid #3ac4fa;
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
            transition: 0.5s;
        }

        .comment_form input[type="submit"]:hover {
            color: #3ac4fa;
            background: #fff;
            border: 1px solid #3ac4fa;
        }

        .padding-0 {
            padding: 0;
        }

        .comment_details {
            display: flex;
            flex-direction: column;
        }

        .d-flex {
            display: flex;
        }

        .flex-grow-1 {
            flex-grow: 1;
        }

        .align-items-center {
            align-items: center;
        }

        .ml-2 {
            margin-left: 0.5rem;
        }
        .p-Action{
            margin-top: 0;
            margin-bottom: 0;
            font-size: 13px;
            font-weight: bold;
        }
    </style>
</body>
</html>
