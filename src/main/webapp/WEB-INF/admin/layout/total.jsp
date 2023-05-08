<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/9/2023
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="/WEB-INF/admin/layout/rightbar.jsp">
  <jsp:param name="totalUser" value="${applicationScope.listUser.size()}"/>
  <jsp:param name="totalCustomer" value="${applicationScope.listCustomer.size()}"/>
  <jsp:param name="totalProduct" value="${applicationScope.listProduct.size()}"/>
  <jsp:param name="totalOrder" value="${applicationScope.listOrder.size()}"/>
</jsp:include>