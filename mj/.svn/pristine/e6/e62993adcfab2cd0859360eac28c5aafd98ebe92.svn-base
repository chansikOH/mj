<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>minji kurly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        .mypageheader {
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

        .myName {
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

        .point:hover,
        .deletePoint:hover {
            text-decoration: none;
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

        .order-detail-list-content {
            margin-top: 30px;
            margin-bottom: 10px;
        }
        
        .order-number {
            color: #260d26;
            font-size: 17px;
        }

        .order-title-small {
            font-size: 12px;
            float: right;
        }

        .onetoone {
            color: rebeccapurple;
        }

        .onetoone:hover {
            text-decoration: none;
        }

        .order-detail {
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
            padding: 20px;
            width: 100%;
            margin-bottom: 30px;
        }
        
        .thumb {
            width: 100px;
        }

        .thumb img {
            width: 80px;
            height: 100px;
            margin-right: 30px;
        }

        .product-name {
            color: black;
            font-size: 1.1em;
            font-weight: bold;
            width: 400px;
        }

        .product-name:hover {
            text-decoration: none;
        }

        .small {
            text-align: right;
        }

        .middleline {
            border: 1px solid rebeccapurple;
            width: 100%;
        }

        .product-price-amount {
            width: 400px;
        }

        .productprice {
            font-size: 1.2em;
        }

        .productamount {
            font-size: 12px;
            color: dimgrey;
        }
        
        .orderlistbutton-h {
            width: 100px;
            height: 40px;
            margin-bottom: 5px;
            background-color: rebeccapurple;
            border: 1px solid rebeccapurple;
            color: white;
            font-size: 12px;
            border-radius: 0px;
            text-align: center;
            padding: 10px;
        }
        
        .orderlistbutton-h:hover {
            color: white;
        }
        
        .orderlistbutton-q {
            width: 100px;
            height: 40px;
            margin-bottom: 5px;
            background-color: white;
            border: 1px solid rebeccapurple;
            font-size: 12px;
            border-radius: 0px;
            text-align: center;
            color: rebeccapurple;
            padding: 10px;
        }

        .orderlist-etc {
            width: 200px;
            text-align: right;
        }

        .order-status {
            top: 50%;
        }

        .button {
            width: 200px;
            text-align: right;
        }

        .order-info {
            border-top: 2px solid rebeccapurple;
            border-bottom: 1px solid lightgray;
            width: 100%;
            margin-bottom: 50px;
            padding: 20px;
        }

        .order-info-title {
            font-size: 17px;
            color: #260d26;
        }

        .info-header {
            width: 200px;
        }

        .info-body {
            padding: 10px;
        }

     <%@ include file="../common/head-foot-style.jsp" %>
    </style>

</head>

<body>
	<%@ include file="../common/header.jsp" %>

    <div class="container-fluid">

        <div class="mypageheader">

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
                    <a href="wishlist.hta" class="list-group-item notic-menu">늘 사는 것
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
            	
                <h3>주문 내역 상세</h3>
                <div class="order-detail-list-content">
                    <p><span class="order-number">주문번호 <c:out value="${orderDetailInfo.orderNo }"/></span><span class="order-title-small">배송 또는 상품에 문제가 있나요? <a href="" class="onetoone">1:1 문의하기<span class="glyphicon glyphicon-menu-right"></span></a></span></p>

                    <hr class="middleline" />

                    <div class="order-detail">
                        <table class="order-detail-list">
                        	<c:forEach var="orderListDetailPro" items="${orderListDetailPro }">
                            <tr>
                                <td class="thumb" rowspan="2"><img src="/mj/images/product/${orderListDetailPro.proImg }"></td>
                                <td class="product-name"><a href="" class="product-name">${orderListDetailPro.proName }</a></td>
                                <td rowspan="2" class="orderlist-etc">
                                    <h5>${orderListDetailPro.orderStatus }</h5>
                                </td>
                                <td rowspan="2" class="button">
                                    <a href="viewBeforeList.hta?orderNo=${orderDetailInfo.orderNo }" class="orderlistbutton-h btn ${orderListDetailPro.orderStatus eq '배송완료' ? '' : 'hidden' }">후기쓰기</a>
                                    <a href="../center/qna.hta?pno=1" class="orderlistbutton-q btn">1:1 문의</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="product-price-amount productprice">${orderListDetailPro.proPrice }원&nbsp;<small>${orderListDetailPro.cartAmount }개 구매</small></td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <div>
                        <p class="order-info-title">결제 정보</p>
                        <div>
                            <table class="order-info">
                                <tr>
                                    <th class="info-header">총주문금액</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.totalPrice }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">상품할인</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.discountPrice }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">적립금 사용</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.usedPoint }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">배송비</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.deliveryfee }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">결제금액</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.orderPrice }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">적립금액</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.pointAmount }"/></td>
                                    
                                </tr>
                                <tr>
                                    <th class="info-header">결제방법</th>
                                    <td class="info-body">무통장입금</td>
                                </tr>
                            </table>
                        </div>

                        <p class="order-info-title">주문 정보</p>
                        <div>
                            <table class="order-info">
                                <tr>
                                    <th class="info-header">주문 번호</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.orderNo }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">주문자명</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.delReceiver }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">주문자 연락처</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.delPhone }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">결제일시</th>
                                    <td class="info-body"><fmt:formatDate value="${orderDetailInfo.orderCreateDate }" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                                </tr>
                                <tr>
                                    <th class="info-header">주문 처리상태</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.orderStatus }"/></td>
                                </tr>
                            </table>
                        </div>

                        <p class="order-info-title">배송 정보</p>
                        <div>
                            <table class="order-info">
                                <tr>
                                    <th class="info-header">주소</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.delAddress }"/></td>
                                </tr>
                                <tr>
                                    <th class="info-header">배송 요청사항</th>
                                    <td class="info-body"><c:out value="${orderDetailInfo.delMessage }"/></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>

</html>