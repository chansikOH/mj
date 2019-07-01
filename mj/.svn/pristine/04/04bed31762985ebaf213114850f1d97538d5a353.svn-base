<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>민지 컬리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.main-banner {
	width: 100%;
	height: 300px;
}

.main-name {
	margin-top: 80px;
	display: block;
	text-align: center;
}

.main-thumbnail {
	border: 0;
	position: relative;
}

.main-pro {
	text-decoration: none !important;
}

.main-box {
	width: 70px;
	position: absolute;
	top: 5px;
	left: 5px;
}
.list-cart{
            width: 50px;
            position: absolute;
            right: 30px;
            bottom: 0px;
        }

 a{
 	text-decoration: none !important;
 }
<%@ include file="common/head-foot-style.jsp"%>
</style>
</head>
<body>
	<%@ include file="common/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div  id="myCarousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
			<div class="col-sm-12 item active">
				<img src="../images/main/banner1.jpg" class="main-banner">
			</div>
			<div class="col-sm-12 item">
				<img src="../images/main/banner2.jpg" class="main-banner">
			</div>
			<div class="col-sm-12 item">
				<img src="../images/main/banner3.jpg" class="main-banner">
			</div>
			</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h2 class="main-name">이 상품 어때요?</h2>
			</div>
			<c:forEach var="likesProduct" items="${likesProducts }" >
			<div class="col-sm-3">
				<div class="thumbnail main-thumbnail">
					<a href="/mj/kurly/product/detail.hta?proNo=${likesProduct.no }"><img src="../images/product/${likesProduct.img }" class="main-pro">
						<c:choose>
							<c:when test="${likesProduct.discount > 0}">
								<div>
									<img src="../images/list/icon${likesProduct.discount }.jpg" class="main-box">
								</div>
							</c:when>
						</c:choose>
						<div class="caption">
							<h5>${likesProduct.name }</h5>
							<c:choose>
								<c:when test="${likesProduct.discount > 0}">
									<p>
									<strong>${likesProduct.discountPrice }원</strong>
									</p>						
									<p class="line-through">${likesProduct.price }원</p>
								</c:when>
								<c:otherwise>
									<p>
										<strong>${likesProduct.price }원</strong>
									</p>						
								</c:otherwise>
							</c:choose>
						</div>
					</a>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<h2 class="main-name">알뜰상품</h2>
			</div>
			<c:forEach var="saleProduct" items="${saleProducts }" >
			<div class="col-sm-3">
				<div class="thumbnail main-thumbnail">
					<a href="/mj/kurly/product/detail.hta?proNo=${saleProduct.no }"><img src="../images/product/${saleProduct.img }" class="main-pro">
						<c:choose>
							<c:when test="${saleProduct.discount > 0}">
								<div>
									<img src="../images/list/icon${saleProduct.discount }.jpg" class="main-box">
								</div>
							</c:when>
						</c:choose>
						<div class="caption">
							<h5>${saleProduct.name }</h5>
							<c:choose>
								<c:when test="${saleProduct.discount > 0}">
									<p>
									<strong>${saleProduct.discountPrice }원</strong>
									</p>						
									<p class="line-through">${saleProduct.price }원</p>
								</c:when>
								<c:otherwise>
									<p>
										<strong>${saleProduct.price }원</strong>
									</p>						
								</c:otherwise>
							</c:choose>
						</div>
					</a>
				</div>
			</div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<h2 class="main-name">베스트상품</h2>
			</div>
			<c:forEach var="bestProduct" items="${bestProducts}">
			<div class="col-sm-3">
				<div class="thumbnail main-thumbnail">
					<a href="/mj/kurly/product/detail.hta?proNo=${bestProduct.no }"> <img src="../images/product/${bestProduct.img }" class="main-pro">
						<c:choose>
							<c:when test="${bestProduct.discount > 0}">
								<div>
									<img src="../images/list/icon${bestProduct.discount }.jpg" class="main-box">
								</div>
							</c:when>
						</c:choose>
						<div class="caption">
							<h5>${bestProduct.name }</h5>
							<c:choose>
							<c:when test="${bestProduct.discount > 0}">
							<p>
								<strong>${bestProduct.discountPrice }원</strong>
							</p>
							<p class="line-through">${bestProduct.price }원</p>
							</c:when>
							<c:otherwise>
							<p>
								<strong>${bestProduct.price }원</strong>
							</p>
							</c:otherwise>
							</c:choose>
						</div>
					</a>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="common/footer.jsp"%>
	
	
</body>
</html>