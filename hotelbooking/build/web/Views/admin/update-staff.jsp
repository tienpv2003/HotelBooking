<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

﻿<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    <jsp:include page="layout/sidebar.jsp"></jsp:include>
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title mt-5">Chỉnh sửa nhân viên</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <form method="post" action="updatestaff">
                            <div class="row formtype">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input class="form-control" type="email" name="email" required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Vai trò</label>
                                        <select class="form-control" id="sel1" name="sellist1">
                                            <option>Chọn</option>
                                            <option>Staff Events</option>
                                            <option>Staff Service</option>
                                            <option>Staff News</option>
                                            <option>Staff Comments</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary buttonedit ml-2">Save</button>
                        </form>

                        <!-- Display success or error message -->
                        <%
                            String message = (String) request.getAttribute("message");
                            if (message != null) {
                        %>
                            <div class="alert alert-info mt-3"><%= message %></div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
    <script src="Views/admin/assets/js/popper.min.js"></script>
    <script src="Views/admin/assets/js/bootstrap.min.js"></script>
    <script src="Views/admin/assets/js/moment.min.js"></script>
    <script src="Views/admin/assets/js/select2.min.js"></script>
    <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
    <script src="Views/admin/assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="Views/admin/assets/js/script.js"></script>
    <script>
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'LT'
            });
        });
    </script>
</body>
</html>