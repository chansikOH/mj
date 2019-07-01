<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>minji kurly</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
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

        /* orderlist */
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

        .order-list-title {
            font-size: 23px;
        }
        
        .title_style {
            margin-bottom: 20px;
        }

        .year {
            border: 1px solid purple;
            border-radius: 0px;
            font-size: 12px;
            width: 200px;
        }
        
        .year_select {
        	text-align: right;
            margin-bottom: 20px;
        }

        .middleline {
            border: 1px solid rebeccapurple;
            width : 100%;
        }

        .order {
            margin-bottom: 30px;
        }

        .orderdate {
            font-size: 1.2em;
            color: #404040;
        }

        .orderlistbox {
            border: 1px solid lightgray;
            padding: 20px;
            height: 180px;
        }

        .orderlistbox-table {
            width: 100%;
            padding: 20px;
        }

        .table-header {
            border-bottom: 1px solid lightgray;
            padding-bottom: 10px;
        }

        .orderlist-icon {
            float: right;
        }

        .thumb img {
            width: 70px;
            height: 90px;
        }

        .table-td-top {
            padding-top: 15px;
        }

        .table-td {
            width: 90px;
        }

        .table-td-order {
            width: 700px;
        }

        .table-td-cat {
            font-size: 12px;
        }

        .orderproduct {
            font-size: 17px;
            color: black;
        }

        .orderproduct:hover {
            text-decoration: none;
        }

        .listmiddleline {
            width: 97%;
            border-color: lightgray;
        }


        .orderlist-1 {
            font-size: 0.9em;
            padding-right: 10px;
        }

        .orderlist-2 {
            padding-left: 10px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .orderlist-3 {
            padding-left: 10px;
            font-weight: bold;
            font-size: 1.1em;
            color: dimgray;
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
    
    <form class="form-inline" action="orderlist.hta" id="list-form">
		<input type="hidden" name="pno" id="page-no"/>
    
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
                    <div class="col-sm-6">
                        <p><span class="order-list-title title_style" >주문 내역</span>&nbsp;<small>지난 3년간의 주문 내역 조회가 가능합니다.</small></p>
                    </div>
                    <div class="col-sm-6 year_select">
                        <div class="form-group">
                            <select class="form-control year" name="year" onchange="sendform(1);">
                                <option value="all" selected>전체기간</option>
                                <option value="1" ${param.year eq '1' ? 'selected' : '' }>2019년</option>
                                <option value="2" ${param.year eq '2' ? 'selected' : '' }>2018년</option>
                                <option value="3" ${param.year eq '3' ? 'selected' : '' }>2017년</option>
                            </select>
                        </div>
                    </div>

                <hr class="middleline" />

				<c:choose>
					<c:when test="${not empty orderlistpro }">
						<c:forEach var="orderlistpro" items="${orderlistpro }">
		                <div class="order">
		                    <p class="orderdate"><fmt:formatDate value="${orderlistpro.orderCreateDate }" pattern="yyyy.MM.dd (h시 m분)" /></p>
		
		                    <div class="orderlistbox">
		
		                        <table class="orderlistbox-table">
		                            <thead>
		                                <tr>
		                                    <td colspan="4" class="table-header"><a href="orderlistdetail.hta?orderNo=${orderlistpro.orderNo }" class="orderproduct">${orderlistpro.proName } 포함 ${orderlistpro.cnt }건<span class="glyphicon glyphicon-menu-right orderlist-icon"></span></a></td>
		                                </tr>
		                            </thead>
		                            <tbody class="table-tbody">
		                                <tr>
		                                    <td rowspan="4" class="thumb table-td table-td-top"><img src="/mj/images/product/${orderlistpro.proImg }"></td>
		                                </tr>
		                                <tr>
		                                    <td class="table-td table-td-top table-td-cat">주문번호</td>
		                                    <td class="table-td-order table-td-top">${orderlistpro.orderNo }</td>
		                                    <td rowspan="4" class="table-td table-td-top">
			                                    <a href="viewBeforeList.hta?orderNo=${orderDetailInfo.orderNo }" class="orderlistbutton-h btn ${orderlistpro.orderStatus eq '배송완료' ? '' : 'hidden' }">후기쓰기</a>
		                                    <a href="../center/qna.hta?pno=1" class="orderlistbutton-q btn">1:1 문의</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td class="table-td table-td-cat">결제금액</td>
		                                    <td class="table-td-order">${orderlistpro.orderPrice }원</td>
		                                </tr>
		                                <tr>
		                                    <td class="table-td table-td-cat">배송상태</td>
		                                    <td class="table-td-order">${orderlistpro.orderStatus }</td>
		                                </tr>
		                            </tbody>
		                        </table>
		
		                    </div>
		                </div>
		                </c:forEach>
	                </c:when>
	                <c:otherwise>
	               		<div>
	               			<p class="text-center">조회된 구매내역이 없습니다.</p>
	               		</div>
	                </c:otherwise>
                </c:choose>
                
                <div class="row">
                    <div class="text-center">
                        <ul class="pagination">
                            <c:if test="${not pagination.first }">
                        		<li><a href="#" onclick="goPage(event, ${pagination.page-1})">&laquo;</a></li>
                        	</c:if>
                        	
                        	<c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
                        		<c:choose>
                        			<c:when test="${num eq pagination.page }">
                        				<li class="active"><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
                        			</c:when>
                        			<c:otherwise>
                        				<li><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
                        			</c:otherwise>
                        		</c:choose>
                        	</c:forEach>
                        
                            <c:if test="${not pagination.last }">
                        		<li><a href="#" onclick="goPage(event, ${pagination.page+1})">&raquo;</a></li>
                        	</c:if>
                        </ul>
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
	    	event.preventDefault();
	    	sendform(pno);
	    }
	    
	    function preDefault(event) {
			event.preventDefault();
		}
    </script>
    
    <%@ include file="../common/footer.jsp" %>

</body></html>
