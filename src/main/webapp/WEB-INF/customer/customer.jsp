<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <title>Case Study - Quản Lí Sản Phẩm</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css  ">
    <link rel="stylesheet" href="/admin1/css/menu.css">
    <link rel="stylesheet" href="/admin1/css/customer.css">
    <style>

        #main {
            width: auto;
            height: auto;
            margin-left: 1%;
        }
        img {
            width: 50px;
        }
    </style>
</head>

<body>
<div id="wrapper">
    <jsp:include page="/WEB-INF/customer/topnav.jsp"></jsp:include>
    <div id="content">
        <div id="main">
            <section class="wrapper">
                <div class="products">
                    <ul>
                        <li class="main-product">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Mũi Hàn 500</h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">25000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                        <li class="main-product">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Trạm Hàn Hakko 942 75W 200-480*C 220VAC Cực Nóng</h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">1299000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                        <li class="main-product">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Máy Bơm Chìm Hộ Gia Đình QDX 1500W 220VAC 40L/1min H=8m</h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">1599000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                        <li class="main-product no-margin">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Module DIY Sạc Không Dây Qi IOS/Androi - Bộ phát V2</h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">89000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                        <li class="main-product">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Bộ Điều Chỉnh Điện Áp CHLVFU SDTY-200P 20KW 200A (BH 06 Tháng)
                                </h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">2199000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                        <li class="main-product">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Module ISD1760 Thu Âm Thanh - Phát Âm Thanh 75s</h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">115000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                        <li class="main-product">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Raspberry Pi 3 E14 Model B Plus B+ 2.4G/5G Bluetooth</h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">1295000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                        <li class="main-product no-margin">
                            <div class="img-product">
                                <img class="img-prd"
                                     src="https://cdn.tgdd.vn/Products/Images/44/239552/macbook-air-m1-2020-gold-600x600.jpg"
                                     alt="">
                            </div>
                            <div class="content-product">
                                <h3 class="content-product-h3">Module IOT ESP8266 ESP-12E CH340 V3</h3>
                                <div class="content-product-deltals">
                                    <div class="price">
                                        <span class="money">85000đ</span>
                                    </div>
                                    <button type="button" class="btn btn-cart">Thêm Vào Giỏ</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>

        </div>


    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
    $(document).ready(function () {
        $('.sub-menu').parent('li').addClass('has-child');
    })
</script>
</body>


</html>