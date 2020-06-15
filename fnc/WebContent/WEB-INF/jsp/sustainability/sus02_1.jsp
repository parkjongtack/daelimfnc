<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>약관동의 및 본인 인증 &lt; 사이버신문고 &lt; 정도경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>

<%@ include file="/WEB-INF/jsp/header.jsp" %>


<script type="text/javascript">
// 본인 인증
function nmConfirm(type) {
	//	TODO : 서버간 통신 속도 문제로 주석 처리
	alert("문의사항이 있을시 김성인(063-260-1135)으로 문의해 주세요.");
	return;
	
	var radioVal = $('input[name="cyberAgree"]:checked').val();
	
	if (radioVal != "Y") {
		alert("개인정보 수집, 이용 및 위탁에 동의 하셔야만 합니다.");
		$("#cyberAgree_Y").focus();
		return false;
	}

	var frm = document.cyberForm;
	if(frm.sName.value == "" || frm.sResponseNumber.value == "" || frm.sBirthDate.value == "") {
		alert("본인인증 페이지로 이동합니다. \n\r본인인증을 정확하게 진행하신 후 이용하실 수 있습니다.");
		fnPopup();
		return false;
	}

	//본인인증 확인 바로 입력화면으로 이동 2013.04.25
	frm.target = "_self";
	return true;
}

//TODO : 시작
//본인 인증
function testConfirm(type) {
	var radioVal = $('input[name="cyberAgree"]:checked').val();
	
	if (radioVal != "Y") {
		alert("개인정보 수집, 이용 및 위탁에 동의 하셔야만 합니다.");
		$("#cyberAgree_Y").focus();
		return false;
	}

	var frm = document.cyberForm;
	if(frm.sName.value == "" || frm.sResponseNumber.value == "" || frm.sBirthDate.value == "") {
		alert("본인인증 페이지로 이동합니다. \n\r본인인증을 정확하게 진행하신 후 이용하실 수 있습니다.");
		fnPopup();
		return false;
	}

	//본인인증 확인 바로 입력화면으로 이동 2013.04.25
	frm.target = "_self";
	return true;
}
//TODO : 종료


window.name ="Parent_window";
//document.domain = "daelim.co.kr";

function fnPopup(){
	
	// 엣지 브라우저 구분
	var agent = navigator.userAgent.toLowerCase();
	var url = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb?m=checkplusSerivce&EncodeData=<c:out value="${sEncData}" />";
    window.open(url, 'popupDaelimChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	
// 	if(agent.indexOf('edge/') > -1) { // Edge
// 		var url = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb?m=checkplusSerivce&EncodeData=<c:out value="${sEncData}" />";
// 		window.open(url, 'popupDaelimChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');

// 	}else{
// 		window.open('', 'popupDaelimChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
// /* 		if ((location.href.indexOf("http://localhost:8080") < 0)) {					// 운영반영시 수정 */
// 			document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
// /* 		} else {
// 			document.form_chk.action = "/checkPlusSuccess.do";
// 		} */
// 		document.form_chk.target = "popupDaelimChk";
// 		document.form_chk.submit();
// 	}
}

</script>
				<div class="lnb">
					<ul>
						<li>
							<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
						</li>
						<li>
							<a href="javascript:void(0)">지속가능경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/com01.do">회사소개</a></li>
								<li><a href="/biz01.do">사업소개</a></li>
								<li><a href="/rnd01.do">기술개발</a></li>
								<li><a href="/sus01_1.do" class="active">지속가능경영</a></li>
								<li><a href="/pr01.do">홍보센터</a></li>
								<li><a href="/car01.do">인재채용</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)">정도경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do">안전·보건·환경 경영</a></li>
								<li><a href="/sus02_1.do" class="active">정도경영</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)" class="active">사이버신문고<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus02_1.do" class="active">사이버신문고</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
 			<div class="gnbBg"></div>
        </header>
		<!-- //header -->

		<!-- Container -->
		<div id="container">
			<form name="cyberForm" id="cyberForm" method="post" onsubmit="return testConfirm('name');">
				<input type="hidden" name="sName" value=""/>
				<input type="hidden" name="sMobileNo" value=""/>
				<input type="hidden" name="sResponseNumber" value="" />
				<input type="hidden" name="sBirthDate" value="" />
