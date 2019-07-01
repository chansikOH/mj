<%@page import="org.reflections.util.FilterBuilder.Include"%>
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
  
  		td{
  			margin: 10px 10px 10px 10px;
  		}
  
  		  .text-center{
            cursor: pointer;
        }
        .detail {
            display: none;
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
                <h3 class="not_snb">자주하는 질문<span id="not_snb2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span></h3>
            </div>
            <div>
            </div>
        </div>


        <div class="row">
            <div class="col-sm-2">
                <div class="list-group">
                    <a href="notice.hta?pno=1" class="list-group-item notic-menu">공지사항
                        <span class="glyphicon glyphicon-chevron-right notic-icon"></span></a>
                    <a href="frequent.hta?pno=1" class="list-group-item notic-menu active">자주하는 질문
                        <span class="glyphicon glyphicon-chevron-right qna-icon"></span></a>
                    <a href="qna.hta?pno=1" class="list-group-item notic-menu">1:1 문의
                        <span class="glyphicon glyphicon-chevron-right mun-icon"></span></a>

                </div>


            </div>

            <div class="col-xs-2 form-group">
                <form method="post" action="">
                    <select class="form-control category">
                        <option value="">선택</option>
                        <option value="회원문의">회원문의</option> 
                        <option value="주문/결제">주문/결제</option>
                        <option value="배송문의">배송문의</option>
                        <option value="서비스이용">서비스이용/기타</option>
                        <option value="쿠폰/적립금">쿠폰/적립금</option>
                        <option value="취소">취소/교환/반품</option>
                    </select>
                </form>
            </div>
            <div class="col-sm-10">
                <div>
                    <hr class="hr-puple">
                </div>
                <div>
                    <table class="table">
                        <colgroup>
                            <col width="15%" />
                            <col width="15%" />
                            <col width="*%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>카테고리</th>
                                <th>제목</th>
                            </tr>
                        </thead>
                    </table>
                    
                    <!--  c:forEach var="board" items="${boards }">-->
           			<c:forEach var="fre" items="${frequent}">
                    <div class="title">
                        <table class="table">
                        <colgroup>
                            <col width="15%" />
                            <col width="15%" />
                            <col width="*%" />
                        </colgroup>
                            <tr onclick="displayYn('${fre.no}')">
                                <td class="text-center" style="border-style: none;">${fre.no }</td>
                                <td class="text-center" style="border-style: none;">${fre.category }</td>
                                <td class="text-center" style="border-style: none;" >${fre.title }</td>
                            </tr>
                        </table>
                        <div class="detail" id="detail-content-${fre.no }">
                            <table class="table">
                                <tr class="text-center">
                                    <td>
                                      <img src="../../images/center/faq_a.jpg">
                                       ${fre.contents }
                                    <td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    </c:forEach>
                    <!--  -->
                    
                </div>
            </div>
            <div class="row">
                <div class="col-sm-10 col-sm-offset-2">
                    <hr class="hr-puple">
                </div>
                <div class="col-sm-10 col-sm-offset-2 page">
                    <ul class="pagination">
                        <li><a href="frequent.hta?pno=${fristpage }">&laquo;</a></li>
                        <c:forEach var="no" begin="1" end="${totalPCount }">
                        
                        <li class="${no eq pno ? 'active' : '' }"><a href="frequent.hta?pno=${no }">${no }</a></li>
                        </c:forEach>
                        <li><a href="frequent.hta?pno=${totalPCount }">&raquo;</a></li>
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
                    <form class="form-horizontal" method="post" action="">
                        <div class="form-group">
                            <div class="col-sm-3 col-sm-offset-8">
                                <input type="text" class="form-control" />
                            </div>
                            <div class="col-sm-1">
                                <button type="submit" class="btn search-btn"><span class="glyphicon glyphicon-search"></span></button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        
        function displayYn(no){
            
            var view = document.getElementById("detail-content-"+no);
            
            if(view.style.display == 'none' || view.style.display == ''){
                
                document.getElementById("detail-content-"+no).style.display = 'block';
                
            }else{
                document.getElementById("detail-content-"+no).style.display = 'none';
            }
        }
    </script>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>
