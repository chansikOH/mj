<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>민지 컬리</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        .list-cat-icon{
            width: 50px;
            margin-top: 30px
        }
        .cat-par-text{position: absolute; bottom: 3px;}
        .list-nav-tabs{
            font-size: 12px;
            border-bottom: 1px solid #ddd;
            margin-top: 15px;
        }
        .list-nav-tabs > li.active {
            border-bottom : 1px solid purple;
        }
        .list-nav-tabs > li.active > a,  .nav-tabs > li.active > a:hover{
            font-weight: bold;
            color: purple;
            border-top: 0;
            border-left: 0;
            border-right: 0;
        }
        .list-nav-tabs > li > a:hover {
            background-color: white;
            color: purple;
            font-weight: bold;
            border-top: 0;
            border-left: 0;
            border-right: 0;
        }
        .list-nav-tabs > li > a {
            color: black;
            padding-bottom: 3px;
        }
        .list-pro{text-decoration: none !important;}
        .list-box{
            width: 80px;
            position: absolute;
            top: 35px;
            left: 20px;
        }
        .list-thumbnail {
            margin-top: 30px; 
            border: 0px;      
        }
        .list-cart{
            width: 50px;
            position: absolute;
            right: 30px;
            bottom: 0px;
        }
        .list-paging {
            text-align: center;
        }
        .list-pagination > li > a {
            color: #555;
        }
        .list-pagination > li > a:hover {
            color: purple;
            font-weight: bold;
        }
        .list-pagination > li.active > a, .pagination > li.active > a:hover {
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
        .pro-img:hover {
			opacity: 0.5;
		}
		.list-line-throgh {
			text-decoration: line-through;
			font-size: 13px;
			color: #555;
		}
		.glyphicon-arrow-right {
			margin-left: 2px;
			margin-right: 2px;
		}
        <%@ include file="../common/head-foot-style.jsp" %>
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container">
	<form method="post" action="list.hta" class="form-inline" id="list-form">
		<input type="hidden" name="pno" id="page-no"/>
		<input type="hidden" name="catNo" id="cat-no"/>
		<input type="hidden" name="size" value="15"/>
		<input type="hidden" name="page" id="page-name">
	    <div class="row">
	        <div class="col-sm-12">
	        <c:choose>
	        	<c:when test="${page eq 'cate' }">
		            <img src="/mj/images/header_footer/${parentCat.img }" class="list-cat-icon">
		            <span class="cat-par-text"><strong>${parentCat.name }</strong></span>    
	        	</c:when>
	        	<c:when test="${page eq 'new' }">
	        		<span class="cat-par-text"><strong>NEW</strong></span>
	        	</c:when>
	        	<c:when test="${page eq 'best' }">
	        		<span class="cat-par-text"><strong>BEST</strong></span>
	        	</c:when>
	        	<c:when test="${page eq 'sale' }">
	        		<span class="cat-par-text"><strong>알뜰쇼핑</strong></span>
	        	</c:when>
	        </c:choose>
	        </div>
	        <div class="col-sm-10">
	            <ul class="nav nav-tabs list-nav-tabs">
	            <c:choose>
	            	<c:when test="${page eq 'cate' }">
		                <li class="${parentCat.no eq catNo ? 'presentation active' : 'presentation' }"><a href="#" onclick="goPage(event, 1, ${parentCat.no}, '${page }')">전체보기</a></li>
		                <c:forEach var="childCat" items="${childCats }">
			                <li class="${childCat.no eq catNo ? 'presentation active' : 'presentation' }"><a href="#" onclick="goPage(event, 1, ${childCat.no}, '${page }');">${childCat.name }</a></li>
		                </c:forEach>
	            	</c:when>
	            	<c:otherwise>
	            		<li class="presentation active"><a href="#" onclick="preDefault(event)">전체보기</a></li>
	            	</c:otherwise>
	            </c:choose>
	            </ul>
	        </div>
	        <div class="col-sm-2">
                <div class="form-group">
                    <select class="form-control list-orderby" name="sort" onchange="sendform(1, ${catNo }, '${page }');">
                        <option value="default" ${param.sort eq 'default' ? 'selected' : '' }>선택하세요</option>
                        <c:if test="${page eq 'cate' }">
	                        <option value="ordercnt" ${param.sort eq 'ordercnt' ? 'selected' : '' }>추천순</option>
                        </c:if>
                        <option value="date" ${param.sort eq 'date' ? 'selected' : '' }>신상품순</option>
                        <option value="likescnt" ${param.sort eq 'likescnt' ? 'selected' : '' }>인기상품순</option>
                        <option value="lowprice" ${param.sort eq 'lowprice' ? 'selected' : '' }>낮은가격순</option>
                        <option value="highprice" ${param.sort eq 'highprice' ? 'selected' : '' }>높은가격순</option>
                    </select>
                </div>
	        </div>
	    </div>
	    <div class="row">
	    <c:choose>
	    	<c:when test="${not empty products }">
	    		<c:forEach var="product" items="${products }">
			        <div class="col-sm-4 product-thumbnail">
			            <div class="thumbnail list-thumbnail">
			                <a href="detail.hta?proNo=${product.no }&reviewPno=1&pqPno=1&position=first" class="list-pro">
			                    <img src="/mj/images/product/${product.img }" class="pro-img">
			                    <div>
			                    	<c:choose>
			                    		<c:when test="${product.saleYn eq 'Y' && product.discount eq 0.35 }">
					                    	<img src="/mj/images/list/icon0.35.jpg" class="list-box">
			                    		</c:when>
			                    		<c:when test="${product.saleYn eq 'Y' && product.discount eq 0.2 }">
			                    			<img src="/mj/images/list/icon0.2.jpg" class="list-box">
			                    		</c:when>
			                    	</c:choose>
			                    </div>
			                    <div>
			                        <img src="/mj/images/list/cart-add-button_type2.jpg" class="list-cart img-circle" onclick="addProduct(event, ${product.no});">
			                    </div>
			                    <div class="caption">
			                        <h5><strong>${product.name }</strong></h5>
			                        <c:choose>
			                        	<c:when test="${product.saleYn eq 'Y' }">
			                        		<p>
			                        			<span class="list-line-throgh">${product.price }원</span>
			                        			<span class="glyphicon glyphicon-arrow-right"></span>
			                        			<strong>
			                        				<fmt:formatNumber value="${product.discountPrice }"/>원
			                        			</strong>
			                        		</p>
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
	    	<c:otherwise>
	    		<div>
	    			<p>조회된 상품이 없습니다.</p>
	    		</div>
	    	</c:otherwise>
	    </c:choose>
	        <div class="col-sm-12 list-paging">
	            <ul class="pagination list-pagination">
	            	<c:choose>
						<c:when test="${not pagination.first }">
							<li><a href="#" onclick="goPage(event, ${pagination.page - 1}, ${catNo }, '${page }');">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" onclick="goPage(event, ${pagination.begin}, ${catNo }, '${page }');">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="no" begin="${pagination.begin }" end="${pagination.end }">
						<li class="${no eq pagination.page ? 'active' : '' }" ><a href="#" onclick="goPage(event, ${no }, ${catNo }, '${page }');">${no }</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${not pagination.last }">
							<li><a href="#" onclick="goPage(event, ${pagination.page + 1}, ${catNo }, '${page }');">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" onclick="goPage(event, ${pagination.end}, ${catNo }, '${page }');">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
	            </ul>
	        </div>
	    </div>
	</form>
</div>
<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">
	function sendform(pno, cno, page) {
		document.getElementById("page-no").value = pno;
		document.getElementById("cat-no").value = cno;
		document.getElementById("page-name").value = page;
		document.getElementById("list-form").submit();
	}
	
	function goPage(event, pno, cno, page) {
		event.preventDefault();
		sendform(pno, cno, page);
	}
	
	function preDefault(event) {
		event.preventDefault();
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
</body>
</html>