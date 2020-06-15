<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>CEO 인사말 &lt; 회사소개 &lt; DAELIMFnC</title> 
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)">회사소개<i class="icon-arr"></i></a>
						<ul class="submenus">
					
							<li><a href="/com01.do" class="active">회사소개</a></li>
							<li><a href="/biz01.do">사업소개</a></li>
							<li><a href="/rnd01.do">기술개발</a></li>
							<li><a href="/sus01_1.do">지속가능경영</a></li>
							<li><a href="/pr01.do">홍보센터</a></li>
							<li><a href="/car01.do">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">CEO인사말<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">기업정보</a></li>
							<li><a href="/com02.do" class="active">CEO인사말</a></li>
							<li><a href="/com03.do">기업연혁</a></li>
							<li><a href="/com04_1.do">그룹사 현황</a></li>
							<li><a href="/com05.do">오시는길</a></li>
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

		<div class="sub-visual Company">
			<h2>회사소개</h2>
		</div>
		<div id="content">

			<h3>CEO 인사말</h3>
			<!-- 지도 영역 -->
			<p class="ceo-comment">대림에프엔씨 홈페이지를 찾아주신 여러분을<br> 진심으로 환영합니다.</p>
			<div class="ceo-text-box">
				<p class="sub-text">
					대림에프엔씨는 전세계 다양한 고객을 대상으로 BOPP 및 EVA 필름을 공급하는 회사입니다.<br>1996년 1호기 시운전 이래 지속적인 투자로, 사업 집중을 통해 발전을 거듭하였습니다. 독자적인 기술력과 탁월한 공정 운영을 바탕으로 범용 필름부터 Speciality 제품까지 고객 만족을 실현해 왔습니다.
				</p>
				<p class="sub-text">
					<strong>또한 안전∙보건∙환경 경영의 적극적인 실천을 통해 후세에 맑고 깨끗한 환경을 물려주고, 안전한 일터가 되도록 앞장서고 있습니다. 아울러 지역사회 봉사활동 등 다양한 사회공헌활동을 펼쳐<br> 존경 받는 기업이</strong> 되고자 힘쓰고 있습니다. 노사화합 및 인재육성을 통해 임직원과 함께 성장하는 기업이 되도록 더욱 정진할 것입니다.
				</p>
				<p class="sub-text">저희 대림에프엔씨 임직원들은 불굴의 의지로 세계시장에서 경쟁우위를 점하고 지속적인 경영혁신과 투명경영을 통해 기업의 사회적 책임을 다하겠습니다.<br> 고객 만족을 최상의 가치로 삼아, 보다 편리하고 행복한 미래사회를 만드는데 진력하는 대림에프엔씨가 되겠습니다.
				</p>
			</div>
		</div>
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