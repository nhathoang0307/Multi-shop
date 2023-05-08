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
                <c:if test="${requestScope.order.getStatusId() == 1}">
                    <a class="breadcrumb-item text-dark" href="/manager-oder">List Pending Order</a>
                </c:if>
                <c:if test="${requestScope.order.getStatusId() == 3}">
                    <a class="breadcrumb-item text-dark" href="/manager-oder?action=listorderTransport">List Shipping Order</a>
                </c:if>
                <c:if test="${requestScope.order.getStatusId() == 4}">
                    <a class="breadcrumb-item text-dark" href="/manager-oder?action=listorderDone">List Finish Order</a>
                </c:if>
                <%--                <a class="breadcrumb-item text-dark" href="/user?action=viewHistoryOrder">Order History</a>--%>
                <span class="breadcrumb-item active">View Detail OrderItem</span>
            </nav>
        </div>
    </div>
</div>

<div class="toast" data-autohide="true" style="position: fixed; top: 10px; right: 10px; z-index: 1000000">
    <div class="toast-header">
        <strong class="mr-auto text-primary">Order Manager</strong>
        <small class="text-muted">1 mins ago</small>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
    </div>
    <div class="toast-body">
        Edit success....ahii
    </div>
</div>
<c:if test="${requestScope.message!=null}">
    <script>
        $(document).ready(function () {
            let message = '<%= request.getAttribute("message")%>';
            document.querySelector(".toast-body").innerText = message;
            $('.toast').toast({delay: 5000});
            $('.toast').toast('show');
        });
    </script>
</c:if>

<div class="container-fluid" style="padding-bottom: 10px;">
    <div class="row px-xl-5">
        <div class="col-6">
            <div class="dataTables_length" id="table4_length">
                <label>
                    <select id="idSlLimitEntries" name="table4_length" aria-controls="table4" class="custom-select custom-select-sm form-control form-control-sm" onchange="handleLimitEntries()">
                        <option>3</option>
                        <option>10</option>
                        <option>25</option>
                        <option>50</option>
                    </select>
                </label>
            </div>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <div class="input-group">
                <input name="q" value="${requestScope.q}" type="text" class="form-control" value=""
                       placeholder="Search for Products" id="idTxtSearch">
                <div class="input-group-append">
                    <button style="border: none;padding: 0px;" id="submit" type="submit">
                            <span class="input-group-text bg-transparent text-primary" style="padding: 10px;">
                                <i class="fa fa-search" style=""></i>
                            </span>
                    </button>
                </div>
            </div>
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


                    <c:if test="${requestScope.order.getStatusId() == 1}">
                        <tr style="">
                            <td class="align-middle" colspan="4"><a href="/manager-oder"><button style=" border: none;width: 100%;height: 100%; background-color: #ffc800 !important;
    padding: 10px;">Back</button></a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${requestScope.order.getStatusId() == 3}">
                        <tr style="">
                            <td class="align-middle" colspan="4"><a href="/manager-oder?action=listorderTransport"><button style=" border: none;width: 100%;height: 100%; background-color: #ffc800 !important;
    padding: 10px;">Back</button></a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${requestScope.order.getStatusId() == 4}">
                        <tr style="">
                            <td class="align-middle" colspan="4"><a href="/manager-oder?action=listorderDone"><button style=" border: none;width: 100%;height: 100%; background-color: #ffc800 !important;
    padding: 10px;">Back</button></a>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav>
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
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