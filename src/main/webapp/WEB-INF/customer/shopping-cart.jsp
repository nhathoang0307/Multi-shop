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
<jsp:include page="/WEB-INF/customer/topnav.jsp"></jsp:include>

<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Shopping Cart</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->

<!-- Cart Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table class="table table-light table-borderless table-hover text-center mb-0">
                <thead class="thead-dark">
                <tr>
                    <th>Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach items="${requestScope.carts}" var="cart">
                    <tr>
                        <td class="align-middle" style="text-align: left;"><img src="${cart.getImage()}" alt="" style="width: 50px;">${cart.getProductName()}</td>
                        <td class="align-middle">$${cart.getPrice()}</td>
                        <td class="align-middle">
                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                <div class="input-group-btn">
                                    <a href="/cart?action=sub&id=${cart.getProductId()}">
                                    <button class="btn btn-sm btn-primary btn-minus">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                    </a>
                                </div>
                                <input type="text" min="0" name="quatity"
                                       class="form-control form-control-sm bg-secondary border-0 text-center"
                                       value="${cart.getQuantity()}" disabled>
                                <div class="input-group-btn">
                                    <a href="/cart?action=add&id=${cart.getProductId()}">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td class="align-middle">$${cart.getPrice()*cart.getQuantity()}</td>
                        <td class="align-middle"><a href="/cart?action=removeOne&id=${cart.getProductId()}">
                            <button class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button>
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <form class="mb-30" action="">
                <div class="input-group">
                    <input type="text" class="form-control border-0 p-4" placeholder="Coupon Code">
                    <div class="input-group-append">
                        <button class="btn btn-primary">Apply Coupon</button>
                    </div>
                </div>
            </form>
            <h5 class="section-title position-relative text-uppercase mb-3"><span
                    class="bg-secondary pr-3">Cart Summary</span></h5>
            <div class="bg-light p-30 mb-5">
                <div class="border-bottom pb-2">
                    <div class="d-flex justify-content-between mb-3" style="display: flex">
                        <h6>Subtotal</h6>
                        <h6>$${requestScope.total}</h6>
                    </div>
                    <div class="d-flex justify-content-between" style="display: flex">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">$10</h6>
                    </div>
                </div>
                <div class="pt-2">
                    <div class="d-flex justify-content-between mt-2" style="display: flex">
                        <h5>Total</h5>
                        <h5>$${requestScope.totalFee}</h5>
                    </div>
                    <a href="/checkout"><button class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</button></a>
                </div>
            </div>
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