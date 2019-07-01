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
        .detail-img {
            width: 100%;
            margin-bottom: 50px;
        }
        .detail-title{
            margin-bottom: 30px;
        }
        .detail-info-name{
            color: #555;
        }
        .btn-modify, .btn-modify:hover{
            background-color: purple;
            color: white;
            margin-top: 30px;
            width: 100px;
        }
        .amt-pnm {
            width: 40px;
            height: 34px;
            text-align: center;
            margin: 0px;
            border: 1px solid #555;
            background-color: #ddd;
        }
        .amt-num{
            width: 61px;
            height: 33px;
            text-align: center;
            padding-bottom: 3px;
            margin: 0px;
            border: 1px solid #555;
        }
        .price{
            margin-top: 40px;
            font-weight: bold;
            font-size: 20px;
        }
        .detail-btn-cart{
            width: 100%;
            height: 50px;
            background-color: rebeccapurple;
            color: white !important;
            border: 0px;
            font-size: 17px;
            padding-top: 12px;
        }
        .detail-btn-likes{
            width: 100%;
            height: 50px;
            border: 1px solid rebeccapurple;
            background-color: white;
            font-size: 17px;
            padding-top: 12px;
            color: rebeccapurple;
        }
        .glyphicon-heart-empty{
            color: rebeccapurple;
            font-size: 20px;
        }
        .glyphicon-heart{
        	color: red;
        	font-size: 20px;
        }
        .detail-sale-box{
            width: 50px;
            position: absolute;
            top: 35px;
            left: 20px;
        }
        .detail-thumbnail {
            margin-top: 30px; 
            border: 0px;      
        }
        .detail-nav-tabs{
            font-weight: bold;
            margin-top: 15px;
            border-bottom: 1px solid #aaa;
            margin-bottom: 50px
        }
        .detail-nav-tabs > li.active > a,  .nav-tabs > li.active > a:hover{
            font-weight: bold;
            color: black;
            border-top: 1px solid #aaa; 
            border-left: 1px solid #aaa; 
            border-right: 1px solid #aaa; 
            width: 170px;
            height: 40px;
            text-align: center;
        }
        .detail-nav-tabs > li > a, .nav-tabs > li > a:hover {
            background-color: #eee;
            color: black;
            border-top: 1px solid #aaa; 
            border-left: 1px solid #aaa; 
            border-right: 1px solid #aaa; 
            padding-bottom: 3px;
            border-bottom: 1px solid #aaa;
            width: 170px;
            height: 40px;
            text-align: center;
        }
        .detail-text{
            text-align: center;
        }
        .detail-table{
            width: 100%;
        }
        .detail-review-sel {
            position: absolute !important;
            top: 40px;
            width: 120px;
            font-size: 12px;
        }
        .detail-btn-table, .detail-btn-table:hover{
            width: 130px;
            height: 30px;
            border: 1px solid rebeccapurple;
            background-color: rebeccapurple;
            font-size: 15px;
            color: white !important;
            padding-top: 3px;
        }
        .detail-paging {
            text-align: center;
        }
        .detail-pagination > li > a {
            color: #555;
        }
        .detail-pagination > li > a:hover {
            color: purple;
            font-weight: bold;
        }
        .detail-pagination > li.active > a, .pagination > li.active > a:hover {
            background-color: #aaa;
            border: 1px solid #aaa;
            color: purple;
            font-weight: bold;
        }
        .detail-table-top{
        	border-top: 2px solid purple;
        }
        .detail-table-bottom{
        	border-bottom: 2px solid purple;
        }
		.detail-review-row:hover, .detail-pq-row:hover {
        	background-color: #ccc;
        }
        .detail-review-content, .detail-pq-content, .detail-pq-answer{
        	display: none;
        	text-align: center;
        }
        .detail-line-throgh {
			text-decoration: line-through;
			font-size: 13px;
			color: #555;
		}
		.glyphicon-arrow-right {
			margin-left: 2px;
			margin-right: 2px;
		}
        <%@ include file="../common/head-foot-style.jsp" %>
    </style>
