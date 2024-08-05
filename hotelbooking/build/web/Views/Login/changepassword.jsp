<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en">

    <head>
        <title>Login 01</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Views/Login/css/style.css">
        <style>
            /* Common styles for both buttons */
            .button-like, .back-to-login {
                display: inline-block;
                padding: 10px 0px;
                font-size: 16px;
                font-weight: 600;
                color: #007bff;
                background-color: white; 
                text-align: center;
                text-decoration: none;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            /* Specific styles for the input button */
            .button-like {
                appearance: none;
                -webkit-appearance: none;
            }

            /* Ensure links have the same padding and appearance as buttons */
            .back-to-login {
                line-height: normal;
                padding: 10px 20px;
            }
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
                            <h3 class="text-center mb-4" style=" font-weight: bold;">Đổi mật khẩu</h3>
                            <c:if test="${messErr != null}">
                                <p style="color: red">${messErr}</p>
                            </c:if>
                            <form action="change_password" method="post" class="login-form">

                                <div class="form-group d-flex">
                                    <input type="password" name="password"class="form-control rounded-left" <c:if test="${password != null}">value="${password}"</c:if> placeholder=" Enter new Password"
                                           required>
                                    </div>
                                    <div class="form-group d-flex">
                                        <input type="password" name="repassword"class="form-control rounded-left" <c:if test="${repassword != null}">value="${repassword}"</c:if> placeholder="Re-Password"
                                           required>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Send" class="button-like">
                                </div>

                                <div class="form-group d-md-flex">
                                    <div class="w-60 text-md-left">
                                        <a href="signup">Back to log in</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>