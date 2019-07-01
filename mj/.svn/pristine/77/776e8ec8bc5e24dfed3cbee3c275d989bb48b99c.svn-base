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
.tit {
	padding: 5px 0 10px;
	font-weight: 600;
	font-size: 40px;
	color: #4e266d;
	line-height: 1.5;
	text-align: center;
}

.desc {
	padding-bottom: 40px;
	font-weight: 300;
	font-size: 12px;
	color: #4c4c4c;
	line-height: 1px;
	text-align: center;
}

.search-box {
	border-top: 2px solid;
	border-bottom: 1px solid;
	border-color: purple;
	padding-top: 30px;
	padding-bottom: 20px;
}

.search-button {
	width: 175px;
	height: 45px;
	background-color: #512772;
	color: #fff;
	line-height: 45px;
	border-style: none;
}

.search-amount {
	padding: 130px 0px 0px 0px;
	border-bottom: 1px solid #ccc;
	font-size: 13px;
	color: #4c4c4c
}

.page {
	text-align: center;
	margin-top: 30px;
}

.pagination>li>a {
	color: #555;
}

.pagination>li>a:hover {
	color: purple;
}

.pagination>li.active>a, .pagination>li.active>a:hover {
	background-color: #F6F6F6;
	border: 1px solid #aaa;
	color: purple;
}

.pagination>.active {
	background-color: #aaa;
}

.list-cat-icon {
	width: 50px;
	margin-top: 30px
}

.cat-par-text {
	position: absolute;
	bottom: 3px;
}

.list-nav-tabs {
	font-size: 12px;
	border-bottom: 1px solid #ddd;
	margin-top: 15px;
}

.list-nav-tabs>li.active {
	border-bottom: 1px solid purple;
}

.list-nav-tabs>li.active>a, .nav-tabs>li.active>a:hover {
	font-weight: bold;
	color: purple;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}

.list-nav-tabs>li>a:hover {
	background-color: white;
	color: purple;
	font-weight: bold;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}

.list-nav-tabs>li>a {
	color: black;
	padding-bottom: 3px;
}

.list-pro {
	text-decoration: none !important;
}

.list-box {
	width: 80px;
	position: absolute;
	top: 35px;
	left: 20px;
}

.list-thumbnail {
	margin-top: 30px;
	border: 0px;
}

.list-cart {
	width: 50px;
	position: absolute;
	right: 30px;
	bottom: 0px;
}
.list-cart-empty {
	width: 50px;
	position: absolute;
	right: 30px;
	bottom: 0px;
}

.list-paging {
	text-align: center;
}

.list-pagination>li>a {
	color: #555;
}

.list-pagination>li>a:hover {
	color: purple;
	font-weight: bold;
}

.list-pagination>li.active>a, .pagination>li.active>a:hover {
	background-color: #aaa;
	border: 1px solid #aaa;
	color: purple;
	font-weight: bold;
}

.list-orderby {
	position: absolute !important;
	width: 130px;
	font-size: 12px;
	border: transparent;
}
.doubleLine-Price{
	margin-top: 10px;
}
.row > .col-sm-4{
	height: 600px;
}
.searchPageImg:hover{
	opacity: 0.5;
}
<%@ include file="../common/head-foot-style.jsp" %>
</style>
</head>

<body>
<%@ include file="../common/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<h2 class="tit">상품검색</h2>
				<p class="desc">신선한 컬리의상품을 검색해 보세요</p>
			</div>
		</div>
		<form class="form-inline" action="searchPage.hta" id="list-form">
		<input type="hidden" name="pno" id="page-no"/>
		<div class="row">
			<div class="col-sm-12 search-box">
					<div>
						<label class="col-sm-2 control-label" style="margin-top: 10px;">검색어</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name='keyword' style="height: 42px; width: 100%;" value="${keyword }">
						</div>
						<div class="col-sm-2">
							<input type="submit" class="search-button" onclick="sendform(1);" value="검색하기">
						</div>
					</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<p class="search-amount">
					<strong>총</strong><span>${pagination.records }</span><strong>개의 상품이 검색되었습니다.</strong>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
				<c:choose>
					<c:when test="${not empty products }">
						<c:forEach var="product" items="${products}">
							<div class="col-sm-4">
								<div class="thumbnail list-thumbnail">
									<a href="/mj/kurly/product/detail.hta?proNo=${product.no }" class="list-pro"> <img class="searchPageImg"
										src="../../images/product/${product.img }">
											<c:if test="${product.discount > 0 }">
												<div>
													<img src="../../images/list/icon${product.discount }.jpg" class="list-box">
												</div>
											</c:if>
											<div>
												<img src="../../images/list/cart-add-button_type2.jpg"
													class="list-cart img-circle" onclick="addProduct(event, ${product.no})">
											</div>
										<div class="caption">
											<h5>${product.name }</h5>
												<c:choose>
												<c:when test="${product.discount > 0 }">
													<div class="doubleLine-Price">
													<p>
														<strong>${product.discountPrice }원</strong>
													</p>						
													<p class="line-through">${product.price }원</p>
													</div>	
												</c:when>
												<c:otherwise>
												<p><strong>${product.price }원</strong></p>
												</c:otherwise>
												</c:choose>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
					<div class="row">
						<div class="col-sm-12">
							<div class="page">
								<ul class="pagination">
									<c:choose>
										<c:when test="${ pagination.first }">
											<li><a href="#" onclick="goPage(event, ${pagination.page})">&laquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="goPage(event, ${pagination.page -1})">&laquo;</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
										<c:choose>
											<c:when test="${num eq pagination.page }">
												<li class="active"><a href="" onclick="goPage(event, ${num})">${num }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="" onclick="goPage(event, ${num})">${num }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${ pagination.last }">
											<li><a href="#" onclick="goPage(event, ${pagination.page})">&raquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="goPage(event,${pagination.page + 1})">&raquo;</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<script type="text/javascript">
		function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit();
		}
		
		function goPage(event, pno) {
			event.preventDefault();	// a 태그 기본동작 발생 방지
			sendform(pno);
		}
		
		function addProduct(event, proNo) { 
			event.preventDefault();
	  		var xhr = new XMLHttpRequest();
	  		xhr.onreadystatechange = function() {
	  			if (xhr.readyState == 4 && xhr.status == 200) {
	  				var result = JSON.parse(xhr.responseText);
	  				if (result.success == "YES") {
						alert("상품이 장바구니에 담겼습니다.");
						document.getElementById("header-cart-badge").innerHTML = result.headCartCount;
					} else if(result.success == "No") {
						alert("처리 중 오류가 발생하였습니다.");
					} else if(result.success == "LoginFail") {
						alert("로그인 후 사용 가능합니다.");
					} else {
						alert("같은 상품이 장바구니에 존재합니다.");
					}
	  			}
	  		} 		
	  		xhr.open("GET","/mj/kurly/orders/addProduct.hta?cartAmount=1&proNo=" + proNo)
	  		xhr.send();	
	  	}
	</script>
<%@ include file="../common/footer.jsp"%>
</body>

</html>