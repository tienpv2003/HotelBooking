<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="active"> <a href="HomeAdminController"><i class="fas fa-tachometer-alt"></i>
                        <span>Thống kê khách sạn</span></a> </li>
                <li class="list-divider"></li>
                <li class="submenu"> <a href="#"><i class="fas fa-suitcase"></i> <span> Đặt phòng </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="all_booking"> Tất cả đơn đặt phòng </a></li>
                        <li><a href="booking_options"> Thêm đơn đặt phòng </a></li>
                    </ul>
                </li>
                <li> <a href="all_custumer"><i class="fas fa-user"></i> <span>Khách hàng</span></a> </li>
                <li class="submenu"> <a href="#"><i class="fas fa-door-closed"></i><span> Loại phòng </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="all_type_room">Tất cả loại phòng</a></li>
                        <li><a href="create_type_room"> Tạo loại phòng mới </a></li>
                        <li><a href="update_type_room_service">Thêm dịch vụ vào loại phòng</a></li>
                        <li><a href="status_room_type"> Loại phòng dừng hoạt động</a></li>
                    </ul>
                </li>
                <li class="submenu"> <a href="#"><i class="fas fa-key"></i> <span> Phòng </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="all_room">Tất cả phòng </a></li>               
                        <li><a href="create_room"> Thêm phòng </a></li>
                        <li><a href="booked_room"> Phòng đã được đặt </a></li>
                        <li><a href="status_room"> Phòng đã dừng hoạt động </a></li>
                    </ul>
                </li>

                <c:if test="${sessionScope.role == 1}">
                    <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Nhân viên </span> <span
                                class="menu-arrow"></span></a>
                        <ul class="submenu_class" style="display: none;">
                            <li><a href="all_staff">Tất cả nhân viên </a></li>
                            <li><a href="create_staff"> Tạo nhân viên </a></li>
                            <!--<li><a href="updatestaff"> Chỉnh sửa nhân viên </a></li>-->
                            <li><a href="ban"> Danh sách nhân viên bị cấm </a></li>
                        </ul>
                    </li>
                </c:if>
                <li class="submenu"> <a href="#"><i class="fas fa-calendar-check"></i> <span> Sự kiện </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="list_event">Tất cả sự kiện </a></li>
                        <li><a href="create_event"> Tạo sự kiện mới </a></li>
                        <li><a href="list_inactive_event"> Sự kiện đã hủy </a></li>
                    </ul>
                </li>
                <li class="submenu"> <a href="#"><i class="fab fa-servicestack"></i> <span> Dịch vụ </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="list_service">Tất cả dịch vụ </a></li>
                        <li><a href="create_service"> Tạo dịch vụ mới </a></li>
                        <li><a href="list_inactive_service"> Dịch vụ đã hủy </a></li>
                    </ul>
                </li>
                <li class="submenu"> <a href="#"><i class="fas fa-bed"></i> <span> Tiện ích </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="list_convenient">Tất cả Tiện ích </a></li>
                        <li><a href="add_convenient"> Tạo Tiện ích mới </a></li>
                        <li><a href="list_room_convenient">Tiện ích theo phòng </a></li>
                    </ul>
                </li>


                <li> <a href="home_pricing"><i class="far fa-money-bill-alt"></i> <span>Bảng giá</span></a> </li>

                <li> <a href="list_news"><i class="fas fa-table"></i> <span>Tin tức</span></a> </li>

                <li> <a href="list_review"><i class="fas fa-star"></i> <span>Đánh giá</span></a> </li>
                <li class="list-divider"></li>
            </ul>
        </div>
    </div>
</div>