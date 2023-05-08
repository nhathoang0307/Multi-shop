<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .menuu {
        padding-right: 20px;
    }
</style>
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
            <a href="/home" class="text-decoration-none active">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form action="#" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" value="${requestScope.searchStr}"
                           placeholder="Search for products" name="inputSearch">
                    <div class="input-group-append">
                        <button style="border: none;padding: 0px;">
                            <span class="input-group-text bg-transparent text-primary" style="padding: 10px;">
                                <i class="fa fa-search" style=""></i>
                            </span>
                        </button>
                    </div>
                </div>
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
        <div class="col-lg-12">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0" style="padding-left: 25%">
                        <div class="nav-item dropdown menuu">
                            <a href="/home" class="nav-item nav-link">Home</a>
                        </div>
                        <div class="nav-item dropdown menuu">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">User
                                <i class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="/user" class="dropdown-item">List User</a>
                                <a href="/user?action=create" class="dropdown-item">Add User</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown menuu">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Customer
                                <i class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="/manager-customer?action=listNewcustomer" class="dropdown-item">List New Customer</a>
                                <a href="/manager-customer?action=listcustomer" class="dropdown-item">List All Customer</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown menuu">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Product
                                <i class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="/product" class="dropdown-item">List Product</a>
                                <a href="/product?action=create" class="dropdown-item">Add Product</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown menuu">
                            <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Order
                                <i class="fa fa-angle-down mt-1"></i></a>
                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
                                <a href="/manager-oder" class="dropdown-item">Pending</a>
                                <a href="/manager-oder?action=listorderTransport" class="dropdown-item">Shipping</a>
                                <a href="/manager-oder?action=listorderDone" class="dropdown-item">Finish</a>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->

<div class="container-fluid">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <a href="/user"><div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h3 class="text-primary m-0 mr-3" style="text-align: center;">User Total</h3>
                <h1 class="m-0 mr-3" style="text-align: center;"><%=request.getParameter("totalUser")%></h1></div></a>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <a href="/manager-customer?action=listcustomer"><div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h3 class="text-primary m-0 mr-3" style="text-align: center;">Customer Total</h3>
                <h1 class="m-0 mr-3" style="text-align: center;"><%=request.getParameter("totalCustomer")%> </h1></div></a>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <a href="/product"><div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h3 class="text-primary m-0 mr-3" style="text-align: center;">Product Total</h3>
                <h1 class="m-0 mr-3" style="text-align: center;"><%=request.getParameter("totalProduct")%></h1></div></a>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <a href="/manager-oder"><div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                <h3 class="text-primary m-0 mr-3" style="text-align: center;">Order Total</h3>
                <h1 class="m-0 mr-3" style="text-align: center;"><%=request.getParameter("totalOrder")%></h1></div></a>
        </div>
    </div>
</div>


