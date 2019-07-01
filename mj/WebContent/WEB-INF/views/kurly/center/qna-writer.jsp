<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="ko">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>




    <style>
     <%@ include file="../common/head-foot-style.jsp"%>
     	.contents-qna{
     		resize: none;
     }
        .writer-button:hover{
            background-color: purple;
        }
        .order-button:hover{
            background-color: purple;
        }
        .order-button, .writer-button{
            width: 100px;
            height: 34px;
            border: 1px solid purple;
            color: white;
            background-color: #795b8f;
            font-weight: bold;
            
        }
        .contents-qna{
            width: 100%;
            height: 474px;
        }
        .desc{
                padding: 21px 10px 30px 0;
        }
        .order {
            width: 560px;
            height: 380px;
            display: none;
            background-color: rgb(255, 255, 255);

            border: 1px solid rgb(0, 0, 0);


        }

        .order-no {
            width: 140px;
            height: 30px;
            margin-top: 10px;
            border: 1px solid #d9d9d9;
        }

        .title {
            width: 100%;
            height: 30px;
            margin-top: 10px;
            border: 1px solid #d9d9d9;
        }

        .category-list {
            width: 35%;
            height: 30px;


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



        .table>tbody>tr>td {
            width: 110px;
            padding: 15px;
        }

        .table>tbody>tr>th {
            width: 110px;
            padding: 15px 0 15px 20px;
            background-color: #F7F5F8;
            border-bottom: 1px solid #e8e8e8;
            text-align: left;
            font-weight: normal;
            vertical-align: middle;
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
              
                    <form action="qna-add.hta" id="frmWr">
                        <table class="table">
                            <colgroup>
                                <col width="14%" align="right">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>제목</th>
                                    <td>
                                        <select class="category-list" name="categorylist" required id="j">
                                            <option disabled="disabled">선택해주세요</option>
                                            <option value="배송지연">배송지연</option>
                                            <option value="컬리패스">컬리패스 (무료배송)</option>
                                            <option value="반품문의">반품문의</option>
                                            <option value="AS문의">A/S문의</option>
                                            <option value="환불문의">환불문의</option>
                                            <option value="주문결제문의">주문결제문의</option>
                                            <option value="회원정보문의">회원정보문의</option>
                                            <option value="취소문의">취소문의</option>
                                            <option value="교환문의">교환문의</option>
                                            <option value="상품정보문의">상품정보문의</option>
                                            <option value="기타문의">기타문의</option>
                                        </select>
                                        <p><input class="title" type="text" name="title" id="title-text" required>
                                        </p>


                                    </td>
                                </tr>
                                <tr>
                                    <th>주문번호</th>
                                    <td>
                                        <p><input class="orderListNo" type="text" name="orderListNo" id="order-list-no" readonly="readonly" value="0000000">
                                            <input type="button" class="order-button" onclick="orderedList();" value="주문조회">
                                        </p>
                                        <div style="overflow:scroll; width:100%; height: 100%;"class="order" id="order-de" >
                                            <div class="text-center">
                                                문의하실 주문번호를 선택하세요!
                                            </div>

                                            <table class="table" id="orderDetailList">
                                                <colgroup>
                                                <col width="10%">
                                                <col width="10%">
                                                <col width="*">
                                                <col width="10%">
                                                <col width="15%">
                                                <col width="10%">
                                                <col width="10%">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th>주문번호</th>
                                                        <th>주문일자</th>
                                                        <th class="text-center">상품명</th>
                                                        <th class="text-center">수량</th>
                                                        <th class="text-center">주문금액</th>
                                                        <th class="text-center">총 구매건</th>
                                                        <th class="text-center">선택</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="ord" items="${order }">
                                                    <tr class="text-center"><!-- 주문상품 조회 -->
                                                        <td id="order-no-${ord.orderNo }">${ord.orderNo }</td>
                                                        <td><fmt:formatDate value="${ord.orderCreateDate }" pattern="yyyy-MM-dd"/></td>
                                                        <td >${ord.proName }</td>
                                                        <td class="text-center">${ord.cartAmount }</td>
                                                        <td class="text-center">${ord.orderPrice }</td>
                                                        <td class="text-center">외 ${ord.cnt }건</td>
                                                       <td>
                                                        <input type="button" onclick="setOrderNo(${ord.orderNo })" id="orderChoose" value="선택"/>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>								   			
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <strong>1:1 문의 작성 전 확인해주세요!</strong>
                                        <dl>
                                            <dt>반품 / 환불</dt>
                                            <dd>
                                                - 제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.</dd>

                                            <dd>

                                                -샛별 지역 : 배송일 전날 19시까지
                                                <p>-택배 지역 : 배송일 전날 18시까지</p>
                                                <p>
                                                    고객행복센터(1644-1107)/ 1:1문의 게시판/ 카카오톡(마켓컬리) 으로 취소 요청 바랍니다.</p>
                                                <p>
                                                    - 생산이 시작된 이후에는 취소가 불가능 한 점 고객님의 양해 부탁드립니다.</p>
                                                <p>
                                                    - 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.</p>
                                                <p>
                                                    - 비회원 주문건의 경우 1:1문의 게시판 접수가 불가하기에 고객행복센터(1644-1107), 카카오톡(마켓컬리) 로 취소 요청 부탁드립니다.</p>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>배송</dt>
                                            <dd>- 주문 완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.</dd>
                                            <dd> - 배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)</dd>
                                        </dl>
                                        <p class="desc"></p> 
                                        <!--문의 내용-->
                                        <textarea class="contents-qna" name="contentsqna" id="contents-qna" required></textarea>
                                    </td>
                                 
                                </tr>
                            </tbody>
                       
                        </table>
                             <div class="text-right">
                                   
                                  
                                        <input type="submit" class="writer-button" value="글쓰기"  onclick="b(event)">
                                   
                            </div>
                    </form>
                </div>
            </div>
        </div>


        <script type="text/javascript">
            function orderedList() {
            	document.getElementById("order-list-no").value = "";
                var view = document.getElementById("order-de");

                if (view.style.display == 'none' || view.style.display == '') {

                    document.getElementById("order-de").style.display = 'block';

                } else {
                    document.getElementById("order-de").style.display = 'none';
                }
            } 
            function setOrderNo(no){
            	
            		var orderNo = document.getElementById("order-no-" + no).textContent;
            		document.getElementById("order-list-no").value = orderNo;
            	
            	
    				var view = document.getElementById("order-de");
                    
    				if (view.style.display == 'block' || view.style.display == '') {

                        document.getElementById("order-de").style.display = 'none';

                    } else {
                        document.getElementById("order-de").style.display = 'block';
                    }
	            }
           function addBoard(){
        	   var form = document.frmWr;
        	   
        	   if(form.content.value.length == 0){
        		   alert('내용을 입력하세요~');
        		   form.content.focus();
        		   return;
        	   }
           }
            
        </script>
    </div>
     <%@ include file="../common/footer.jsp"%>
</body></html>
