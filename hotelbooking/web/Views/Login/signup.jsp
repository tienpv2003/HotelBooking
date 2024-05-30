<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="vi">

    <head>
        <title>Đăng Ký</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="Views/Login/css/style.css">
        <style>
            body {
                background-image: url('Views/img/chot.jpg');
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
                        <div class="login-wrap p-4 p-md-5 tiencac">
                            <div class="icon d-flex align-items-center justify-content-center">
                                <img src="Views/img/logo_chot.jpg" alt="Logo" style="width: auto; height: 100px;"> <!-- Adjust width and height as needed -->
                            </div>

                            <h3 class="text-center mb-4"  style=" font-weight: bold;">Đăng Ký</h3>
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">${errorMessage}</div>
                            </c:if>
                            <form action="signup" method="post" class="login-form">
                                <div class="form-group">
                                    <input type="text" name="first_name" <c:if test="${firstName != null}">value="${firstName}"</c:if> class="form-control rounded-left" placeholder="Họ" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="last_name" <c:if test="${lastName != null}">value="${lastName}"</c:if> class="form-control rounded-left" placeholder="Tên" required>
                                    </div>
                                    <div class="form-group d-flex">
                                        <input type="password" name="password" <c:if test="${password != null}">value="${password}"</c:if> class="form-control rounded-left" placeholder="Mật khẩu" required>
                                    </div>
                                    <div class="form-group d-flex">
                                        <input type="password" name="repassword" class="form-control rounded-left" placeholder="Nhập lại mật khẩu" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="phone" <c:if test="${phoneNumber != null}">value="${phoneNumber}"</c:if> class="form-control rounded-left" placeholder="Số điện thoại" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="address" <c:if test="${address != null}">value="${address}"</c:if> class="form-control rounded-left" placeholder="Địa chỉ" required>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" value="" name="agreed" id="rememberPasswordCheck">
                                    <label class="form-check-label" for="term">
                                        Đồng ý điều khoản của chúng tôi
                                    </label>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary rounded submit px-3">Đăng ký</button>
                                </div>
                            </form>
                            <div class="form-check mb-3">
                                <label class="form-check-label" for="term">
                                    Đã có tài khoản, đăng nhập 
                                    <a href="signin">tại đây</a>
                                </label>     
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
