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

        .point-title-padding {
            padding-top: 13px;
            padding-bottom: 30px;
        }

        .point-title {
            font-size: 23px;
        }

        .point-title-small {
            font-size: 12px;
        }
        
        .table {
        	font-size: 14px;
        	color: black;
        }
        
        .pointOrderNo {
        	color: black;
        	font-weight: bold;
        	font-size: 15px;
        }
        
        .pointOrderNo:hover {
        	text-decoration: none;
        }
        
        .grey {
        	color: gray;
        }

        .table thead {
            border-top: 2px solid rebeccapurple;
        }
        
        .point-table-td-center {
            text-align: center;
            width: 150px;
        }
        
        .pointAmount {
        	font-weight: bold;
        	font-size: 16px;
        	color: rebeccapurple;
        	text
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

<body onload="statusAmount()">
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
    
    <form class="form-inline" action="mypoint.hta" id="list-form">
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
                    <a href="#" class="list-group-item notic-menu">적립금
                        <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
                    <a href="confirmpwd.hta" class="list-group-item notic-menu">개인 정보 수정
                        <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
                </div>
            </div>

            <div class="col-sm-10">
                <div class="point-title-padding">
                    <span class="point-title">적립금</span>&nbsp;<span class="point-title-small">보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</span>
                </div>
				
                <div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="point-table-td-center">날짜</th>
                                <th>내용</th>
                                <th class="point-table-td-center">금액</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        <c:choose>
							<c:when test="${not empty mypoint }">
								<c:forEach var="mypoint" items="${mypoint }">
									<tr>
						            <td class="point-table-td-center"><fmt:formatDate value="${mypoint.pointCreateDate }" pattern="yy.MM.dd" /></td>
						            <td>[${mypoint.pointStatus }] <a href="orderlistdetail.hta?orderNo=${mypoint.orderNo }" class="pointOrderNo">${mypoint.orderNo eq 0 ? '' : mypoint.orderNo }</a> ${mypoint.pointContent }</td>
						            <td class="point-table-td-center pointAmount" ><span class="${mypoint.pointStatus eq '사용' ? 'grey' : '' }"><fmt:formatNumber value="${mypoint.pointAmount }"/></span></td>
					            </tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3" class="text-center">조회된 적립금이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
                        </tbody>
                    </table>
                </div>

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

    <script>
	    function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit();
		}
    
        function goPage(event, pno) {
        	event.preventDefault();
        	sendform(pno);
        }
    </script>
    
    <%@ include file="../common/footer.jsp" %>

</body>

</html>
