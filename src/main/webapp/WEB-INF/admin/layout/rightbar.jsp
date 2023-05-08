<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>

<div id="extra">
    <div class="extra1">
        <div class="extra2">
            <div class="tittle">Tổng User</div>
            <div class="value"><%=request.getParameter("totalUser")%></div>
        </div>
    </div>
    <div class="extra1">
        <div class="extra2">
            <div class="tittle">Tổng Khách Hàng</div>
            <div class="value"><%=request.getParameter("totalCustomer")%></div>
        </div>
    </div>
    <div class="extra1">
        <div class="extra2">
            <div class="tittle">Số Sản Phẩm</div>
            <div class="value"><%=request.getParameter("totalProduct")%></div>
        </div>
    </div>
    <div class="extra1">
        <div class="extra2">
            <div class="tittle">Tổng Đơn Hàng</div>
            <div class="value"><%=request.getParameter("totalOrder")%></div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
    $(document).ready(function () {
        $('.sub-menu').parent('li').addClass('has-child');
    })
</script>