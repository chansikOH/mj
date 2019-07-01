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
    	.pqform-title {
    		margin-top: 50px;
            font-weight: bolder;
            color: #5D5D5D;
        }
        .pqform-input {
            width: 100%;
            height: 30px;
            margin-top: 10px;
            border: 1px solid #d9d9d9;
        }
        .table>tbody>tr>td {
            padding: 15px;
            border: 1px solid #e8e8e8;
        }
        .table>tbody>tr>th {
            width: 150px;
            padding: 15px 0 15px 20px;
            background-color: #F7F5F8;
            border: 1px solid #e8e8e8;
            text-align: left;
            font-weight: normal;
            vertical-align: middle;
        }
        .pqform-btn, .pqform-btn:hover{
            background-color: purple;
            color: white;
            margin-top: 30px;
        }
        .pqform-table-top {
        	border-top: 2px solid purple !important;
        }
        <%@ include file="../common/head-foot-style.jsp" %>
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container">
	<div class="row">
        <div class="col-sm-12">
            <h3 class="pqform-title">PRODUCT Q&A</h3>
            <ul>
                <li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
                <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <form method="post" action="addPq.hta" enctype="multipart/form-data">
				<input type="hidden" name="prono" value="${proNo }" />
				<input type="hidden" name="custid" value="${customer.id }" />
                <table class="table">
                    <tbody class="pqform-table-top">
                  		<tr>
                        	<th>작성자</th>
                        	<td colspan="3">
                        		<input type="text" class="" name="pqwriter" value="${customer.name }" readonly>
                        	</td>
                        </tr>
                        <tr>
                        	<th>제목</th>
                        	<td colspan="3"><input type="text" class="pqform-input" name="pqtitle"></td>
                        </tr>
                        <tr>
                        	<th>내용</th>
                        	<td colspan="3"><textarea rows="10" cols="100%" name="content"></textarea></td>
                        </tr>
                        <tr>
                        	<th>상품사진</th>
                        	<td colspan="3"><input type="file" class="pqform-input" name="pqimg"></td>
                        </tr>
                        <tr>
                        	<td colspan="4" class="text-right">
                        		<input type="submit" class="btn pqform-btn" value="등록"/>
                        		<input type="reset" class="btn pqform-btn" value="취소"/>
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>