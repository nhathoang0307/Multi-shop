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

<jsp:include page="/WEB-INF/admin/layout/topnav.jsp">
    <jsp:param name="totalUser" value="${applicationScope.listUser.size()}"/>
    <jsp:param name="totalCustomer" value="${applicationScope.listCustomer.size()}"/>
    <jsp:param name="totalProduct" value="${applicationScope.listProduct.size()}"/>
    <jsp:param name="totalOrder" value="${applicationScope.listOrder.size()}"/>
</jsp:include>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <span class="breadcrumb-item active">Account Information</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Account Information</span>
            </h5>
            <div class="bg-light p-30 mb-5">
                <div class="toast" data-autohide="true" style="position: fixed; top: 10px; right: 10px; z-index: 1000000">
                    <div class="toast-header">
                        <strong class="mr-auto text-primary">Account Information</strong>
                        <small class="text-muted">1 mins ago</small>
                        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                    </div>
                    <div class="toast-body">
                        Edit success....ahii
                    </div>
                </div>
                <c:if test="${requestScope.message!=null}">
                    <script>
                        $(document).ready(function(){
                            let message = '<%= request.getAttribute("message")%>';
                            document.querySelector(".toast-body").innerText = message;
                            $('.toast').toast({delay: 5000});
                            $('.toast').toast('show');
                        });
                    </script>
                </c:if>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Full Name</label>
                        <input value="${sessionScope.user.getFullName()}" class="form-control" type="text" placeholder="Doe John" disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Date Of Birth</label>
                        <input value="${sessionScope.user.getBirthDay()}" class="form-control" type="date" disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Phone Number</label>
                        <input value="${sessionScope.user.getPhoneNumber()}" class="form-control" type="text" placeholder="0999888999" disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Email</label>
                        <input value="${sessionScope.user.getEmail()}" class="form-control" type="email" placeholder="nhathoang@gmail.com" disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Address</label>
                        <input value="${sessionScope.user.getAddress()}" class="form-control" type="text" placeholder="123 Street" disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Role</label>
                        <c:forEach items="${requestScope.listRole}" var="role">
                            <c:if test="${sessionScope.user.getRole() == role.getId()}">
                                <input value="${role.getType()}" class="form-control" type="text" disabled>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Created</label>
                        <input value="${sessionScope.user.getCreatedTime()}" class="form-control"  disabled>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Updated</label>
                        <input value="${sessionScope.user.getUpdatedTime()}" class="form-control"  disabled>
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
                    <a href="/user?action=editInfo"><button class="btn btn-block btn-primary font-weight-bold py-3">Edit</button></a>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Cart End -->
<!-- Footer Start -->

<jsp:include page="/WEB-INF/customer/footer.jsp"></jsp:include>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


</body>

</html>