<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
</head>
<style>
    /*공통*/
    .panel-panel {
        margin: 20px;
        border-bottom: 1px solid #aaa;
    }

    .panel-heading {
        color: #aaa !important;
        font-size: 60px;
        border-bottom: 2px solid rebeccapurple;
    }

    .all-sub-desc {
        font-size: 13px;
        color: #555;
        text-align: center;
    }

    .all-plus-info {
        margin: 7px;
    }

    .all-info-title {
        padding-bottom: 20px;
    }

    .all-info-text {
        padding: 4px;
        margin: 2px;
        border: none;
    }

    /*상품정보*/
    .header {
        padding: 15px;
        margin: 80px;
        color: rebeccapurple;
        font-size: 80px;
        text-align: center;
    }

    .show_tbl .inner_show {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        padding: 20px 0 20px;
        border-top: 2px solid #512772;
        border-bottom: 1px solid #ddd;
        font-size: 14px;
        line-height: 20px;
        text-align: center;
        letter-spacing: -0.3px display: block;
        position: relative;
        height: 94px
    }

    /*이동버튼*/
    .move-button {
        margin: 70px;
        text-align: center;
    }

    .btn-move {
        margin: 10px;
        width: 550px;
        height: 50px;
        color: white;
        background-color: rebeccapurple;
    }

    .glyphicon-repeat {
        font-size: 20px;
    }
    
    .btn-show, .btn-show:hover {
    	text-decoration: none !important;
    	color: black !important;
    }
    .ico {
    	width: 20px;
    	margin-left: 5px;
    }
    .ordersheet-tap {
    	display: block;
    	margin-top: 5px;
    }
    #ordersheet-info {
    	display: none;
    }
    .ordersheet-txt {
    	color: #663399;
    }
    .img-thumbnail {
    	width: 80px;
    	border: 0px;
    }
    .table>thead>tr>th {
    	text-align: center;
    }
    .table-noborder>tbody>tr>td, .table-noborder>tbody>tr>th {
    	border-style: none;
    }
    .old-addr {
    	display: table-row;
    }
    .new-addr {
    	display: none;
    }
	<%@ include file="../common/head-foot-style.jsp" %>
</style>

