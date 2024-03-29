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

.modal-body {
	margin-top: 30px;
}
.address-table th,
	.address-table td {
	padding-bottom: 500px;
	height: 110px;
}

.box {
	float: left;
	width: 300px;
	height: 30px;
}

.birth-day {
	width: 300px;
	border: 1px solid #333;
}

.birth {
	width: 70px;
	border: 0 none;
	background: transparent;
	height: 40px;
}

.btn-submit {
	display: block;
	width: 200px;
	height: 48px;
	margin: 40px auto 40px;;
	border: 0 none;
	background-color: #512772;
	font-size: 14px;
	color: #fff;
	line-height: 44px;
	letter-spacing: -0.3px;
}

.btn-submit:hover {
	color: #fff;
}

.title {
	margin: 100px;
}
.btn-primary, .btn-primary:hover {
	background-color: #512772;
}

<%@ include file ="../common/head-foot-style.jsp"%>
</style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>
	<h1 class="text-center title">회원가입</h1>
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2">
			<form class="well" method="post" action="register.hta">
				<div class="form-group">
					<table class="table">
						<colgroup>
							<col width="20%">
							<col width="50%">
							<col width="30%">
						</colgroup>
						<tbody class="text-center">
						
							<tr>
								<th>아이디*</th>
								<td><input class="box form-control" type="text" id="userid"  name="userid" value="" maxlength="16" required onclick="disableButton();"
									placeholder=" 예: marketkurly12" value="" /></td>
								<td><button type="button" class="btn btn-primary" onclick="checkIdDuplicate();">아이디 중복확인</button></td>
							</tr>
							
							<tr>
								<th>비밀번호*</th>
								<td><input class="box form-control" type="password" name="userpwd" required maxlength="16" required class="reg_pw" onclick="disableButton();"
									id="userpwd" placeholder=" 비밀번호를 입력해주세요."></td>
								<td></td>
							</tr>
							<tr>
								<th>비밀번호확인*</th>
								<td><input class="box form-control" type=password name="userpwd" required maxlength="16" required class="confirm_pw" onblur="checkpwd()" onclick="disableButton();"
									id="userpwdck" placeholder=" 비밀번호를 한번 더 입력해주세요."></td>
								<td><span id="msg-box"></span></td>
							</tr>



							<tr>
								<th>이름*</th>
								<td><input class="box form-control" type="text" onclick="disableButton();" name="username" required placeholder=" 예: 김컬리"></td>
								<td></td>
							</tr>
							<tr>
								<th>이메일*</th>
								<td><input class="box form-control" type="text" id="useremail"name="useremail" value="" size=30 required onclick="disableButton();"
									placeholder=" 예: minzikurly@kurly.com"></td>
								<td><button type="button" class="btn btn-primary" onclick="checkEmailDuplicate()">이메일 중복확인</button></td>
							</tr>
							<tr>
								<th>휴대폰*</th>
								<td>
									<input class="box form-control" type="text" value="" pattern="[0-9]*" name="phoneNumber" maxlength="11" required
									placeholder=" '-' 없이 숫자만 입력해주세요." class="inp" onclick="disableButton();" onblur="removeButton();">
								</td>
								<td></td>
							</tr>
							<tr class="address-table">
								<th>배송주소</th>
								<td class="box"><script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
									<div class="box address-box">
										우편번호 : <input type="text" name="userzip" style="width: 80px; height: 26px;" />
										<button type="button" style="width: 60px; height: 32px;" onclick="openZipSearch()">검색</button><br> 
										주소 : <input type="text" name="useraddr1" style="width: 260px; height: 30px;" readonly /><br> 
										상세 : <input type="text" name="useraddr2" style="width: 260px; height: 30px;" />
									</div> <script>
                                        function openZipSearch() {
                                            new daum.Postcode({
                                                oncomplete: function(data) {
                                                    $('[name=userzip]').val(data.zonecode); // 우편번호 (5자리)
                                                    $('[name=useraddr1]').val(data.address);
                                                    $('[name=useraddr2]')
                                                        .val(data.buildingName);
                                                }
                                            }).open();
                                        }
                                    </script></td>
		                                  
								<td></td>
							</tr>
							<tr>
								<th>성별*</th>
								<td class="box">
									<input required class="box-7" type="radio" name="usergender" value="male" />남 
									<input required class="box-7" type="radio" name="usergender" value="female" />여 
									<input required class="box-7" type="radio" name="usergender" value="none" />해당없음
								</td> 
								<td></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<div class="birth-day">
										<input class="birth text-center" type="text" size="4" maxlength="4" placeholder="YYYY" name="userbir1"> 
										<span>/</span>
										<input class="birth text-center" type="text" size="2" maxlength="2" placeholder="MM" name="userbir2"> 
										<span>/</span>
										<input class="birth text-center" type="text" size="2" maxlength="2" placeholder="DD" name="userbir3">
									</div>
								</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<div class="text-center">
						<input type="submit" id="submitButton" class="btn btn-primary" value="회원 가입" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-9 col-sm-offset-2">
			<div class="yn">
				<h3 class="tit">이용약관동의*</h3>
				<p class="sub">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
				<form class="well">

					<div class="all">
						<input type="checkbox" id="all-ck" onchange="allCheckOrRelease();" />
						<span class="yn-style">전체 약관동의</span>
					</div>

					<div class="check-view">
						<input type="checkbox" id="ck-1" name="tech" value="이용약관" />
						<span class="">이용약관</span><span class="">(필수)</span>
						<a type="text" class="" data-toggle="modal" data-target="#modal-1">약관보기></a>

						<div class="modal fade bs-example-modal-lg" id="modal-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
							
								<div class="modal-content modal-box">
									<div class="modal-body">
										<h2>이용 약관</h2>
										제1조(목적)<br> 이 약관은 주식회사 컬리 회사(전자상거래 사업자)가 운영하는 인터넷사이트
										마켓컬리(이하 “컬리”라 한다)에서 제공하는 전자상거래 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어
										컬리와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br> *PC통신, 스마트폰 앱,
										무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다.<br> <br>
										제2조(정의)<br> ① “컬리”란 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게
										제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며,
										아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br> ② “이용자”란 “컬리”에 접속하여 이
										약관에 따라 “컬리”가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br> ③ ‘회원’이라 함은
										“컬리”에 회원등록을 한 자로서, 계속적으로 “컬리”가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
										④ ‘비회원’이라 함은 회원에 가입하지 않고 “컬리”가 제공하는 서비스를 이용하는 자를 말합니다.<br>
										<br> <br> 제3조 (약관 등의 명시와 설명 및 개정) <br> ① “컬리”는 이
										약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함),
										전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알
										수 있도록 컬리의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수
										있도록 할 수 있습니다.<br> ② “컬리"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용
										중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면
										등을 제공하여 이용자의 확인을 구하여야 합니다.<br> ③ “컬리”는「전자상거래 등에서의 소비자보호에
										관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」,
										「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을
										위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br> ④ “컬리”가 약관을 개정할 경우에는
										적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지
										공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고
										공지합니다. 이 경우 "컬리“는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록
										표시합니다. <br> ⑤ “컬리”가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는
										계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미
										계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에
										“컬리”에 송신하여 “컬리”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br> ⑥ 이 약관에서
										정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에
										관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br>
										<br> 제4조(서비스의 제공 및 변경) <br> ① “컬리”는 다음과 같은 업무를 수행합니다.<br>
										1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br> 2. 구매계약이 체결된 재화 또는
										용역의 배송<br> 3. 기타 “컬리”가 정하는 업무<br> ② “컬리”는 재화 또는 용역의
										품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수
										있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을
										게시한 곳에 즉시 공지합니다.<br> ③ “컬리”가 제공하기로 이용자와 계약을 체결한 서비스의 내용을
										재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시
										통지합니다.<br> ④ 전항의 경우 “컬리”는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만,
										“컬리”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br> <br>
										제5조(서비스의 중단) <br> ① “컬리”는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의
										두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br> ② “컬리”는
										제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다.
										단, “컬리”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br> ③ 사업종목의
										전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “컬리”는 제8조에 정한
										방법으로 이용자에게 통지하고 당초 “컬리”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “컬리”가
										보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “컬리”에서 통용되는 통화가치에
										상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br> <br> 제6조(회원가입) <br>
										① 이용자는 “컬리”가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서
										회원가입을 신청합니다.<br> ② “컬리”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음
										각 호에 해당하지 않는 한 회원으로 등록합니다.<br> 1. 가입신청자가 이 약관 제7조제3항에 의하여
										이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서
										“컬리”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br> 2. 등록 내용에 허위, 기재누락,
										오기가 있는 경우<br> 3. 기타 회원으로 등록하는 것이 “컬리”의 기술상 현저히 지장이 있다고
										판단되는 경우<br> 4. 회원가입 및 전자상거래상의 계약에 관한 서비스는 만 14세 이상인자에 한함<br>
										③ 회원가입계약의 성립 시기는 “컬리”의 승낙이 회원에게 도달한 시점으로 합니다.<br> ④ 회원은
										회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “컬리”에 대하여 회원정보 수정 등의 방법으로
										그 변경사항을 알려야 합니다.<br> <br> 제7조(회원 탈퇴 및 자격 상실 등) <br>
										① 회원은 "컬리"에 언제든지 탈퇴를 요청할 수 있으며 "컬리"는 회원의 요청을 받았을 경우 사이트를 통하여
										"컬리"가 고지한 방법에 따라 신속하게 회원탈퇴를 처리합니다.<br> ② 회원이 다음 각 호의 사유에
										해당하는 경우, “컬리”는 회원자격을 제한 및 정지시킬 수 있습니다.<br> 1. 가입 신청 시에 허위
										내용을 등록한 경우<br> 2. “컬리”를 이용하여 구입한 재화 등의 대금, 기타 “컬리”이용에 관련하여
										회원이 부담하는 채무를 기일에 지급하지 않는 경우<br> 3. 다른 사람의 “컬리” 이용을 방해하거나 그
										정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br> 4. “컬리”를 이용하여 법령 또는 이 약관이
										금지하거나 공서양속에 반하는 행위를 하는 경우<br> ③ “컬리”가 회원 자격을 제한·정지 시킨 후,
										동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “컬리”는 회원자격을 상실시킬
										수 있습니다.<br> ④ “컬리”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우
										회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br>
										<br> 제8조(회원에 대한 통지)<br> ① “컬리”가 회원에 대한 통지를 하는 경우, 회원이
										“컬리”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br> ② “컬리”는 불특정다수 회원에
										대한 통지의 경우 1주일이상 “컬리” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의
										거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br> <br>
										제9조(구매신청) <br> ① “컬리”이용자는 “컬리”상에서 다음 또는 이와 유사한 방법에 의하여 구매를
										신청하며, “컬리”는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. <br>
										1. 재화 등의 검색 및 선택<br> 2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는
										이동전화번호) 등의 입력<br> 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료 등의 비용부담과
										관련한 내용에 대한 확인<br> 4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는
										표시(예, 마우스 클릭)<br> 5. 재화등의 구매신청 및 이에 관한 확인 또는 “컬리”의 확인에 대한
										동의<br> 6. 결제방법의 선택<br> ② “컬리”가 제3자에게 구매자 개인정보를 제공?위탁할
										필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지
										않습니다. 이 때 “컬리”는 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및
										보유?이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」
										제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.<br>
										<br> 제10조 (계약의 성립)<br> ① “컬리”는 제9조와 같은 구매신청에 대하여 다음 각
										호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지
										못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br> 1.
										신청 내용에 허위, 기재누락, 오기가 있는 경우<br> 2. 미성년자가 담배, 주류 등 청소년보호법에서
										금지하는 재화 및 용역을 구매하는 경우<br> 3. 기타 구매신청에 승낙하는 것이 “컬리” 기술상 현저히
										지장이 있다고 판단하는 경우<br> ② “컬리”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게
										도달한 시점에 계약이 성립한 것으로 봅니다.<br> ③ “컬리”의 승낙의 의사표시에는 이용자의 구매
										신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br>
										<br> 제11조(지급방법)<br> “컬리”에서 구매한 재화 또는 용역에 대한 대금지급방법은
										다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “컬리”는 이용자의 지급방법에 대하여 재화 등의
										대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br> ① 폰뱅킹, 인터넷뱅킹, 메일 뱅킹
										등의 각종 계좌이체 <br> ② 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br> ③
										온라인무통장입금<br> ④ 전자화폐에 의한 결제<br> ⑤ 수령 시 대금지급<br> ⑥
										마일리지 등 “컬리”가 지급한 적립금에 의한 결제<br> ⑦ “컬리”와 계약을 맺었거나 “컬리”가 인정한
										상품권에 의한 결제 <br> ⑧ 기타 전자적 지급 방법에 의한 대금 지급 등<br> <br>
										제12조(적립금)<br> ① “컬리”는 회원의 구매활동, 이벤트 참여 등에 따라 회원에게 일정한 적립금을
										부여할 수 있습니다.<br> ② 회원은 적립금을 “컬리”에서 상품 등의 구매 시 결제 수단으로 사용할 수
										있으며, “컬리”는 적립금의 적립기준, 사용방법, 사용기간 및 제한에 대한 사항을 사이트에 별도로 게시하거나
										통지합니다. 적립금의 사용조건에 관한 사항은 “컬리”의 정책에 따라 달라질 수 있습니다.<br> ③
										적립금은 현금으로 환급될 수 없습니다. <br> ④ 회원은 적립금을 제3자에게 또는 다른 아이디로 양도할
										수 없으며, 유상으로 거래하거나 현금으로 전환할 수 없습니다.<br> ⑤ “컬리”는 회원이 “컬리”가
										승인하지 않은 방법 또는 허위 정보 제공 등의 부정한 방법으로 적립금을 획득하거나 부정한 목적이나 용도로 적립금을
										사용하는 경우 적립금의 사용을 제한하거나 적립금을 사용한 구매신청을 취소하거나 회원 자격을 정지할 수 있습니다.<br>
										⑥ 회원 탈퇴시 미사용한 적립금은 즉시 소멸되며, 탈퇴 후 재가입하더라도 소멸된 적립금은 복구되지 아니합니다.<br>
										<br> 제13조(할인쿠폰)<br> ① 할인쿠폰은 회원에게 무상으로 발행되는 것으로 “컬리”는
										회원이 할인쿠폰을 사이트에서 상품 구매 시 적용할 수 있도록 그 사용대상, 사용방법, 사용기간, 구매가 할인액
										등을 정할 수 있습니다. 할인쿠폰의 종류 또는 내용은 “컬리”의 정책에 따라 달라질 수 있습니다.<br>
										② “컬리”는 할인쿠폰의 사용대상, 사용방법, 사용기간, 할인금액 등을 사이트에 별도로 표시하거나 통지합니다.<br>
										③ 할인쿠폰은 현금으로 환급될 수 없으며, 할인쿠폰의 사용기간이 만료되거나 구매 취소 시 또는 이용계약이 종료되면
										소멸됩니다.<br> ④ “회원은 할인쿠폰을 제3자에게 또는 다른 아이디로 양도할 수 없으며, 유상으로
										거래하거나 현금으로 전환할 수 없습니다.<br> ⑤ “컬리”는 회원이 “컬리”가 승인하지 않은 방법으로
										할인쿠폰을 획득하거나 부정한 목적이나 용도로 할인쿠폰을 사용하는 경우 할인쿠폰의 사용을 제한하거나 할인쿠폰을
										사용한 구매신청을 취소하거나 회원 자격을 정지할 수 있습니다.<br> ⑥ 회원 탈퇴 시 “컬리”로부터
										발급받은 할인쿠폰 중 미사용한 할인쿠폰은 즉시 소멸되며, 탈퇴 후 재가입하더라도 소멸된 할인쿠폰은 복구되지
										아니합니다.<br> <br> <br> 제14조(수신확인통지·구매신청 변경 및 취소)<br>
										① “컬리”는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br> ② 수신확인통지를
										받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할
										수 있고 “컬리”는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만
										이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.<br> <br>
										제15조(재화 등의 공급)<br> ① “컬리”는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는
										이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한
										조치를 취합니다. 다만, “컬리”가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는
										일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “컬리”는 이용자가 재화 등의 공급 절차 및 진행
										사항을 확인할 수 있도록 적절한 조치를 합니다.<br> ② “컬리”는 이용자가 구매한 재화에 대해
										배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “컬리”가 약정 배송기간을 초과한
										경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “컬리”가 고의·과실이 없음을 입증한 경우에는
										그러하지 아니합니다.<br> <br> 제16조(환급)<br> “컬리”는 이용자가
										구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게
										통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한
										조치를 취합니다.<br> <br> 제17조(청약철회 등)<br> ① “컬리”와 재화등의
										구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른
										계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을
										공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만,
										청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에
										따릅니다. <br> ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및
										교환을 할 수 없습니다.<br> 1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된
										경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>
										2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br> 3. 시간의
										경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br> 4. 같은 성능을 지닌
										재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br> ③ 제2항제2호 내지
										제4호의 경우에 “컬리”가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나
										시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br> ④
										이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시?광고 내용과 다르거나 계약내용과 다르게 이행된
										때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에
										청약철회 등을 할 수 있습니다.<br> <br> 제18조(청약철회 등의 효과)<br>
										① “컬리”는 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다.
										이 경우 “컬리”가 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에
										관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.<br>
										② “컬리”는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을
										지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록
										요청합니다.<br> ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다.
										“컬리”는 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이
										표시?광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은
										“컬리”가 부담합니다.<br> ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “컬리”는
										청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br> <br>
										제19조(개인정보보호)<br> ① “컬리”는 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서
										최소한의 개인정보를 수집합니다. <br> ② “컬리”는 회원가입시 구매계약이행에 필요한 정보를 미리
										수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정
										개인정보를 수집하는 경우에는 그러하지 아니합니다.<br> ③ “컬리”는 이용자의 개인정보를 수집?이용하는
										때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. <br> ④ “컬리”는 수집된 개인정보를
										목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는
										이용?제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는
										경우에는 예외로 합니다.<br> ⑤ “컬리”가 제2항과 제3항에 의해 이용자의 동의를 받아야 하는
										경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적,
										제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및
										정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이
										동의를 철회할 수 있습니다.<br> ⑥ 이용자는 언제든지 “컬리”가 가지고 있는 자신의 개인정보에 대해
										열람 및 오류정정을 요구할 수 있으며 “컬리”는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가
										오류의 정정을 요구한 경우에는 “컬리”는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br>
										⑦ “컬리”는 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드,
										은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의
										손해에 대하여 모든 책임을 집니다.<br> ⑧ “컬리” 또는 그로부터 개인정보를 제공받은 제3자는
										개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br> ⑨
										“컬리”는 개인정보의 수집?이용?제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의
										수집?이용?제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의
										수집?이용?제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br>
										<br> 제20조(“컬리“의 의무)<br> ① “컬리”는 법령과 이 약관이 금지하거나 공서양속에
										반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을
										다하여야 합니다.<br> ② “컬리”는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의
										개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br> ③ “컬리”가 상품이나 용역에
										대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은
										때에는 이를 배상할 책임을 집니다.<br> ④ “컬리”는 이용자가 원하지 않는 영리목적의 광고성
										전자우편을 발송하지 않습니다.<br> <br> 제21조(회원의 ID 및 비밀번호에 대한 의무)<br>
										① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br> ② 회원은
										자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br> ③ 회원이 자신의 ID 및
										비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “컬리”에 통보하고 “컬리”의 안내가 있는
										경우에는 그에 따라야 합니다.<br> <br> 제22조(이용자의 의무)<br> 이용자는
										다음 행위를 하여서는 안 됩니다.<br> 1. 신청 또는 변경시 허위 내용의 등록<br> 2.
										타인의 정보 도용<br> 3. “컬리”에 게시된 정보의 변경<br> 4. “컬리”가 정한 정보
										이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br> 5. “컬리” 기타 제3자의 저작권 등
										지적재산권에 대한 침해<br> 6. “컬리” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
										7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위<br>
										<br> 제23조(저작권의 귀속 및 이용제한)<br> ① “컬리“가 작성한 저작물에 대한 저작권
										기타 지적재산권은 "컬리"에 귀속합니다.<br> ② 이용자는 “컬리”를 이용함으로써 얻은 정보 중
										“컬리”에게 지적재산권이 귀속된 정보를 “컬리”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에
										의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br> ③ “컬리”는 약정에 따라
										이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br> <br>
										제24조(면책조항)<br> ① “컬리”는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할
										수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br> ② “컬리”는 회원의 귀책사유로 인한
										서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br> ③ “컬리”는 회원이 서비스를 이용하여
										기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그 밖의 서비스를 통하여 얻은 자료로 인한 손해에 관하여
										책임을 지지 않습니다.<br> ④ “컬리”는 회원이 게재한 정보, 자료, 사실의 신뢰도, 정확성 등
										내용에 관해서는 책임을 지지 않습니다.<br> ⑤ “컬리”는 회원 간 또는 회원과 제3자 상호간에
										서비스를 매개로 하여 거래 등을 한 경우에는 책임을 지지 않습니다.<br> <br> <br>
										제25조(분쟁해결)<br> ① “컬리”는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를
										보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.<br> ② “컬리”는 이용자로부터 제출되는
										불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와
										처리일정을 즉시 통보해 드립니다.<br> ③ “컬리”와 이용자 간에 발생한 전자상거래 분쟁과 관련하여
										이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시?도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수
										있습니다.<br> <br> 제26조(재판권 및 준거법)<br> ① “컬리”와 이용자
										간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를
										관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의
										경우에는 민사소송법상의 관할법원에 제기합니다.<br> ② “컬리”와 이용자 간에 제기된 전자상거래
										소송에는 한국법을 적용합니다.<br> <br> *부칙<br> 1. 이 약관은 2018년
										09월 13일부터 시행됩니다.<br> 2. 2017년 03월 27일부터 시행되던 종전의 약관은 이
										약관으로 대체됩니다.
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="check-view">
						<input type="checkbox" id="ck-2" name="tech" value="개인정보처리방침" />
						<span class="">개인정보처리방침</span><span class="">(필수)</span>
						<a type="text" class="" data-toggle="modal" data-target="#modal-2">약관보기></a>
						<div class="modal fade bs-example-modal-lg" id="modal-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content modal-box">
									<div class="modal-body">
										<h2>개인정보 수집·이용 동의 (필수)</h2>
										<table class="table">
											<thead>
												<tr>
													<th>수집 목적</th>
													<th>수집 항목</th>
													<th>보유 기간</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>이용자 식별 및 본인여부</td>
													<td rowspan="3">아이디, 비밀번호, 이름, 휴대폰번호, 이메일</td>
													<td rowspan="3">회원 탈퇴 후 30일 내</td>
												</tr>
												<tr>
													<td>계약 이행 및 약관변경 등의 고지를 위한 연락, 본인의사 확인 및 민원 등의 고객 고충 처리</td>
												</tr>
												<tr>
													<td>부정 이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="check-view">
						<input type="checkbox" id="ck-3" name="tech" value="개인정보처리방침" />
						<span class="">개인정보처리방침</span><span class="">(선택)</span>
						<a type="text" class="" data-toggle="modal" data-target="#modal-3">약관보기></a>
						<div class="modal fade bs-example-modal-lg" id="modal-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content modal-box">
									<div class="modal-body">
										<h2>개인정보의 수집 및 이용목적</h2>
										<table class="table">
											<colgroup>
												<col width="55%">
												<col width="20%">
												<col width="25%">
											</colgroup>
											<thead>
												<tr>
													<th scope="row">수집 목적</th>
													<th scope="row">수집 항목</th>
													<th scope="row">보유 기간</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>맞춤형 회원 서비스 제공</td>
													<td>성별, 생년월일</td>
													<td>회원 탈퇴 후 30일 내</td>
												</tr>
												<tr>
													<td>거점 기반 서비스 제공</td>
													<td>주소</td>
													<td>회원 탈퇴 후 30일 내</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="check-view">
						<input type="checkbox" id="ck-4" name="tech" value="나이" />
						<span class="">본인은 만14세이상입니다.</span>
						<span class="">(필수)</span>
					</div>
				</form>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
		function checkIdDuplicate() {
			
			var userid = document.getElementById("userid").value;
			
				var xhr = new XMLHttpRequest();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var data = JSON.parse(xhr.responseText);
						if( data.exist == "N" ) {
							alert("중복되는 아이디입니다.");
							document.getElementById("submitButton").setAttribute("disabled", "disabled");
						} else if (data.exist == "Y") {
							alert("사용가능한 아이디입니다.");
							document.getElementById("submitButton").removeAttribute("disabled");
						} else if(data.exist == "Nnull") {
							alert("아이디를 입력하세요");
							document.getElementById("submitButton").setAttribute("disabled", "disabled");
						}
					}
				}
				xhr.open("GET", "addCustomer-id.hta?id=" + userid);
				xhr.send();
			
		}
		
		function checkEmailDuplicate() {
			
			var useremail = document.getElementById("useremail").value;
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var data = JSON.parse(xhr.responseText);
					if( data.exist == "N" ) {
						alert("중복되는 이메일입니다.");
						document.getElementById("submitButton").setAttribute("disabled", "disabled");
					} else if (data.exist == "Y") {
						alert("사용가능한 이메일입니다.");
						document.getElementById("submitButton").removeAttribute("disabled");
					}
				}
			}
			xhr.open("GET", "addCustomer-email.hta?email=" + useremail);
			xhr.send();
		}
		
		function allCheckOrRelease() {
			var allCheckboxStatus = document.getElementById("all-ck").checked;
			console.log("전체 체크여부", allCheckboxStatus);

			var checkboxes = document.querySelectorAll("[name=tech]");
			console.log("모든 체크박스", checkboxes);

			for (var i = 0; i < checkboxes.length; i++) {
				var checkbox = checkboxes[i];

				checkbox.checked = allCheckboxStatus;
				console.log("각 체크박스", checkbox, checkbox.checked);
			}
		}

		function checkpwd() {
			var pwd = document.getElementById("userpwd").value;
			var pwdCk = document.getElementById("userpwdck").value;

			var msgbox = document.getElementById("msg-box")
			if (pwd.length <= 7 && pwdCk.length <= 7) {
				msgbox.textContent = "비밀번호는 8글자 이상 입력해야 합니다.";
				msgbox.style.color = 'red';
				msgbox.style.fontStyle = 'italic';
				document.getElementById("submitButton").setAttribute("disabled", "disabled");
				return;
			}
			if (pwd != pwdCk) {
				msgbox.textContent = "비밀번호가 일치하지 않습니다.";
				msgbox.style.color = 'red';
				msgbox.style.fontStyle = 'italic';
				document.getElementById("submitButton").setAttribute("disabled", "disabled");
				return;
			} else if (pwd == pwdCk) {
				msgbox.textContent = "비밀번호가 일치합니다.";
				msgbox.style.color = 'green';
				msgbox.style.fontStyle = 'italic';
				document.getElementById("submitButton").removeAttribute("disabled");
				return;
			}
			
		}
		
		function disableButton() {
			document.getElementById("submitButton").setAttribute("disabled", "disabled");
		}
		
		function removeButton() {
			document.getElementById("submitButton").removeAttribute("disabled");
		}
		
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
