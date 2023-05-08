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
                <span class="breadcrumb-item active">List User</span>
            </nav>
        </div>
    </div>
</div>

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

<div class="container-fluid" style="padding-bottom: 10px;">
    <div class="row px-xl-5">
        <div class="col-6">
            <div class="dataTables_length" id="table4_length">
                <label>
                    <select id="idSlLimitEntries" name="table4_length" aria-controls="table4"
                            class="custom-select custom-select-sm form-control form-control-sm"
                            onchange="handleLimitEntries()">
                        <c:forEach items="${requestScope.numberOflines}" var="numberOfline">
                            <option value="${numberOfline}" <c:if
                                    test="${requestScope.recordsPerPage == numberOfline}"> selected</c:if>>${numberOfline}
                            </option>
                        </c:forEach>
                    </select></label>
            </div>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form action="/user" method="get">
                <div class="input-group">
                    <input name="q" value="${requestScope.q}" type="text" class="form-control" value="" placeholder="Search for Users" id="idTxtSearch">
                    <div class="input-group-append">
                        <button style="border: none;padding: 0px;" id="submit" type="submit">
                            <span class="input-group-text bg-transparent text-primary" style="padding: 10px;">
                                <i class="fa fa-search" style=""></i>
                            </span>
                        </button>
                    </div>
                </div>
            </form>
        </div></div>
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
                    <th>Fullname</th>
                    <th>DateOfBirth</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Picture</th>
                    <th>Role</th>
                    <th>Password</th>
                    <th>Created</th>
                    <th>Updated</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach items="${requestScope.users}" var="user">
                    <tr>
                        <td class="align-middle">${user.getId()}</td>
                        <td class="align-middle">${user.getFullName()}</td>
                        <td class="align-middle">${user.getBirthDay()}</td>
                        <td class="align-middle">${user.getPhoneNumber()}</td>
                        <td class="align-middle">${user.getEmail()}</td>
                        <td class="align-middle">${user.getAddress()}</td>
                        <td class="align-middle"><img src="${user.getImage()}" alt="image" style="width: 50px;"></td>
                        <td class="align-middle">${user.getRole()}</td>
                        <td class="align-middle">${user.getPassword()}</td>
                        <td class="align-middle">${user.getCreatedTime()}</td>
                        <c:choose>
                            <c:when test="${user.getUpdatedTime()==null}">
                                <td class="align-middle"></td>
                            </c:when>
                            <c:otherwise>
                                <td class="align-middle">${user.getUpdatedTime()}</td>
                            </c:otherwise>
                        </c:choose>
                        <td class="align-middle">
                            <a href="/user?action=edituser&id=${user.getId()}"><i class="fa fa-edit"
                                                                                  style="font-size:24px"></i>
                            </a>
                            <a href="/user?action=removeuser&id=${user.getId()}"
                               onclick="return confirm('Are you sure remove ${user.getFullName()}?');"><i
                                    class="fa fa-times"
                                    style="font-size:24px; color: red;"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <ul class="pagination justify-content-center" style="">
                <c:if test="${currentPage != 1}">
                    <li class="page-item"> <a class="page-link" href="/user?page=${1}&q=${requestScope.q}&table4_length=${requestScope.recordsPerPage}">Previous</a></li>
                </c:if>
                <c:forEach begin="${requestScope.start}" end="${requestScope.end}" var="i">
                    <c:choose>
                        <c:when test="${currentPage eq i}">
                            <li class="page-item active"><a class="page-link active">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                <li class="page-item"><a class="page-link" href="/user?page=${i}&q=${requestScope.q}&table4_length=${requestScope.recordsPerPage}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage lt noOfPages}">
                <li class="page-item"><a class="page-link" href="/user?page=${noOfPages}&q=${requestScope.q}&table4_length=${requestScope.recordsPerPage}">
                    Next
                    </a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
<!-- Cart End -->
<!-- Footer Start -->

<jsp:include page="/WEB-INF/customer/footer.jsp"></jsp:include>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<script>
    function handleLimitEntries() {
        let limitEntries = document.getElementById("idSlLimitEntries").value;
        let txtSearch = document.getElementById("idTxtSearch").value;

        <%--let url = `/user?table4_length=${limitEntries}&q=${txtSearch}`;--%>
        <%--console.log(url)--%>
        let url1 = "/user?table4_length=" + limitEntries + "&q=" + txtSearch;
        window.location.assign(url1)
    }
</script>
</body>

</html>