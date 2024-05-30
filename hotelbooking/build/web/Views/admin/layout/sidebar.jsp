<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="active"> <a href="index.jsp"><i class="fas fa-tachometer-alt"></i>
                        <span>Bảng điều khiển</span></a> </li>
                <li class="list-divider"></li>
                <li class="submenu"> <a href="#"><i class="fas fa-suitcase"></i> <span> Đặt phòng </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="all-booking.jsp"> Tất cả đơn đặt phòng </a></li>
                        <li><a href="edit-booking.jsp"> Chỉnh sửa đơn đặt phòng </a></li>
                        <li><a href="add-booking.jsp"> Thêm đơn đặt phòng </a></li>
                    </ul>
                </li>
                <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Khách hàng </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="all_custumer"> Tất cả khách hàng </a></li>
                        <li><a href="edit-customer.jsp"> Chỉnh sửa khách hàng </a></li>
                        <li><a href="add-customer.jsp"> Thêm khách hàng </a></li>
                    </ul>
                </li>
                <li class="submenu"> <a href="#"><i class="fas fa-key"></i> <span> Phòng </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="all-rooms.jsp">Tất cả phòng </a></li>
                        <li><a href="edit-room.jsp"> Chỉnh sửa phòng </a></li>
                        <li><a href="add-room.jsp"> Thêm phòng </a></li>
                    </ul>
                </li>
                <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Nhân viên </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="all-staff.jsp">Tất cả nhân viên </a></li>
                        <li><a href="edit-staff.jsp"> Chỉnh sửa nhân viên </a></li>
                        <li><a href="add-staff.jsp"> Thêm nhân viên </a></li>
                    </ul>
                </li>
                <li> <a href="pricing.jsp"><i class="far fa-money-bill-alt"></i> <span>Bảng giá</span></a> </li>

                <li class="submenu"> <a href="#"><i class="far fa-money-bill-alt"></i> <span> Tài khoản </span>
                        <span class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="invoices.jsp">Hóa đơn </a></li>
                        <li><a href="payments.jsp">Thanh toán </a></li>
                        <li><a href="expenses.jsp">Chi phí </a></li>
                        <li><a href="taxes.jsp">Thuế </a></li>
                        <li><a href="provident-fund.jsp">Quỹ dự trữ </a></li>
                    </ul>
                </li>

                <li> <a href="calendar.jsp"><i class="fas fa-calendar-alt"></i> <span>Lịch</span></a> </li>
                <li class="submenu"> <a href="#"><i class="fe fe-table"></i> <span> Blog </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="blog.jsp">Blog </a></li>
                        <li><a href="blog-details.jsp">Xem Blog </a></li>
                        <li><a href="add-blog.jsp">Thêm Blog </a></li>
                        <li><a href="edit-blog.jsp">Chỉnh sửa Blog </a></li>
                    </ul>
                </li>
                <li> <a href="settings.jsp"><i class="fas fa-cog"></i> <span>Cài đặt</span></a> </li>
                <li class="list-divider"></li>

                <li class="list-divider"></li>
                <li class="menu-title mt-3"> <span>PHỤ LỤC</span> </li>
                <li class="submenu"> <a href="#"><i class="fas fa-columns"></i> <span> Trang </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="submenu_class" style="display: none;">
                        <li><a href="login.jsp">Đăng nhập </a></li>
                        <li><a href="register.jsp">Đăng ký </a></li>
                        <li><a href="forgot-password.jsp">Quên mật khẩu </a></li>
                        <li><a href="change-password.jsp">Thay đổi mật khẩu </a></li>
                        <li><a href="lock-screen.jsp">Màn hình khóa </a></li>
                        <li><a href="profile.jsp">Hồ sơ </a></li>
                        <li><a href="gallery.jsp">Thư viện ảnh </a></li>
                        <li><a href="error-404.jsp">404 Lỗi </a></li>
                        <li><a href="error-500.jsp">500 Lỗi </a></li>
                        <li><a href="blank-page.jsp">Trang trống </a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>