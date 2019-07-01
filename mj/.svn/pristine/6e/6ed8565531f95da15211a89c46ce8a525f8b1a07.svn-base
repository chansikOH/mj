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
        .insert-product-btn{
            width: 90% !important;
            
        }
 
    </style>

</head>

<body>
	<%@ include file="../common/header.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-sm-2">
                <h2 class="tit_snb">관리페이지</h2>
            </div>
            <div class="col-sm-10">
                <h3 class="not_snb">문의 관리<span class="not_snb2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의를 관리합니다</span></h3>
            </div>
            <div>
            </div>
        </div>
        <form class="form-inline" action="qnaManagement.hta" id="list-form">
        <div class="row">
            
                <div class="col-sm-4 col-sm-offset-2">
			<select class="form-control" name="sort" onchange="sendform(1);">
				<option value="답변대기중" ${param.sort eq '답변대기중' ? "selected" : "" }>답변대기중 </option>
				<option value="답변완료" ${param.sort eq '답변완료' ? "selected" : "" }>답변완료 </option>
			</select>
		</div>
        </div>

        <div class="row">
			<div class="col-sm-2">
			<div class="list-group">
				<a href="productManagement.hta?pno=1" class="list-group-item notic-menu ">상품관리<span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
				<a href="orderManagement.hta?pno=1" class="list-group-item notic-menu ">주문관리<span class="glyphicon glyphicon-chevron-right qna-icon"></span></a>
				<a href="management.hta?pno=1" class="list-group-item notic-menu">회원관리<span class="glyphicon glyphicon-chevron-right mun-icon"></span></a>
				<a href="qnaManagement.hta?pno=1&sort=답변대기중" class="list-group-item notic-menu active">문의관리<span class="glyphicon glyphicon-chevron-right mun-icon"></span></a>
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
                            <col width="*%" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%" />
                            
                        </colgroup>
                        <thead>
                            <tr>
                                <th>문의 번호</th>
                                <th>문의 제목</th>
                                <th>아이디</th>
                                <th>상품 번호</th>
                                <th>문의 날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="qna" items="${productsQuestions }">
                            <tr>
                                <td>${qna.no }</td>
                                <td><a href="/mj/kurly/product/detail.hta?proNo=${qna.proNo }&position=searchPq&pqNo=${qna.no}">${qna.title }</a></td>
                                <td>${qna.custId }</td>
                                <td>${qna.proNo }</td>
                                <td><fmt:formatDate value="${qna.createDate }" pattern="yyyy-MM-dd"/></td>
                            </tr>
                          </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10 col-sm-offset-2">
                    <hr class="hr-puple">
                </div>
                </div>
                <div class="row">
						<div class="col-sm-12">
							<div class="page">
								<ul class="pagination">
									<c:choose>
										<c:when test="${ pagination.first }">
											<li><a href="#" onclick="goPage(event, ${pagination.page})">&laquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="goPage(event, ${pagination.page -1})">&laquo;</a></li>
										</c:otherwise>
									</c:choose>
									<c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
										<c:choose>
											<c:when test="${num eq pagination.page }">
												<li class="active"><a href="" onclick="goPage(event, ${num})">${num }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="" onclick="goPage(event, ${num})">${num }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${ pagination.last }">
											<li><a href="#" onclick="goPage(event, ${pagination.page})">&raquo;</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="goPage(event,${pagination.page + 1})">&raquo;</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
					</div>
            </div>

            <div class="row">
                <div class="col-sm-10 col-sm-offset-2">
                    <div>
                        <hr class="hr-puple">
                    </div>
                </div>
           
                <div class="col-sm-10 col-sm-offset-2">
                    	<input type="hidden" name="pno" id="page-no" value="${param.pno }">
                       	 
                    </div>
                </div>
         </form>
            </div>
 
            <%@ include file="../common/footer.jsp"%>
    	<script type="text/javascript">
    	
		function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit();
		}
		
		function goPage(event, pno) {
			event.preventDefault();	 //a태그 기본동작 방지
			sendform(pno);
		}
				
			
	
	</script>
</body></html>