<%-- 				<input type="hidden" name="cd_mnu" value="${ currentMenu.cd_mnu }" /> --%>
				<input type="hidden" name="confirmKey" id="confirmKey"  value=""/>
			
			<div class="sub-visual Sustainability">
				<h2>지속가능경영</h2>
			</div>
			<div id="content">
				<h3>사이버신문고</h3>
				<p class="sub-text align-c">
					대림에프엔씨와의 거래나 접촉 시 임직원의 부당한 요구나 불공정 행위로 인해 피해를 입으신 사항이나<br>
					윤리경영을 위한 제안, 건의사항 등을 보내주시면 확인 후 성실히 답변해 드리겠습니다.
				</p>
				<div class="bg-text-box type-notice">
					<p class="text">사이트 이용관련 또는 기타 문의는 고객문의를 이용해 주십시오.</p>
					<a href="javascript:void(0)" class="btn btn-arrow" onclick="sendEmail('sikim@daelimfnc.co.kr','3','기타문의')">고객문의 이용하기</a>
				</div>
				<ul class="step-list">
					<li class="step1 active">
						<span class="blind">1</span>
						<span class="txt">약관동의<br>본인인증</span>
					</li>
					<li class="step2">
						<span class="blind">2</span>
						<span class="txt">신고내용<br>등록하기</span>
					</li>
					<li class="step3">
						<span class="blind">3</span>
						<span class="txt">신고완료</span>
					</li>
				</ul>
				<h4 class="blind">약관동의 및 본인 인증</h4>
				<h5>개인정보수집 및 이용에 대한 안내</h5>
				<div class="terms-agree-area page-type">
<!-- 컨텐츠 들여쓰기 정렬 금지 -->
<div class="prewrap-txt-box">'대림에프엔씨'는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 
회사는 고객의 소리 이용과 관련하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지
알려드립니다.

회사는 취급방침 개정 시 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

ο 본 방침은 2020년 4월 29일부터 시행됩니다.

<strong>1. 수집 목적 : 본인 확인, 고객 불만 민원 처리, 시정사항 고지</strong>
   (본 정보는 이해 당사자에게 절대 누설되지 않으니 안심하셔도 좋습니다.)

<strong>2. 개인정보 수집 항목</strong>
   - 필수항목 : 이름, 이메일, 연락처(휴대폰) (이름, 휴대폰 정보는 NICE신용평가정보에서 인증 받은 정보를 이용합니다.)
   - 선택 항목 : 전화번호
   - 수집 방법 : 홈페이지
   
<strong>3. 보유 및 이용 기간 : 접수 후 6개월</strong>
   - 이용 목적 달성 시 달성 후 5일 이내에 해당 정보는 예외 없이 파기됩니다.
   
<strong>4. 정보주체의 권리, 의무 및 그 행사방법 안내</strong>
   - 이용자는 개인정보주체로서 다음 권리 행사가 가능합니다. 
     : 개인정보 열람 요구 / 오류 발생 시 정정 요구 / 삭제 요구 / 처리 정지 요구
   - 열람 요구는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다. 
     또한 법정대리인 및 위임을 받은 자를 통해 요구가 가능하나, 이 경우 개인정보보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
   
<strong>5. 개인정보수집 및 이용 동의 거부 안내 </strong>
   - 본 서비스의 개인정보 수집 및 이용 동의에 거부하실 수 있으나, 이 경우 본 서비스를 이용하실 수 없습니다. 
   - 개인정보 처리와 관련하여 문의사항이 있으신 분께서는 전화 063-260-1135나, 이메일 <a href="sikim@daelimfnc.co.kr">sikim@daelimfnc.co.kr</a>로 보내주시길 바랍니다.
</div>
<!-- // 컨텐츠 들여쓰기 정렬 금지 -->
					<p class="info-txt02">개인정보의 수집 및 이용에 동의하십니까? <span class="f-color02"> (필수)</span></p>
					
					<div class="radio-area">
						<span class="radio-box">
							<input type="radio" id="cyberAgree_Y" name="cyberAgree" value="Y">
							<label for="cyberAgree_Y">동의</label>
						</span>
						<span class="radio-box">
							<input type="radio" id="cyberAgree_N" name="cyberAgree" value="N">
							<label for="cyberAgree_N">동의하지않음</label>
						</span>
					</div>
				</div>
				<div class="btn-area">
					<button type="button" class="btn btn-primary" onclick="javascript:testConfirm('name');">본인인증</button>
				</div>
			</div>
			<button type="button" class="btn-top">TOP</button>
			</form>
		</div>
		<!-- //Container -->
		
		<form name="form_chk" id="form_chk" method="post" action="">
			<input type="hidden" name="m" value="checkplusSerivce" />						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
			<input type="hidden" name="EncodeData" value="<c:out value="${sEncData}" />" />	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
		
		    <!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다. 해당 파라미터는 추가하실 수 없습니다. -->
			<input type="hidden" name="param_r1" id="param_r1" value="" />
			<input type="hidden" name="param_r2" id="param_r2" value="" />
			<input type="hidden" name="param_r3" id="param_r3" value="" />
		</form>
		
	<!-- footer -->
		<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	<!-- //footer -->

	<!-- sitemap -->
		<%@ include file="/WEB-INF/jsp/ft/sitemap.jsp" %>
	<!-- //sitemap -->


		<div class="back"></div>
	</div>
	<!-- //wrapper -->
</body>

</html>