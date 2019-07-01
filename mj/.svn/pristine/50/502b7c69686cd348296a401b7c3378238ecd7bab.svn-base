<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>민지 컬리 로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        .login {
            margin: 50px;
            margin-top: 100px;
            color: purple;
        }

        .pwd {
            margin-top: 10px;
        }

        .table {
            padding: 50px;
        }

        .hr-purple {
            border: 1px solid purple;
            width: 800px;
        }

        .button button:hover {
            background: #6a3664;
            color: #ffffff;
        }

        .button button {
            background-color: #ffffff;
            color: #6a3664;
            border: 1px solid #6a3664;
        }

        .btn-submit {
            background-color: #795B8f;
            color: #ffffff;
            padding: 20px;
            border: 1px solid #795b8f;
        }

        .btn-submit:hover {
            background-color: #ffffff;
             color: #795B8f;
        }
        a {
            color: inherit;
        }
        a:hover {
            color: inherit;
            text-decoration: none;
        }
    <%@ include file="../common/head-foot-style.jsp"%>
    </style>
</head>




<body onload="checklogin();">
<%@ include file="../common/header.jsp"%>
    <div class="container">
        <div class="row text-center">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="login"><strong>로그인</strong></h1>
            </div>
            <div class="col-sm-3">
            </div>
        </div>

        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <form class="well" action="login.hta">
                    <div class="row">
                        <div class="col-sm-3">
                            <p>아이디</p>
                            <p>비밀번호</p>
                        </div>
                        <div class="col-sm-6 form-group">
                            <input type="text" class="id" id="userid" name="userid" />
                            <br />
                            <input type="password" class="pwd" id="userpwd" name="userpwd" />
                        </div>
                        <div class="col-sm-3">
                            <input type="submit" value="회원 로그인" class="btn btn-submit" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <hr class="hr-purple" />

        <div class="row">
            <div class="col-sm-8 button col-sm-offset-3">
               <a href="searchById.hta"><button class="btn btn-lg">아이디 찾기</button></a>
                <a href="searchByPwd.hta"><button class="btn btn-lg">비밀번호 찾기</button></a>
                <a href="addCustomer.hta"><button class="btn btn-lg">회원가입</button></a>
            </div>
            <div class="col-sm-1">
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp"%>
    <script type="text/javascript">
   	function checklogin() {
    	var url = window.location.href
    	var spliturl = new Array();
    	spliturl = url.split("=");
    	if("nullfail" == spliturl[1]) {
    		alert("올바르지않는 아이디입니다.");
    	}
    	
    	if("neqfail" == spliturl[1]) {
    		alert("아이디나 비밀번호가 일치하지 않습니다.");
    	}
    	
    	if("nofail" == spliturl[1]){
    		alert("이미 탈퇴한 회원입니다.");
    	}
    	
	}
    	
    </script>
</body></html>


