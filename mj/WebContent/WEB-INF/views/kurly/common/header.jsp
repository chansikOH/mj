<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="navbar navbar-reverse">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${!empty LOGINCUSTOMER }">
						<c:choose>
							<c:when test="${LOGINCUSTOMER.status eq '관리자' }">
								<li><a href="" class="dropdown-toggle nav-top"
									data-toggle="dropdown"><span class="badge">${LOGINCUSTOMER.status }</span>${LOGINCUSTOMER.name }님<span class="caret"></span>
									</a>
									<ul class="dropdown-menu nav-top-center">
										<li><a href="/mj/kurly/admin/productManagement.hta">관리페이지</a></li>
										<li><a href="/mj/kurly/customers/logout.hta">로그아웃</a></li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
						<li><a href="" class="dropdown-toggle nav-top"
							data-toggle="dropdown"><span class="badge">${LOGINCUSTOMER.gra }</span>${LOGINCUSTOMER.name }님<span class="caret"></span>
							</a>
							<ul class="dropdown-menu nav-top-center">
								<li><a href="/mj/kurly/mypage/orderlist.hta">주문내역</a></li>
								<li><a href="/mj/kurly/mypage/wishlist.hta">늘사는것</a></li>
								<li><a href="/mj/kurly/mypage/viewBeforeList.hta">상품후기</a></li>
								<li><a href="/mj/kurly/mypage/mypoint.hta">적립금</a></li>
								<li><a href="/mj/kurly/mypage/confirmpwd.hta">개인정보수정</a></li>
								<li><a href="/mj/kurly/customers/logout.hta">로그아웃</a></li>
							</ul>
						</li>
							</c:otherwise>
					</c:choose>
					</c:when>
					<c:otherwise>
						<li><a href="/mj/kurly/customers/addCustomer.hta" class="nav-top">회원가입</a></li>
						<li><a href="/mj/kurly/customers/loginform.hta" class="nav-top">로그인</a></li>
					</c:otherwise>
				</c:choose>
					<li class="dropdown"><a href="/mj/kurly/center/notice.hta"
						class="dropdown-toggle nav-top" data-toggle="dropdown">고객센터<span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu nav-top-center">
							<li><a href="/mj/kurly/center/notice.hta?pno=1">공지사항</a></li>
							<li><a href="/mj/kurly/center/frequent.hta">자주하는 질문</a></li>
							<li><a href="/mj/kurly/center/qna.hta?pno=1">1:1문의</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2 col-sm-offset-5">
				<a href="/mj/kurly/main.hta"><img
					src="/mj/images/header_footer/logo01.png" class="header-logo">
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<nav  data-spy="affix" data-offset-top="90">
			<div class="row" style="background-color: white;">
				<div class="col-sm-10 col-sm-offset-2" >
					<ul class="nav navbar-nav">
	                        <li class="dropdown">
	                            <a href="" class="dropdown-toggle header-menu" data-toggle="dropdown"><img class="header-img" src="/mj/images/header_footer/ico_gnb_all.png" width="20px" height="20px"> 전체카테고리<span class="caret"></span>
	                            </a>
		                        <ul class="dropdown-menu multi-level" aria-labelledby="dropdownMenu">
	                            <c:forEach var="menucat" items="${MENUCATS }">
		                                <li class="dropdown-submenu header-menu"><a tabindex="-1" href="/mj/kurly/product/list.hta?pno=1&catNo=${menucat.parentCat.no }&page=cate"><img class="header-img" src="/mj/images/header_footer/${menucat.parentCat.img }" width="30px" height="30px" align="left">${menucat.parentCat.name }</a>
		                                    <ul class="dropdown-menu submenu">
		                                    	<c:forEach var="childCategory" items="${menucat.childCatList }">
			                                        <li><a tabindex="-1" href="/mj/kurly/product/list.hta?pno=1&catNo=${childCategory.no }&page=cate">${childCategory.name }</a></li>
		                                    	</c:forEach>
		                                    </ul>
		                                </li>
	                            </c:forEach>
	                            </ul>
	                        </li>
	                        <li><a href="/mj/kurly/product/list.hta?pno=1&page=new" class="header-menu">신상품</a></li>
	                        <li><a href="/mj/kurly/product/list.hta?pno=1&page=best" class="header-menu">베스트</a></li>
	                        <li><a href="/mj/kurly/product/list.hta?pno=1&page=sale" class="header-menu">알뜰상품</a></li>
	                    </ul>
					<form class="navbar-form " onsubmit="globalSearch(event)" role="search" id="header-seach-form"  method="get" action="/mj/kurly/admin/searchPage.hta" >
						<div class="form-group">
							<input name="pno" type="hidden" class="form-control" value="1">
							<input name="keyword" type="text" class="form-control" placeholder="search" id="global-search-keyword">
						</div>
						<button  type="submit" class="btn search-btn">
							<span class="glyphicon glyphicon-search" style="margin-right: 10px;"></span>
						</button>
						<a href="/mj/kurly/orders/cart.hta" onclick="isLogin(event,'${LOGINCUSTOMER.id }')"><img src="/mj/images/header_footer/ico_cart_x2.jpg" class="cart-icon"><span class="badge" id="header-cart-badge">${headCartCount }</span></a>
					</form>
				</div>
			</div>
		</nav>
	</div>
	</div>
<script type="text/javascript">
	function globalSearch(event) {
		var content = document.getElementById("global-search-keyword").value;
		if (content == '') {
			event.preventDefault();
			alert("검색어를 입력하세요");
		}
	}
	
	function isLogin(event, custId) {
		if(custId == null || custId == "") {
			event.preventDefault();
			alert("로그인 후에 이용해주세요.");
		}
	}
</script>