<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>석유화학 &lt; 그룹사 현황 &lt; 회사소개 &lt; DAELIMFnC</title>
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
						<a href="javascript:void(0)">그룹사 현황<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">기업정보</a></li>
							<!-- <li><a href="/com02.do">CEO인사말</a></li> -->
							<li><a href="/com03.do">기업연혁</a></li>
							<li><a href="/com04_1.do" class="active">그룹사 현황</a></li>
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

			<h3>그룹사 현황</h3>
			<ul class="tab-ul-02">
				<li class="active"><a href="/com04_1.do">개요</a></li>
				<li><a href="/com04_2.do">석유화학</a></li>
				<li><a href="/com04_3.do">건설</a></li>
				<li><a href="/com04_4.do">제조/상사</a></li>
				<li><a href="/com04_5.do">IT</a></li>
				<li><a href="/com04_6.do">레저</a></li>
				<li><a href="/com04_7.do">교육/문화</a></li>
				<li><a href="/com04_8.do">에너지</a></li>
			</ul>
			<div class="cmpny-tabcon">
				<strong class="blind">개요</strong>
				<p class="sub-textb align-c">1939년 창업한 대림그룹은 건설 및 석유화학 전문 기업인 대림산업을 중심으로<br>12개 관계사로 이루어진 대한민국 대표 그룹입니다.</p>
				<ul class="cmpny-list">
					<li class="item_01">
						<strong class="tit">석유화학</strong>
						<ul class="cmpny-item-list">
							<li><a href="/com04_2.do#come4_2_1">대림산업㈜ 석유화학 사업부</a></li>
							<li><a href="/com04_2.do#come4_2_2">여천NCC㈜</a></li>
							<li><a href="/com04_2.do#come4_2_3">폴리미래㈜</a></li>
						</ul>
					</li>
					<li class="item_02">
						<strong class="tit">건설</strong>
						<ul class="cmpny-item-list">
							<li><a href="/com04_3.do#come4_3_1">대림산업㈜ 건설사업부</a></li>
							<li><a href="/com04_3.do#come4_3_2">㈜삼호</a></li>
							<li><a href="/com04_3.do#come4_3_3">고려개발㈜</a></li>
						</ul>
					</li>
					<li class="item_03">
						<strong class="tit">제조/상사</strong>
						<ul class="cmpny-item-list">
							<li><a href="/com04_4.do#come4_4_1">㈜대림코퍼레이션 상사부문</a></li>
							<li><a href="/com04_4.do#come4_4_2">㈜대림피앤피</a> / <a href="/com04_4.do#come4_4_3">대림 C&S㈜</a></li>
							<li><a href="/com04_4.do#come4_4_4">대림 자동차공업㈜</a> / <a href="/com04_4.do#come4_4_5">대림오토바이㈜</a></li>
						</ul>
					</li>
					<li class="item_04">
						<strong class="tit">IT</strong>
						<ul class="cmpny-item-list">
							<li><a href="/com04_5.do#come4_5_1">㈜대림코퍼레이션</a></li>
							<li><a href="/com04_5.do#come4_5_2">IT컨버전스 부문</a></li>
						</ul>
					</li>
					<li class="item_05">
						<strong class="tit">레저</strong>
						<ul class="cmpny-item-list">
							<li><a href="/com04_6.do#come4_6_1">글래드 호텔앤리조트㈜</a></li>
						</ul>
					</li>
					<li class="item_06">
						<strong class="tit">교육/문화</strong>
						<ul class="cmpny-item-list">
							<li><a href="/com04_7.do#come4_7_1">대림문화재단/대림미술관</a></li>
							<li><a href="/com04_7.do#come4_7_2">학교법인 대림학원</a></li>
						</ul>
					</li>
					<li class="item_07">
						<strong class="tit">에너지</strong>
						<ul class="cmpny-item-list">
							<li><a href="/com04_8.do#come4_8_1">대림 에너지</a></li>
						</ul>
					</li>
				</ul>
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