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
                <a class="breadcrumb-item text-dark" href="/user?action=viewHistoryOrder">Order History</a>
                <span class="breadcrumb-item active">View Detail</span>
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
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach items="${requestScope.orderItems}" var="orderItem">
                    <tr>
                        <td class="align-middle">
                            <c:forEach items="${requestScope.products}" var="product">
                                <c:if test="${orderItem.getProductId() == product.getId()}">
                                    ${product.getName()}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td class="align-middle">$${orderItem.getPrice()}</td>
                        <td class="align-middle">${orderItem.getQuantity()}</td>
                        <td class="align-middle">$${orderItem.getQuantity()*orderItem.getPrice()}</td>
                    </tr>
                </c:forEach>
                <tr style="">
                    <td class="align-middle" colspan="4"><a href="/user?action=viewHistoryOrder"><button style=" border: none;width: 100%;height: 100%; background-color: #ffc800 !important;
    padding: 10px;">Back</button></a>
                    </td>
                </tr>
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