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
          
        a{
            text-decoration: none !important;
            color: black ;
        
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
        .list2:hover{
        	background-color: purple;
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
              .list2 {
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

        th {
            background: #eee;
        }

        .contents {
            width: 10%;
            height: 10%;
            display: inline;
            word-break: break-all;
			margin:50px;
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
                <h2>공지사항<span class="title_snb">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></h2>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <table class="table">

                    <tbody>
                        <tr>
                            <th class="a" style="border-top:2px solid purple">제목</th>
                            <td class="a" colspan="3" style="border-top:2px solid purple">${notice.title }</td>
                        </tr>
                        <tr>
                            <th class="a" style="width: 20%">작성자</th>
                            <td class="a">admin</td>
                        </tr>
                        <tr>
                            <th class="a" style="width: 20%">작성일</th>
                            <td class="a" style="width: 20%"><fmt:formatDate value="${notice.createdate }" pattern="yyyy-MM-dd"/></td>
                            <th class="a" style="width: 20%">조회수</th>
                            <td class="a">${notice.views }</td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="contents">
                   ${notice.contentswithBr } 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <hr class="hr-puple">
                <div class="text-right">
                    <a href="notice.hta?pno=${param.pno}">
                    	<span class="list">목록</span>
                    </a>
                   <c:if test="${LOGINCUSTOMER.status eq '관리자' }">
                    <form action="noticeDelete.hta">
                   		 <input type="hidden" name=no value="${notice.no }"> 
                  			  <button class="list2"> 삭제</button>
                    </form>
                    </c:if>
                </div>
                <div></div>



            </div>

        </div>
        <div class="row">
            <div class="col-sm-12">
                <hr class="hr-puple" />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <ul>
                    <li> <!--다음글 or 이전글 없을 땐 비워두게끔 만들기-->
                    <c:choose>
                    	<c:when test="${list.next eq 0 }">
                    			다음글이 존재하지 않습니다.
                    	</c:when>
                    	<c:otherwise>                    
	                        <strong>다음글</strong>
	                        <a href="notice-detail.hta?no=${list.next }&pno=1">${list.nextTitle }</a>
                    	</c:otherwise>
                    </c:choose>
                    </li>
                    
                    <li>
                    	<c:choose>
                    		<c:when test="${list.prev eq 0 }">
                    			이전글이 존재하지 않습니다.
                    		</c:when>
                    		<c:otherwise>
                      			 <strong>이전글</strong>
	    	                     <a href="notice-detail.hta?no=${list.prev }&pno=1">${list.prevTitle }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <hr class="hr-puple2" />
            </div>
        </div>
    </div>
        <%@ include file="../common/footer.jsp"%>
    
</body></html>