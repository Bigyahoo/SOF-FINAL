<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>SOF Food - Đặt Đồ Ăn Nhanh</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body{
    background:#f8f9fa;
}

/* HEADER */
header{
    background:#ff6600;
    color:white;
    padding:15px 50px;

    display:flex;
    justify-content:space-between;
    align-items:center;
}

.logo{
    font-size:28px;
    font-weight:bold;
}

nav{
    display:flex;
    align-items:center;
    gap:20px;
}

nav a{
    color:white;
    text-decoration:none;
    font-weight:bold;
}

nav a:hover{
    text-decoration:underline;
}

.user-info{
    font-weight:bold;
}

/* HERO */
.hero{
    height:70vh;

    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;

    text-align:center;

    background:linear-gradient(
            rgba(0,0,0,0.4),
            rgba(0,0,0,0.4)
        ),
        url('https://images.unsplash.com/photo-1504674900247-0877df9cc836');

    background-size:cover;
    background-position:center;

    color:white;
}

.hero h1{
    font-size:56px;
    margin-bottom:15px;
}

.hero p{
    font-size:22px;
    margin-bottom:30px;
}

.btn{
    background:#ff6600;
    color:white;
    text-decoration:none;

    padding:15px 30px;

    border-radius:8px;

    font-weight:bold;
}

.btn:hover{
    background:#e65c00;
}

/* SECTION */
.section{
    padding:60px 10%;
}

.section-title{
    text-align:center;
    margin-bottom:40px;
    font-size:36px;
}

/* FOOD LIST */
.food-container{
    display:flex;
    justify-content:center;
    gap:30px;
    flex-wrap:wrap;
}

.card{
    width:280px;

    background:white;

    border-radius:12px;

    overflow:hidden;

    box-shadow:0 3px 10px rgba(0,0,0,0.15);
}

.card img{
    width:100%;
    height:180px;
    object-fit:cover;
}

.card-body{
    padding:20px;
}

.card-body h3{
    margin-bottom:10px;
}

.price{
    color:#ff6600;
    font-size:20px;
    font-weight:bold;
}

.order-btn{
    display:inline-block;

    margin-top:15px;

    background:#ff6600;

    color:white;

    text-decoration:none;

    padding:8px 16px;

    border-radius:5px;
}

/* FOOTER */
footer{
    background:#222;
    color:white;

    text-align:center;

    padding:25px;
}

</style>
</head>

<body>

<header>

    <div class="logo">
        🍔 SOF FOOD
    </div>

    <nav>

        <a href="${pageContext.request.contextPath}/">
            Trang chủ
        </a>

        <a href="#">
            Thực đơn
        </a>

        <a href="#">
            Khuyến mãi
        </a>

        <a href="#">
            Liên hệ
        </a>

        <c:choose>

            <c:when test="${sessionScope.user != null}">

                <span class="user-info">
                    Xin chào,
                    ${sessionScope.user.fullName}
                </span>

                <a href="${pageContext.request.contextPath}/logout">
                    Đăng xuất
                </a>

            </c:when>

            <c:otherwise>

                <a href="${pageContext.request.contextPath}/login.jsp">
                    Đăng nhập
                </a>

            </c:otherwise>

        </c:choose>

    </nav>

</header>

<!-- HERO -->
<section class="hero">

    <h1>Đặt Đồ Ăn Nhanh Trực Tuyến</h1>

    <p>
        Giao hàng nhanh chóng - Thanh toán tiện lợi - Món ăn chất lượng
    </p>

    <a href="#" class="btn">
        Đặt Món Ngay
    </a>

</section>

<!-- POPULAR FOOD -->
<section class="section">

    <h2 class="section-title">
        Món Ăn Nổi Bật
    </h2>

    <div class="food-container">

        <div class="card">

            <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd">

            <div class="card-body">

                <h3>Burger Bò Phô Mai</h3>

                <p class="price">
                    89.000 VNĐ
                </p>

                <a href="#" class="order-btn">
                    Đặt món
                </a>

            </div>

        </div>

        <div class="card">

            <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591">

            <div class="card-body">

                <h3>Pizza Hải Sản</h3>

                <p class="price">
                    199.000 VNĐ
                </p>

                <a href="#" class="order-btn">
                    Đặt món
                </a>

            </div>

        </div>

        <div class="card">

            <img src="https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58">

            <div class="card-body">

                <h3>Gà Rán Giòn Cay</h3>

                <p class="price">
                    129.000 VNĐ
                </p>

                <a href="#" class="order-btn">
                    Đặt món
                </a>

            </div>

        </div>

    </div>

</section>

<footer>

    <p>
        © 2025 SOF Food Ordering System
    </p>

</footer>

</body>
</html>