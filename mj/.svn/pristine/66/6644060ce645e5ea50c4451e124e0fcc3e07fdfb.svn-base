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
    	 .pagination>li>a {
            color: #555;
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

        .row>.col-sm-2>.list-group>.notic-menu:hover {
            color: purple;
        }

        .row>.col-sm-2>.list-group>.active {
            background-color: #F6F6F6;
            color: purple;
            border: 1px solid #aaa;
        }
        
	<%@ include file="../common/head-foot-style.jsp"%>
    </style>
</head>

<body>
<%@ include file="../common/header.jsp"%>
    <div class="container">
    <form method="get" action="management.hta" id="management-form">
        <div class="row">
            <div class="col-sm-2">
                <h2 class="tit_snb">관리페이지</h2>
            </div>
            <div class="col-sm-10">
                <h3 class="not_snb">회원 관리<span class="not_snb2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원을 관리합니다</span></h3>
            </div>
        </div> 
       	
        <div class="row">
	        <div class="col-sm-2">
			<div class="list-group">
				<a href="productManagement.hta?pno=1" class="list-group-item notic-menu ">상품관리<span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
				<a href="orderManagement.hta?pno=1" class="list-group-item notic-menu ">주문관리<span class="glyphicon glyphicon-chevron-right qna-icon"></span></a>
				<a href="management.hta?pno=1" class="list-group-item notic-menu active">회원관리<span class="glyphicon glyphicon-chevron-right mun-icon"></span></a>
				<a href="qnaManagement.hta?pno=1&sort=답변대기중" class="list-group-item notic-menu ">문의관리<span class="glyphicon glyphicon-chevron-right mun-icon"></span></a>
			</div>
		</div>
			<div class="col-sm-10">
                <div>
                    <hr class="hr-puple">
                </div>
                <div>
                    <table class="table">
                        <colgroup>
                            <col width="6%" />
                            <col width="7%" />
                            <col width="10%" />
                            <col width="12%" />
                            <col width="*%" />
                            <col width="7%" />
                            <col width="7%" />
                            <col width="5%" />
                            <col width="5%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>전화번호</th>
                                <th>주소지</th>
                                <th>성별</th>
                                <th>포인트</th>
                                <th>권한</th>
                                <th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="customer" items="${customers }">
                            <tr>
                                <td>${customer.id }</td>
                                <td>${customer.name }</td>
                                <td>${customer.email }</td>
                                <td>${customer.phoneNumber }</td>
                                <td>${customer.address }</td>
                                <td>${customer.gender }</td>
                                <td>${customer.point }</td>
                                <td>
                                	<select onchange="chackstatus('${customer.id }');" id="role-${customer.id }" >
										<option value="회원" ${customer.status eq '회원' ? "selected" : "" } >
										회원
										</option>
										
										<option value="관리자" ${customer.status eq '관리자' ? "selected" : "" } >
										관리자
										</option>
									</select>
								</td>                                
	                                <td> 
	                                <c:choose>
	                                	<c:when test="${customer.usedYn eq 'Y' }">
	                                		<a type="button" href="managementregister.hta?id=${customer.id }&usedYn=N" class="btn btn-success"> ${customer.usedYn }</a>
	                                	</c:when>
	                                	<c:when test="${customer.usedYn eq 'N' }">
	                                		<a type="button" href="managementregister.hta?id=${customer.id }&usedYn=Y" class="btn btn-danger"> ${customer.usedYn }</a>
	                                	</c:when>
	                                </c:choose>
	                               </td>
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
		<input type="hidden" id="page-no" name="pno" />
	</form>
</div>
            
    <%@ include file="../common/footer.jsp"%>
    <script type="text/javascript">
		function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("management-form").submit();
		}
		
		function goPage(event, pno) {
			event.preventDefault();	// a 태그 기본동작 발생 방지
			sendform(pno);
		}
		
		function chackstatus(id) {
			var role = document.getElementById("role-" + id).value;
			
			console.log(role);
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = JSON.parse(xhr.responseText);
					if(data.status == "admin") {
						alert("관리자로 권한이 변경되었습니다.");
					} else if(data.status == "member") {
						alert("회원으로 권한이 변경되었습니다.");
					}
				}
			}
			xhr.open("GET", "management-status.hta?status=" + role +"&id=" + id);
			xhr.send();
		}
		
	</script>
</body></html>
