<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>minji kurly</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
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

        h3 {
            margin-bottom: 30px;
        }

        .modify-title {
            font-size: 20px;
        }

        .modify-title-small {
            float: right;
            font-size: 12px;
            margin-top: 10px;
        }
        
        .modify-table {
        	width: 100%;
        }

        .modify-table-basic {
            border-top: 2px solid rebeccapurple;
            border-bottom: 1px solid lightgray;
            width: 100%;
            margin-bottom: 30px;
        }

        .modify-table-basic tr td {
            height: 40px;
            width: 300px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .modify-table-basic tr th {
            height: 40px;
            width: 80px;
            padding-left: 60px;
            padding-top: 10px;
            padding-bottom: 10px;
        }


        .modify-table-basic input {
            height: 35px;
            width: 300px;
            padding: 10px;
        }

        .modify-table-email {
            width: 150px;
            height: 35px;
            background-color: rebeccapurple;
            border: 1px solid rebeccapurple;
            color: white;
            font-size: 13px;
        }

        .modify-table-add {
            border-top: 2px solid rebeccapurple;
            border-bottom: 1px solid lightgray;
            width: 100%;
            margin-bottom: 30px;
        }

        .modify-table-add tr td {
            height: 40px;
            width: 300px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .modify-table-add tr th {
            height: 40px;
            width: 80px;
            padding-left: 60px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .birth-day {
            width: 300px;
            border: 1px solid gray;
        }

        .birth {
            width: 300px;
            border: 0 none;
            background: transparent;
            height: 35px;
            padding: 10px;
        }

        .birth-text {
            height: 20px;
        }

        .recommend-id {
            height: 35px;
            width: 300px;
            padding: 10px;
        }

        .personalData-choice {
            color: gray;
        }

        .personalData-modal {
            color: rebeccapurple;
            font-size: 12px;
        }

        .modal-table {
            width: 100%;
            margin-bottom: 10px;
        }

        .modal-table tr th {
            text-align: center;
            border: 1px solid lightgray;
            height: 40px;
            background-color: #ebebfa;
        }

        .modal-table tr td {
            text-align: center;
            border: 1px solid lightgray;
            height: 40px;
        }

        .modal-close-button {
            width: 150px;
            height: 35px;
            margin-bottom: 5px;
            background-color: rebeccapurple;
            border: 0 none;
            color: white;
            font-size: 13px;
        }

        .modal-footer {
            text-align: center;
        }

        .modify-table-notice-agree {
            border-top: 2px solid rebeccapurple;
            border-bottom: 1px solid lightgray;
            width: 100%;
            margin-bottom: 30px;
        }

        .modify-table-notice-agree tr th {
            height: 10px;
            width: 50px;
            padding-top: 20px;
            padding-bottom: 10px;
            padding-left: 60px;
        }

        .modify-table-notice-agree tr td {
            height: 10px;
            width: 30px;
            padding-bottom: 20px;
            padding-left: 60px;
        }
        
        .check-view {
            display: block;
            padding-left: 20px;
        }
        
        .modify-cancleNwithdrawal {
            width: 130px;
            height: 40px;
            margin-bottom: 5px;
            background-color: white;
            border: 1px solid rebeccapurple;
            color: rebeccapurple;
        }
        
        .modify-confirm {
            width: 130px;
            height: 40px;
            background-color: rebeccapurple;
            border: 1px solid rebeccapurple;
            color: white;
            font-size: 13px;
            font-weight: bold;
        }
        
        .modify-footer-button {
            text-align: center;
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
                    <a href="#" class="list-group-item notic-menu">개인 정보 수정
                        <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
                </div>
            </div>

            <!-- 회원정보수정 버튼 클릭하면 alert뜨고 다시 개인정보수정 페이지 -->
            <div class="col-sm-10">
                <h3>개인정보수정</h3>

                    <form method="post" action="complete.hta">
                <div>
                    <p><span class="modify-title">기본정보</span><span class="modify-title-small">*필수입력사항</span></p>
                    <div class="modify-table">
                        <table class="modify-table-basic">
                            <tr>
                                <th>아이디*</th>
                                <td><input type="text" value="${LOGINCUSTOMER.id }" readonly="readonly" name="id"></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호*</th>
                                <td><input type="password" id="pwd-2" name="newPwd" onkeyup="checkNewPwd()">
                                <span id="msg-box-2"></span></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호 확인*</th>
                                <td><input type="password" id="pwd-2ck" name="newPwdCk" onkeyup="checkNewPwdCk()">
                                <span id="msg-box-3"></span></td>
                            </tr>
                            <tr>
                                <th>이름*</th>
                                <td><input type="text" value="${LOGINCUSTOMER.name }" name="name"></td>
                            </tr>
                            <tr>
                                <th>이메일*</th>
                                <td><input type="text" id="custEmail" value="${LOGINCUSTOMER.email }" name="custEmail">
                                <button type="button" onclick="checkEmail()" class="modify-table-email">이메일 중복확인</button></td>
                            </tr>
                            <tr>
                                <th>휴대폰*</th>
                                <td><input type="text" value="${LOGINCUSTOMER.phoneNumber }" name="phone"><span><small style="color: gray;">&nbsp; '-'를 제외한 휴대폰 번호를 적어주세요.</small></span></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div>
                    <p><span class="modify-title">추가정보</span></p>

                    <table class="modify-table-add">
                        <tr>
                            <th>성별*</th>
                            <td>
                                <input type="radio" name="gender" value="male" <c:if test="${LOGINCUSTOMER.gender eq 'male'}">checked</c:if>/>남&nbsp;
                                <input type="radio" name="gender" value="female" <c:if test="${LOGINCUSTOMER.gender eq 'female'}">checked</c:if>/>여&nbsp;
                                <input type="radio" name="gender" value="none" <c:if test="${LOGINCUSTOMER.gender eq 'none'}">checked</c:if>/>해당없음</td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td>
                             	<div class="birth-day">
                             		<input name="birth" class="birth" type="text" placeholder="YYYY - MM - DD" value="${LOGINCUSTOMER.birthday eq 'null-null-null' ? '' : LOGINCUSTOMER.birthday}" />
                             	</div>
                            </td>
                        </tr>
                        <tr>
                            <th>선택약관 동의</th>
                            <td><input type="checkbox" id="personalData-ck" name="personalData" <c:if test="${LOGINCUSTOMER.agree eq 'true'}">checked</c:if> /><span class="">&nbsp;
                            개인정보처리방법</span><span class="personalData-choice">(선택)</span>&nbsp;
                            <a type="text" class="personalData-modal" data-toggle="modal" data-target="#myModal">약관보기<span class="glyphicon glyphicon-menu-right"></span></a></td>
                        </tr>
                    </table>

                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">개인정보 수집·이용 동의(선택)</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="modal-table">
                                        <tr>
                                            <th>수집 목적</th>
                                            <th>수집 항목</th>
                                            <th>보유 기간</th>
                                        </tr>
                                        <tr>
                                            <td>맞춤형 회원 서비스 제공</td>
                                            <td>성별, 생년월일</td>
                                            <td>회원 탈퇴 후 30일 내</td>
                                            
                                        </tr>
                                    </table>

                                    <p>※ 동의를 거부하시는 경우에도 서비스는 이용하실 수 있습니다.</p>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="modal-close-button" data-dismiss="modal">확인</button>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="modify-footer-button">
                    <input type="button" onclick="location.reload()" class="modify-cancleNwithdrawal" value="취소">&nbsp;
                    <input type="button" onclick="location.href='memberQuit.hta'" class="modify-cancleNwithdrawal" value="탈퇴"/>&nbsp;
                    <input type="button" class="modify-confirm" value="회원정보수정" id="confirm" onclick="modifyConfirm();"/>
                </div>
                    </form>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
	    
	    function checkNewPwd() {
	    	var newpwd = document.getElementById("pwd-2").value;
	    	var msgbox2 = document.getElementById("msg-box-2");
	    	
	    	if(newpwd.length <= 7) {
	    		msgbox2.textContent = "비밀번호는 8글자 이상 입력해야 합니다.";
	    		msgbox2.style.color = 'red';
	    		return;
	    	} else if(newpwd.length >= 8) {
	    		msgbox2.textContent = "";
				return;
	    	}
	    }
	    
	    function checkNewPwdCk() {
	    	var newpwd = document.getElementById("pwd-2").value;
	    	var newpwdck = document.getElementById("pwd-2ck").value;
	    	
	    	var msgbox3 = document.getElementById("msg-box-3");
	    		    	
	    	if(newpwd != newpwdck) {
	    		msgbox3.textContent = "비밀번호가 일치하지 않습니다.";
	    		msgbox3.style.color = 'red';
	    		return;
	    	} else if(newpwd == newpwdck) {
	    		msgbox3.textContent = "";
				return;
	    	}
	    }
	    
	    function checkEmail() {
	    	var email = document.getElementById("custEmail").value;
	    	
	    	var xhr = new XMLHttpRequest();
	    	xhr.onreadystatechange = function() {
	    		if(xhr.readyState == 4 && xhr.status == 200) {
	    			var data = JSON.parse(xhr.responseText);
	    			if(data.exist == "N") {
						alert("중복되는 이메일입니다.");
					} else if (data.exist == "Y") {
						alert("사용가능한 이메일입니다.");
					}
				}
			}
			xhr.open("GET", "ckeckemail.hta?email=" + email);
			xhr.send();
		}
	    
	    function modifyConfirm() {
	    	var newpwd = document.getElementById("pwd-2").value;
	    	var newpwdck = document.getElementById("pwd-2ck").value;
	    	var email = document.getElementById("custEmail").value;
	    	
	    	if(!newpwd == "" && newpwdck == "") {
	    		alert("비밀번호를 확인하세요.");
	    		return false;
	    	}
	    	
	    	var xhr = new XMLHttpRequest();
	    	xhr.onreadystatechange = function() {
	    		if(xhr.readyState == 4 && xhr.status == 200) {
	    			var data = JSON.parse(xhr.responseText);
	    			if(data.result == "Y" && data.checkEmail == "Y") {
						alert("회원정보가 수정되었습니다.");
						window.location.href = "modifyform.hta";
					} else if (data.result == "N") {
						alert("에러) 로그아웃 후 다시 시도해주세요.");
					} else if (data.checkEmail == "N") {
						alert("이메일 중복 확인을 하세요.");
					}
				}
			}
			xhr.open("POST", "complete.hta");
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			var pwd = document.querySelector('#pwd-2').value;
			var name= document.querySelector('[name=name]').value;
			var email= document.querySelector('[name=custEmail]').value;
			var phone= document.querySelector('[name=phone]').value;
			var gender= document.querySelector('input[name="gender"]:checked').value;
			var birth= document.querySelector('[name=birth]').value;
			var agree= document.querySelector('[name=personalData]').checked;
			
			xhr.send("newPwd=" + pwd + "&name=" + name + "&custEmail=" + email + "&phone=" + phone + "&gender=" + gender + "&birth=" + birth + "&personalData=" + agree);
	    }
	    
    </script>
    
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
