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
        
        .go-to-write {
            width: 100px;
            height: 35px;
            margin: 25px;
            background-color: rebeccapurple;
            color: white;
            border: 0px;
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
            <a href="wishlist.hta" class="list-group-item notic-menu">늘 사는 것
                <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
            <a href="viewBeforeList.hta" class="list-group-item notic-menu active">상품후기
                <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
            <a href="mypoint.hta" class="list-group-item notic-menu">적립금
                <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
            <a href="confirmpwd.hta" class="list-group-item notic-menu">개인 정보 수정
                <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
        </div>
    </div>
    
    <div class="col-sm-10">
        <h3 class="title">상품후기</h3>
        <div class="row">
            <ul class="nav nav-tabs nav-justified" style="margin-top: 20px;">
                <li class="presentation active">
                    <a href="viewBeforeList.hta">작성가능 후기   (${canWriteAmount })</a>
                </li>
                <li class="presentation">
                    <a href="viewAfterList.hta">작성완료 후기 (${FinishedAmount })</a>
                </li>
            </ul>
            
            <!-- 작성 가능 후기 내역이 없을 때 -->
            
            <!-- 
            <div class="text-center"  style="margin-top: 20px;">작성 가능 후기 내역이 없습니다.</div>
             -->
            <span style="color: gray">제품 이름을 누르면 제품 페이지로 이동합니다.</span>
            <div style="margin-top: 20px;">
             <c:forEach var="product" items="${list }">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-sm-2">
                                <img src="../../images/product/${product.proImg }" width="80px" height="100px"/>
                            </div>
                            <div class="col-sm-6">
                                <a href="../product/detail.hta?proNo=${product.proNo }&reviewPno=1&pqPno=1&position=first"><h4>${product.proName }</h4></a>
                            </div>
                            <div class="col-sm-2 col-sm-offset-2">
                            <!-- a태그  -->
                                <a href="reviewWrite.hta?pro=${product.proNo }"><button type="submit" class="go-to-write">후기쓰기</button></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </c:forEach>
            </div>
            
            
            
            
        </div>
    </div>
</div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>