
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi Tiết Blog</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                // Gửi form bình luận hiện tại
                $('#commentForm').submit(function (event) {
                    event.preventDefault(); // Ngăn chặn biểu mẫu gửi theo cách truyền thống
                    $.ajax({
                        type: 'POST',
                        url: 'add_comment', // URL của servlet để xử lý thêm bình luận
                        data: $(this).serialize(), // Tuần tự hóa dữ liệu biểu mẫu
                        success: function (response) {
                            if (response.status === 'success') {
                                // Xử lý khi chèn bình luận thành công, ví dụ: cập nhật khu vực bình luận
                                $('#commentSection').prepend(
                                        '<li>' +
                                        '<div class="comment_container">' +
                                        '<div class="comment">' +
                                        '<div class="com_author_photo">' +
                                        '<img src="Views/client/img/default-avt.jpg" alt="">' +
                                        '</div>' +
                                        '<div class="col-md-12 col-sm-12">' +
                                        '<div class="comment_details">' +
                                        '<h3>' + response.customerName + '<span class="comm_time">' + response.commentDate + '</span></h3>' +
                                        '<p>' + response.content + '</p>' +
                                        '<a href="#" class="reply-button" data-comment-id="' + response.commentId + '">Hồi đáp</a>' +
                                        (response.isOwner ? '<a href="delete_comment_customer?commentId=' + response.commentId + '" class="reply delete-comment" data-comment-id="' + response.commentId + '">| Gỡ bình luận</a>' : '') +
                                        '<div class="reply-form" style="display: none;">' +
                                        '<form class="replyCommentForm" method="post" action="add_reply">' +
                                        '<input type="hidden" name="commentId" value="' + response.commentId + '">' +
                                        '<textarea name="replyContent" onkeyup="textAreaAdjust(this)" style="overflow:hidden; resize: none; width: 100%" rows="2" cols="30" placeholder="Nhập nội dung hồi đáp..."></textarea>' +
                                        '<input type="submit" value="Gửi">' +
                                        '</form></div>' +
                                        '<div class="replyContainer"></div>' +
                                        '</div></div></div></div></li>'
                                        );
                                $('#content').val(''); // Xóa nội dung input bình luận
                            } else {
                                // Xử lý khi thất bại
                                alert('Vui lòng nhập bình luận có nội dung.');
                            }
                        },
                        error: function () {
                            alert('Đã có lỗi xảy ra, vui lòng thử lại.');
                        }
                    });
                });
                // Gửi form hồi đáp
                $(document).on('submit', '.replyCommentForm', function (event) {
                    event.preventDefault();
                    var form = $(this);
                    var formData = {
                        commentId: form.find('input[name="commentId"]').val(),
                        replyContent: form.find('textarea[name="replyContent"]').val()
                    };
                    $.ajax({
                        url: form.attr("action"),
                        type: form.attr("method"),
                        data: formData,
                        success: function (response) {
                            if (response.trim() === "error") {
                                alert("Vui lòng nhập bình luận có nội dung.");
                            } else {
                                form.closest('.comment_details').find('.replyContainer').append(response);
                                form.closest('.reply-form').hide();
                                form.find('textarea[name="replyContent"]').val('');
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("loi");
                        }
                    });
                });
                // Xóa reply 
                $(document).on('click', '.delete-reply', function (event) {
                    event.preventDefault();
                    var replyId = $(this).data('reply-id');
                    var commentId = $(this).data('comment-id');
                    var replyElement = $(this).closest('li');

                    $.ajax({
                        url: 'delete_reply_customer',
                        type: 'GET',
                        data: {replyId: replyId, commentId: commentId},
                        dataType: 'json',
                        success: function (response) {
                            if (response.status === 'success') {
                                replyElement.remove();
                            } else {
                                alert('Failed to delete');
                            }
                        },
                        error: function () {
                            alert('Khong xoa dc thu lai');
                        }
                    });
                });
                // Xoa hoi dap
                $(document).on('click', '.delete-comment', function (event) {
                    event.preventDefault();
                    var commentId = $(this).data('comment-id');
                    var commentElement = $(this).closest('li');

                    $.ajax({
                        url: 'delete_comment_customer',
                        type: 'GET',
                        data: {commentId: commentId},
                        dataType: 'json',
                        success: function (response) {
                            if (response.status === 'success') {
                                commentElement.remove();
                            } else {
                                alert('Failed to delete');
                            }
                        },
                        error: function () {
                            alert('Khong xoa dc');
                        }
                    });
                });

                // Ẩn/hiện form hồi đáp
                $(document).on('click', '.reply-button', function (event) {
                    event.preventDefault();
                    $(this).closest('.comment_details').find('.reply-form').toggle();
                });
            });
        </script>

        <script>
            function textAreaAdjust(element) {
                element.style.height = "1px";
                element.style.height = (25 + element.scrollHeight) + "px";
            }
        </script>

        <script>
            function showComments() {
                // get items have class name is see_more_item
                const commentSections = document.querySelectorAll(".see_more_item");
                const seeMoreBtn = document.getElementById('seeMoreBtn');
                const seeLessBtn = document.getElementById('seeLessBtn');
                commentSections.forEach(function (section) {
                    section.classList.remove('display_none');
                });
                seeMoreBtn.classList.add('display_none');
                seeLessBtn.classList.remove('display_none');
            }

            function hideComments() {
                // get items have class name is see_more_item
                const commentSections = document.querySelectorAll(".see_more_item");
                const seeMoreBtn = document.getElementById('seeMoreBtn');
                const seeLessBtn = document.getElementById('seeLessBtn');
                commentSections.forEach(function (section) {
                    section.classList.add('display_none');
                });
                seeMoreBtn.classList.remove('display_none');
                seeLessBtn.classList.add('display_none');
            }
        </script>

        <script>
            const commentSections = document.querySelectorAll(".see_more_item");


        </script>
    </head>
    <body>
        <jsp:include page="layout/header.jsp"></jsp:include>
            <!-- start breadcrumb -->
            <section class="breadcrumb_main_area margin-bottom-80">
                <div class="container-fluid">
                    <div class="row">
                        <div class="breadcrumb_main" style="padding-top: 20px; padding-bottom: 0px;">
                            <h2 style="color: #313a45">Tin tức</h2>
                        </div>
                    </div>
                </div>            
            </section>
            <!-- end breadcrumb -->

            <!-- start single blog section -->
            <section class="single_blog_area margin-bottom-150">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="single_blog_post_area">
                                <div class="sing_blog_photo">
                                    <img src="img/sing_blog_photo_1.jpg" alt="">
                                    <i class="fa fa-heart top"></i>
                                    <i class="fa fa-picture-o bottom"></i>
                                </div>
                            <c:set var="d" value="${newsDetail}"></c:set>
                                <div class="sing_blog_content">
                                    <div class="sing_blog_heading">
                                        <h2>${d.news.title}</h2>
                                    <ul>
                                        <li>Bởi  
                                            <c:choose>
                                                <c:when test="${fn:contains(d.news.staff.email, '@')}">
                                                    ${fn:substringBefore(d.news.staff.email, '@')}
                                                </c:when>
                                                <c:otherwise>
                                                    ${d.news.staff.email}
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                        <li>${d.news.createDate}</li>
                                    </ul>
                                </div>
                                <div class="sing_blog_post_cont">
                                    <blockquote>${d.news.title}</blockquote>
                                    <p>
                                        <img src="Views/admin/assets/img/product/${d.news.img}" class="floatleft" alt="">
                                    </p>
                                    <p>${d.content}</p>
                                </div>
                                <div class="single_post_comment_area">
                                    <h2>Bình luận</h2>
                                    <div class="comment_form">
                                        <c:if test="${empty sessionScope.cusObj}">
                                            <h2>Đăng nhập để bình luận.</h2>
                                            <a href="signin" class="btn" style="margin: 10px 0">Đăng nhập</a>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.cusObj}">
                                            <form id="commentForm">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <input type="hidden" name="detailId" value="${d.newsDetailId}">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label>Tin nhắn</label>
                                                        <textarea name="content" id="content" onkeyup="textAreaAdjust(this)" style="overflow:hidden" rows="3" cols="30"></textarea>
                                                        <input style="font-weight: bold;" type="submit" value="Gửi">
                                                    </div>
                                                </div>
                                            </form>
                                        </c:if>
                                    </div>

                                    <ul class="coments" id="commentSection">
                                        <c:forEach var="c" items="${listCommment}" varStatus="status">
                                            <c:if test="${c.status == 'active'}">
                                                <li class="${status.index < 3 ? "" : "see_more_item display_none"}" style="padding: 10px 0">
                                                    <div class="comment_container">
                                                        <div class="comment">
                                                            <div class="com_author_photo">
                                                                <img src="Views/client/img/default-avt.jpg" alt="">
                                                            </div>
                                                            <div class="col-md-12 col-sm-12">
                                                                <div class="comment_details">
                                                                    <h3>${c.customer_id.firstName} ${c.customer_id.lastName}<span class="comm_time">${c.comment_date}</span></h3>
                                                                    <p>${c.content}</p>
                                                                    <c:if test="${not empty sessionScope.cusObj}">
                                                                        <a href="#" class="reply-button" data-comment-id="${c.comment_id}">Hồi đáp</a>
                                                                    </c:if>
                                                                    <c:if test="${not empty sessionScope.cusObj}">
                                                                        <c:set var="cus" value="${sessionScope.cusObj}"/>
                                                                        <c:if test="${cus.customerId == c.customer_id.customerId}">
                                                                            <a href="delete_comment_customer?commentId=${c.comment_id}" class="reply delete-comment" data-comment-id="${c.comment_id}">| Gỡ bình luận</a>
                                                                        </c:if>
                                                                    </c:if>
                                                                    <div class="reply-form" style="display: none;">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <form class="replyCommentForm" method="post" action="add_reply">
                                                                                    <div class="reply_container">
                                                                                        <input type="hidden" name="commentId" value="${c.comment_id}" >
                                                                                        <textarea name="replyContent" onkeyup="textAreaAdjust(this)" style="overflow:hidden; resize: none; width: 100%" rows="2" cols="30" placeholder="Nhập nội dung hồi đáp..."></textarea>
                                                                                        <div class="submit_reply_btn">
                                                                                            <input type="submit" value="Gửi">
                                                                                        </div>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="replyContainer"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:if test="${not empty c.replies}">
                                                            <c:forEach var="r" items="${c.replies}">
                                                                <c:if test="${r.status == 'active'}">
                                                                    <div class="comment" style="padding-left: 55px; padding-top: 10px">
                                                                        <div class="com_author_photo">
                                                                            <img src="Views/client/img/default-avt.jpg" alt="">
                                                                        </div>
                                                                        <div class="col-md-12 col-sm-12">
                                                                            <div class="comment_details">
                                                                                <h3>${r.customer_id.firstName} ${r.customer_id.lastName}<span class="comm_time">${r.rely_date}</span></h3>
                                                                                <p>${r.content}</p>
                                                                                <c:if test="${not empty sessionScope.cusObj}">
                                                                                    <c:set var="cus" value="${sessionScope.cusObj}"/>
                                                                                    <c:if test="${cus.customerId == r.customer_id.customerId}">
                                                                                        <a href="delete_reply_customer?replyId=${r.reply_id}&commentId=${c.comment_id}" class="reply delete-reply" data-reply-id="${r.reply_id}" data-comment-id="${c.comment_id}">Gỡ bình luận</a>
                                                                                    </c:if>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <div style="margin-bottom: 10px">
                                            <c:if test="${listCommment.size() > 3}">
                                                <button id="seeMoreBtn" class="see-more-btn" onclick="showComments()">Xem thêm</button>
                                                <button id="seeLessBtn" class="see-more-btn display_none" onclick="hideComments()">Ẩn bớt</button>
                                            </c:if>
                                        </div>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <aside>
                            <div class="row">
                                <div class="right_sidebar_area">
                                    <div class="col-lg-12 col-md-12 col-sm-6">
                                        <div class="input_search margin-bottom-30 text-center">
                                            <h4>Tin tức mới nhất</h4>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-6">
                                            <div class="blog_recent_post margin-bottom-30">
                                                <div class="single_recent_post">
                                                    <div class="row">
                                                        <c:forEach var="newsItem" items="${list5New}">
                                                            <div class="col-lg-12 col-md-12 col-xs-12">
                                                                <a href="news_detail_customer?newId=${newsItem.newsId}" class="recent_post_link">
                                                                    <div class="row">
                                                                        <div class="col-lg-4 col-md-4 col-xs-4">
                                                                            <div class="recent_thumb">
                                                                                <img src="Views/admin/assets/img/product/${newsItem.img}" alt="img" class="recent_img">
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-8 col-md-8 col-xs-8">
                                                                            <div class="recent_post_details">
                                                                                <h6>${newsItem.title}</h6>
                                                                                <p>${newsItem.createDate}</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </aside>
                    </div>
                </div>
            </div>
        </section>
        <!-- end single blog section -->
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </body>

</html>
