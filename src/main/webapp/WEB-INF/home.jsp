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
<!-- Topbar Start -->
<jsp:include page="/WEB-INF/customer/topnav.jsp"></jsp:include>

<!-- Products Start -->
<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Featured Products</span>
    </h2>
    <div class="container-fluid" style="padding-bottom: 10px;">
        <div class="row px-xl-5">
            <div class="col-12" style="padding: 0px;text-align: right;">
                <label>
                    <select id="idSlLimitEntries" name="table4_length" aria-controls="table4" class="custom-select custom-select-sm form-control form-control-sm" onchange="handleLimitEntries()">
                        <option selected>Sort</option>
                        <c:forEach items="${requestScope.values}" var="value">
                            <option value="${value}" <c:if test="${requestScope.info == value}"> selected</c:if>>
                                    ${value}
                            </option>
                        </c:forEach>
                    </select></label>
            </div>
        </div>
    </div>
    <script>
        function handleLimitEntries() {
            let limitEntries = document.getElementById("idSlLimitEntries").value;
            let txtSearch = document.getElementById("idTxtSearch").value;

            let url1 = "/trangchu?action=" + limitEntries + "&inputSearch=" + txtSearch;
            window.location.assign(url1)
        }
    </script>
    <div class="row px-xl-5">
        <div class="toast" data-autohide="true" style="position: fixed; top: 10px; right: 10px; z-index: 1000000">
            <div class="toast-header">
                <strong class="mr-auto text-primary">Shopping Cart</strong>
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
        <c:forEach items="${requestScope.products}" var="product">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="${product.getImage()}" alt="">
                        <div class="product-action">
                            <form action="/trangchu?action=addtocart" method="post" style="display: flex;">
                                <a class="btn btn-outline-dark btn-square">
                                    <button style="margin-left: -10px;border: none;background: none;" name="id"
                                            value="${product.getId()}"><i class="fa fa-shopping-cart"></i></button>
                                </a>
                                <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                                <input type="hidden" name="option" value="${requestScope.info}">
                                <input type="hidden" name="search" value="${requestScope.searchStr}">
                            </form>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="#">${product.getName()}</a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5>$${product.getPrice()}</h5>
                            <h6 class="text-muted ml-2">
                                <del>$1000.00</del>
                            </h6>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small>(99)</small>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!-- Products End -->


<!-- Offer Start -->
<div class="container-fluid pt-5 pb-3">
    <div class="row px-xl-5">
        <div class="col-md-6">
            <div class="product-offer mb-30" style="height: 300px;">
                <img class="img-fluid" src="/admin1/img/offer-1.jpg" alt="">
                <div class="offer-text">
                    <h6 class="text-white text-uppercase">Save 20%</h6>
                    <h3 class="text-white mb-3">Special Offer</h3>
                    <a href="#" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="product-offer mb-30" style="height: 300px;">
                <img class="img-fluid" src="/admin1/img/offer-2.jpg" alt="">
                <div class="offer-text">
                    <h6 class="text-white text-uppercase">Save 20%</h6>
                    <h3 class="text-white mb-3">Special Offer</h3>
                    <a href="#" class="btn btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Offer End -->


<!-- Products Start -->
<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Recent Products</span>
    </h2>
    <div class="row px-xl-5">
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-1.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-2.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-3.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <small class="far fa-star text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-4.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="far fa-star text-primary mr-1"></small>
                        <small class="far fa-star text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-5.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-6.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-7.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <small class="far fa-star text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" src="/admin1/img/product-8.jpg" alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="far fa-heart"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-sync-alt"></i></a>
                        <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="#">Product Name Goes Here</a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5>$123.00</h5>
                        <h6 class="text-muted ml-2">
                            <del>$123.00</del>
                        </h6>
                    </div>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <small class="far fa-star text-primary mr-1"></small>
                        <small class="far fa-star text-primary mr-1"></small>
                        <small>(99)</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Vendor Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel vendor-carousel">
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-1.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-2.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-3.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-4.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-5.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-6.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-7.jpg" alt="">
                </div>
                <div class="bg-light p-4">
                    <img src="/admin1/img/vendor-8.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Vendor End -->
<!-- Products End -->

<jsp:include page="/WEB-INF/customer/footer.jsp"></jsp:include>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

</body>

</html>