</head>
<body onload="firstPrint('${position}', ${pqNo });">
<%@ include file="../common/header.jsp" %>
<div class="container">
   	<form method="post" action="detail.hta" class="form-inline" id="detail-form">
   		<input type="hidden" name="proNo" id="pro-no"/>
   		<input type="hidden" name="reviewPno" id="review-pno" />
   		<input type="hidden" name="pqPno" id="pq-pno" />
   		<input type="hidden" name="size" value="5"/>
		<input type="hidden" name="position" id="detail-position"/>
		<a href="#goods-reviews" id="detail-goReviews"></a>
		<a href="#goods-questions" id="detail-goPqs"></a>
	    <div class="row">
	        <div class="col-sm-5">
	            <img src="/mj/images/product/${product.img }" class="detail-img">
	        </div>
	        <div class="col-sm-7">
	            <div class="col-sm-12">
	                <div class="col-sm-8 detail-title">
	                    <h3>${product.name }</h3>
	                    <p>${product.simple }</p>
	                </div>
	                <div class="col-sm-4">
	                <c:choose>
	                	<c:when test="${LOGINCUSTOMER.status eq '관리자' }">
		                    <a href="modify.hta" class="btn btn-modify">수정하기</a>
	                	</c:when>
	                </c:choose>
	                </div>
	            </div>
	            <div class="col-sm-4 detail-info-name">
	                <p>판매가</p>
	            </div>
	            <div class="col-sm-8">
	            <c:choose>
	            	<c:when test="${product.saleYn eq 'Y' }">
		                <p>
	               			<span class="detail-line-throgh"><fmt:formatNumber value="${product.price }" />원</span>
	               			<span class="glyphicon glyphicon-arrow-right"></span><strong><fmt:formatNumber value="${product.discountPrice }"/>원</strong>
	               		</p>
	            	</c:when>
	            	<c:otherwise>
		                <p><strong><fmt:formatNumber value="${product.price }" />원</strong></p>
	            	</c:otherwise>
	            </c:choose>
	            </div>
	            <div class="col-sm-12">
	                <hr/>
	            </div>
	            <div class="col-sm-4 detail-info-name">
	                <p>판매단위</p>
	                <p>중량/용량</p>
	            </div>
	            <div class="col-sm-8">
	                <p>세부정부 참조</p>
	                <p>세부정부 참조</p>
	            </div>
	            <div class="col-sm-12">
	                <hr/>
	            </div>
	            <div class="col-sm-4 detail-info-name">
	                <p>배송구분</p>
	            </div>
	            <div class="col-sm-8">
	                <p>택배배송</p>
	            </div>
	            <div class="col-sm-12">
	                <hr/>
	            </div>
	            <div class="col-sm-4 detail-info-name">
	                <p>포장타입</p>
	            </div>
	            <div class="col-sm-8">
	                <p>세부정부 참조</p>
	            </div>
	            <div class="col-sm-12">
	                <hr/>
	            </div>
	            <div class="col-sm-4 detail-info-name">
	                <p>유통기한</p>
	            </div>
	            <div class="col-sm-8">
	                <p>세부정부 참조</p>
	            </div>
	            <div class="col-sm-12">
	                <hr/>
	            </div>
	            <div class="col-sm-4 detail-info-name">
	                <p>구매수량</p>
	            </div>
	            <div class="col-sm-8">
	                <button type="button" class="btn amt-pnm" id="btn-minus"><span class="glyphicon glyphicon-minus"></span></button>
					<input type="text" class="amt-num" id="detail-amt" value="1" min="1" max="50" readonly/>
					<button type="button" class="btn amt-pnm" id="btn-plus"><span class="glyphicon glyphicon-plus"></span></button>                	
	            </div>
	            <div class="col-sm-12">
	            	<input type="hidden" id="unit-price" value="${unitPrice }">
	                <p class="price">총 상품금액 : <input type="text" class="form-control" id="total-price" name="totalPrice" readonly="readonly"/>원</p>
	            </div>
	            <div class="col-sm-6">
	                <a id="add-Product" class="btn detail-btn-cart" onclick="addProduct(${product.no})"><img src="/mj/images/detail/ico_basket_v2.png"> 장바구니 담기</a>
	            </div>
	            <div class="col-sm-6">
	            <c:choose>
	            	<c:when test="${likeYn eq 'N' }">
		                <a href="addLikePro.hta?prono=${product.no }" class="btn detail-btn-likes" onclick="isLogin(event, '${LOGINCUSTOMER.id }');"><span class="glyphicon glyphicon-heart-empty"></span> 늘 사는 것</a>
	            	</c:when>
	            	<c:when test="${likeYn eq 'Y' }">
		                <a href="delLikePro.hta?prono=${product.no }" class="btn detail-btn-likes" onclick="isLogin(event, '${LOGINCUSTOMER.id }');"><span class="glyphicon glyphicon-heart"></span> 늘 사는 것</a>
	            	</c:when>
	            </c:choose>
	            </div>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-sm-12">
	        	<h5><strong>RELATED PRODUCTS</strong></h5>
	            <div class="col-sm-1"></div>
	            <c:choose>
	            	<c:when test="${not empty relatedProducts }">
			            <c:forEach var="relatedProduct" items="${relatedProducts }">
				            <div class="col-sm-2">
				                <div class="thumbnail detail-thumbnail">
				                    <a href="detail.hta?proNo=${relatedProduct.no }">
				                        <img src="/mj/images/product/${relatedProduct.img }">
				                        <div><img src="/mj/images/list/icon0.35.jpg" class="detail-sale-box"></div>
				                        <div class="caption">
				                            <h5>${relatedProduct.name }</h5>
				                            <c:choose>
								            	<c:when test="${relatedProduct.saleYn eq 'Y' }">
									                <p>
								               			<span class="detail-line-throgh"><fmt:formatNumber value="${relatedProduct.price }" />원</span>
								               			<span class="glyphicon glyphicon-arrow-right"></span><strong><fmt:formatNumber value="${relatedProduct.discountPrice }"/>원</strong>
								               		</p>
								            	</c:when>
								            	<c:otherwise>
									                <p><strong><fmt:formatNumber value="${relatedProduct.price }" />원</strong></p>
								            	</c:otherwise>
								            </c:choose>
				                        </div>
				                    </a>
				                </div>
				            </div>
			            </c:forEach>
	            	</c:when>
	            	<c:otherwise>
	            		<div>
	            			<p>관련 인기 상품이 없습니다.</p>
	            		</div>
	            	</c:otherwise>
	            </c:choose>
	            <div class="col-sm-1"></div>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-sm-12"  id="goods-description">
	            <ul class="nav nav-tabs detail-nav-tabs">
	                <li class="presentation active"><a href="#goods-description">상품설명</a></li>
	                <li class="presentation"><a href="#goods-image">상품이미지</a></li>
	                <li class="presentation"><a href="#goods-infomation">상세정보</a></li>
	                <li class="presentation"><a href="#goods-reviews">고객후기(${revPag.records })</a></li>
	                <li class="presentation"><a href="#goods-questions">상품문의(${pqPag.records })</a></li>
	            </ul>
	        </div>
	        <div class="col-sm-12">
	            <h3 class="detail-text">${product.name }</h3>
	            <h2 class="detail-text">${product.simple }</h2>
	        </div>
	        <div class="col-sm-12"  id="goods-image">
	            <ul class="nav nav-tabs detail-nav-tabs">
	                <li class="presentation"><a href="#goods-description">상품설명</a></li>
	                <li class="presentation active"><a href="#goods-image">상품이미지</a></li>
	                <li class="presentation"><a href="#goods-infomation">상세정보</a></li>
	                <li class="presentation"><a href="#goods-reviews">고객후기(${revPag.records })</a></li>
	                <li class="presentation"><a href="#goods-questions">상품문의(${pqPag.records })</a></li>
	            </ul>
	        </div>
	        <div class="col-sm-12">
	            <img src="/mj/images/product/${product.img }" class="detail-img">
	        </div>
	        <div class="col-sm-12"  id="goods-infomation">
	            <ul class="nav nav-tabs detail-nav-tabs">
	                <li class="presentation"><a href="#goods-description">상품설명</a></li>
	                <li class="presentation"><a href="#goods-image">상품이미지</a></li>
	                <li class="presentation active"><a href="#goods-infomation">상세정보</a></li>
	                <li class="presentation"><a href="#goods-reviews">고객후기(${revPag.records })</a></li>
	                <li class="presentation"><a href="#goods-questions">상품문의(${pqPag.records })</a></li>
	            </ul>
	        </div>
	        <div class="col-sm-12">
	            <img src="/mj/images/detail/table001.PNG" class="detail-img">
	        </div>
	        <div class="col-sm-12"  id="goods-reviews">
	            <ul class="nav nav-tabs detail-nav-tabs">
	                <li class="presentation"><a href="#goods-description">상품설명</a></li>
	                <li class="presentation"><a href="#goods-image">상품이미지</a></li>
	                <li class="presentation"><a href="#goods-infomation">상세정보</a></li>
	                <li class="presentation active"><a href="#goods-reviews">고객후기(${revPag.records })</a></li>
	                <li class="presentation"><a href="#goods-questions">상품문의(${pqPag.records })</a></li>
	            </ul>
	        </div>
	        <div class="col-sm-10">
	            <h5><strong>PRODUCT REVIEW</strong></h5>
	            <ul>
	                <li>상품에 대한 리뷰를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
	                <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</li>
	            </ul>
	        </div>
	        <div class="col-sm-2">
	            <div>
                    <div class="form-group">
                        <select class="form-control detail-review-sel" name="sort" onchange="reviewSendform(1, ${product.no });">
                            <option value="date" ${param.sort eq 'date' ? 'selected' : '' }>최근등록순</option>
                            <option value="likes" ${param.sort eq 'likes' ? 'selected' : '' }>도움많은순</option>
                            <option value="view" ${param.sort eq 'view' ? 'selected' : '' }>조회많은순</option>
                        </select>
                    </div>
	            </div>
	        </div>
	        <div class="col-sm-12">
	            <table class="table detail-table">
	            	<colgroup>
	                    <col width="5%">
	                    <col width="*%">
	                    <col width="10%">
	                    <col width="10%">
	                    <col width="5%">
	                    <col width="5%">
	                </colgroup>
	                <thead class="detail-table-top">
	                    <tr>
	                        <th>번호</th>
	                        <th>제목</th>
	                        <th>작성자</th>
	                        <th>작성일</th>
	                        <th>도움</th>
	                        <th>조회</th>
	                    </tr>
	                </thead>
	                <tbody class="detail-table-bottom">
	                	<c:choose>
	                		<c:when test="${not empty reviews }">
				                <c:forEach var="review" items="${reviews }">
				                    <tr class="detail-review-row" id="detail-rev-title-${review.no }" onclick="showReview(${review.no});">
				                        <td>${review.no }</td>
				                        <td>${review.title }</td>
				                        <td><span class="badge">${review.customer.gra }</span>${review.customer.name }</td>
				                        <td><fmt:formatDate value="${review.createDate }"/></td>
				                        <td id="rev-likes-td-${review.no }">${review.likes }</td>
				                        <td>${review.view }</td>
				                    </tr>
						      		<tr class="detail-review-content" id="detail-review-content-${review.no }">
						      			<td colSpan="6">
						      			<c:if test="${review.img ne null}">
						      				<img src="/mj/images/mypage/${review.img }" width="600px">
						      			</c:if>
						              		<p>${review.content }</p>
						              		<div class="text-right" id="rev-likes-btn-${review.no }">
						              			<a href="#" class="btn btn-default" onclick="upRevLikes(event, ${review.no}, '${LOGINCUSTOMER.id }', ${review.likes })">도움이 돼요 ${review.likes }</a>
						              		</div>
						      			</td>
						      		</tr>
				                </c:forEach>
	                		</c:when>
	                		<c:otherwise>
	                			<tr class="detail-review-row" style="text-align: center">
	                				<td colspan="6">
	                					<p>조회된 리뷰가 없습니다.</p>
	                				</td>
	                			</tr>
	                		</c:otherwise>
	                	</c:choose>
	                </tbody>
	            </table>
	        </div>
	        <div class="col-sm-2 col-sm-offset-10">
	        	<a href="/mj/kurly/mypage/reviewWrite.hta?pro=${product.no }" id="write-review" class="btn detail-btn-table" onclick="isLogin(event, '${LOGINCUSTOMER.id }')">후기 쓰기</a>
	        </div>
	        <div class="col-sm-12 detail-paging">
	            <ul class="pagination detail-pagination">
	            <c:choose>
	            	<c:when test="${not revPag.first }">
		                <li><a href="#" onclick="goReviewPage(event, ${revPag.page - 1}, ${product.no });">&laquo;</a></li>
	            	</c:when>
	            	<c:otherwise>
		                <li><a href="#" onclick="goReviewPage(event, ${revPag.begin }, ${product.no});">&laquo;</a></li>
	            	</c:otherwise>
	            </c:choose>
	            <c:forEach var="no" begin="${revPag.begin }" end="${revPag.end }">
	                <li class="${no eq revPag.page ? 'active' : '' }"><a href="#" onclick="goReviewPage(event, ${no }, ${product.no });">${no }</a></li>
	            </c:forEach>
	            <c:choose>
	            	<c:when test="${not revPag.last }">
		                <li><a href="#" onclick="goReviewPage(event, ${revPag.page + 1 }, ${product.no});">&raquo;</a></li>
	            	</c:when>
	            	<c:otherwise>
		                <li><a href="#" onclick="goReviewPage(event, ${revPag.end }, ${product.no});">&raquo;</a></li>
	            	</c:otherwise>
	            </c:choose>
	            </ul>
	        </div>
	        <div class="col-sm-12"  id="goods-questions">
	            <ul class="nav nav-tabs detail-nav-tabs">
	                <li class="presentation"><a href="#goods-description">상품설명</a></li>
	                <li class="presentation"><a href="#goods-image">상품이미지</a></li>
	                <li class="presentation"><a href="#goods-infomation">상세정보</a></li>
	                <li class="presentation"><a href="#goods-reviews">고객후기(${revPag.records })</a></li>
	                <li class="presentation active"><a href="#goods-questions">상품문의(${pqPag.records })</a></li>
	            </ul>
	        </div>
	        <div class="col-sm-12">
	            <h5><strong>PRODUCT Q&A</strong></h5>
	            <ul>
	                <li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
	                <li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</li>
	            </ul>
	        </div>
	        <div class="col-sm-12">
	            <table class="table detail-table">
	                <colgroup>
	                    <col width="5%">
	                    <col width="*%">
	                    <col width="15%">
	                    <col width="10%">
	                </colgroup>
	                <thead class="detail-table-top">
	                    <tr>
	                        <th>번호</th>
	                        <th>제목</th>
	                        <th>작성자</th>
	                        <th>작성일</th>
	                    </tr>
	                </thead>
	                <tbody class="detail-table-bottom">
	                <c:choose>
	                	<c:when test="${not empty pqs }">
	                		<c:forEach var="pq" items="${pqs }">
			                    <tr class="detail-pq-row" onclick="showPq(${pq.no});">
			                        <td>${pq.no }</td>
			                        <td>${pq.title }</td>
			                        <td>${pq.customer.name }</td>
			                        <td><fmt:formatDate value="${pq.createDate }"/> </td>
			                    </tr>
			                    <tr class="detail-pq-content" id="detail-pq-content-${pq.no }" >
			                    	<td colspan="4">
									<c:if test="${pq.imgName ne null }">
			                    		<img src="/mj/images/pq/${pq.imgName }">
									</c:if>
			                    		<p>${pq.contents }</p>
			                    		<c:if test="${LOGINCUSTOMER.status eq '관리자' && pq.answer eq null }">
				                    		<div class="text-right">
				                    			<a href="pqanswerform.hta?prono=${product.no }&pqno=${pq.no }&pqPno=${pqPag.page }" class="btn btn-default">답변작성</a>
				                    		</div>
			                    		</c:if>
			                    	</td>
			                    </tr>
			                    <c:if test="${pq.answer ne null }">
			                    	<tr class="detail-pq-row" onclick="showPqAnsw(${pq.no});">
				                        <td></td>
				                        <td><span class="label label-info">re</span> 안녕하세요, 민지컬리입니다.</td>
				                        <td>MinzyKurly</td>
				                        <td></td>
				                    </tr>
				                    <tr class="detail-pq-answer" id="detail-pq-answer-${pq.no }" >
				                    	<td colspan="4">
				                    		<p>${pq.answerWithBr }</p>
				                    	</td>
				                    </tr>
			                    </c:if>
	                		</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                		<tr class="detail-pq-row" style="text-align: center">
	                			<td colspan="4">
	                				<p>조회된 상품 문의가 없습니다.</p>
	                			</td>
	                		</tr>
	                	</c:otherwise>
	                </c:choose>
	                </tbody>
	            </table>
	        </div>
	        <div class="col-sm-4 col-sm-offset-8 text-right">
	            <a href="pqform.hta?prono=${product.no }&custid=${LOGINCUSTOMER.id }" class="btn detail-btn-table" onclick="isLogin(event, '${LOGINCUSTOMER.id }');">상품문의</a>
	        	<c:if test="${LOGINCUSTOMER.status eq '관리자' }">
		        	<a href="/mj/kurly/admin/qnaManagement.hta?sort=답변대기중" class="btn detail-btn-table">문의관리</a>
	        	</c:if>
	        </div>
	        <div class="col-sm-12 detail-paging">
	            <ul class="pagination detail-pagination">
	                <c:choose>
	            	<c:when test="${not pqPag.first }">
		                <li><a href="#" onclick="goPqPage(event, ${pqPag.page - 1}, ${product.no });">&laquo;</a></li>
	            	</c:when>
	            	<c:otherwise>
		                <li><a href="#" onclick="goPqPage(event, ${pqPag.begin }, ${product.no});">&laquo;</a></li>
	            	</c:otherwise>
	            </c:choose>
	            <c:forEach var="no" begin="${pqPag.begin }" end="${pqPag.end }">
	                <li class="${no eq pqPag.page ? 'active' : '' }"><a href="#" onclick="goPqPage(event, ${no }, ${product.no });">${no }</a></li>
	            </c:forEach>
	            <c:choose>
	            	<c:when test="${not pqPag.last }">
		                <li><a href="#" onclick="goPqPage(event, ${pqPag.page + 1 }, ${product.no});">&raquo;</a></li>
	            	</c:when>
	            	<c:otherwise>
		                <li><a href="#" onclick="goPqPage(event, ${pqPag.end }, ${product.no});">&raquo;</a></li>
	            	</c:otherwise>
	            </c:choose>
	            </ul>
	        </div>
	    </div>
	</form>
