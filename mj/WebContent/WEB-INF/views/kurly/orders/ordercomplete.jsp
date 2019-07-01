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
</head>
<style>
    .img-thumbnail {
        width: 180px;
        height: 100px;
        border: none;
    }

    .header {
        color: rebeccapurple;
        font-size: 80px;
        text-align: center;
        border-bottom: 2px solid rebeccapurple;
    }

    .panel-panel {
        background-color: white;
        border-bottom: 2px solid rebeccapurple;
    }

    .panel-footer {
        background-color: white;
        font-size: 13px;
        color: dimgray;
        text-align: left;
    }

    .page-title {
        margin: 40px;
    }

    .pg_sub_desc {
        font-size: 16px;
        color: #555;
    }

    .table>tbody {
        color: #555;
    }

    .table>tfoot {
        font-size: 18px;
    }

    .move-button {
        margin: 30px;
        text-align: center; 
    }

    .btn-move {
        margin: 10px;
        width: 300px;
        height: 50px;
        color: white;
        background-color: rebeccapurple;
    }
    
    <%@ include file="../common/head-foot-style.jsp" %>
    
</style>

<body>
<%@ include file="../common/header.jsp" %>
    <div class="container">
        <div class="col-sm-8 col-sm-offset-2 well">
            <div class="panel-panel">
                <div class="header"> 
                    <img src="/mj/images/order/ani_success.gif" class="img-thumbnail" />
                    <h1 class="page-title"><strong>결제완료</strong></h1>
                    <div class="pg_sub_desc">
                        <p>
                            <strong>${custName }</strong>님의 주문이 완료되었습니다.<br>
                            다음에 다시 만나요<br>
                        </p>
                    </div>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>수량</th>
                                <th>상품명</th>
                                <th>금액</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cartInfo" items="${cartInfos }">
                            <tr>
                                <td>${cartInfo.cartAmount }</td>
                                <td>${cartInfo.proName }</td>
                                <td><p><fmt:formatNumber value="${cartInfo.discountPrice * cartInfo.cartAmount}" />원</p></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th></th>
                                <th><span>총 결제금액</span></th>
                                <th><c:out value="${plusPoint}" />원</th>
                                <br />
                            </tr>
                            <tr>
                                <th></th>
                                <th><span>적립포인트</span></th>
                                <th><c:out value="${lastTotalPrice}" /> 원</th>
                                <br />
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="panel-footer">
                    <p>
                        ※ 고객님의 단순변심으로 인한 환불은 배송비가 청구될 수 있습니다. <br />
                        ※ 신선제품은 구매 2일 이내에만 환불 가능합니다. 
                    </p>
                </div>
            </div>


           <!-- <div class="move-button">
                <div class="row">
                    <button class="btn btn-move">
                        <span class="glyphicon glyphicon-repeat" onclick="/kurly/main.hta"> 메인으로이동</span>
                    </button>
                    <button class="btn btn-move">
                        <span class="glyphicon glyphicon-repeat" onclick="/kurly/mypage/orderlist.hta"> 주문내역</span>
                    </button>
                </div>
            </div> -->
        </div>
    </div>
<%@ include file="../common/footer.jsp"%>

</body>
</html>
