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
                <span class="breadcrumb-item active">Order History</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-lg-12 table-responsive mb-5">
            <table class="table table-light table-borderless table-hover text-center mb-0">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Created</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Customer</th>
                    <th>Detail</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach items="${requestScope.orders}" var="order">
                    <tr>
                        <td class="align-middle">${order.getId()}</td>
                        <td class="align-middle">${order.getCreatedTime()}</td>
                        <td class="align-middle">$${order.getGrandTotal()}</td>
                        <td class="align-middle">
                            <c:forEach items="${requestScope.statuss}" var="status">
                                <c:if test="${status.getId() == order.getStatusId()}">
                                    ${status.getType()}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td class="align-middle">
                            <c:forEach items="${requestScope.customers}" var="customer">
                                <c:if test="${order.getCustomerId() == customer.getId()}">
                                    ${customer.getFullName()}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td class="align-middle"><a href="/manager-oder?action=vieworderItemFromUser&id=${order.getId()}">View</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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