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
        .reviewTitle{
        	font-size: 17px;
        }
        .reviewContent{
        	font-size: 13px;
        }
        
        .likes{
        	margin-top: 20px;
        }
          .button-del{
            width: 100px;
            height: 35px;
            margin: 10px;
            background-color: rebeccapurple;
            color: white;
            border: 0px;
        }
         .button-upd{
            width: 100px;
            height: 35px;
            margin: 10px;
            background-color: rebeccapurple;
            color: white;
            border: 0px;
        }
     	.reviewContent{
     	
     		padding-top: 25px;
     	}
      
        .table>tbody>tr>td{
        	padding-top: 30px;
        }
        .abc{
        text-decoration:none !important;
      	color : black;
        }
        .abc:hover{
        color:black;
        }
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
        
        .detail {
            display: none;
        }

        .image-max-size {
           /*  max-height: 25%; */
			width: 120px;
			
			height: 110px;           
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
            <ul class="nav nav-tabs nav-justified" style="margin-top: 20px;">
                <li class="presentation">
                    <a href="viewBeforeList.hta">작성가능 후기   (${canWriteAmount })</a>
                </li>
                <li class="presentation active">
                    <a href="viewAfterList.hta">작성완료 후기 (${FinishedAmount })</a>
                </li>
            </ul>

            <!-- 작성한 후기가 없을 시-->
            <!-- 
            <div class="text-center"  style="margin-top: 20px;">작성한 후기가 없습니다.</div>
			 -->
			 
            <!-- 작성한 후기가 있을 때-->
            <span style="color: gray">제품 이름을 누르면 제품 페이지로 이동합니다.</span>
            <c:forEach var="list" items="${reviews }">
            <div style="margin-top: 20px;">
                <a href="" class="abc">
                   <strong><span style="color: black font-weight: bold"><h4>${list.proName }</h4></span></strong></a>
            </div>
            <div class="title">
             <!--    <table class="table table-hover">
                    <tr onclick="displayYn()">
                        <td class="text-center" id="show-review" style="border-style: none;">후기보기/닫기</td>
                    </tr>
                </table> -->
                <div >
                    <table class="table">
                    <colgroup>
                    <col width="20%">
                    <col width="20%">
                    <col width="20%">
                    </colgroup>
                        <tr>
                        <td>
                        
                        	<div class="text-center">
	                              <img src="../../images/mypage/${not empty list.img ? list.img : 'noImg.jpg'}" class="image-max-size">
                                    <div class="likes"><span class="glyphicon glyphicon-thumbs-up"></span><span>도움이 돼요 ${list.likes }</span> </div>
                        	</div>
                        </td>
                         <td>	
                         	<div class="reviewContent">
                              	<div class="reviewTitle">
                              	제목:${list.title }
                              	</div>
								<div class="reviewContent">
								내용:${list.content }
								</div>
                              </div>
                         </td>
                         <td>
                               <c:choose>
                               		<c:when test="${list.usedYn eq 'Y' }">
	                                    <div class='text-center'>
	                                    	<a href="deleteReview.hta?reviewNo=${list.no }"><button class="button-del">비공개하기</button></a>
	                                    </div>
                                    </c:when>
                                    <c:when test="${list.usedYn eq 'N' }">
	                                    <div class='text-center'>
	                                    	<a href="reopen.hta?reviewNo=${list.no }"><button class="button-del">공개하기</button></a>
	                                    </div>
                                    </c:when>
                               </c:choose>
									<div class='text-center'>
                                   		 <a href="reviewEditPage.hta?reviewNo=${list.no }"><button class="button-upd">수정</button></a> 
									</div>
                             
                         </td>
                        </tr>
                    </table>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<script type="text/javascript">
    function displayYn(no){
        var view = document.getElementById("detail-content");
        var review = document.getElementById("show-review");
        if(view.style.display == 'none' || view.style.display == ''){
            document.getElementById("detail-content").style.display = 'block';
            review.innerHTML = "후기보기/닫기";
        } else {
            document.getElementById("detail-content").style.display = 'none';
            review.innerHTML = "후기보기/닫기";
        }
    }
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>