<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>개인정보처리방침 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<div class="lnb">
					<ul>
						<li>
							<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
						</li>
						<li>
							<a href="javascript:void(0)">개인정보처리방침<!-- <i class="icon-arr"></i> --></a>
							<!-- <ul class="submenus">
								<li><a href="javascript:void(0)">회사소개</a></li>
								<li><a href="javascript:void(0)" class="active">사업소개</a></li>
								<li><a href="javascript:void(0)">기술개발</a></li>
								<li><a href="javascript:void(0)">지속가능경영</a></li>
								<li><a href="javascript:void(0)">홍보센터</a></li>
								<li><a href="javascript:void(0)">인재채용</a></li>
							</ul> -->
						</li>
						<li>
							<a href="javascript:void(0)">개인정보처리방침<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/ps01.do" class="active">개인정보처리방침</a></li>
								<li><a href="/md01.do">영상정보처리기기 운영관리방침</a></li>
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

			<div class="sub-visual Ft">
				<h2>고객센터</h2>
			</div>
			<div id="content">
				<h3>개인정보처리방침</h3>
				<div class="bg-text-box">
					<p class="sub-text">
						대림에프엔씨와의 (이하 '회사' 라 칭함) 은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록<br>
						다음과 같은 처리방침을 두고 있습니다.<br>
						회사는 개인정보처리방침을 개정하는 경우 회사 홈페이지(<a href="http://www.daelimfnc.co.kr">http://www.daelimfnc.co.kr</a>)를 통하여 공지할 것입니다.
					</p>
				</div>
				<div class="view-sel-box">
					<input type="hidden" id="snum" name="snum" value="0"/>
					<input type="hidden" id="cnts" name="cnts" value="0"/>
					<label for="viewselect" class="blind">개인정보처리방침 버전 선택</label>
					<select id="viewselect" class="ipt-basic ml-size">
						<option>개인정보처리방침 버전 v1.0</option>
					</select>
					<button type="button" class="btn btn-view" id="btn-view">보기</button>
				</div>

				<ul class="list-style01">
					<li>
						<strong>01.개인정보의 처리목적</strong>
						<p class="sub-text">회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</p>
						<ul class="list-style02">
							<li>가. 고객문의 고객제안, 고객불만, 고객문의</li>
							<li>나. 인재채용 
								<ul class="list-style03">
									<li>입사전형 진행, 입사 지원서 수정</li>
									<li>합격여부 확인</li>
									<li>입사지원자와의 원활한 의사소통</li>
									<li>자격증빙 확인</li>
								</ul>
							</li>
							<li>다. 오더센터
								<ul class="list-style03">
									<li>제품 주문, 문의</li>
								</ul>
							</li>
							<li>라. 사이버신문고 
								<ul class="list-style03">
									<li>공정거래에 대한 문의사항, 아이디어</li>
								</ul>
							</li>
							<li>마. 구매
								<ul class="list-style03">
									<li>제품 및 용역 구매</li>
								</ul>
							</li>
							<li>바. 출입관리
								<ul class="list-style03">
									<li>긴급 상황 발생 시 연락, 교육 이수 및 출입 허가, 작업 가능 판단 목적</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<strong>02.개인정보의 수집 및 보유</strong>
						<p class="sub-text">회사는 정보주체의 동의에 의해서만 개인정보를 수집,보유합니다. 법령의 규정에 근거하여 수집,보유하고 있는 주요 개인정보파일은 다음과 같습니다.</p>
						<ul class="list-style02">
							<li>가. 고객문의
								<ul class="list-style03">
									<li>개인정보 항목 : 이름, 전화번호, 회사명, 이메일</li>
									<li>수집방법 : 홈페이지</li>
									<li>보유근거 : 고객문의 및 민원처리</li>
									<li>보유기간 : 문의접수 후 6개월</li>
								</ul>
							</li>
							<li>나. 인재채용 
								<ul class="list-style03">
									<li>개인정보 항목 : 이름, 사진, 최종학력, 이메일, 연락처(전화번호, 휴대폰), 주소, 병역 정보, 학력 정보, 어학능력 정보, 가족 정보</li>
									<li>수집방법 : 홈페이지</li>
									<li>보유근거 : 입사전형 진행, 입사 지원서 수정</li>
									<li>보유기간 : 3년</li>
								</ul>
							</li>
							<li>다. 오더센터
								<ul class="list-style03">
									<li>개인정보 항목 : 회사명, 사업자등록번호, 회사전화번호, 대표자명, 주소, 담당자명, 담당자핸드폰, 담당자 이메일</li>
									<li>수집방법 : 홈페이지</li>
									<li>보유근거 : 제품 주문, 문의, 고객의견 반영</li>
									<li>보유기간 : 3년</li>
								</ul>
							</li>
							<li>라. 사이버신문고 
								<ul class="list-style03">
									<li>개인정보 항목 : 이름, 전화번호, 이메일</li>
									<li>수집방법 : 홈페이지</li>
									<li>보유근거 : 공정거래 관련 문의</li>
									<li>보유기간 : 문의접수 후 6개월</li>
								</ul>
							</li>
							<li>마. 구매
								<ul class="list-style03">
									<li>개인정보 항목 : 회사명, 사업자등록번호, 회사전화번호, 대표자명, 주소, 담당자명, 담당자핸드폰, 담당자 이메일, 주민등록번호 앞자리</li>
									<li>수집방법 : 홈페이지</li>
									<li>보유근거 : 당사 구매 계약 체결 및 유지</li>
									<li>보유기간 : 3년. 단 기간 내 거래 지속 시 자동 갱신</li>
								</ul>
							</li>
							<li>바. 출입관리
								<ul class="list-style03">
									<li>개인정보 항목 : 생년월일, 성명, 주소, 전화번호, 특수건강검진 확인서<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(작업차량의 경우) 차량번호, 보험시작종료일, 면허작성검사시작종료
									</li>
									<li>수집방법 : 홈페이지 및 당사 출입관리시스템</li>
									<li>보유근거 : 긴급 상황 발생 시 연락, 교육 이수 및 출입 허가, 작업 가능 판단 목적</li>
									<li>보유기간 : 3년</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<strong>03. 개인정보의 제3자 제공</strong>
						<p class="sub-text">회사는 정보주체의 개인정보를 [1. 개인정보의 처리목적]에서 고지한 범위 내에서 사용합니다. 정보주체의 사전 동의 없이는 동 범위를 초과하여 이용하지 않으며,<br>정보주체의 개인정보를 제3자에 제공하지 않습니다. 다만, 아래의 경우에 한해서는 예외로 합니다.</p>
						<ul class="list-style03">
							<li>정보주체가 개인정보 제공에 대해 동의한 경우</li>
							<li>법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</li>
							<li>통계작성, 학술연구, 시장조사를 위해 특정 개인을 식별할 수 없는 형태로 가공하여 제공하는 경우</li>
						</ul>
					</li>
					<li>
						<strong>04. 개인정보처리 위탁</strong>
						<p class="sub-text">회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p>
						<p class="sub-text">위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.</p>
						<table class="brdList">
							<colgroup>
								<col style="width:33.333%;">
								<col style="width:33.333%;">
								<col style="width:33.333%;">
							</colgroup>
							<thead>
							<tr>
								<th scope="col">수탁업체</th>
								<th scope="col">위탁업무내용</th>
								<th scope="col">개인정보의 보유 및 이용기간</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>대림코퍼레이션</td>
								<td>웹사이트 운영</td>
								<td rowspan="2">위탁계약 종료시까지</td>
							</tr>
							<tr>
								<td>조인스HR</td>
								<td>연말정산 위탁</td>
							</tr>
							</tbody>
						</table>
						<p class="sub-text">회사는 위탁계약 체결 시 개인정보 보호법 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적 관리적 보호조치, 재 위탁 제한, 수탁자에 대한 관리 감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
					</li>
					<li>
						<strong>05. 정보주체의 권리, 의무 및 그 행사방법</strong>
						<p class="sub-text">이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>
						<ul class="list-style02">
							<li>가. 개인정보 열람요구</li>
							<li>나. 오류 등이 있을 경우 정정 요구</li>
							<li>다. 삭제요구</li>
							<li>라. 처리정지 요구</li>
						</ul>
						<p class="sub-text">가항에 따른 권리 행사는 회사에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다.</p>
						<p class="sub-text">정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</p>
						<p class="sub-text">가항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p>
					</li>
					<li>
						<strong>06. 개인정보의 파기절차 및 방법</strong>
						<p class="sub-text">회사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</p>
						<ul class="list-style02">
							<li>가. 파기절차
								<ul class="list-style03">
									<li>이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</li>
								</ul>
							</li>
							<li>나. 파기기한
								<ul class="list-style03">
									<li>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</li>
								</ul>
							</li>
							<li>다. 파기방법
								<ul class="list-style03">
									<li>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</li>
									<li>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<strong>07. 개인정보의 안전성 확보 조치</strong>
						<p class="sub-text">회사는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</p>
						<ul class="list-style02">
							<li>가. 개인정보 취급 직원의 최소화 및 교육
								<ul class="list-style03">
									<li>개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</li>
								</ul>
							</li>
							<li>나. 정기적인 자체 감사 실시
								<ul class="list-style03">
									<li>개인정보 취급 관련 안정성 확보를 위해 정기적(연 1회)으로 자체 감사를 실시하고 있습니다.</li>
								</ul>
							</li>
							<li>다. 내부관리계획의 수립 및 시행
								<ul class="list-style03">
									<li>개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</li>
								</ul>
							</li>
							<li>라. 개인정보의 암호화
								<ul class="list-style03">
									<li>이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</li>
								</ul>
							</li>
							<li>마. 해킹 등에 대비한 기술적 대책
								<ul class="list-style03">
									<li>회사 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신,점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</li>
								</ul>
							</li>
							<li>바. 개인정보에 대한 접근 제한
								<ul class="list-style03">
									<li>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</li>
								</ul>
							</li>
							<li>사. 접속기록의 보관 및 위변조 방지
								<ul class="list-style03">
									<li>개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.</li>
								</ul>
							</li>
							<li>아. 비인가자에 대한 출입 통제
								<ul class="list-style03">
									<li>개인정보를 보관하고 있는 개인정보시스템의 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다. 또한 개인정보가 기록된 문서의 안전한 보관을 위하여 잠금 장치 설치 등 물리적 조치를 취하고 있습니다.</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<strong>08. 개인정보 보호책임자</strong>
						<p class="sub-text">회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다</p>
						<table class="brdList">
							<colgroup>
								<col style="width:20%;">
								<col style="width:30%;">
								<col style="width:20%;">
								<col style="width:30%;">
							</colgroup>
							<thead>
							<tr>
								<th colspan="2" scope="col">개인정보보호책임자</th>
								<th colspan="2" scope="col">개인정보 보호 담당부서</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>성명</td>
								<td>김원성</td>
								<td>부서명</td>
								<td>경영지원팀</td>
							</tr>
							<tr>
								<td>직책</td>
								<td>부장</td>
								<td>전화</td>
								<td>063-260-1135</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>063-260-1130 / <a href="mailto:wskim@daelimfnc.co.kr">wskim@daelimfnc.co.kr</a></td>
								<td>이메일</td>
								<td><a href="mailto:sikim@daelimfnc.co.kr">sikim@daelimfnc.co.kr</a></td>
							</tr>
							</tbody>
						</table>
						<p class="sub-text">정보주체께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p>
					</li>
					<li>
						<strong>09. 권익침해 구제방법</strong>
						<p class="sub-text">정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.</p>
						<ul class="list-style03">
							<li>정보보호마크인증위원회 : 02-580-0533~4 (<a href="http://eprivacy.or.kr" target="_blank" title="새창열기">http://eprivacy.or.kr</a>)</li>
							<li>대검찰청 사이버수사과 : (국번없이) 1301 (<a href="http://www.spo.go.kr" target="_blank" title="새창열기">http://www.spo.go.kr/</a>)</li>
							<li>경찰청 사이버안전국 : (국번없이) 182 (<a href="http://cyberbureau.police.go.kr" target="_blank" title="새창열기">http://cyberbureau.police.go.kr/</a>)</li>
						</ul>
					</li>
					<li>
						<strong>10. 개인정보 처리방침의 변경</strong>
						<p class="sub-text">이 개인정보 처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 가능한 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
						<ul class="list-style03">
							<li>개인정보처리방침 버전번호 : v1.0</li>
							<li>시행일자 : 2020년 4월 29일 </li>
						</ul>
					</li>
				</ul>
			</div>
			<button type="button" class="btn-top">TOP</button>
		</div>
		<!-- //Container -->
<script type="text/javascript">
$(document).ready(function(){
	$(".list-style01").empty();
	$("#viewselect").empty();
	var snum = 0;
	var cnt = 0;
	fn_getList(snum);
	
	$("#btn-view").click(function() {
		cnt = $("#cnts").val();
		snum = $("#viewselect option:selected").val();
		if (cnt < 2) {
			alert('이전버전이 없습니다.');
		} else {
			fn_getList(snum);		
		}
	});
});

$(function() {
//	fn_getList(snum);
});


function fn_getList(snum) {

	$.ajax({
        url : "/pers01ListAjax.do",
        type: 'POST',
        data: {
        },
        dataType : "json",
        beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
		},
        success: function(data) {
        	 console.log("data: " + JSON.stringify(data));
			$(".list-style01").empty();
			$("#viewselect").empty();
    		
        	var html = "";
        	var html2 = "";
        	if(data.resultList != null && data.resultList.length > 0) {
	        	for(var i = 0; i < data.resultList.length; i++) {
	 	        	 if (snum == 0) {
	   	        		 html += '<option value=\"'+data.resultList[i].noNtcPlteSral+'\">'+data.resultList[i].sbjtNtcPlte+'</option>';
	        		 	if (i == 0) {
		        			html2 += data.resultList[i].cntsNtcPlte;
		        			$(".list-style01").append(html2);
		        		}
	 	        	 } else {
	 	        		 if (data.resultList[i].noNtcPlteSral == snum) {
		   	        		 html += '<option value=\"'+data.resultList[i].noNtcPlteSral+'\" selected>'+data.resultList[i].sbjtNtcPlte+'</option>';
			        		 html2 += data.resultList[i].cntsNtcPlte;
			        		 $(".list-style01").append(html2);
	 	        		 } else {
		   	        		 html += '<option value=\"'+data.resultList[i].noNtcPlteSral+'\">'+data.resultList[i].sbjtNtcPlte+'</option>';
	 	        		 }
	 	        	 }
  	
	        	}
        	} else {
        	}
        	$("#viewselect").append(html);
        	$("#cnts").val(data.resultList.length);
      
        },
        error: function(xhr, textStatus, error) {
        	if(xhr.status == "500") {
        		alert("Session connection is lost.");
        		location.href = "/";
        	} else {
        		alert("error");
        	}
        }
    });
}

</script>		
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
