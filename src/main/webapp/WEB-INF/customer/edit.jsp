<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MultiShop - Online Shop Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <jsp:include page="/WEB-INF/customer/layout.jsp"></jsp:include>

</head>

<body>
<jsp:include page="/WEB-INF/customer/topnav.jsp"></jsp:include>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="/user?action=view">Account Information</a>
                <span class="breadcrumb-item active">Edit Information</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Checkout Start -->
<div class="container-fluid">
    <form method="post">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Edit Information</span>
                </h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Full Name</label>
                            <input value="${sessionScope.user.getFullName()}" name="fullName" class="form-control" type="text" placeholder="Doe John" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Date Of Birth</label>
                            <input value="${sessionScope.user.getBirthDay()}" name="birthDay" class="form-control" type="date" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Phone Number</label>
                            <input value="${sessionScope.user.getPhoneNumber()}" name="phoneNumber" class="form-control" type="text" placeholder="0999888999" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Email</label>
                            <input value="${sessionScope.user.getEmail()}" name="email" class="form-control" type="email" placeholder="nhathoang@gmail.com" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input value="${sessionScope.user.getAddress()}" name="address" class="form-control" type="text" placeholder="123 Street" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Image</label>
                            <input id="image" onchange="chooseFile()"  value="${sessionScope.user.getImage()}" name="image" class="form-control" type="text"  >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Password</label>
                            <input  value="${sessionScope.user.getPassword()}" name="password" class="form-control" type="text" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Role</label>
                            <c:forEach items="${requestScope.listRole}" var="role">
                                <c:if test="${sessionScope.user.getRole() == role.getId()}">
                                    <input value="${role.getId()}" class="form-control" type="number" name="role" disabled>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Create</label>
                            <input value="${sessionScope.user.getCreatedTime()}" class="form-control" disabled>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Updated</label>
                            <input value="${sessionScope.user.getUpdatedTime()}" class="form-control" disabled>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"></span></h5>
                <div class="bg-light p-30 mb-5">
                    <img id="imageProduct" src="${sessionScope.user.getImage()}" alt="image" style="width: 100%;height: 330px;">
                </div>
                <div class="mb-5" style="margin-top: -2rem !important;">
                    <div class="bg-light p-30">
                        <button class="btn btn-block btn-primary font-weight-bold py-3">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Checkout End -->


<jsp:include page="/WEB-INF/customer/footer.jsp"></jsp:include>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

</body>

</html>