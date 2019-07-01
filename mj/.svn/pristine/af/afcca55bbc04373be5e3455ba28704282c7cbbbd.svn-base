<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>민지 컬리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        <%@ include file="../common/head-foot-style.jsp"%>
        .header {
          padding-top: 55px;
          margin-bottom: 30px;
          width: 100%;
          height: 280px;
          background-color: #f2f2f2;
          margin-bottom: 40px;
        }

        .infobox {
          background-color: white;
          height: 170px;
          padding: 30px;
          border: 2px solid #f2f2f2;
        }

        .myName{
          font-size: 15pt;
        }

        .myGrade {
          background-color: purple;
          color: white;
          font-size: 45px;
          padding:20px;
        }

        .myTable {
          width: 100%;
          height: 100%;
        }

        .point {
          font-size: 1.4em;
          font-weight: bold;
          color: purple;
          margin-top: 20px;
        }

        .point:hover, .deletePoint:hover {
          text-decoration: none;
        }

        .deletePoint {
          color: gray;
          font-size: 0.8em;
        }
        
        .grade-table {
        	width: 100%;
        	height: 100%;
        }
        
        .grade-table-th {
        	border-bottom: 1px solid lightgray;
        	color: rebeccapurple;
        }
        
        .grade-table-th-row {
        	color: black;
        	
        }
        
        .grade-table-td {
        	border-bottom: 1px solid lightgray;
        }
        
        .nav-title {
            font-weight: bolder;
            color: #5D5D5D;
        }
        
        .list-group {
            margin-top: 20px;
        }

        .row>.col-sm-2>.list-group>.notic-menu:hover {
            color: purple;
        }

        .row>.col-sm-2>.list-group>.active {
            background-color: #F6F6F6;
            color: purple;
            border: 1px solid #aaa;
        }

        .notic-icon {
            position: absolute;
            top: 36%;
            left: 87%;
        }
        
        .title {
            font-weight: bolder;
            color: #5D5D5D;
            padding: 4px;
        }
        
        .sub-title {
            font-size: 12px;
            font-weight: 100;
        }
        
        hr {
            border-color: rebeccapurple;
            border-width: medium;
        }
        
        .detail-btn-cart{
            background-color: rebeccapurple;
            color: white;
            border: 0px;
            padding: 5px;
        }
        
        .detail-btn-delete {
            background-color: white;
            color: rebeccapurple;
            border: 0px;
            padding: 5px;
        }
        
        .detail-btn-delete-all {
/*             width: 150px;
            height: 40px;
            border: 1px solid rebeccapurple;
            background-color: white;
            font-size: 17px;
            color: rebeccapurple; */
           	background-color:white ;
            color: rebeccapurple;
            border: 0px;
            padding: 5px;
        }

        .detail-btn-cart-all, .detail-btn-cart-all:hover{
        	height: 40px;
            background-color: rebeccapurple;
            color: white;
            border: 0px;
            padding: 10px;
            margin-bottom: 10px;
        }
        
        .pagination>li>a {
            color: #555;
        }
        
        .pagination>li>a:hover {
            color: purple;
        }

        .pagination>li.active>a,
        .pagination>li.active>a:hover {
            background-color: #F6F6F6;
            border: 1px solid #aaa;
            color: purple;
        }

        .pagination>.active {
            background-color: #aaa;
        }
        
    </style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container-fluid">
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5 infobox">
                    	<h3 style="font-size: 40px; vertical-align: middle;"><c:out value="${LOGINCUSTOMER.name }"/>님의 등급: <strong class="myGrade"><c:out value="${LOGINCUSTOMER.gra }"/></strong></h3>
                    </div>
                    <div class="col-sm-3 infobox">
                        <table class="myTable">
                          <tr>
                             <td class="col-sm-1"></td>
                              <td class="col-sm-11">적립금</td>
                          </tr>
                          <tr>
                             <td class="col-sm-1"></td>
                                <td class="col-sm-11"><a href="mypoint.hta?id=${LOGINCUSTOMER.id }" class="point"><c:out value="${LOGINCUSTOMER.point }"/> 원</a><span class="glyphicon glyphicon-menu-right"></span></td>
                          </tr>
                          
                      </table>
                    </div>
                    <div class="col-sm-4 infobox">
                        <table class="grade-table">
	                        <thead>
	                        	<tr>
	                        		<th class="grade-table-th">등급</th>
	                        		<th class="grade-table-th">일반회원<th/>
	                        		<th class="grade-table-th">VIP<th/>
	                        		<th class="grade-table-th">VVIP<th/>
	                        	</tr>
	                        </thead>
	                        <tbody>
	                        	<tr>
	                        		<th class="grade-table-th">전년도 결제</th>
	                        		<td class="grade-table-td grade-table-th-row">50만원<td/>
	                        		<td class="grade-table-td grade-table-th-row">100만원<td/>
	                        		<td class="grade-table-td grade-table-th-row">150만원<td/>
	                        	</tr>
	                        	<tr>
	                        		<th class="grade-table-th">적립률</th>
	                        		<td class="grade-table-td grade-table-th-row">0.5%<td/>
	                        		<td class="grade-table-td grade-table-th-row">1%<td/>
	                        		<td class="grade-table-td grade-table-th-row">3%<td/>
	                        	</tr>
                        	</tbody>
                        </table>
                    </div>
                </div>
             </div>
        </div>
    </div>
	<div class="container">
	    <div class="row">
	        <div class="col-sm-2">
	            <h2 class="nav-title">마이컬리</h2>
	            <div class="list-group">
	                <a href="orderlist.hta" class="list-group-item notic-menu">주문 내역
	                    <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
	                <a href="wishlist.hta" class="list-group-item notic-menu active">늘 사는 것
	                    <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
	                <a href="viewBeforeList.hta" class="list-group-item notic-menu">상품후기
	                    <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
	                <a href="mypoint.hta" class="list-group-item notic-menu">적립금
	                    <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
	                <a href="confirmpwd.hta" class="list-group-item notic-menu">개인 정보 수정
	                    <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
	            </div>
	        </div>
	        <div class="col-sm-10">
	            <h3 class="title">늘 사는 것<span class="sub-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;늘 사는 것으로 등록하신 상품 목록입니다.</span></h3>
	            <form method="post" action="addAllProductIntoCart.hta">
	            	<input type="hidden" name="userid" value="${LOGINCUSTOMER.id }">
	            	<div class="row">
	                	<hr>
	                	<table class="table">
			                    <thead>
			                        <tr>
			                            <th>
			                                <input type="checkbox" id="product-all-ck" name="selectAllProduct" onchange="allCheckOrRelease();">전체
			                            </th>
			                            <th>상품정보</th>
			                            <th></th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    <c:forEach var="product" items="${products }">
			                        <tr>
			                            <td>
			                                    <input type="checkbox" id="tech-ck-1" name="prono" value="${product.no }"> 
			                            </td>
			                            <td>
			                                <img src="/mj/images/product/${product.img }" width="90px" height="120px">
			                            </td>
			                            <td>
			                                <a href="../product/detail.hta?proNo=${product.no }&reviewPno=1&pqPno=1&position=first">${product.name }</a>
			                                <p><fmt:formatNumber value="${product.price }"/> 원</p>
			                            </td>
			                            <td class="text-right">
			                            	<div>
				                                <a href="#" class=" btn detail-btn-cart-all" onclick="addProduct(event, ${product.no })">장바구니 담기</a>
			                            	</div>
			                            	<div>
				                                <a href="deleteLike.hta?proNoForDelete=${product.no}" class="btn detail-btn-cart-all">삭제</a>
			                            	</div>
			                            </td>
			                        </tr>
			                        </c:forEach>
			                    </tbody>
	                        </table>
	                    </div>
	                <div class="row">
	                   <div class="col-sm-12">
	                        <div class="text-right">
	                            <a href="deleteAllLikes.hta" class=" btn detail-btn-cart-all">전체 비우기</a>
	                            <input type="submit" class="btn detail-btn-cart-all" value="전체 주문하기"/>
	                        </div>
	                    </div>
	            	</div>
	            </form>
			</div>
		</div>
	</div>
		<!--
		<div class="row">
               <div class="text-center">
                <ul class="pagination">
                    <li><a href="">&laquo;</a></li>
                        <li><a href="">&lt;</a></li>
                        <li class="active"><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li><a href="">6</a></li>
                        <li><a href="">7</a></li>
                        <li><a href="">8</a></li>
                        <li><a href="">9</a></li>
                        <li><a href="">10</a></li>
                        <li><a href="">&gt;</a></li>
                        <li><a href="">&raquo;</a></li>
                </ul>
               </div>
           </div>
		</div>
	</div>
	  -->
	<script type="text/javascript">
	    function allCheckOrRelease() {
	        var allCheckboxStatus = document.getElementById("product-all-ck").checked;
	        var checkboxes = document.querySelectorAll("[name=prono]");
	        for (var i=0; i<checkboxes.length; i++) {
	            var checkbox = checkboxes[i];
	            checkbox.checked = allCheckboxStatus;
	        }
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