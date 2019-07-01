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
            <form method="post" action="" enctype="multipart/form-data">
            	<input type="hidden" name="prono" value="">
                <table class="table">
                    <tbody>   
                        <tr>
                            <th class="modify-table-top">카테고리</th>
                            <td colspan="3" class="modify-table-top">
                                <select class="modify-category-list" name="procat">
                                    <option>선택해주세요</option>
                                    <option vlaue="1010">기본채소</option>
                                    <option vlaue="1020">쌈.샐러드.간편채소</option>
                                    <option vlaue="1030">브로콜리.특수채소</option>
                                    <option vlaue="2010">국산과일</option>
                                    <option vlaue="2020">견과류</option>
                                    <option vlaue="2030">쌀.잡곡</option>
                                    <option vlaue="3010">생선류</option>
                                    <option vlaue="3020">해산물.조개류</option>
                                    <option vlaue="3030">건어물.다시팩</option>
                                    <option vlaue="4010">소고기</option>
                                    <option vlaue="4020">돼지고기</option>
                                    <option vlaue="4030">계란류</option>
                                    <option vlaue="5010">국.탕.찌개</option>
                                    <option vlaue="5020">밑반찬</option>
                                    <option vlaue="5030">메인요리</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                        	<th>상품명</th>
                        	<td><input type="text" class="modify-input" name="proname" value=""></td>
                        	<th>가격</th>
                        	<td><input type="text" class="modify-input" name="proprice" value=""></td>
                        </tr>
                        <tr>
                        	<th>간단설명</th>
                        	<td colspan="3"><input type="text" class="modify-input" name="prosimple" value=""></td>
                        </tr>
                        <tr>
                        	<th>재고</th>
                        	<td><input type="text" class="modify-input" name="prostock" value=""></td>
                        	<th>할인율</th>
                        	<td><input type="text" class="modify-input" name="prodiscount" value=""></td>
                        </tr>
                        <tr>
                        	<th>세일여부</th>
                        	<td>
                        		<input type="radio" name="prosale" value="N" checked="checked">정가
                        		<input type="radio" name="prosale" value="Y">할인
                        	</td>
                        	<th>판매여부</th>
                        	<td>
                        		<input type="radio" name="proused" value="Y" checked="checked">판매
                        		<input type="radio" name="proused" value="N">절판
                        	</td>
                        </tr>
                        <tr>
                        	<th>상품사진</th>
                        	<td colspan="3"><input type="file" class="modify-input" name="proimg" value=""></td>
                        </tr>
                        <tr>
                        	<td colspan="4" class="text-right">
                        		<input type="submit" class="btn modify-btn" value="등록"/>
                        		<input type="reset" class="btn modify-btn" value="취소"/>
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>