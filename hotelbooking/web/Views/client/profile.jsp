<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
    <jsp:include page="layout/header.jsp"></jsp:include>
    <body style="background-color: #EFF6FC">
    <div class="container">
            <div class="account-settings">
                <div class="user-profile">                    
                    <h1 style="margin-top: 5%; text-align: center" class="user-name">Thông Tin Của Bạn</h1>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                <c:set var="c" value="${cus}" scope="session"></c:set>
                    <form action="update_profile" method="post">
                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="fullName">Họ: </label>
                                    <input type="text" class="form-control" id="fullName" name="firstName" placeholder="Enter full name" 
                                    <c:if test="${firstName != null}">value="${firstName}"</c:if> value="${c.firstName}" <c:if test="${check == null}">readonly</c:if>>
                                <c:if test="${validFirstName != null}">
                                    <p style="color: red; font-weight: bold; margin: 0;">
                                        ${validFirstName}
                                    </p>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="fullName">Tên: </label>
                                <input type="text" class="form-control" id="fullName" name="lastName" placeholder="Enter full name" 
                                       <c:if test="${lastName != null}">value="${lastName}"</c:if> value="${c.lastName}" <c:if test="${check == null}">readonly</c:if>>
                                <c:if test="${valiLastName != null}">
                                    <p style="color: red; font-weight: bold; margin: 0;">
                                        ${valiLastName}
                                    </p>
                                </c:if>        
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="eMail">Email: </label>
                                <input type="email" class="form-control" id="eMail" placeholder="Enter email ID" value="${c.email}" readonly>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="phone">Số điện thoại: </label>
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number" 
                                       <c:if test="${phone != null}">value="${phone}"</c:if> value="${c.phone}" <c:if test="${check == null}">readonly</c:if> >
                                <c:if test="${valiPhone != null}">
                                    <p style="color: red; font-weight: bold; margin: 0;">
                                        ${valiPhone}
                                    </p>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="website">Địa chỉ: </label>
                                <input type="text" class="form-control" id="website" name="address" placeholder="Enter address" 
                                       <c:if test="${address != null}">value="${address}"</c:if> value="${c.address}" <c:if test="${check == null}">readonly</c:if>>
                                <c:if test="${validAddress != null}">
                                    <p style="color: red; font-weight: bold; margin: 0;">
                                        ${validAddress}
                                    </p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="text-right" style="margin-bottom: 5%">
                        <c:if test="${check == null}">
                            <button type="button" class="button" onclick="window.location.href = 'update_profile';">Chỉnh sửa thông tin</button>
                        </c:if>
                        <c:if test="${check != null}">
                            <input type="submit" class="button" value="Lưu">
                            <button type="button" class="button" onclick="window.location.href = 'ForgotServlet';">Đổi mật khẩu</button>
                        </c:if>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="layout/footer.jsp"></jsp:include>

</body>
<style>
    .button {
        background-color: #4CAF50; /* Màu nền xanh lá */
        color: white; /* Màu chữ trắng */
        padding: 12px 24px; /* Padding cho nút */
        border: none; /* Không viền */
        border-radius: 5px; /* Bo góc */
        cursor: pointer; /* Con trỏ chuột */
        margin-right: 10px; /* Khoảng cách giữa các nút */
    }

    .button:hover {
        background-color: #45a049; /* Màu khi hover */
    }

</style>
</html>
