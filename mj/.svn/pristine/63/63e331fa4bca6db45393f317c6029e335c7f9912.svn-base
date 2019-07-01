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
          
         th{
         	background-color: #eee !important;
         }
         
        .qnaContents{
        	width: 100%;
        	height:100px;
        	resize:none;
        }
        a{
            text-decoration: none !important;
            color: black ;
        }
        .b{
        	border-top-style:none !important;
        }
        ul,
        li {
            list-style-type: none;
        }

        .after {
            border: 1px solid black;
        }

        .list:hover {
            background-color: purple;
        }
		.list-qna{
		   width: 150px;

            display: inline-block;
            line-height: 30px;
            text-align: center;
            background-color: #795b8f;
            border: 1px solid #56297a;
            color: #fff;
            font-size: 15px;
            float: right;
            margin-left: 2px;
            margin-top: 30px;
            font-size: 13px;
            
            
		}
        .list {
            width: 150px;

            display: inline-block;
            line-height: 30px;
            text-align: center;
            background-color: #795b8f;
            border: 1px solid #56297a;
            color: #fff;
            font-size: 15px;
            float: right;
            margin-left: 2px;
            font-size: 13px;
        }

        .title_snb {
            font-size: 12px;
            font-weight: 100;
        }

        .a {
            padding: 13px 0 13px 20px !important;
        }

   
        .contents {
            width: 10%;
            height: 10%;
            display: inline;
            word-break: break-all;
            margin: 50px;

        }

        .hr-puple {
            border: 0.5px solid purple;
        }
          .hr-puple2 {
            border: 1px solid purple;

        }
    </style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-sm-12 ">
                <h2>1:1문의</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <table class="table">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
                    <tbody>
                        <tr>
                            <th class="a" >제목</th>
                            <td class="a ">${qna.title }</td>
                            <th class="a">카테고리</th>
                            <td class="a">${qna.category }</td>
                            
                        </tr>
                        <tr>
                            <th class="a">작성자</th>
                            <td class="a">${qna.cusId }</td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th class="a">작성일</th>
                            <td class="a"><fmt:formatDate value="${qna.createDate }" pattern="yyyy-MM-dd"/></td>
							<td></td>
							<td></td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="contents">
                   <span class="glyphicon glyphicon-pencil"></span>&nbsp;${qna.contents}
                </div>
            </div>
        </div>
        <div class="row">
        	<hr class="hr-puple">
        	<div class="col-sm-12">
        		<table class="table">
        		<c:choose>
        		<c:when test="${qna.ans ne null }">
        			<tr class="contents ">
        			<td class="b">
        			
        			<span><img src="../../images/center/faq_a.jpg"></span>${qna.ans }
        			</td>
        			</tr>
        		</c:when>
        		<c:otherwise>
        			<tr class="contents ">
        			<td class="b">
        			<span><img src="../../images/center/faq_a.jpg"></span>조금만 기다려주세요!! &nbsp;빠른 시일내에 답변을 작성을 하겠습니다.
        			</td>
        			</tr>
        		</c:otherwise>
        		</c:choose>
        		</table>
        	</div>
        </div>
        	
        <form action="adminAddQna.hta">
        <div class="row">
                <hr class="hr-puple">
        	<div class="col-sm-10">
		<c:choose>
		<c:when test="${LOGINCUSTOMER.status eq '관리자' }">     
			<c:if test="${qna.ans eq null }">   		 
        		 <div class="text-center">
        		 <input type="hidden" name="pno" value="${param.pno }">
        		 	<textarea class="qnaContents" name="qnaContentsAdmin"></textarea>
        		 </div>
        	</c:if>
		</c:when>
		</c:choose>
        
        	</div>
            <div class="col-sm-2">
                <div class="text-right">
                    <a href="qna.hta?pno=${param.pno }">
                    <span class="list">목록</span></a>
                    <input type="hidden" name="qnaList-no"value="${qna.no }"/>
                   	<c:choose>
                   		<c:when test="${LOGINCUSTOMER.status eq '관리자' }">
                   			<c:if test="${qna.ans eq null }">   
        		 	<input type="submit" class="list-qna" value="등록">
        		 			</c:if>
        		 		</c:when>
                    </c:choose>
                </div>
            </div>
        </div>
		</form>

        <div class="row">
            <div class="col-sm-12">
                <hr class="hr-puple2" />
            </div>
        </div>
    </div>
        <%@ include file="../common/footer.jsp"%>
    
</body>
</html>