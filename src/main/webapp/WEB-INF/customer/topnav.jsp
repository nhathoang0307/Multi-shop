<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid">
    <div class="row bg-secondary py-1 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center h-100">
                <a class="text-body mr-3" href="#">About</a>
                <a class="text-body mr-3" href="#">Contact</a>
                <a class="text-body mr-3" href="#">Help</a>
                <a class="text-body mr-3" href="#">FAQs</a>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <c:choose>
                    <c:when test="${sessionScope.user!=null}">
                        <div class="nav-item dropdown">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown"
                                    style="background-color: #ffc800 !important;"
                                    aria-expanded="false">${sessionScope.user.getFullName()}
                                <img src="${sessionScope.user.getImage()}"
                                     style="width: 30px;height: 30px; border-radius: 20px;">
                            </button>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0" style="">
                                <a href="/user?action=view" class="dropdown-item">Account Information</a>
                                <a href="/user?action=editInfo" class="dropdown-item">Change Information</a>
                                <a href="/user?action=viewHistoryOrder" class="dropdown-item">Order History</a>
                                <a href="/logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="input-group-append">
                            <a href="/login">
                                <button class="btn btn-primary">Sign In</button>
                            </a>
                        </div>
                        <div class="input-group-append" style="padding-left: 10px;">
                            <a href="/signup">
                                <button class="btn btn-primary">Register</button>
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <a class="text-dark px-2" href="#">
                    <i class="fab fa-facebook-f"></i>
                </a><a class="text-dark px-2" href="#">
                <i class="fab fa-twitter"></i>
            </a>
                <a class="text-dark px-2" href="#">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="#">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="#">
                    <i class="fab fa-youtube"></i>
                </a>
                <div class="d-inline-flex align-items-center d-block d-lg-none">
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-heart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle"
                              style="padding-bottom: 2px;">0</span>
                    </a>
                    <a href="" class="btn px-0 ml-2">
                        <i class="fas fa-shopping-cart text-dark"></i>
                        <span class="badge text-dark border border-dark rounded-circle"
                              style="padding-bottom: 2px;">0</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/trangchu" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form action="/trangchu?action=search" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" value="${requestScope.searchStr}"
                           placeholder="Search for products" name="inputSearch" id="idTxtSearch">
                    <div class="input-group-append">
                        <button style="border: none;padding: 0px;">
                            <span class="input-group-text bg-transparent text-primary" style="padding: 10px;">
                                <i class="fa fa-search" style=""></i>
                            </span>
                        </button>
                    </div>
                </div>
                <input type="hidden" name="option" value="${requestScope.info}">
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Customer Service</p>
            <h5 class="m-0">+012 345 6789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse"
               href="#" style="height: 65px; padding: 0 30px; position: relative;">
                <h6 class="text-dark m-0" style="padding-top: 20px; position: absolute;"><i class="fa fa-bars mr-2" ></i>Categories</h6>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <div class="nav-item dropdown dropright">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Dresses <i
                                class="fa fa-angle-right float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute rounded-0 border-0 m-0">
                            <a href="#" class="dropdown-item">Men's Dresses</a>
                            <a href="#" class="dropdown-item">Women's Dresses</a>
                            <a href="#" class="dropdown-item">Baby's Dresses</a>
                        </div>
                    </div>
                    <a href="#" class="nav-item nav-link">Shirts</a>
                    <a href="#" class="nav-item nav-link">Jeans</a>
                    <a href="#" class="nav-item nav-link">Swimwear</a>
                    <a href="#" class="nav-item nav-link">Sleepwear</a>
                    <a href="#" class="nav-item nav-link">Sportswear</a>
                    <a href="#" class="nav-item nav-link">Jumpsuits</a>
                    <a href="#" class="nav-item nav-link">Blazers</a>
                    <a href="#" class="nav-item nav-link">Jackets</a>
                    <a href="#" class="nav-item nav-link">Shoes</a>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="/trangchu" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                    <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a class="nav-item nav-link active" href="/trangchu" >Home</a>
                        <a href="#" class="nav-item nav-link">Shop</a>
                        <a href="#" class="nav-item nav-link">Shop Detail</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages <i
                                    class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="/cart" class="dropdown-item">Shopping Cart</a>
                                <a href="/checkout" class="dropdown-item">Checkout</a>
                            </div>
                        </div>
                        <a href="#" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                        <a href="/cart" class="btn px-0 ml-3">
                            <i class="fas fa-shopping-cart text-primary"></i>
                            <span class="badge text-secondary border border-secondary rounded-circle"
                                  style="padding-bottom: 2px;">${sessionScope.carts.size()}</span>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