<body>
	<%@ include file="../common/header.jsp" %>
    <div class="container">
		<form id="order-form" method="post" action="ordercomplete.hta">
			<!-- 타이틀 -->
	        <div class="header">
	            <h1 class="page-title"><strong>주문서</strong></h1>
	            <div class="all-sub-desc">
	                <p>
	                    주문하실 상품 명 및 수량을 정확하게 확인해 주세요.<br><br>
	                </p>
	            </div>
	        </div>
	
	        <!-- 상품정보 -->
	        <div>
	            <div class="show_tbl" id="ordersheet-title">
	                <div class="inner_show">
	                    <div class="name"> <strong class="ordersheet-txt">${proName }</strong> 포함 총 <strong>${proAmount }</strong>개의 상품을 주문합니다.</div>
	                    <div class="ordersheet-tap">
		                    <a class="btn-show" onclick="showInfo(event)">상세보기<img class="ico" src="https://res.kurly.com/pc/ico/1803/ico_arrow_open_28x16.png" alt="열기"></a>
	                    </div>
	                </div>
	            </div>
	
	            <div class="row" id="ordersheet-info">
	                <div class="col-sm-12">
	                    <div class="panel-panel">
	                        <div class="panel-heading">
	                            <h4><strong>상품정보</strong></h4>
	                        </div>
	                        <div class="panel-body">
	                            <table class="table">
	                            	<colgroup>
	                            		<col width="10%">
	                            		<col width="*">
	                            		<col width="15%">
	                            	</colgroup>
	                                <thead>
	                                    <tr>
	                                        <th colspan="2">상품정보</th>
	                                        <th>상품금액</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach var="cartInfo" items="${cartInfos }">
	                                    <tr>
	                                        <td>
	                                            <img src="/mj/images/product/${cartInfo.img }" class="img-thumbnail" />
	                                        </td>
	                                        <td>
	                                            <p><strong> ${cartInfo.proName }</strong></p>
	                                            <p>																			
	                                                ${cartInfo.proName } / ${cartInfo.cartAmount }개 / 개당 <fmt:formatNumber value="${cartInfo.proPrice }" />원
	                                            </p>
	                                        </td>
	                                        <td>
	                                        	<p><fmt:formatNumber value="${cartInfo.discountPrice * cartInfo.cartAmount}" />원</p>
	                                        </td>
	                                    </tr>
	                                	</c:forEach>
	                                </tbody>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <!-- 주문자정보 -->
	        <div class="row">
	            <div class="col-sm-12">
	                <div class="panel-panel">
	                    <div class="panel-heading">
	                        <h4><strong>주문자 정보</strong></h4>
	                    </div>
	                    <div class="panel-body">
	                    	<table class="table table-noborder">
	                    		<colgroup>
	                    			<col width="25%">
	                    			<col width="75%">
	                    		</colgroup>
	                    		<tbody>
	                    			<tr>
	                    				<th><strong>보내는 분</strong></th>
	                    				<td><strong>${custName }</strong></td>
	                    			</tr>
	                    			<tr>
	                    				<th><strong>휴대폰</strong></th>
	                    				<td><strong>${custPhone }</strong></td>
	                    			</tr>
	                    			<tr>
	                    				<th><strong>이메일</strong></th>
	                    				<td><strong>${custEmail }</strong></td>
	                    			</tr>
	                    		</tbody>
	                    	</table>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <!-- 배송정보 -->
	        <div class="row">
	            <div class="col-sm-12">
	                <div class="panel-panel">
	                    <div class="panel-heading">
	                        <h4><strong>배송정보</strong></h4>
	                    </div>
	                    <div class="panel-body">
	                    	<table class="table table-noborder">
	                    		<colgroup>
	                    			<col width="25%">
	                    			<col width="75%">
	                    		</colgroup>
	                    		<tbody style="border-bottom: 2px solid rebeccapurple">
	                    			<tr>
	                    				<th><strong>배송지선택</strong></th>
	                    				<td>
	                    					<div onchange="chanAddr();">
			                                    <p class="all-info-text">
			                                        <label class="label_radio">
			                                            <input id="selectDeliveryOn" type="radio" name="selectDelivery" checked="checked"> 최근 배송지
			                                            <input id="selectDeliveryOff" type="radio" name="selectDelivery" class="styled-radio-black"> 새로운 배송지
			                                        </label>
			                                    </p>
			                                </div>
	                    				</td>
	                    			</tr>
	                    		</tbody>
	                    	</table>
	                    	<table class="table table-noborder">
	                    		<colgroup>
	                    			<col width="25%">
	                    			<col width="75%">
	                    		</colgroup>
	                    		<tbody>
	                    			<tr class="old-addr" id="old-address">
	                    				<th><strong>주소</strong></th>
	                    				<td><strong>경기도 고양시 덕양구 화정동</strong></td>
	                    			</tr>
	                    			<tr class="new-addr" id="new-address">
	                    				<th><strong>주소</strong></th>
	                    				<td class="box">
	                    					<div class="box address-box">
												<button type="button" class="btn btn-default" style="width: 20%; height: 32px; margin-bottom: 20px;" onclick="openZipSearch()">주소검색</button><br/> 
												<input type="text" name="userzip" style="width: 20%; height: 26px; margin-bottom: 15px;" />
												<input type="text" name="useraddr1" style="width: 60%; height: 30px;" readonly /><br/> 
												<input type="text" name="useraddr2" style="width: 80%; height: 30px;" placeholder="상세주소를 입력하세요."/>
											</div>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th><strong>수령인이름</strong></th>
	                    				<td><strong>홍길동</strong></td>
	                    			</tr>
	                    			<tr>
	                    				<th><strong>휴대폰</strong></th>
	                    				<td>
	                    					<div>
			                                    <p class="all-info-text">
			                                        <input style="width:43px;" type="text" name=# value="010" size="3" maxlength="3" option="regNum" required="">
			                                        <span class="bar"><span></span></span>
			                                        <input style="width:50px;" type="text" name=# value="3932" size="4" maxlength="4" option="regNum" required="">
			                                        <span class="bar"><span></span></span>
			                                        <input style="width:50px;" type="text" name=# value="1671" size="4" maxlength="4" option="regNum" required="">
			                                    </p>
			                                </div>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<th><strong>배송요청사항</strong></th>
	                    				<td>
			                                <div>
			                                    <p class="all-info-text">
			                                        <textarea rows="5" cols="80" id="#" name="#" onkeyup="#"></textarea>
			                                    </p>
			                                </div>
	                    				</td>
	                    			</tr>
	                    			<tr>
	                    				<td colspan="2">
		                    				<p class="all-sub-desc">
					                            배송 지역 중 아래 장소는 <strong>배송 불가 장소</strong>입니다.<br>
					                            <strong>▶ 배송 불가 장소</strong> : 관공서/ 학교/ 병원/ 시장/ 공단 지역/ 산간 지역/ 백화점 등
					                        </p>
	                    				</td>
	                    			</tr>
	                    		</tbody>
	                    	</table>
	                    </div>
	                </div>
	            </div>
	        </div>
	  
	     <!-- 적립금사용 -->
        <div class="row">
            <div class="col-sm-8">
                <div class="panel-panel">
                    <div class="panel-heading">
                        <h4><strong>적립금 사용</strong></h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-sm-3" style="text-align: left">
                            <div id="all-info-title">
                                <div class="all-info-text">
                                    <label><strong>적립금 사용</strong></label><br />
                                </div >
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div id="all-info-title">
                                <div>                                  
                                    <input type="text" id="usePoint1" onkeyup="changepoint()">
                                </div>                
                                <div>
                                    <p>적립금:<span id="originalPoint"> ${originalPoint }</span> 원</p>                                
                                </div>
                            </div>     
                        </div>
                    </div>
                    <div class="col-sm-9 col-sm-offset-3">
                        <p class="all-sub-desc">
                            적립금 내역: <strong>마이컬리>적립금</strong>
                        </p>
                    </div>
                    <hr />
                    <hr />
                </div>
            </div>
            <div class="col-sm-4">
                <div class="panel-panel">
                    <div class="panel-heading">
                        <h4><strong>적립금 사용</strong></h4>
                    </div>
                    <div>
                        <div class="col-sm-6" style="text-align: left">
                            <div class="all-info-title">
                                <div class="all-info-text">
                                    <label><strong>상품 금액</strong></label><br />
                                </div>
                                <div class="all-info-text">
                                    <label><strong>상품할인금액</strong></label><br />
                                </div>
                                <div class="all-info-text">
                                    <label><strong>배송비</strong></label><br />
                                </div>
                                <div class="all-info-text">
                                    <label><strong>총 상품금액</strong></label><br />
                                </div>                                
                                <div class="all-info-text">
                                    <label><strong>적립금사용</strong></label><br />
                                </div>
                                <div class="all-info-text" style="color: rebeccapurple; font-size: 16px">
                                    <label><strong>최종결제금액</strong></label><br />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div id="all-info-title">
                                <div class="all-info-text">
                                    <p>${originalTotalPrice }원 </p>
                                </div>
                                <div class="all-info-text">
                                    <p> -${totalDiscount }원 </p>
                                </div>
                                <div class="all-info-text">
                                    <p>${orderFee }원 </p>
                                </div>
                                <div class="all-info-text">
                                    <p><span id="TotalPrice">${finalTotalPrice }</span>원</p>
                                </div>
                                <div class="all-info-text">
                                    <p><span id="usePoint2">0</span>원</p>
                                </div>
                                <div class="all-info-text">
                                    <p><span id="last-TotalPrice" name="lastTotalPrice">0</span>원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9 col-sm-offset-3">
                        <p class="all-sub-desc" style="text-align: right">   
                            회원등급 : <span id="grade">${gra}</span>
                        </p>
                        <p class="all-sub-desc" style="text-align: right">   
                            구매 시 <span id="plus-point" name="plusPoint">0</span>원 적립예정
                        </p>
                        
                    </div>
                </div>
            </div>
        </div>

