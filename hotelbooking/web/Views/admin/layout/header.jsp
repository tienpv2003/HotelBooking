<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>KHÁCH SẠN</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="Views/client/img/logo-chot.jpg">
    <link rel="stylesheet" href="Views/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="Views/admin/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="Views/admin/assets/css/feathericon.min.css">
    <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
    <link rel="stylesheet" href="Views/admin/assets/plugins/morris/morris.css">
    <link rel="stylesheet" href="Views/admin/assets/css/style.css"> 
</head>

<body>
    <div class="main-wrapper">
        <div class="header">
            <div class="header-left">
                <a href="HomeAdminController" class="logo"> <img src="Views/Login/img/logo-chot.jpg" width="50" height="70" alt="logo"> <span class="logoclass">KHÁCH SẠN</span> </a>
            </div>
            <a href="javascript:void(0);" id="toggle_btn"> <i class="fe fe-text-align-left"></i> </a>
            <a class="mobile_btn" id="mobile_btn"> <i class="fas fa-bars"></i> </a>
            <ul class="nav user-menu">
                <li class="nav-item dropdown noti-dropdown">
                    <div class="dropdown-menu notifications">
                        <div class="topnav-dropdown-header"> <span class="notification-title">Thông báo</span> <a href="javascript:void(0)" class="clear-noti"> Xóa tất cả </a> </div>
                        <div class="noti-content">
                            <ul class="notification-list">
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media"> <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="Ảnh người dùng" src="Views/admin/assets/img/profiles/avatar-02.jpg">
                                            </span>
                                            <div class="media-body">
                                                <p class="noti-details"><span class="noti-title">Carlson Tech</span> đã chấp nhận <span class="noti-title">bảng báo giá của bạn</span></p>
                                                <p class="noti-time"><span class="notification-time">4 phút trước</span> </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media"> <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="Ảnh người dùng" src="Views/admin/assets/img/profiles/avatar-11.jpg">
                                            </span>
                                            <div class="media-body">
                                                <p class="noti-details"><span class="noti-title">International Software
                                                        Inc</span> đã gửi cho bạn một hóa đơn với số tiền <span class="noti-title">$218</span></p>
                                                <p class="noti-time"><span class="notification-time">6 phút trước</span> </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media"> <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="Ảnh người dùng" src="Views/admin/assets/img/profiles/avatar-17.jpg">
                                            </span>
                                            <div class="media-body">
                                                <p class="noti-details"><span class="noti-title">John Hendry</span> đã gửi yêu cầu hủy <span class="noti-title">Apple iPhone
                                                        XR</span></p>
                                                <p class="noti-time"><span class="notification-time">8 phút trước</span> </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="notification-message">
                                    <a href="#">
                                        <div class="media"> <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt="Ảnh người dùng" src="Views/admin/assets/img/profiles/user-icon.jpg">
                                            </span>
                                            <div class="media-body">
                                                <p class="noti-details"><span class="noti-title">Mercury Software
                                                        Inc</span> đã thêm một sản phẩm mới <span class="noti-title">Apple
                                                        MacBook Pro</span></p>
                                                <p class="noti-time"><span class="notification-time">12 phút trước</span> </p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="topnav-dropdown-footer"> <a href="#">Xem tất cả Thông báo</a> </div>
                    </div>
                </li>
                <li class="nav-item dropdown has-arrow">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <span class="user-img"><img class="rounded-circle" src="Views/admin/assets/img/profiles/user-icon.jpg" width="31" alt="Soeng Souy"></span> </a>
                    <div class="dropdown-menu">
                        <div class="user-header">
                            <div class="avatar avatar-sm"> <img src="Views/admin/assets/img/profiles/user-icon.jpg" alt="Ảnh người dùng" class="avatar-img rounded-circle"> </div>
                            <div class="user-text">
                                <h6>${name}</h6>
                                <p class="text-muted mb-0">${name_roles}</p>
                            </div>
                        </div> 
                        <a class="dropdown-item" href="LogoutAdminServlet">Đăng xuất</a> 
                    </div>
                </li>
            </ul>
            
        </div>