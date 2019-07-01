<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>민지 컬리 비밀번호 찾기</title>
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
		.emailCode {
			display: none;
		}		
	<%@ include file="../common/head-foot-style.jsp"%>
	</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
	<div class="container">
		<h1 class="text-center title">비밀번호 찾기</h1>
		<form class="well" id="formaction" action="changepwd.hta">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<table class="table">
						<colgroup>
							<col width="30%">
							<col width="30%">
							<col width="*">
						</colgroup>
						<tr>
							<th>이름</th>
							<td><input type="text" class="form-group" id="username" name="username" value="" required maxlength="30" size="20" /></td>
							<td></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" class="form-group" id="userid" value="" name="userid" required maxlength="30" size="16" /></td>
							<td></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" class="form-group" id="useremail" value="" name="useremail" required maxlength="30" size="30" /></td>
							<td><button type="button" onclick="showEmailCode(); abc();"  >이메일 코드발송</button></td>
						</tr>
					</table>
					<div>
						<table class="table">
							<colgroup>
								<col width="30%">
								<col width="40%">
								<col width="*">
								
							</colgroup>
							<tr  id="emailCode" class="emailCode">
								<th>인증코드입력</th>
								<td><input type="text" class="form-group" id="usercode" value="" name="usercode" onkeyup="checkCode();" required maxlength="6" size="30" /></td>
								<td id="msg-box">
									<span id="msg-box"></span> 
								</td>
							</tr>
						</table>
					</div>
					<div class="text-center">
						<input type="submit" class="btn submit-button" id="submitButton" disabled="disabled" value="확인"/>
					</div>
				</div>
			</div>
		</form>
	</div>
	<input type="hidden" value="${CHANGEPWD.code }" id="sessioncode" />
	
<%@ include file="../common/footer.jsp"%>

	<script type="text/javascript">
		function abc() {
			
			var useremail = document.getElementById("useremail").value;
			
			console.log(useremail);
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					
				}
			}
			xhr.open("GET", "searchByPwd-useremail.hta?useremail=" + useremail);
			xhr.send();
		}
		
		
		function showEmailCode() { 
			document.getElementById("emailCode").style.display = 'table-row';
	    }
		
		function checkCode() {
			var sescode = document.getElementById("sessioncode").value;
			var usercode = document.getElementById("usercode").value;
			
			var msgbox = document.getElementById("msg-box");
			
			console.log(sescode);
			
			if(usercode.length < 6) {
				msgbox.textContent = "코드는 6글자 입니다.";
				msgbox.style.color = 'red';
				msgbox.style.fontStyle = 'italic';
				document.getElementById("submitButton").setAttribute("disabled", "disabled");
				return;
			}
			
			if (sescode != usercode) {
				msgbox.textContent = "코드가 다릅니다.";
				msgbox.style.color = 'red';
				msgbox.style.fontStyle = 'italic';
				document.getElementById("submitButton").setAttribute("disabled", "disabled");
				return;
			} else {
				msgbox.textContent = "코드가 같습니다.";
				msgbox.style.color = 'green';
				msgbox.style.fontStyle = 'italic';
				document.getElementById("submitButton").removeAttribute("disabled");
				return;
			}
			
			
		}
		
	</script>
</body>
</html>