<!--         <div class="row">
            <div class="col-sm-8">
                <div class="panel-panel">
                    <div class="panel-heading">
                        <h4><strong>결제</strong></h4>
                    </div>
                    <div class="panel-body">
                        <div class="col-sm-3" style="text-align: left">
                            <div id="all-info-title">
                                <div class="all-info-text">
                                    <strong>입금은행</strong>
                                </div>
                                <div class="all-info-text">
                                    <strong>입금자</strong>
                                </div>
                                <div class="all-info-text">
                                    <strong>입금금액</strong>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div id="all-info-title">
                                <div class="all-info-text">
                                    <strong>신한은행</strong>
                                </div>
                                <div class="all-info-text">
                                    <strong>양해림</strong>
                                </div>
                                <div class="all-info-text">
                                    <strong>38,000원</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-9 col-sm-offset-3">
                        <p class="all-sub-desc">
                            결제취소시 입금하신 통장으로 영업일 기준 3일 이내에 환불됩니다.
                        </p>
                    </div>
                    <hr />
                    <hr />
                </div>
            </div>
        </div> -->
	
	
	        <!-- 개인정보수집/제공 * -->
	        <div class="row">
	            <div class="panel-panel">
	                <div class="panel-heading">
	                    <h4><strong>개인정보 수집/제공*</strong></h4>
	                </div>
	                <div class="panel-body">
	                	<table class="table table-noborder">
                    		<tbody>
                    			<tr>
                    				<td>
                    					<input type="checkbox" />
			                            [필수] 개인정보 수집 및 이용동의
			                            <a type="text" class="personalData-modal" data-toggle="modal" data-target="#myModal">약관보기<span class="glyphicon glyphicon-menu-right"></span></a>
                    				</td>
                    			</tr>
                    		</tbody>
	                	</table>
	                </div>
	            </div>
	        </div>
	
	
	        <!-- 약관 -->	        
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
		                                    <th>
		                                        온라인 쇼핑 구매자에 대한 상품 결제 및 배송
		                                    <th>
		                                </tr>
		                                <tr>
		                                    <th>
		                                        결제정보, 수취인명, 휴대전화번호, 수치인주소
		                                    <th>
		                                </tr>
		                                <tr>
		                                    <th>
		                                        회원 탈퇴 후 30일 내 <br />
		                                        (단,타 법령에 따라 법령에서 규정한 기간동안 보존)
		                                    <th>
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
                  
        <!-- 결제하기 -->            
	    <div class="row cart-row">
            <div class="move-button">
                <button type="button" class="btn btn-move" onclick="submitOrder()">
                    <span class="glyphicon glyphicon-repeat"> 결제하기</span>
                </button>
            </div>
        </div>
        
        <input type="hidden" id="result-1" name="lastTotalPrice">
        <input type="hidden" id="result-2" name="plusPoint">

     
        </form>
    </div>
