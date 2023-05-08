<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/29/2022
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
  <link rel="stylesheet" href="/admin1/css/login.css">
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
  <title>Sign in</title>
  <style>

  </style>
</head>

<body>
<div class="main">
  <p class="sign" align="center">Sign in</p>
  <form class="form1" method="post">
    <c:if test="${requestScope.messagesuccess!=null}">
      <div class="alert alert-primary">
          ${requestScope.messagesuccess}
      </div>
    </c:if>
    <c:if test="${requestScope.message != null}">
      <div class="alert alert-success">
        <h3>${requestScope.message}</h3>
      </div>
    </c:if>
    <c:if test="${requestScope.errors!=null}">
      <div class="alert alert-danger" role="alert">
        <ul>
          <c:forEach items="${requestScope.errors}" var="error">
            <li>${error}</li>
          </c:forEach>
        </ul>
      </div>
    </c:if>
    <input class="un " type="text" align="center" name="email" placeholder="Email">
    <input class="pass" type="password" align="center" name="password" placeholder="Password">
    <button class="submit" align="center">Sign in</button>
    <p class="forgot" align="center"><a href="#">Forgot Password? </a> </p>
    <p align="center" >Do not have an account?</p>
  </form>
  <a href="/signup"><button class="submit" align="center" >Sign Up</button></a>
</div>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</body>

</html>
