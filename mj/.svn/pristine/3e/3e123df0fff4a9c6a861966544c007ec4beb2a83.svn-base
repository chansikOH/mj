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
                <h3 class="not_snb">상품 관리<span class="not_snb2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품을 관리합니다</span></h3>
            </div>
            <div>
            </div>
        </div>
        <form class="form-inline" action="productManagement.hta" id="list-form">
        <div class="row">
            
                <div class="col-sm-4 col-sm-offset-2">
			<select class="form-control" name="category" onchange="sendform2(1);">
				<option value="1" ${param.category eq 1 ? "selected" : "" }> 전체</option>
				<c:forEach var="category" items="${categories}">
				<option value="${category.no }" ${param.category eq category.no ? "selected" : "" }> ${category.name }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-sm-3 col-sm-offset-3 ">
			<select class="form-control pull-right " name="gijun" onchange="sendform(1);" >
				<option value="U" ${param.gijun eq 'U' ? "selected" : "" }> 오름차순</option>
				<option value="D" ${param.gijun eq 'D' ? "selected" : "" }> 내림차순</option>
			</select>
			<select class="form-control" name="sort" onchange="sendform(1);" >
				<option value="CD" ${param.sort eq 'CD' ? "selected" : "" }> 등록일</option>
				<option value="OD" ${param.sort eq 'OD' ? "selected" : "" }> 판매량</option>
				<option value="FV" ${param.sort eq 'FV' ? "selected" : "" }> 늘사는것</option>
			</select>
		</div>
           
            
        </div>

        <div class="row">
			<div class="col-sm-2">
			<div class="list-group">
				<a href="productManagement.hta?pno=1" class="list-group-item notic-menu active">상품관리<span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
				<a href="orderManagement.hta?pno=1" class="list-group-item notic-menu ">주문관리<span class="glyphicon glyphicon-chevron-right qna-icon"></span></a>
				<a href="management.hta?pno=1" class="list-group-item notic-menu">회원관리<span class="glyphicon glyphicon-chevron-right mun-icon"></span></a>
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
                            <col width="5%" />
                            <col width="5%" />
                            <col width="10%" />
                            <col width="*" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="check-All-Product" onchange="checkAllProduct()"></th>
                                <th>번호</th>
                                <th>이미지</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>할인률</th>
                                <th>늘사는 것</th>
                                <th>판매량</th>
                                <th>판매여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products }">
                            <tr>
                                <td><input type="checkbox" name="no" value="${product.no }"></td>
                                <td>${product.no }</td>
                                <td><img src="../../images/product/${product.img }" width="100%"/></td>
                                <td><a href="/mj/kurly/admin/productModify.hta?no=${product.no }">${product.name }</a> </td>
                                <td>${product.stock }</td>
                                <td><fmt:parseNumber integerOnly="true" value="${product.discount *100}"/></td>
                                <td>${product.likesCnt }</td>
                                <td>${product.orderCnt }</td>
                                <td>${product.usedYn }</td>
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
                <div class="row">
                    <div class="col-sm-2 pull-right">
                        <a href="/mj/kurly/admin/productAddPage.hta" class="form-control btn btn-default insert-product-btn">상품등록</a>
                    </div> 
                       <div class="col-sm-2 pull-right">
                        <input type="button"  onclick="stopSell(event)" class="form-control btn btn-danger insert-product-btn" value="판매중지">
                    </div>
                    <div class="col-sm-2 pull-right">
                        <input type="button"  onclick="startSell(event)" class="form-control btn btn-primary insert-product-btn" value="판매시작">
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
                       	 <div class="form-group pull-right">
                            <label class="control-label">상품검색</label>
                            <input type="text" class="form-control " name=keyword id="admin-product-keyword" value="${param.keyword }" />
                            <button type="submit" class="btn search-btn" onclick="sendform(1);"><span class="glyphicon glyphicon-search"></span></button> 
                        </div>
                    </div>
                </div>
            </div>
         </form>
    </div>
            <%@ include file="../common/footer.jsp"%>
    	<script type="text/javascript">
    	
    	function isOneMoreChecked() {
			var checkboxes = document.querySelectorAll('[name=no]');
    		
    		var isExist = false;
    		for (var i=0; i<checkboxes.length; i++) {
    			if (checkboxes[i].checked) {
    				isExist = true;
    				break;
    			}
    		}
    		return isExist;
    	}
    	
    	function stopSell() {
    		
    		if (isOneMoreChecked()) {
    			document.getElementById("list-form").setAttribute("action", "stopSell.hta");
        		document.getElementById("list-form").submit();
    		} else {
    			alert("선택된 상품이 존재하지 않습니다.");
    		}
    			
    		
    	}
    	
    	function startSell() {
    		if (isOneMoreChecked()) {
	    		document.getElementById("list-form").setAttribute("action", "startSell.hta");
	    		document.getElementById("list-form").submit();
    		} else {
    			alert("선택된 상품이 존재하지 않습니다.");
    		}
    	}
    	
		function sendform(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("list-form").submit();
		}
		
		function goPage(event, pno) {
			event.preventDefault();	// a 태그 기본동작 발생 방지
			sendform(pno);
		}
		
		function sendform2(pno) {
			document.getElementById("page-no").value = pno;
			document.getElementById("admin-product-keyword").value ="";
			document.getElementById("list-form").submit();
		}
		function checkAllProduct() {
			var allCheckboxStatus = document.getElementById("check-All-Product").checked;
			
			var checkboxes = document.querySelectorAll("[name=no]");
			
			for (var i =0; i < checkboxes.length; i++){
				var checkbox = checkboxes[i];
				
				checkbox.checked = allCheckboxStatus;
				
			}
		}
	</script>
</body></html>
