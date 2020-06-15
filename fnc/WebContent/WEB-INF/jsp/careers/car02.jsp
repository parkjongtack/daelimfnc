<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인재상 &lt; 인재채용 &lt; 홍보센터 &lt; DAELIM Fnc</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)">인재채용<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">회사소개</a></li>
							<li><a href="/biz01.do">사업소개</a></li>
							<li><a href="/rnd01.do">기술개발</a></li>
							<li><a href="/sus01_1.do">지속가능경영</a></li>
							<li><a href="/pr01.do">홍보센터</a></li>
							<li><a href="/car01.do" class="active">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">인사제도<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/car01.do">인재상</a></li>
							<li><a href="/car02.do" class="active">인사제도</a></li>
							<li><a href="/car01List.do">채용정보</a></li>
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

		<div class="sub-visual Careers"><h2>인재채용</h2></div>

		<div id="content">
			
			<h3>인사제도</h3>

			<h4>직급체계</h4>
			<p class="sub-text">대림산업의 경영이념의 실천과 Vision의 성공적 달성을 위하여 능력 및 성과주의를 지향하는 인사체계를 구성하고 있습니다.</p>
			<ul class="rank-process">
				<li class="rank1">사원</li>
				<li class="rank2">주임</li>
				<li class="rank3">대리</li>
				<li class="rank4">과장</li>
				<li class="rank5">차장</li>
				<li class="rank6">부장</li>
			</ul>

			<h4>평가제도</h4>
			<div class="grfdv"><img src="../static/images/contents/img_evaluation.png" alt="한숲人 평가제도는 업적평가 : 개인별 당해년도의 업무목표를 설정하고 목표대비 업무실적 및 수행과정과 달성도를 평가 및 역량평가 : 개인별 당해년도의 업무목표를 설정하고 목표대비 업무실적 및 수행과정과 달성도를 평가를 합하여 능력과 성과 중심의 공정하고 합리적인 평가제도 운영 인적자원관 전반의 기준으로 평가함"></div>

			<h4>승진제도</h4>
			<p class="sub-text">능력과 성과가 뛰어난 직원에 대하여 발탁승진 및 연공에 관계없이 주요 보직수행의 기회 부여합니다.</p>

			<h4>보상제도</h4>
			<ul class="text-lst">
				<li><strong>연봉제</strong>
				<p>2005년 도입·시행중인 연봉제는 성과주의문화 정착을 위한 제도로써 사업부별 성과와 개인별 역량 및 업적에 따라 연봉을 조정하는 제도</p>
				</li>
				<li><strong>호봉제</strong>
				<p>개인별 학력에 따른 초봉을 바탕으로 근속년수 및 평가결과에 따라 호봉을 조정하는 제도</p>
				</li>
			</ul>

			<h4>근무형태</h4>
			<ul class="text-lst">
				<li><strong>사무직</strong>
				<p>주 5일제 근무 시행</p>
				</li>
				<li><strong>공장 생산직</strong>
				<p>4조 3교대 교대근무 운영</p>
				</li>
			</ul>

			<h4>복리후생</h4>
			<ul class="welfare-list">
				<li class="list1">
					<strong>생활지원</strong>
					<p>주택자금지원<br>학자금 지원 (고교, 대학교)<br>입학축하금 (유치원, 중학교)</p>
				</li>
				<li class="list2">
					<strong>복지</strong>
					<p>다양한 자기개발지원 (어학,자격증)<br>경조금 및 경조휴가</p>
				</li>
				<li class="list3">
					<strong>여가</strong>
					<p>하계휴가 및 콘도∙휴양소<br>공로자, 장기근속자 해외여행<br>동호회 지원</p>
				</li>
				<li class="list4">
					<strong>의료</strong>
					<p>상해보험가입<br>일반 및 종합 건강검진<br>의료비</p>
				</li>
			</ul>

		
		</div>
		<!-- // #content -->
		<button type="button" class="btn-top">TOP</button>
	</div>
	<!-- //Container -->
	
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