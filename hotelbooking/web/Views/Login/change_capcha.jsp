<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="Vi">

    <head>
        <title>Login 01</title>
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
                    <div class="col-md-7 col-lg-5">
                        <div class="login-wrap p-4 p-md-5">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <span class="fa fa-user-o"></span>
                            </div>
                            <h3 style=" font-weight: bold;" class="text-center mb-4">Xác minh Captcha</h3>
                            <form action="change_capcha" class="login-form" method="post">
                                 <c:if test="${not empty param.message}">
                                    
                                    <div class="alert alert-danger">${param.message}</div>
                                </c:if>  
                                <c:if test="${not empty message1}">
                                <div class="alert alert-success">${message1}</div>
                            </c:if>
                                <div class="form-group">
                                    <input type="text" class="form-control rounded-left" placeholder="Nhập Captcha" required name="captcha" value="${requestScope.capcha}">
                                    <input type="hidden" name="email" value="${requestScope.email}">
                                    <input type="hidden" name="encodedCaptcha" value="${requestScope.encodedCaptcha}">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control rounded-left" placeholder="Nhập mật khẩu" required name="password">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control rounded-left" placeholder="Nhập lại mật khẩu" required name="passworda">
                                </div>
<div class="form-group">
                                    <button type="submit"
                                            class="form-control btn btn-primary rounded submit px-3">Change</button>
                                </div>
                                <!-- <div class="form-group d-md-flex">
                                        

                                        <div class="w-70 text-md-right">
                                                <a href="forgot.html">Forgot Password</a>
                                        </div>
                                </div> -->
                                <!-- <div class="form-group d-md-flex">
                                        

                                        <div class="w-60 text-md-left">
                                                <a href="signup.html">Sign up new account</a>
                                        </div>
                                </div> -->
                                <div class="form-group d-md-flex">


                                    <div class="w-60 text-md-left">
                                        <a href="index.html">Back to log in</a>
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