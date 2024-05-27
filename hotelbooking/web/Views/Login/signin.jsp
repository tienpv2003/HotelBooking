<!doctype html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi">

    <head>
        <title>Khách Sạn</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Views/Login/css/style.css">

    </head>

    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Đặt Phòng Khách Sạn</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="login-wrap p-4 p-md-5">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <span class="fa fa-user-o"></span>
                            </div>
                            <h3 class="text-center mb-4" style=" font-weight: bold;">Đăng Nhập</h3>
                            <c:if test="${errorMessage != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success">${successMessage}</div>
                            </c:if>
                            <form action="signin" method="post" class="login-form">
                                <div class="form-group">
                                    <input name="email" type="text" class="form-control rounded-left" <c:if test="${email != null}">value="${email}"</c:if> placeholder="Email" required>
                                </div>
                                <div class="form-group d-flex">
                                    <input name="password" type="password" class="form-control rounded-left" placeholder="Mật Khẩu" required>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" value="" name="remember" id="rememberPasswordCheck">
                                    <label class="form-check-label" for="term">
                                        Ghi nhớ mật khẩu
                                    </label>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">Đăng nhập</button>
                                </div>

                            </form>
                            <div class="form-check mb-3">
                                <label class="form-check-label" for="term">
                                    Nếu bạn chưa có tài khoản, ấn  
                                    <a href="email_signup">vào đây</a>
                                </label>
                            </div>
                                <div class="form-check mb-3">
                                <label class="form-check-label" for="term">
                                    Quên mật khẩu, ấn  
                                    <a href="ForgotServlet">vào đây</a>
                                </label>
                            </div>
                            <div class="form-group">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/HotelBooking/signingoogle&response_type=code
		   &client_id=328168281764-4kip3kh0h81t2t9342d1oq3rrg3fb7ms.apps.googleusercontent.com&approval_prompt=force" class="form-control btn btn-primary rounded submit px-3"> Đăng nhập với Google</a>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-60 text-md-left">
                                    <a href="home">Quay lại Trang chủ</a>
                                </div>
                            </div>
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
