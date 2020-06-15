<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>기업정보 &lt; 회사소개 &lt; 기업연혁&lt; DAELIMFnC</title>
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
						<a href="javascript:void(0)">기업연혁<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">기업정보</a></li>
							<!-- <li><a href="/com02.do">CEO인사말</a></li> -->
							<li><a href="/com03.do" class="active">기업연혁</a></li>
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
			<h3>기업연혁</h3>
			<!-- 200416 ui 변경으로 인한 전체 마크업 수정-->
			<div class="cmpny-hstry-top">
				<p class="term">2000 ~ 2020</p>
				<p class="term-info">2호기 REVAMPING (1,500MTA Capa. Up)<i class="icon-arrow">화살표</i>DAELIM FnC 설립</p>
			</div>
			<ul class="cmpny-hstry-list bg01">
				<li>
					<strong class="y">2020</strong>
					<div class="text-box">
						<p><span class="date">04</span>대림에프엔씨 물적분할</p>
					</div>
				</li>
				<li>
					<strong class="y">2019</strong>
					<div class="text-box">
						<p><span class="date">01</span>EVA 2호기 상업운전 개시 - Started Commercial Operation of the 2<sup>nd</sup> EVA Line</p>
					</div>
				</li>
				<li>
					<strong class="y">2016</strong>
					<div class="text-box">
						<p><span class="date">05</span>EVA 1호기 상업운전 개시 - Started Commercial Operation of the 1<sup>st</sup> EVA Line</p>
					</div>
				</li>
				<li>
					<strong class="y">2013</strong>
					<div class="text-box">
						<p><span class="date">05</span>3호기 시운전 개시 (Andritz) Started Commercial Operation of the 3<sup>rd</sup> BOPP Line</p>
					</div>
				</li>
				<li>
					<strong class="y">2011</strong>
					<div class="text-box">
						<p><span class="date">01</span>2호기 5-Layer Revamping (국내 최초, 특수/개발필름)<br>5-Layer Revamping of the 2nd Line (First Trial in Korea, Aimed at Specialized Film)</p>
						<ol class="layer-info-list">
							<li>1. Treated Matte Skin Layer</li>
							<li>2. OPP Inter Layer</li>
							<li>3. OPP Core Layer</li>
							<li>4. OPP Inter Layer</li>
							<li>5. Treated Matte Skin Layer</li>
						</ol>
					</div>
				</li>
				<li>
					<strong class="y">2002</strong>
					<div class="text-box">
						<p><span class="date">02</span>2호기 Revamping (1,500MTA Capa. Up) - Revamping the 2<sup>nd</sup> Line (1,500MTA Capa. Up)</p>
					</div>
				</li>
			</ul>
			<div class="cmpny-hstry-top">
				<p class="term">1995 ~ 1999</p>
				<p class="term-info">전주공장 착공(완주산업단지)<i class="icon-arrow">화살표</i>상업운전 개시</p>
			</div>
			<ul class="cmpny-hstry-list bg02">
				<li>
					<strong class="y">1997</strong>
					<div class="text-box">
						<p><span class="date">04</span>2호기 시운전 Commissioned the 2<sup>nd</sup> Line </p>
						<p><span class="date">07</span>2호기 상업운전 개시 - Started Commercial Operation of the 2<sup>nd</sup> Line</p>
					</div>
				</li>
				<li>
					<strong class="y">1996</strong>
					<div class="text-box">
						<p><span class="date">05</span>2호기 착공 (Bruckner, width 6.6M) - Started Construction of the 2<sup>nd</sup> BOPP Line</p>
						<p><span class="date">05</span>1호기 시운전 (Cellier, width 6.6M) - Commissioned the 1<sup>st</sup> BOPP Line</p>
						<p><span class="date">07</span>1호기 상업운전 개시 – Started Commercial Operation of the 1<sup>st</sup> Line</p>						
					</div>
				</li>
				<li>
					<strong class="y">1995</strong>
					<div class="text-box">
						<p><span class="date">04</span>전주공장  착공 (완주산업단지) - Started Construction(In Wanju General Industrial Complex)</p>
					</div>
				</li>
			</ul>
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