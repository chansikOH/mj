<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>민지 컬리 아이디 찾기</title>
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
.submit-button {
	padding: 10px 30px;
	background-color: #795B8F;
	color: #fff;
}
.submit-button:hover {
	border: 1px solid #000;
	background-color: #fff;
	color: #795B8f;	
}

.well {
	min-height: 20px;
	padding: 19px;
	margin-bottom: 20px;
	background-color: #fffaff;
	border: 1px solid #000;
	border-style: solid none solid;
	border-radius: 0px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
}
.title {
	margin-top: 150px;
}
.text-center{
	margin-bottom: 50px;
}
<%@ include file="../common/head-foot-style.jsp"%>

</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div class="container">
		<h1 class="text-center title">아이디 찾기</h1>
		<form class="well" action="searchByIdRegister.hta">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<table class="table main-table">
						<tr>
							<th>이름</th>
							<td><input class="form-group" type="text" name="username" value="" maxlength="30" required id="username"/></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input class="form-group" type="text" name="useremail" value="" size="30" required id="useremail" ></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="submit" class="btn submit submit-button"
								value="확인"></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>