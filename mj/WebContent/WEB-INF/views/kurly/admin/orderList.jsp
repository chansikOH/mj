<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>민지컬리</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/mj/kurly/images/header_footer/tab-logo02.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
    
    .list {
            width: 150px;

            display: inline-block;
            line-height: 30px;
            text-align: center;
            background-color: #795b8f;
            border: 1px solid #56297a;
            color: #fff;
            font-size: 30px;
            float: right;
            margin-left: 2px;
            font-size: 13px;
        }
          .list:hover {
            background-color: purple;
            color: white !important;
        }
    	.table>tbody>tr>th{
    		text-align: center;
    	}
    	
    	.table>tbody>tr>td{
    		text-align:center;
    		font-family: "Nanum Gothic", sans-serif;
	        font-size: 23px;
    	}
    	.img{
    		width: 100px;
    		height: 100px;
    	}
        .title {
            margin: 30px;
            margin-top: 100px;
            color: purple;
        }
        .bottom{
        	margin: 30px;
        	margin-top: 100px;
        }
        a{
			text-decoration: none !important;       
        	color : black;
        }
        .text{
        	margin-top: 25px;
        }
    <%@ include file="../common/head-foot-style.jsp"%>
    </style>
</head>




<body onload="checklogin();">
<%@ include file="../common/header.jsp"%>
    <div class="container">
        <div class="row text-center">
            <div class="col-sm-6 col-sm-offset-3">
                <h1 class="title"><strong>상품 목록</strong></h1>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                    <div class="row">
                        <div class="well">
                            <table class="table">
                            	<tr>
                            		<th></th>
                            		<th>상품명</th>
                            		<th>갯수</th>
                            		<th>가격</th>
                            	<tr>
                               <c:forEach var="lis" items="${list }">
                                <tr>
                                    <td><img class="img" src="../../images/product/${lis.proImg }"></td>                                       
                                    <td><p class="text"><a href="/mj/kurly/product/detail.hta?proNo=${lis.proNo }">${lis.proName }</a></p></td>                                       
                                    <td><p class="text">${lis.cartAmount }개</p></td>                                       
                                    <td><p class="text">${lis.proPrice }\</p></td>                                       
                                </tr>
                               </c:forEach>
                            </table>
                        </div>
                    </div>
            </div>
        </div>
        <div class="row">
        	<div class="col-sm-8 col-sm-offset-2 text-right">
        		<a href="orderManagement.hta?pno=${param.pno }" class="btn list">목록</a>
        	</div>
        </div>
        <div class="bottom">       
        </div>
        <hr class="hr-purple" />

    </div>
    <%@ include file="../common/footer.jsp"%>
</body></html>


