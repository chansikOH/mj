<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>민지 컬리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.complete-table {
	margin-top: 30px;
}

.button-1 {
	width: 49%;
	float: left;
}

.button-2 {
	width: 49%;
	float: right;
	background-color: #795B8F;
	color: #fff;
}
.container {
	margin-top: 150px;
	
}
.well {
	min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #fffaff;
    border: 1px solid #000;
    border-style: solid none solid;
    border-radius: 0px; 
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    
    
}
<%@ include file="../common/head-foot-style.jsp"%>
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div class="container">
		<form class="well">
			<h1 class="text-center">회원가입이 완료되었습니다.</h1>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<table class="table complete-table">
						<tr>
							<th>아이디</th>
							<td>${id }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${name }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${email }</td>
						</tr>
					</table>
					<a type="button" href="../main.hta" class="btn btn-default button-1">홈으로 이동</a>
					<a type="button" href="loginform.hta" class="btn btn-default button-2">로그인 페이지로 이동</a>
				</div>

			</div>

		</form>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>