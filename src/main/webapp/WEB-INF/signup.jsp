<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/4/2023
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>Document</title>
    <style>
        .vh-100 {
            background-color: #F3EBF6;
            height: 100% !important;
        }

        .form-outline {
            padding-bottom: 10px;
        }


    </style>
</head>
<body>
<section class="vh-100">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body">
                            <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                            <c:if test="${requestScope.messagesuccess!=null}">
                                <div class="alert alert-primary">
                                        ${requestScope.messagesuccess}
                                </div>
                            </c:if>
                            <c:if test="${requestScope.errors.isEmpty() == false}">
                                <div class="alert alert-danger">
                                    <ul>
                                        <c:forEach items="${requestScope.errors}" var="error">
                                            <li>${error}</li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <form method="post" enctype="multipart/form-data">
                                <div class="form-outline ">
                                    <input value="${requestScope.newUser.getFullName()}" required name="fullName"
                                           type="text" id="form3Example1cg"
                                           class="form-control form-control-lg" placeholder="Nhập Họ Và Tên"/>
                                    <%--                                    <label class="form-label" for="form3Example1cg">Your Name</label>--%>
                                </div>
                                <div class="form-outline ">
                                    <input required name="birthDay" type="date" id="form3Example2cg"
                                           class="form-control form-control-lg"/>
                                    <%--                                    <label class="form-label" for="form3Example2cg">Birthday</label>--%>
                                </div>


                                <div class="form-outline ">
                                    <input required name="phoneNumber" type="number" id="form3Example3cg"
                                           class="form-control form-co  ntrol-lg" placeholder="Nhập Số Điện Thoại"/>
                                    <%--                                    <label class="form-label" for="form3Example3cg">Số Điện Thoại</label>--%>
                                </div>

                                <div class="form-outline ">
                                    <input required name="email" type="email" id="form3Example4cg"
                                           class="form-control form-co  ntrol-lg" placeholder="Nhập Email"/>
                                    <%--                                    <label class="form-label" for="form3Example3cg" >Your Email</label>--%>
                                </div>

                                <div class="form-outline ">
                                    <input required name="address" type="text" id="form3Example5cg"
                                           class="form-control form-control-lg" placeholder="Nhập Địa Chỉ"/>
                                    <%--                                    <label class="form-label" for="form3Example4cg">Địa Chỉ</label>--%>
                                </div>

                                <div class="form-outline ">
                                    <input required name="password" type="password" id="form3Example6cg"
                                           class="form-control form-control-lg" placeholder="Nhập Mật Khẩu"/>
                                    <%--                                    <label class="form-label" for="form3Example5cg">Password</label>--%>
                                </div>

                                <div class="form-outline mb-4">
                                    <input required name="password1" type="password" id="form3Example6cdg"
                                           class="form-control form-control-lg" placeholder="Nhập Lại Mật Khẩu"/>
                                    <%--                                    <label class="form-label" for="form3Example6cdg">Repeat your password</label>--%>
                                </div>

                                <div class="form-outline mb-4">
                                    <div>
                                        <%--                                    <form method="post" action="UploadFileServlet" enctype="multipart/form-data">--%>
                                        <label for="exampleFormControlFile1">Chọn Ảnh</label>
                                        <input name="file" type="file" size="60" class="form-control-file"
                                               id="exampleFormControlFile1" value="${requestScope.newUser.getImage()}">
                                        <%--                                    </form>--%>

                                    </div>
                                </div>
                                <div class="form-check d-flex justify-content-center mb-5">
                                    <input required class="form-check-input me-2" type="checkbox" value=""
                                           id="form2Example3cg"/>
                                    <label class="form-check-label">
                                        I agree all statements in <a href="#!" class="text-body"><u>Terms of
                                        service</u></a>
                                    </label>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button type="submit"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">
                                        Register
                                    </button>
                                </div>
                                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="/login"
                                                                                                        class="fw-bold text-body"><u>Login
                                    here</u></a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

</html>