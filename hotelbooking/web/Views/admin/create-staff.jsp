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
                                <div class="mt-5">
                                    <h4 class="card-title float-left mt-2">Tạo nhân viên</h4> <a href="add_staff" class="btn btn-primary float-right veiwbutton">Thêm nhân viên</a> </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="create_staff" method="post">
                                <div class="row formtype">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Email nhân viên</label>
                                            <input name="email" class="form-control" type="text" placeholder="Email nhân viên">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Mật khẩu</label>
                                            <input name="password" class="form-control" type="password" placeholder="Mật khẩu">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Vai trò</label>
                                            <select class="form-control" id="sel1" name="sellist1">
                                                <c:forEach var="role" items="${roles}">
                                                    <option value="${role.staff_type_id}">${role.type}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>
                                    <div style="display: flex;align-items: center;margin-top: 31px;" class="col-md-3 create">
                                        <div class="form-group">
                                            <label><button style="width: 160px" type="submit" class="btn btn-success btn-block mt-0 search_button btn-create">Tạo</button></label>
                                        </div>
                                    </div>
                                </div>

                            </form>

                            <c:if test="${not empty param.message1}">

                                <div class="alert alert-danger">${param.message1}</div>
                            </c:if>  
                            <c:if test="${not empty param.message}">

                                <div class="alert alert-success">${param.message}</div>
                            </c:if>  
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body booking_card">
                                    <div class="table-responsive">
                                        <table class="datatable table table-stripped table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID nhân viên</th>
                                                    <th>Email</th>
                                                    <th>Vai trò</th>
                                                    <th>Trạng thái</th>
                                                    <th class="text-right">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="staff" items="${staffList}">
                                                    <tr>
                                                        <td>${staff.getStaff_id()}</td>
                                                        <td>${staff.getEmail()}</td>
                                                        <td>${staff.getStaff_type_id().getType()}</td>
                                                        <td>${staff.getStatus()}</td>
                                                        <td class="text-right">
                                                            <div class="actions">
                                                                <a href="edit-staff?id=${staff.getStaff_id()}" class="btn btn-sm bg-success-light mr-2">
                                                                    <i class="fe fe-pencil"></i> Edit
                                                                </a>                   
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="Views/admin/assets/js/jquery-3.5.1.min.js"></script>
        <script src="Views/admin/assets/js/popper.min.js"></script>
        <script src="Views/admin/assets/js/bootstrap.min.js"></script>
        <script src="Views/admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="Views/admin/assets/plugins/raphael/raphael.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="Views/admin/assets/plugins/datatables/datatables.min.js"></script>
        <script src="Views/admin/assets/js/script.js"></script>
    </body>

</html>