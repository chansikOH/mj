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

        
        
        .table>tbody>tr>td,
        .table>tbody>tr>th{
        	border-style: none;
        }
        
        .title-text{
        	width:100%;
        
        }
        .qnaContents{
        	width: 100%;
        	height:100px;
        	resize:none;
        }
        a{
            text-decoration: none !important;
            color: black ;
        }
        ul,
        li {
            list-style-type: none;
        }

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

        .title_snb {
            font-size: 12px;
            font-weight: 100;
        }

        .a {
            padding: 13px 0 13px 20px !important;
        }

   
        .contents {
            width: 10%;
            height: 10%;
            display: inline;
            word-break: break-all;
            margin: 50px;

        }

        .hr-puple {
            border: 0.5px solid purple;
        }
                  
            .notContents  {
        	width: 100%;
        	height:150px;
        	resize:none;
        }
    </style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>

    <div class="container">
    <form action="noticeComplete.hta">
        <div class="row">
            <div class="col-sm-12 ">
                <h2>공지사항 글쓰기</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 well">
                <table class="table">
					<colgroup>
						<col width="25%">
						<col width="55%">
					</colgroup>
                    <tbody>
                        <tr>
                            <th class="a" >제목<input type="checkbox" name="fixed" value=Y></th>
                            
                            <td class="a "><input type="text" class="title-text" name="notTitle"/></td>           
                      
                        </tr>
                        <tr>
                            <th class="a">작성자</th>
                            <td class="a">maketkurly</td>
                       	
                        </tr>
                        <tr>
                            <th class="a">작성일</th>
                            <td class="a" id="create-date"></td>
                        
                        </tr>
                        <tr>
                            <th class="a">내용</th>
                            <td class="a"><textarea name="notcontents" class="notContents"></textarea></td>
                        
                        </tr>
                        <tr class="notsubmit">
                        	<th></th>
                        	<td class="text-right">
					        	<input type="submit" class="list" value="글쓰기"/>
                        	</td>
							
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
       
        <div class="row">
        <div class="col-sm-12">
        	<hr class="hr-puple">
        </div>
        </div>
        	
       
        <div class="row">
        	<div class="col-sm-10">
        	</div>
            <div class="col-sm-2">
                <div class="text-right">
                    <a href="notice.hta?pno=${param.pno }">
                    <span class="list">목록</span></a>
                </div>
            </div>
        </div>
        </form>
        </div>
                <%@ include file="../common/footer.jsp"%>
                <script type="text/javascript">
                	var v = new Date();
                	var localeDate  =  v.toLocaleDateString(); 
                	document.getElementById('create-date').innerHTML = localeDate;
                	
                </script>
    
</body>
</html>