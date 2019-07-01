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
	<style>
	    /*공통*/
	    .cart-row {
	        margin: 50px;
	    }
	    /*cart-header*/
	    .cart-header {
	        padding: 15px;
	        margin: 50px;
	        color: rebeccapurple;
	        font-size: 80px;
	        text-align: center;
	    }
	
	    .pg_sub_desc {
	        font-size: 13px;
	        color: #555;
	    }
	
	    .pg_sub_desc {
	        font-size: 13px;
	        color: #555;
	    }
	
	
	    /*상품선택*/
	    .panel-panel {
	        margin: 20px;
	    }
	
	    .panel-heading {
	        color: #aaa !important;
	        font-size: 60px;
	        border-bottom: 2px solid rebeccapurple;
	    }
	
	    .panel-body {}
	
	    .pro-table-text {
	        font-size: 16px;
	    }
	
	    .info-term {
	        margin: 5px;
	    }
	
	    .delete-button {
	        line-height: 35px;
	        font-size: 15px;
	        background-color: white;
	        border: 1px solid rebeccapurple;
	    }
	
	    .img-thumbnail {
	        width: 120px;
	        height: 120px;
	    }
	
	    .cart-amount {
	        font-size: 25px;
	    }
		.sold-out-text {
			font-size: 15px;
			color: red; 
		}
		.input-group {
			width: 15px; 
		}
		.btn-proamount {
			font-size: 18px; 
			padding: 10px;
		}
	
	    /*계산기*/
	    .col-sm-3 {
	        border: 2px solid #aaa;
	        padding: 15px;
	    }
	
	    .col-sm-1 {
	        line-height: 6;
	    }
	
	    .cal-title {
	        text-align: center;
	    }
	
	    .cal-price {
	        text-align: center;
	        font-size: 25px;
	        color: black;
	    }
	
	    .cal-info {
	        text-align: center;
	    }
	
	    .total-price {
	        border: 2px solid #aaa;
	        padding: 15px;
	        background-color: #e6ccff;
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
	
	    <%@ include file="../common/head-foot-style.jsp"%>
	
	</style>
</head>

<body>
    <%@ include file="../common/header.jsp" %>
    <div class="container">

        <!--cart-header-->
        <div class="cart-header">
            <h1 class="page-title"><strong>장바구니</strong></h1>
            <div class="pg_sub_desc">
                <p>
                    주문하실 상품명 및 수량을 정확하게 확인해주세요.<br><br>
                </p>
            </div>
        </div>
		
		<form id="cart-form" method="post" action="ordersheet.hta" >
        <!--상품선택 -->
        <div class="row cart-row">
            <div class="col-sm-12">
                <div class="panel-panel">
                    <div class="panel-heading">
                        <h4><strong>상품선택</strong></h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>
                                        <div class="checkbox-inline">
                                            <input type="checkbox" id="pro-all-ck-1" onchange="allCheckOrRelease1();">
                                            <p class="thead-text"><strong> 전체선택(<span id="select-Checkbox1" >0</span>/<span id="all-checkbox1">${cartCount }</span>)</strong></p>
                                        </div>
                                    </th>
                                    <th>
                                        <p>상품정보</p>
                                    </th>
                                    <th>
                                        <p>수량</p>
                                    </th>
                                    <th>
                                        <p>상품금액</p>
                                    </th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="cartInfo" items="${cartInfos }">	              
                                    <tr class="${cartInfo.usedYn eq 'N' ? 'danger' :'' }" id="row-${cartInfo.cartNo }" >
                                        <td>
                                            <div class="checkbox-inline">
                                                <input type="checkbox" id="individual-checkbox-${cartInfo.proNo }" name="individualcheckbox" ${cartInfo.usedYn eq 'N' ? 'disabled' :'' } value="${cartInfo.cartNo }" onclick="selectCheckbox()">
                                                <img src="/mj/images/product/${cartInfo.img }" class="img-thumbnail" />
                                            </div>
                                        </td>
                                        <td>
                                            <p class="pro-table-text"><strong>${cartInfo.proName }</strong></p>
                                            <p ><span id="real-price-${cartInfo.cartNo }"><fmt:formatNumber value="${cartInfo.discountPrice}" /></span>원</p>
                                               <c:if test="${cartInfo.saleYn eq 'Y'}">
                                                   <p class="line-through"><span id="original-price-${cartInfo.cartNo }"><fmt:formatNumber value="${cartInfo.proPrice}" /></span>원</p>
                                               </c:if>                                                    
                                           
                                               <c:if test="${cartInfo.usedYn eq 'N' }">
                                                   <p class="sold-out-text">해당 상품이 품절되었습니다.</p>                                                    
                                               </c:if>
                                        </td>
                                        <td>
                                            <div class="input-group">
                                             	<div class="input-group-btn">
                                                	<button type="button"  class="btn btn-default" onclick="minusAmount(${cartInfo.cartNo })" id="btn-minus-"${cartInfo.cartNo }  ${cartInfo.usedYn eq 'N' ? 'disabled' :'' } ><i class="glyphicon glyphicon-minus"></i></button>
                                                </div>
                                                <p id="amount-${cartInfo.cartNo}" class="btn-proamount" min="1">${cartInfo.cartAmount }</p>
                                                <div class="input-group-btn">
                                                	<button type="button" class="btn btn-default" onclick="plusAmount(${cartInfo.cartNo })" id="btn-plus-"${cartInfo.cartNo}  ${cartInfo.usedYn eq 'N' ? 'disabled' :'' }><i class="glyphicon glyphicon-plus"></i></button>
                                                </div>
                                            </div> 
                                        </td>
                                        <td>																					
                                          <p><span id="individual-totalPrice-${cartInfo.cartNo }"><fmt:formatNumber value="${cartInfo.discountPrice * cartInfo.cartAmount }" /></span>원</p>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-default btn-sm" style="color: rebeccapurple; " onclick="deleteOneItem(${cartInfo.cartNo})" >
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td>
                                        <div class="checkbox-inline">
                                            <input type="checkbox" id="pro-all-ck-2" onchange="allCheckOrRelease2();">
                                            <p class="thead-text"><strong> 전체선택(<span id="select-Checkbox2" >0</span>/<span id="all-checkbox2">${cartCount }</span>)</strong></p>
                                        </div>
                                    </td>
                                    <td>
	                                    <button type="button" class="delete-button" onclick="deleteAllSelectedItems()">선택삭제</button>
	                                    <button type="button" class="delete-button" onclick="deleteSoldOutItems()">품절상품삭제</button>
	                                    <button type="button" class="delete-button" onclick="deleteAllItems()">전체상품삭제</button> 
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        
           
			// 전체선택 혹은 전체해제
            function checkOrRelease(status) {
                var checkboxes = document.querySelectorAll("[name=individualcheckbox]");
                var count = 0;
          			
                for (var i = 0; i < checkboxes.length; i++) {
                    var checkbox = checkboxes[i];
                    var el = document.getElementById("row-"+ checkbox.value);
                    if (!el.classList.contains('danger')) {
	                    checkbox.checked = status;
	                    count += 1;
	                    updatePrice();
                    }
                }
                changeSelectedCount();
            }
			
        	// 전체선택 혹은 전체해제 1
            function allCheckOrRelease1() {
                checkOrRelease(document.getElementById("pro-all-ck-1").checked);
            }
			
        	// 전체선택 혹은 전체해제 2
            function allCheckOrRelease2() {
                checkOrRelease(document.getElementById("pro-all-ck-2").checked);
            }
	
			// 선택된 체크박스  
			function selectCheckbox() {
        		var checkboxes = document.querySelectorAll("[name=individualcheckbox]");
        		var checked = 0; 
        		
        		for (var i = 0; i<checkboxes.length; i++) {
        			var checkbox = checkboxes[i];
					if(checkbox.checked == true) {
						checked += 1 ; 
					}
        		}
				updatePrice();
        		document.getElementById("select-Checkbox1").textContent = checked; 
        		document.getElementById("select-Checkbox2").textContent = checked; 
        	}	
			
			// 장바구니에 있는 모든 상품갯수
			function allCheckbox() {
				var checkboxes = document.querySelectorAll("[name=individualcheckbox]");
        		var all = checkboxes.length;
        		
        		document.getElementById("all-checkbox").textContent = all; 
			}
			
			// 체크박스 변화 시 갯수변경 
            function changeSelectedCount() {
        		var checkboxes = document.querySelectorAll("[name=individualcheckbox]");
       		    var count = 0;
 				
                 for (var i = 0; i < checkboxes.length; i++) {
                     var checkbox = checkboxes[i];
                     var el = document.getElementById("row-"+ checkbox.value);
                     if (checkbox.checked == true && !el.classList.contains('danger')) {
 	                    count += 1;
                     }
                 }
                 document.getElementById("select-Checkbox1").textContent= count
                 document.getElementById("select-Checkbox2").textContent= count
                 
            }
			// 수량 변화 시 총 상품갯수 변경 
			function changeAllCount() {
				var checkboxes = document.querySelectorAll("[name=individualcheckbox]");
       		    var count = 0;
 				 
                 for (var i = 0; i < checkboxes.length; i++) {
                     var checkbox = checkboxes[i];
                     var el = document.getElementById("row-"+ checkbox.value);
                     if (!el.classList.contains('danger')) {
 	                    count += 1;
                     }
                 }
                 document.getElementById("all-checkbox1").textContent= count
                 document.getElementById("all-checkbox2").textContent= count
			}
						
            // 하나의 상품 삭제 (x 버튼)
            function deleteOneItem(cartNo) {   	
        		var xhr = new XMLHttpRequest();

        		xhr.open("GET","deletecartitem.hta?cartNo=" + cartNo );
        		xhr.send();
        		xhr.onreadystatechange = function() {
        			if (xhr.readyState == 4 && xhr.status == 200) {
        				$("#row-" + cartNo).remove();
        				changeSelectedCount();
        				selectCheckbox();
        				updatePrice();
        				changeAllCount();
        			}	
        		}
        	}
            
            // 선택된 상품 삭제 (한개 or 여러개)
        	function deleteAllSelectedItems() {  
				var checkboxes = document.querySelectorAll("[name=individualcheckbox]");
        		
                for (var i = 0; i < checkboxes.length; i++) {
                    var checkbox = checkboxes[i];
                    
                    if(checkbox.checked == true) {
                    	var cartNo = checkbox.value;
                    	deleteOneItem(cartNo);
                    	updatePrice();
                    	changeAllCount();
                    }
                }
        	}
        	
            // 품절상품 삭제 
        	function deleteSoldOutItems() {
        		
        		var xhr = new XMLHttpRequest();
        		
        		xhr.open("GET","deletesoldoutitems.hta");
        		xhr.send();
        		xhr.onreadystatechange = function() {
        			if (xhr.readyState == 4 && xhr.status == 200) {
	    				var result = JSON.parse(xhr.responseText);
	    				if (result.success = "YES") {
	    					$('.danger').remove();        
	    				} else {
	    					alert("처리 중 오류가 발생하였습니다.");
	    				}
    				}	
        		}
        	}
        	
            // 장바구니 내 모든 상품 삭제 
          	function deleteAllItems() {
            	
            	var result = confirm("모든 상품을 삭제하시겠습니까?");
            	if (result) {
	            	location.href= "deleteallcartitem.hta"
	            	updatePrice();
	            	changeAllCount();
            	}
            }
            
            // 상품갯수 증가 (+)
			function plusAmount(cartNo)  {
				
				var el = document.getElementById("amount-" + cartNo) 
				
				var xhr = new XMLHttpRequest();

        		xhr.onreadystatechange = function() {
        			if (xhr.readyState == 4 && xhr.status == 200) {
	    				var result = JSON.parse(xhr.responseText);
	    				if (result.success = "YES") {
	    					el.textContent = parseInt(el.textContent) + 1
							changeindividualtotalprice (cartNo); 
	    					updatePrice();
	    				} else {
	    					alert("처리 중 오류가 발생하였습니다.");
	    				}
    				}	
        		}
				xhr.open("GET","updateProAmount.hta?type=p&cartNo=" + cartNo);
				xhr.send();
			}
			
			// 상품갯수 감소 (-)
			function minusAmount(cartNo) {
				
				var el = document.getElementById("amount-" + cartNo) 
				var xhr = new XMLHttpRequest();
	
				if (el.textContent <= 1) {
					alert("한개 이상의 상품을 선택해주시기 바랍니다.");
					el.textContent = 1;
				} else {					
	        		xhr.onreadystatechange = function() {
	        			if (xhr.readyState == 4 && xhr.status == 200) {
		    				var result = JSON.parse(xhr.responseText);
		    				if (result.success = "YES") {
		    					el.textContent = parseInt(el.textContent) - 1
								changeindividualtotalprice (cartNo); 
			    				updatePrice();
		    				} else {
		    					alert("처리 중 오류가 발생하였습니다.");
		    				}
	    				}	
	        		}
					xhr.open("GET","updateProAmount.hta?type=m&cartNo=" + cartNo);
					xhr.send();
				}	

			}
			
			// 수량변경 시 각 상품의 총계 변경 
			function changeindividualtotalprice (cartNo) {
				
				var amount = document.getElementById("amount-" + cartNo).textContent; 
				var price = document.getElementById("real-price-"+ cartNo).textContent;
				var realprice = price.replace(/,/g,'');
				
				var individualtotalprice = amount * realprice;
				
				individualtotalprice = new Number(individualtotalprice).toLocaleString();
				
				document.getElementById("individual-totalPrice-" + cartNo).textContent = individualtotalprice;
			}
		
			
        </script>


        <!--계산기능 -->
        <div class="row cart-row">
            <div class="col-sm-12">
                <div class="col-sm-9">
                    <div class="col-sm-3">
                        <p class="cal-title">상품금액</p>
                        <p class="cal-price"><span id="original-total-price">0</span>원</p>   
                        <p class="cal-info"></p>
                    </div>
                    <div class="col-sm-1">
                        <p class="glyphicon glyphicon-minus"></p>
                    </div>
                    <div class="col-sm-3" id="cal">
                        <p class="cal-title">할인금액</p>
                        <p class="cal-price"><span id="total-discount">0</span>원</p>  
                        <p class="cal-info"></p>
                    </div>
                    <div class="col-sm-1">
                        <p class="glyphicon glyphicon-plus"></p>
                    </div>
                    <div class="col-sm-3">
                        <p class="cal-title">배송금액</p>
                        <p class="cal-price"><span id="order-fee">3,000</span>원</p>
                        <p class="cal-info" ></p>
                    </div>
                    <div class="col-sm-1">
                        <strong>
                            <p class="glyphicon glyphicon-menu-right">
                        </strong>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="total-price">
                        <p class="cal-title">결제금액</p>
                        <p class="cal-price"><span id="final-total-price">0</span>원</p> 
                        <p class="cal-info" ></p>
                    </div>
                </div>
            </div>
        </div>
      

        <div class="row cart-row">
            <div class="move-button">
                <button type="button" class="btn btn-move" onclick="submitOrder()">
                    <span class="glyphicon glyphicon-repeat"> 주문하기</span>
                </button>
            </div>
        </div>
        
        <input type="hidden" id="result-1" name="originalTotalPrice">
        <input type="hidden" id="result-2" name="totalDiscount">
        <input type="hidden" id="result-3" name="orderFee">
        <input type="hidden" id="result-4" name="finalTotalPrice">
		</form>
    </div>
    
    <script type="text/javascript">
    
	 	// 체크된 것만 계산
		function updatePrice() {
		
			var checkboxes = document.querySelectorAll("[name=individualcheckbox]"); 
				var	originalTotalPrice = 0;  // 할인적용 전 총 가격 	
				var discountTotalPrice = 0;	 // 할인적용 후 총 가격 
				
				document.getElementById("original-total-price").textContent = 0;
				document.getElementById("total-discount").textContent = 0;
				document.getElementById("final-total-price").textContent = 0; 
				
				var x = 'N'; 
				
				for (var i = 0; i < checkboxes.length; i++) {
		            var checkbox = checkboxes[i];
		            var ischeck = checkbox.checked;
		            
		            if(ischeck == true) {
		            	var cartNo = checkbox.value;
		            	x = 'Y'; 
		            	var amount = document.getElementById("amount-" + cartNo).textContent; 
						var saleprice = document.getElementById("real-price-"+ cartNo).textContent;
						var realsaleprice = saleprice.replace(/,/g,'');
						
						discountTotalPrice += amount * realsaleprice;
						
						var beforeprice = 0;
		            
						if (document.getElementById("original-price-"+ cartNo) == null) {
		            		originalTotalPrice += amount * realsaleprice;
		            	} else {                    		
		    				beforeprice = document.getElementById("original-price-"+ cartNo).textContent;
		        			var realbeforeprice = beforeprice.replace(/,/g,'');	
		        			originalTotalPrice += amount * realbeforeprice;                		
		            	}
		            }
		        }     
				
				if (x == 'N') { 
					document.getElementById("original-total-price").textContent = 0;
					document.getElementById("total-discount").textContent = 0;
					document.getElementById("final-total-price").textContent = 0; 
				} else {
					var totalDiscount = originalTotalPrice - discountTotalPrice;     	// 할인적용 가격
					var finalTotalPrice = originalTotalPrice - totalDiscount + 3000;    // 할인 및 택배비용 적용 후 가격 
			
					
					document.getElementById('result-1').value = originalTotalPrice;
					document.getElementById('result-2').value = totalDiscount;
					document.getElementById('result-3').value = 3000;
					document.getElementById('result-4').value = finalTotalPrice;
					
					originalTotalPrice = new Number(originalTotalPrice).toLocaleString();
					totalDiscount = new Number(totalDiscount).toLocaleString();
					finalTotalPrice = new Number(finalTotalPrice).toLocaleString();
					
					document.getElementById("original-total-price").textContent = originalTotalPrice;
			        document.getElementById("total-discount").textContent = totalDiscount;
			        document.getElementById("final-total-price").textContent = finalTotalPrice; 							
				}	
							
		}
	 	
	 	// 정보 ordersheet에 넘기기 
    	function submitOrder() {
    		var checkedCount = document.getElementById("select-Checkbox1").textContent;
    		if (checkedCount == '0') {
    			alert("선택된 상품이 없습니다.");
    		} else {
    			document.getElementById('cart-form').submit();
    		}
    	}
    </script>

<%@ include file="../common/footer.jsp"%>
</body>
</html>