<%@ include file="../common/footer.jsp"%>



<script type="text/javascript">
	
	// 주소 API 
	function showInfo(event) {
		event.preventDefault();
		document.getElementById("ordersheet-info").style.display = "block";
		document.getElementById("ordersheet-title").style.display = "none";
	}
	
	function chanAddr() {
		var oldAddr = document.getElementById("old-address");
		var newAddr = document.getElementById("new-address");
		if(newAddr.style.display == "none" || newAddr.style.display == "") {
			newAddr.style.display = "table-row";
			oldAddr.style.display = "none";
		} else if (oldAddr.style.display == "none" || oldAddr.style.display == "") {
			oldAddr.style.display = "table-row";
			newAddr.style.display = "none";
		}
	}
	
	function openZipSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                $('[name=userzip]').val(data.zonecode); // 우편번호 (5자리)
                $('[name=useraddr1]').val(data.address);
                $('[name=useraddr2]').val(data.buildingName);
            }
        }).open();
    }
	
	// 포인트사용 
	function changepoint() {
		var usePoint = document.getElementById("usePoint1").value;
		if (usePoint == '') {
			usePoint = 0;
		}
		var originalPoint = parseInt(document.getElementById("originalPoint").textContent); 
		
		
		if (usePoint > originalPoint) {
			alert("적립금을 초과사용 하였습니다.");
			document.getElementById("usePoint1").value = "";
			document.getElementById("usePoint2").textContent = 0; 
		} else {
			document.getElementById("usePoint2").textContent = usePoint;  
			finalPrice(usePoint); 
			plusPoint(); 
		}
	}
	
	// 포인트사용을 적용한 최종사용금액 
	function finalPrice(usePoint) {
		var TotalPrice = parseInt(document.getElementById("TotalPrice").textContent);
		var useP = parseInt(usePoint);
	
		var finalTotalPrice = TotalPrice - useP;
			
		document.getElementById("last-TotalPrice").textContent = finalTotalPrice; 
	}
	
	// 구매 시 적립금액 계산 
	function plusPoint() {
		
		var grade = document.getElementById("grade").textContent;
		var TotalPrice = parseInt(document.getElementById("last-TotalPrice").textContent);
		var plusPoint = 0;
		
		if (grade == "일반") {
			plusPoint = TotalPrice * 0.005;
		} else if (grade == "vip") {
			plusPoint = TotalPrice * 0.01;
		} else {
			plusPoint = TotalPrice * 0.03; 
		}
		
		document.getElementById("result-1").value =  Math.ceil(plusPoint);
		document.getElementById("result-2").value =  Math.ceil(TotalPrice);
	}
	
 	// 정보 ordercomplete에 넘기기 
	function submitOrder() {
 		
		// document.getElementById('result-1').value = 주소 입력하기  
		
		document.getElementById('order-form').submit();

	}

</script>
</body>

</html>
