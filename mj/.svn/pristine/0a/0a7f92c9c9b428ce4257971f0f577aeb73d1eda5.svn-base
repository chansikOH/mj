<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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
                  
        .list:hover {
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
        
    
        .help {
            font-size: 6px;
        }

        .pagination>li>a {
            color: #555;
        }

        .search-btn {
            border: 0;
            background-color: #fff;
            color: purple
        }

        .pagination>li>a:hover {
            color: purple;
        }

        .pagination>li.active>a,
        .pagination>li.active>a:hover {
            background-color: #F6F6F6;
            border: 1px solid #aaa;
            color: purple;
        }


        .page {
            text-align: center;
            margin-top: 50px;
        }

        .pagination>.active {
            background-color: #aaa;
        }

        .not_snb2 {
            font-size: 12px;
            font-weight: 100;
        }

        .tit_snb {
            font-weight: bolder;
            color: #5D5D5D;

        }

        .not_snb {
            font-weight: bolder;
            color: #5D5D5D;

            padding: 4px;
        }

        .list-group {
            margin-top: 20px;

        }


        .notic-icon {
            position: absolute;
            top: 36%;
            left: 87%;
        }

        .qna-icon {
            position: absolute;
            top: 36%;
            left: 87%;
        }

        .mun-icon {
            position: absolute;
            top: 36%;
            left: 87%;
        }

        .hr-puple {
            border: 0.5px solid purple;
        }

        .row>.col-sm-2>.list-group>.notic-menu:hover {
            color: purple;
        }

        .row>.col-sm-2>.list-group>.active {
            background-color: #F6F6F6;
            color: purple;
            border: 1px solid #aaa;
        }

        .title {
            border: 1px solid black;

        }

        th {
            text-align: center
        }

        tr {
            text-align: center;
        }

        .serch-select {
            font-size: 0.1px;

        }
        a{
         text-decoration: none !important;
         color: black;
        }
    </style>

</head>

<body>
	<%@ include file="../common/header.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-sm-2">
                <h2 class="tit_snb">고객센터</h2>
            </div>
            <div class="col-sm-10">
                <h3 class="not_snb">공지사항<span class="not_snb2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요</span></h3>
            </div>
            <div>
            </div>
        </div>


        <div class="row">
            <div class="col-sm-2">
                <div class="list-group">
                    <a href="notice.hta?pno=1" class="list-group-item notic-menu active">공지사항
                        <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
                    <a href="frequent.hta?pno=1" class="list-group-item notic-menu">자주하는 질문
                        <span class="glyphicon glyphicon-chevron-right qna-icon"></span></a>
                    <a href="qna.hta?pno=1" class="list-group-item notic-menu">1:1 문의
                        <span class="glyphicon glyphicon-chevron-right mun-icon"></span></a>

                </div>


            </div>

            <div class="col-sm-10">
                <div>
                    <hr class="hr-puple">
                </div>
                <div>
                    <table class="table">
                        <colgroup>
                            <col width="10%" />
                            <col width="*" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>-</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="notice" items="${notices }">
                            <tr>
                            	<c:choose>
									<c:when test="${notice.grade eq 1 }">
	                            		<td>공지</td>
	                                </c:when>
	                           		<c:otherwise>
	 	                          		 <td>${notice.no }</td>
	                           		</c:otherwise>
                            	</c:choose>
                                <td><a href="notice-detail.hta?no=${notice.no }&pno=${param.pno}">${notice.title}</a></td>
                                <td>marketkurly</td>
                                <td><fmt:formatDate value="${notice.createdate }" pattern="yyyy-MM-dd"/></td>
                                <td>${notice.views }</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-10 col-sm-offset-2">
                    <hr class="hr-puple">
                    <div>
                    	<c:if test="${LOGINCUSTOMER.status eq '관리자' }">
                        <a href="notice-writer.hta?pno=${param.pno }"><span class="list">글쓰기</span></a>
                        </c:if>
                    </div>
                </div>
                
                <div class="col-sm-10 col-sm-offset-2 page">
              <ul class="pagination">
              	<c:if test="${not pagination.first }">
						<li><a href="#" onclick="goPage(event,${pagination.page - 1})">&laquo;</a></li>						
				</c:if>
				<c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
					<c:choose>
						<c:when test="${num eq pagination.page }">
							<li class="active"><a href="#" onclick="goPage(event, ${num})">${num }</a>
						</c:when>
					<c:otherwise>
						<li><a href="#" onclick="goPage(event, ${num})">${num }</a></li>
					</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${not pagination.last }">
						<li><a href="#" onclick="goPage(event,${pagination.page + 1})">&raquo;</a></li>						
				</c:if>
				
			</ul>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-10 col-sm-offset-2">
                    <div>
                        <hr class="hr-puple">
                    </div>
                </div>
           
                <div class="col-sm-10 col-sm-offset-2">
                    <form class="form-horizontal" action="notice.hta" id="list-form">
                    	<input type="hidden" name="pno" id="page-no">
                       	 <div class="form-group">
                            <label class="col-sm-2 control-label"><span class="glyphicon glyphicon-play serch-select"></span>검색어</label>
                            <div class="col-sm-4">
                                
                                <div class="checkbox-inline">
                                    <input type="checkbox" name="search"  ${param.search eq 't' ? 'checked' : '' } value="t"  checked="checked">제목
                                </div>
                                <div class="checkbox-inline">
                                    <input type="checkbox" name="search" ${param.search eq 'c' ? 'checked' : '' } value="c" >내용
                                </div>
                            </div>
                            <div class="col-sm-3 col-sm-offset-1">
                                <input type="text" class="form-control" name=keyword value="${param.noticeContent }" />
                            </div>
                            <div class="col-sm-1">
                                <button type="submit" class="btn search-btn" onclick="sendform(1);"><span class="glyphicon glyphicon-search"></span></button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
            <%@ include file="../common/footer.jsp"%>
    	<script type="text/javascript">
		function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit();
		}
		
		function goPage(event, pno) {
			event.preventDefault();	// a 태그 기본동작 발생 방지
			sendform(pno);
		}
	</script>
</body></html>
