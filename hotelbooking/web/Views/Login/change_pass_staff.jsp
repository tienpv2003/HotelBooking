<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="vi">

    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Views/Login/css/style.css">
        <style>
            body {
                background-image: url('Views/Login/img/chot.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
        </style>
    </head>

    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="login-wrap p-4 p-md-5">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <img src="Views/Login/img/logo-chot.jpg" alt="Logo" style="width: auto; height: 100px;">
                            </div>
                            <h3 class="text-center mb-4" style="font-weight: bold">Đổi mật khẩu nhân viên</h3>                     
                            <form action="change_pass_staff" class="login-form" method="post">

                                <c:if test="${not empty param.message1}">

                                    <div class="alert alert-danger">${param.message1}</div>
                                </c:if>  

                                <c:if test="${not empty message}">
                                    <div class="alert alert-success">${message}</div>
                                </c:if>
                                <div class="form-group">
                                    <input type="password" class="form-control rounded-left" placeholder="Enter Old password" required name="opass">   
                                    <input type="hidden" name="email" value="${requestScope.email}">
                                    <input type="hidden" name="encodedCaptcha" value="${requestScope.encodedCaptcha}">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control rounded-left" placeholder="Nhập mật khẩu mới" required name="password">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control rounded-left" placeholder="Xác nhận mật khẩu mới" required name="passworda">
                                </div>
                                <div class="form-group">
                                    <button type="submit"
                                            class="form-control btn btn-primary rounded submit px-3">Lưu mật khẩu mới</button>
                                </div>
                                <div class="form-group d-md-flex">


                                    <div class="w-60 text-md-left">
                                        <a href="signin">Quay lại đăng nhập</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="Views/Login/js/jquery.min.js"></script>
        <script src="Views/Login/js/popper.js"></script>
        <script src="Views/Login/js/bootstrap.min.js"></script>
        <script src="Views/Login/js/main.js"></script>

    </body>

</html>