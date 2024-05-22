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

    <link rel="stylesheet" href="css/style.css">

</head>

<body>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center mb-5">
                    <h2 class="heading-section">Hệ Thống Đặt Chỗ</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-5">
                    <div class="login-wrap p-4 p-md-5">
                        <div class="icon d-flex align-items-center justify-content-center">
                            <span class="fa fa-user-o"></span>
                        </div>
                        <h3 class="text-center mb-4">Đăng Ký</h3>
                        <form action="register" method="post" class="login-form">
                            <div class="form-group">
                                <input type="text" name="first_name" class="form-control rounded-left" placeholder="Họ" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="last_name" class="form-control rounded-left" placeholder="Tên" required>
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" class="form-control rounded-left" placeholder="Email" required>
                            </div>
                            <div class="form-group d-flex">
                                <input type="password" name="password" class="form-control rounded-left" placeholder="Mật khẩu" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="phone" class="form-control rounded-left" placeholder="Số điện thoại" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="address" class="form-control rounded-left" placeholder="Địa chỉ" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Đăng ký</button>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-60 text-md-left">
                                    <a href="index.jsp">Quay lại đăng nhập</a>
                                </div>
                            </div>
                        </form>
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">
                                ${errorMessage}
                            </div>
                        </c:if>
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
