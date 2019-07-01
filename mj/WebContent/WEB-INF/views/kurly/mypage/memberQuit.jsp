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
        h1 {
            font-weight: bold;
            text-align: center;
            color: rebeccapurple;
        }
        
        h3 {
            color: darkgray;
            padding: 50px 0 0px;
            font-size: 20px;
            line-height: 28px;
            font-family: "Noto Sans";
            font-weight: 700;
            
            letter-spacing: 0;
        }
        
        hr {
            border-color: rebeccapurple;
            border-width: medium;
        }
        
        .memberCols1 {
            width: 150px;
            padding: 25px 0 23px 20px;
            text-align: left;
            vertical-align: middle;
            font-size: 13px;
            font-weight: bold;
        }
        
        .memberCols2 {
            width: auto;
            padding: 0px 5px 5px 5px;
            border-top: 0px solid #e8e8e8;
            vertical-align: middle;
            text-align: left;
        }
        
        .boardWrite {
        border-bottom: 1px solid #dddfe1;
        }
        
        .button {
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
<div class="container">
<h1>회원탈퇴</h1>
<h3>회원탈퇴안내</h3>
<hr>

<div class="boardWrite">
    <table width="100%">
        <tbody>
            <tr>
                <td class="memberCols1">
                회원탈퇴안내
                </td>
                <td class="memberCols2">
                고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.<br>
                불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br>
                <br>
                ■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.<br>
                1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리 됩니다.<br>
                2. 탈퇴 시 고객님께서 보유하셨던 적립금은 삭제 됩니다.<br>
                3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.<br>
                4. 회원 탈퇴 시 컬리패스 해지는 별도로 고객행복센터(1644-1107)를 통해서 가능합니다. 직접 해지를 요청하지 않으면 해지 처리가 되지 않습니다.<br>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<h3>회원탈퇴하기</h3>

<hr>

<form method="post" action="quitcheck.hta">
	<div class="boardWrite">
		<input type="hidden" name="userid" value="${LOGINCUSTOMER.id }">
		
	    <table width="100%">
	        <tbody>
	        <tr>
	            <td class="memberCols1" style="text-align: center">비밀번호가<br>어떻게<br>되세요?</td>
	            <td class="memberCols2"><input type="password" name="userpwd" size="20"></td>
	        </tr>
	        <tr>
	            <td class="memberCols1" style="text-align: center">무엇이<br>불편하셨나요?</td>
	            <td class="memberCols2">
	                <div style="float:left;padding-right:10px;">
	                <div class="list-wrap"><label><input type="checkbox" name="service" value="Y">&nbsp;고객서비스(상담,포장 등) 불만</label></div>
	                <div class="list-wrap"><label><input type="checkbox" name="delivery" value="Y">&nbsp;배송불만</label></div>
	                <div class="list-wrap"><label><input type="checkbox" name="refund" value="Y">&nbsp;교환/환불/반품 불만</label></div>
	                <div class="list-wrap"><label><input type="checkbox" name="frequency" value="Y">&nbsp;방문 빈도가 낮음</label></div>
	                </div>
	                <div style="float:left;padding-right:10px;">
	                <div class="list-wrap"><label><input type="checkbox" name="price" value="Y">&nbsp;상품가격 불만</label></div>
	                <div class="list-wrap"><label><input type="checkbox" name="privacy" value="Y">&nbsp;개인 정보유출 우려</label></div>
	                <div class="list-wrap"><label><input type="checkbox" name="trust" value="Y">&nbsp;쇼핑몰의 신뢰도 불만</label></div>
	                <div class="list-wrap"><label><input type="checkbox" name="site" value="Y">&nbsp;쇼핑 기능 불만</label></div>
	                </div>
	            </td>
	        </tr>
	        <tr>
	            <td class="memberCols1" style="text-align: center">고객님의 진심어린<br>충고 부탁드립니다.<br>(1000자 이내)</td>
	            <td class="memberCols2"><div><textarea name="advice" cols="70" rows="8" class="box" style="resize: none"></textarea></div></td>
	        </tr>
	        </tbody>
	    </table>
	</div>


    <div class="text-right">
        <button type="reset" class="button" style="margin: 10px">취소</button>
        <button type="submit" class="button" style="margin: 10px">탈퇴</button>
    </div>
</form>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>