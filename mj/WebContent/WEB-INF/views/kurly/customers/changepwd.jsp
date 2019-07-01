<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>민지 컬리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/mj/kurly/images/header_footer/tab-logo02.png">
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

.container {
	margin-top: 150px;
}

.text-center {
	margin-bottom: 50px;
}
<%@include file ="../common/head-foot-style.jsp"%>
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container">
		<h1 class="text-center">비밀번호 찾기</h1>
		<form class="well" action="changepwdcomplete.hta">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<table class="table">
					<colgroup>
						<col width="20%">
						<col width="40%">
					</colgroup>
						<tr>
							<th>비밀번호</th>
							<td><input class="box form-control" type="password" name="userpwd" id="userpwd" required maxlength="16" class="userpwd" onclick="disableButton();" placeholder=" 비밀번호를 입력해주세요."></td>
							<td ></td>
						</tr>
						<tr>
							<th>비밀번호확인</th>
							<td><input class="box form-control" type="password" name="userpwd2" id="userpwdck" required maxlength="16" class="userpwdck" onclick="disableButton();" onkeyup="checkpwd();" placeholder=" 비밀번호를 한번 더 입력해주세요."></td>
							<td id="msg-box"><span id="msg-box"></span></td>
						</tr>
					</table>
					<div class="text-center">
						<input type="submit" class="btn submit-button" id="submitButton" value="비밀번호 변경" disabled="disabled" />
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
		function checkpwd() {
				var pwd = document.getElementById("userpwd").value;
				var pwdCk = document.getElementById("userpwdck").value;
				
				var msgbox = document.getElementById("msg-box")
								
				if (pwdCk.length <= 7 && pwd.length <= 7) {
					msgbox.textContent = "비밀번호는 8글자 이상 입력해야 합니다.";
					msgbox.style.color = 'red';
					msgbox.style.fontStyle = 'italic';
					document.getElementById("submitButton").setAttribute("disabled", "disabled");
					return;
				}
				
				if (pwd != pwdCk) {
					msgbox.textContent = "비밀번호가 일치하지 않습니다.";
					msgbox.style.color = 'red';
					msgbox.style.fontStyle = 'italic';
					document.getElementById("submitButton").setAttribute("disabled", "disabled");
					return;
				} else if (pwd == pwdCk) {
					msgbox.textContent = "비밀번호가 일치합니다.";
					msgbox.style.color = 'green';
					msgbox.style.fontStyle = 'italic';
					document.getElementById("submitButton").removeAttribute("disabled");
					return;
				}
		}
		
		function disableButton() {
			document.getElementById("submitButton").setAttribute("disabled", "disabled");
		}
	</script>
			
		
</body>
</html>