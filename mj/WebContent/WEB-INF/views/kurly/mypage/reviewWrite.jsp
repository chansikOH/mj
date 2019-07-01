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

        .goods_info .desc {
            display: table;
            height: 104px;
            vertical-align: middle;
        }

        .background-color {
            background-color: mediumpurple;
            color: white;
            text-align: center;
        }

        .submit {
            width: 150px;
            height: 40px;
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
                <h3 class="title">후기작성</h3>
                <span style="font-weight: bold">작성 시 유의사항</span><br>
                마켓컬리는 믿을 수 있는 후기문화를 함께 만들어 가고자 합니다. 따라서 후기 내용이 아래에 해당하는 경우에는 검토 후 비공개 조치될 수 있습니다.<br><br>
                1. 욕설, 비난 등 업체나 타인에게 불쾌한 내용을 작성한 경우<br>
                2. 해당 상품과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용을 작성한 경우<br>
                3. 상품의 기능이나 효과 등에 오해의 소지가 있는 내용을 작성한 경우<br>
                4. 저작권, 초상권 등 타인의 권리를 침해하는 이미지를 사용한 경우<br>
                <hr>

                <form name="form_review" id="form_review" method="post" action="addReview.hta" enctype="multipart/form-data">
                    <input type="hidden" name="mode" value="add_review">
                    <input type="hidden" name="goodsno" value="31441">
                    <input type="hidden" name="ordno" value="1558072900603">
                    <input type="hidden" name="package_goodsno" value="">
                    <input type="hidden" name="sno" value="undefined">
                    <input type="hidden" name="referer" value="mypage">
                    <input type="hidden" name="name" value="노지원">

                    <div class="write_board" style="margin: 20px">
                        <div class="goods_info">
                            <img src="../../images/product/${product.img }" alt="상품 이미지" width="80px" height="100px">
                            <span style="margin: 20px">${product.name }</span>
                            <input type="hidden" name="prono" value="${product.no }"/>
                        </div>
                    </div>

                    <table class="table">
                        <tbody>
                            <tr>
                                <th class="background-color">제목</th>
                                <td><input type="text" name="subject" placeholder="제목을 입력해주세요." value="" size="98px;"></td>
                            </tr>
                            
                            <tr>
                                <th class="background-color">후기작성</th>
                                <td>
                                    <textarea class="" name="content" cols="100" rows="10" style="resize: none" placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며,
일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다. 
반품/환불 문의는 1:1문의로 가능합니다."></textarea>
                                </td>
                            </tr>
                            
                            <tr>
                                <th class="background-color">사진등록</th>
                                <td>
                                    <input type="file" name="file" class="file_upload" onchange="photoUp($(this))" value="사진등록하기" accept="image/x-png,image/gif,image/jpeg">
                                    <p>구매한 상품이 아니거나 캡쳐 사진을 첨부할 경우, 통보없이 삭제 및 적립 혜택이 취소됩니다.</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <button type="submit" class="submit" style="text-align: center">등록하기</button>
                    </div>
            </form>
            </div>
        </div>
    </div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