</div>
<%@ include file="../common/footer.jsp"%>
 <script type="text/javascript">
 	function firstPrint(po, pqNo) {
 		var unitprice = parseInt(document.getElementById("unit-price").value);
 		document.getElementById("total-price").setAttribute("value", unitprice.toLocaleString());
 		if(po == "review") {
 			document.getElementById("detail-goReviews").click();
 		} else if (po == "pq") {
 			document.getElementById("detail-goPqs").click();
 		} else if (po == "openPq") {
 			document.getElementById("detail-pq-content-" + pqNo).style.display = "table-row";
 			document.getElementById("detail-goPqs").click();
 		}
 	}
 	
 	function calculate(cb) {
 		var val = parseInt(document.getElementById("detail-amt").value);
 		var max = parseInt(document.getElementById("detail-amt").max);
 		var min = parseInt(document.getElementById("detail-amt").min);
 		var unitprice = parseInt(document.getElementById("unit-price").value);
 		
 		cb(val, max, min, unitprice);
 	}
 	document.getElementById("btn-plus").onclick = function() {
 		calculate(function(val, max, min, unitprice) {
 			var result = val + 1;
 			if (result > max){
 				result = max;
 			}
 			
 			var totalprice = unitprice*result;
 			document.getElementById("detail-amt").setAttribute("value", result);
 			document.getElementById("total-price").setAttribute("value", totalprice.toLocaleString());
 		});
 	}
 	document.getElementById("btn-minus").onclick = function() {
 		calculate(function(val, max, min, unitprice) {
 			var result = val - 1;
 			if (result < min) {
 				result = min;
 			}
 			
 			var totalprice = unitprice*result;
 			document.getElementById("detail-amt").setAttribute("value", result);
 			document.getElementById("total-price").setAttribute("value", totalprice.toLocaleString());
 		});
 	}
 	
 	function showReview(no) {
 		var content = document.getElementById("detail-review-content-" + no);
 		if(content.style.display == "none" || content.style.display == "") {
	 		var xhr = new XMLHttpRequest();
	 		xhr.onreadystatechange = function() {
	 			if(xhr.readyState == 4 && xhr.status == 200) {
	 				var review = JSON.parse(xhr.responseText);
	 				
	 				var htmlContent = "";
	 				htmlContent += "<td>"+review.no+"</td>";
	 				htmlContent += "<td>"+review.title+"</td>";
	 				htmlContent += "<td><span class=\"badge\">"+review.customer.gra+"</span>"+review.customer.name+"</td>";
	 				htmlContent += "<td>"+review.createDate+"</td>";
	 				htmlContent += "<td id=\"rev-likes-td-"+review.no+"\">"+review.likes+"</td>";
	 				htmlContent += "<td>"+review.view+"</td>"; 
	                
	 				$('#detail-rev-title-' + no).empty();
	 				document.getElementById("detail-rev-title-" + no).innerHTML = htmlContent;
	 			}
	 		}
	 		xhr.open("GET", "proreviewtitle.hta?reviewno=" + no);
	 		xhr.send();
	 		
 			var other = document.querySelectorAll(".detail-review-content");
	 		var i;
	 		for(i=0; i<other.length; i++) {
	 			other[i].style.display = "none";
	 		}
 			content.style.display = "table-row";
 		} else {
 			content.style.display = "none";
 		}
 	}
  		
  	function showPq(no) {
 		var content = document.getElementById("detail-pq-content-" + no);
 		if(content.style.display == "none" || content.style.display == "") {
 			var other = document.querySelectorAll(".detail-pq-content");
	 		var i;
	 		for(i=0; i<other.length; i++) {
	 			other[i].style.display = "none";
	 		}
 			content.style.display = "table-row";
 		} else {
 			content.style.display = "none";
 		}
 	}
  	function showPqAnsw(no) {
 		var content = document.getElementById("detail-pq-answer-" + no);
 		if(content.style.display == "none" || content.style.display == "") {
 			var other = document.querySelectorAll(".detail-pq-answer");
	 		var i;
	 		for(i=0; i<other.length; i++) {
	 			other[i].style.display = "none";
	 		}
 			content.style.display = "table-row";
 		} else {
 			content.style.display = "none";
 		}
 	}
  	
  	function reviewSendform(pno, proNo) {
  		document.getElementById("review-pno").value = pno;
  		document.getElementById("pro-no").value = proNo;
  		document.getElementById("detail-position").value = "review";
  		document.getElementById("detail-form").submit();
  	}
  	function goReviewPage(event, pno, proNo) {
  		event.preventDefault();
  		reviewSendform(pno, proNo);
  	}
  	
  	function pqSendform(pno, proNo) {
  		document.getElementById("pq-pno").value = pno;
  		document.getElementById("pro-no").value = proNo;
  		document.getElementById("detail-position").value = "pq";
  		document.getElementById("detail-form").submit();
  	}
  	function goPqPage(event, pno, proNo) {
  		event.preventDefault();
  		pqSendform(pno, proNo);
  	}
  	
  	function upRevLikes(event, reviewNo, loginId, likes) {
  		event.preventDefault();
  		if(loginId == null || loginId == "") {
  			alert("로그인 후에 이용 가능합니다.");
  			return;
  		}
  		var xhr = new XMLHttpRequest();
  		xhr.onreadystatechange = function() {
  			if(xhr.readyState == 4 && xhr.status == 200) {
  				var review = JSON.parse(xhr.responseText);
  				
  				if(review.likes == likes) {
  					alert("한번만 클릭 가능합니다.")
  					return;
  				} else {
	 				document.getElementById("rev-likes-td-" + reviewNo).innerHTML = review.likes;
	 				
	 				var htmlContent = "";
	 				htmlContent += "<a href=\"#\" class=\"btn btn-default\" onclick=\"upRevLikes(event, "+reviewNo+", \'"+loginId+"\', "+review.likes+")\">도움이 돼요 "+review.likes+"</a>";
	 				
	 				document.getElementById("rev-likes-btn-" + reviewNo).innerHTML = htmlContent;
  				}
  			}
  		}
  		xhr.open("GET", "proreviewlikes.hta?reviewno=" + reviewNo + "&loginid=" + loginId);
  		xhr.send();
  	}
  	
  	function isLogin(event, custId) {
  		if(custId == null || custId == "") {
			event.preventDefault();
			alert("로그인 후에 이용 가능합니다.");
  			return;
  		}
  	}
  	
  	function addProduct(proNo) { 		
  		var cartAmount = document.getElementById("detail-amt").value 
  		
  		var xhr = new XMLHttpRequest();
  		xhr.onreadystatechange = function() {
  			if (xhr.readyState == 4 && xhr.status == 200) {
  				var result = JSON.parse(xhr.responseText);
  				if (result.success == "YES") {
					alert("상품이 장바구니에 담겼습니다.");
					document.getElementById("header-cart-badge").innerHTML = result.headCartCount;
				} else if(result.success == "No") {
					alert("처리 중 오류가 발생하였습니다.");
				} else if(result.success == "LoginFail") {
					alert("로그인 후 사용 가능합니다.");
				} else {
					alert("같은 상품이 장바구니에 존재합니다.");
				}
  			}
  		} 		
  		xhr.open("GET","/mj/kurly/orders/addProduct.hta?cartAmount="+ cartAmount + "&proNo=" + proNo)
  		xhr.send();	
  	}
 </script>
</body>
</html>