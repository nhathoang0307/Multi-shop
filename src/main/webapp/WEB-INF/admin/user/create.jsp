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
                <a class="breadcrumb-item text-dark" href="/user?action=view">List User</a>
                <span class="breadcrumb-item active">add User</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="container-fluid">
    <div class="toast" data-autohide="true" style="position: fixed; top: 10px; right: 10px; z-index: 1000000">
        <div class="toast-header">
            <strong class="mr-auto text-primary">User Manager</strong>
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
    <form method="post">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Edit Information</span>
                </h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Full Name</label>
                            <input required name="fullName" class="form-control" type="text" placeholder="Doe John"  >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Date Of Birth</label>
                            <input required name="birthDay" class="form-control" type="date" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Phone Number</label>
                            <input required name="phoneNumber" class="form-control" type="text" placeholder="0999888999" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Email</label>
                            <input required name="email" class="form-control" type="email" placeholder="nhathoang@gmail.com" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input required name="address" class="form-control" type="text" placeholder="123 Street" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Image</label>
                            <input id="image" onchange="chooseFile()"  required name="image" class="form-control" type="text"   >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Role</label>
                            <input  required name="role" class="form-control" type="number" min="1" max="2" placeholder="1-admin 2-user"  >
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Password</label>
                            <input required name="password" class="form-control" type="text" placeholder="Input password" >
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span
                        class="bg-secondary pr-3"></span></h5>
                <div class="bg-light p-30 mb-5">
                    <img id="imageProduct" src="https://duhochfc.vn/ckfinder/userfiles/images/nguoi-dep-han-quoc-NANCY.jpg" alt="image" style="width: 100%;height: 330px;">
                </div>
                <div class="mb-5" style="margin-top: -2rem !important;">
                    <div class="bg-light p-30">
                        <button class="btn btn-block btn-primary font-weight-bold py-3">Create</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Cart End -->
<!-- Footer Start -->

<jsp:include page="/WEB-INF/customer/footer.jsp"></jsp:include>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


</body>

</html>