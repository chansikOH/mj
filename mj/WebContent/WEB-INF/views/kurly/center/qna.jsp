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

     
        .detail {
            display: none;
        }
        .ansdetail{
        	display: none;
        }

        .qna:hover {
            background-color: white;
            color: purple;
        }

        .qna {
            width: 100px;
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

        #not_snb2 {
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

        #abc {
            text-align: center;
        }

        .serch-select {
            font-size: 0.1px;

        }

        .category {
            margin-top: 20px;
            width:
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
    <form action="adminAddQna.hta">
        <div class="row">
            <div class="col-sm-2">
                <h2 class="tit_snb">고객센터</h2>
            </div>
            <div class="col-sm-10">
                <h3 class="not_snb">1:1 문의</h3>
            </div>

        </div>
            

        <div class="row">
            <div class="col-sm-2">
                <div class="list-group">
                    <a href="notice.hta?pno=1" class="list-group-item notic-menu">공지사항
                        <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
                    <a href="frequent.hta?pno=1" class="list-group-item notic-menu">자주하는 질문
                        <span class="glyphicon glyphicon-chevron-right qna-icon"></span></a>
                    <a href="qna.hta?pno=1" class="list-group-item notic-menu active">1:1 문의
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
                            <col width="15%" />
                            <col width="*%" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%"/>
         
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>카테고리</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>답변여부</th>
                                
                          
                            
                            </tr>
                        </thead>
                    </table>
          		<c:forEach var="qna" items="${Qna }">
                    <div>
                        <table class="table">
                            <col width="10%" />
                            <col width="15%" />
                            <col width="*%" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%" />
                            <tr>
                                <td class="text-center" style="border-style: none;">${qna.no }</td>
                                <td class="text-center" style="border-style: none;">${qna.category }</td>
                                <td class="text-center" style="border-style: none;"><a href="qna-detail.hta?no=${qna.no }&pno=${pno}">${qna.title }</a></td>
                                <td class="text-center" style="border-style: none;">${qna.cusId }</td>
                                <td class="text-center" style="border-style: none;"><fmt:formatDate value="${qna.createDate }"/></td>

							<c:choose>
								<c:when test="${qna.ans ne null }">
                            	    <td style="border-style: none;">답변완료</td>	
								</c:when>
								<c:otherwise>
									<td style="border-style: none;">답변대기중</td>
								</c:otherwise>
							</c:choose>
 
                             <!-- 0530 지민 수정 -->   
                            
                            </tr>
                     	</table>
                    </div>
              </c:forEach>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-10 col-sm-offset-2">
                <hr class="hr-puple">
            </div>
            <div class="col-sm-10 col-sm-offset-2 page">
            
   			<ul class="pagination">
                        <li><a href="qna.hta?pno=1">&laquo;</a></li>
                        <c:forEach var="no" begin="1" end="${totalPCount }">
                        <li class="${no eq pno ? 'active' : '' }"><a href="qna.hta?pno=${no }">${no }</a></li>
                        </c:forEach>
                        <li><a href="qna.hta?pno=${totalPCount }">&raquo;</a></li>
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
                
                   <c:if test="${LOGINCUSTOMER.status eq '회원' }">
                    <div class="form-group">
                        <div class="col-sm-3 col-sm-offset-9">
                            <a href="qna-writer.hta?pno=${pno}">
                                <!--글쓰기로 이동할곳 적기 -->
                                <span class="qna">글쓰기</span>
                            </a>
                        </div>
                    </div>
				  </c:if>
              
            </div>
        </div>
       </form>
    </div>
        <%@ include file="../common/footer.jsp"%>
    <script type="text/javascript">
        
        function displayYn(no) {
            var view = document.getElementById("detail-content-"+no);

            if (view.style.display == 'none' || view.style.display == '') {
                document.getElementById("detail-content-"+no).style.display = 'block';
            } else {
                document.getElementById("detail-content-"+no).style.display = 'none';
            }
        }
        
    </script>
    
</body>

</html>
