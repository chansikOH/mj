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
    	.modify-title {
    		margin-top: 50px;
            font-weight: bolder;
            color: #5D5D5D;
        }
        .modify-input {
            width: 100%;
            height: 30px;
            margin-top: 10px;
            border: 1px solid #d9d9d9;
        }
        .modify-category-list {
            width: 35%;
            height: 30px;
        }
        .table>tbody>tr>td {
            width: 110px;
            padding: 15px;
            border: 1px solid #e8e8e8;
        }
        .table>tbody>tr>th {
            width: 50px;
            padding: 15px 0 15px 20px;
            background-color: #F7F5F8;
            border: 1px solid #e8e8e8;
            text-align: left;
            font-weight: normal;
            vertical-align: middle;
        }
        .modify-btn, .modify-btn:hover{
            background-color: purple;
            color: white;
            margin-top: 30px;
        }
        .modify-table-top {
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
            <h2 class="modify-title">상품 정보 수정</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <form method="post" action="productUpdate.hta" enctype="multipart/form-data">
            	<input type="hidden" name="prono" value="${param.no}">
                <table class="table">
                    <tbody>   
                        <tr>
                            <th class="modify-table-top">카테고리</th>
                            <td colspan="3" class="modify-table-top">
                                <select class="modify-category-list" name="procat">
                                    <option>선택해주세요</option>
                                    <option value="101" ${product.catNo eq '101'?"selected" : ""}>기본채소</option>
                                    <option value="102" ${product.catNo eq '102' ?"selected" : ""}>쌈.샐러드.간편채소</option>
                                    <option value="103" ${product.catNo eq '103' ?"selected" : ""}>브로콜리.특수채소</option>
                                    <option value="201" ${product.catNo eq '201' ?"selected" : ""}>국산과일</option>
                                    <option value="202" ${product.catNo eq '202' ?"selected" : ""}>견과류</option>
                                    <option value="203" ${product.catNo eq '203' ?"selected" : ""}>쌀.잡곡</option>
                                    <option value="301" ${product.catNo eq '301' ?"selected" : ""}>생선류</option>
                                    <option value="302" ${product.catNo eq '302' ?"selected" : ""}>해산물.조개류</option>
                                    <option value="303" ${product.catNo eq '303' ?"selected" : ""}>건어물.다시팩</option>
                                    <option value="401" ${product.catNo eq '401' ?"selected" : ""}>소고기</option>
                                    <option value="402" ${product.catNo eq '402' ?"selected" : ""}>돼지고기</option>
                                    <option value="403" ${product.catNo eq '403' ?"selected" : ""}>계란류</option>
                                    <option value="501" ${product.catNo eq '501' ?"selected" : ""}>국.탕.찌개</option>
                                    <option value="502" ${product.catNo eq '502' ?"selected" : ""}>밑반찬</option>
                                    <option value="503" ${product.catNo eq '503' ?"selected" : ""}>메인요리</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                        	<th>상품명</th>
                        	<td><input type="text" class="modify-input" name="proname" value="${product.name }"></td>
                        	<th>가격</th>
                        	<td><input type="text" class="modify-input" name="proprice" value="${product.price}"></td>
                        </tr>
                        <tr>
                        	<th>간단설명</th>
                        	<td colspan="3"><input type="text" class="modify-input" name="prosimple" value="${product.simple }"></td>
                        </tr>
                        <tr>
                        	<th>재고</th>
                        	<td><input type="text" class="modify-input" name="prostock" value="${product.stock }"></td>
                        	<th>할인율</th>
                        	<td><input type="text" id="discountRate-box" ${product.discount eq 0 ? "readonly" : ""} class="modify-input" name="prodiscount" value="<fmt:parseNumber integerOnly="true" value="${product.discount *100}"/>"></td>
                        </tr>
                        <tr>
                        	<th>세일여부</th>
                        	<td>
                        		<input type="radio" name="prosale" onchange="displayDicountRate('N')" value="N" ${product.discount eq 0 ? 'checked="checked"' : ""}>정가
                        		<input type="radio" name="prosale" onchange="displayDicountRate('Y')"value="Y" ${product.discount gt 0 ? 'checked="checked"' : ""}>할인
                        	</td>
                        	<th>판매여부</th>
                        	<td>
                        		<input type="radio" name="proused" value="Y" ${product.usedYn eq 'Y' ? 'checked="checked"' : "" }>판매
                        		<input type="radio" name="proused" value="N" ${product.usedYn eq 'N' ? 'checked="checked"' : "" }>절판
                        	</td>
                        </tr>
                        <tr>
                        	<th>상품사진</th>
                        	<td colspan="1"><img width="80px;" id="Preview-img" src="../../images/product/${product.img }"></td>
                        	<td colspan="2"><input type="file" id="imgInp" class="modify-input" name="proimg"  value="${product.img }"></td>
                        </tr>
                        <tr>
                        	<td colspan="4" class="text-right">
                        		<input type="submit" class="btn modify-btn"  value="등록"/>
                        		<input type="button" onclick="history.go(-1)" class="btn modify-btn" value="취소"/>
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
	function displayDicountRate(status) {
		if(status == 'Y'){
			document.getElementById("discountRate-box").removeAttribute("readonly");
			
		}
		if(status == 'N'){
			document.getElementById("discountRate-box").setAttribute("readonly", "readonly");
		}
	}
	
	function readURL(input) {
		if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#Preview-img').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
	}
	$("#imgInp").change(function() {
        readURL(this);
    });
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>