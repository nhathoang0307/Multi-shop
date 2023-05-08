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
                <%--                <a class="breadcrumb-item text-dark" href="/user?action=view">List User</a>--%>
                <%--                <a class="breadcrumb-item text-dark" href="/user?action=viewHistoryOrder">Order History</a>--%>
                <span class="breadcrumb-item active">List Pending Order</span>
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
<div class="container-fluid" style="font-size: 13px;font-weight: bold;">
    <div class="row px-xl-5">
        <div class="col-lg-12 table-responsive mb-5">
            <table class="table table-light table-borderless table-hover text-center mb-0">
                <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Created</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Customer</th>
                    <th>User</th>
                    <th>Detail</th>
                    <th>Awaiting Approval</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach items="${requestScope.orders}" var="order">
                    <c:if test="${order.getStatusId() == 1}">
                    <tr>
                        <td class="align-middle">${order.getId()}</td>
                        <td class="align-middle">${order.getCreatedTime()}</td>
                        <td class="align-middle">$${order.getGrandTotal()}</td>
                        <td class="align-middle">
                            <c:forEach items="${requestScope.statuss}" var="status">
                                <c:if test="${status.getId() == 1}">
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
                        <td class="align-middle">
                            <c:if test="${order.getUserId() != null}">
                                <c:forEach items="${requestScope.users}" var="user">
                                    <c:if test="${order.getUserId() == user.getId()}">
                                        ${user.getFullName()}
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </td>
                        <td class="align-middle">
                            <a href="/manager-oder?action=vieworderItem&id=${order.getId()}">View</a>
                        </td>
                        <td class="align-middle">
                            <a href="/manager-oder?action=orderapproval&id=${order.getId()}">Approval</a>
                        </td>
                        <td class="align-middle">
                            <a href="#"><i class="fa fa-edit" style="font-size:24px"></i></a>
                            <a href="#"  onclick="return confirm('Are you sure Order ${order.getId()} ?');"><i class="fa fa-times"style="font-size:24px; color: red;"></i></a>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
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