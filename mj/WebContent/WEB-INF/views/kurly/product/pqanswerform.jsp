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
    	.answerform-title {
    		margin-top: 50px;
            font-weight: bolder;
            color: #5D5D5D;
        }
        .answerform-input {
            width: 100%;
            height: 30px;
            margin-top: 10px;
            border: 1px solid #d9d9d9;
        }
        .table>tbody>tr>td {
            padding: 15px;
            border: 1px solid #e8e8e8;
        }
        .table>tbody>tr>th {
            width: 150px;
            padding: 15px 0 15px 20px;
            background-color: #F7F5F8;
            border: 1px solid #e8e8e8;
            text-align: left;
            font-weight: normal;
            vertical-align: middle;
        }
        .answerform-btn, .answerform-btn:hover{
            background-color: purple;
            color: white;
            margin-top: 30px;
        }
        .anwerform-table-top {
        	border-top: 2px solid purple !important;
        }
        .answerform-head-title {
        	text-align: center !important;
        	font-size: 15px !important;
        	font-weight: bold !important;
        }
        <%@ include file="../common/head-foot-style.jsp" %>
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container">
	<div class="row">
        <div class="col-sm-12">
            <h3 class="answerform-title">상품 문의 답변</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <form method="post" action="addAnswer.hta">
				<input type="hidden" name="prono" value="${proNo }" />
				<input type="hidden" name="pqno" value="${pq.no }" />
				<input type="hidden" name="pqPno" value="${pqPno }" />
                <table class="table">
                    <tbody class="answerform-table-top">
                  		<tr>
                        	<th colspan="4" class="answerform-head-title">문의 내용</th>
                        </tr>
                        <tr>
                        	<th>작성자</th>
                        	<td><input type="text" class="answerform-input" name="pqwriter" value="${pq.customer.name }" disabled="disabled"></td>
                        	<th>작성일</th>
                        	<td><input type="text" class="answerform-input" name="pqCreateDate" value='<fmt:formatDate value="${pq.createDate }"/>' disabled="disabled"></td>
                        </tr>
                        <tr>
                        	<th>제목</th>
                        	<td colspan="3"><input type="text" class="answerform-input" name="pqtitle" value="${pq.title }" disabled="disabled"></td>
                        </tr>
                        <tr>
                        	<th>내용</th>
                        	<td colspan="3">
							<c:if test="${pq.imgName ne null }">
								<img src="/mj/images/pq/${pq.imgName }">
							</c:if>
								<p>${pq.contents }</p>
                        	</td>
                        </tr>
                        <tr>
                        	<th colspan="4" class="answerform-head-title">답변 작성</th>
                        </tr>
                        <tr>
                        	<th>답변</th>
                        	<td colspan="4"><textarea rows="10" cols="100%" name="answer"></textarea></td>
                        </tr>
                        <tr>
                        	<td colspan="4" class="text-right">
                        		<input type="submit" class="btn answerform-btn" value="등록"/>
                        		<input type="reset" class="btn answerform-btn" value="취소"/>
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