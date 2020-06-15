<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>목록 &lt; 회사소식 &lt; 홍보센터 &lt; DAELIM Fnc</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)">홍보센터<i class="icon-arr"></i></a>
						<ul class="submenus">
					
							<li><a href="/biz01.do">사업소개</a></li>
								<li><a href="/rnd01.do">기술개발</a></li>
								<li><a href="/sus01_1.do">지속가능경영</a></li>
								<li><a href="/pr01.do" class="active">홍보센터</a></li>
								<li><a href="/car01.do">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">CI/BI 소개<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/pr01.do">회사소식</a></li>
							<li><a href="/pr02.do" class="active">CI/BI 소개</a></li>
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

		<div class="sub-visual Pr"><h2>홍보센터</h2></div>

		<div id="content">
			
			<h3>CI / BI 소개</h3>
			<h4>CI</h4>
			<p class="sub-text">
				대림에프엔씨는 대림그룹의 플라스틱가공 전문 기업입니다.<br>
				국내 필름업계에서 기술력과 생산량 부분에서 선도적 위치를 차지하고 있습니다. 
			</p>
			<div class="cibi-img-box">
				<div class="img-box">
					<img src="../static/images/common/img_ci_01.jpg" alt="블루계열 색상의 DAELIM FnC 로고">
					<a href="../static/images/logo/logo_CI.ai" class="btn btn-download02">CI 다운로드</a>
				</div>
				<div class="img-box">
					<img src="../static/images/common/img_ci_02.jpg" alt="DAELIM FnC 영문로고, 국문 대림 FnC로고 여백 가이드">
				</div>
			</div>
			<h5>Color Palette</h5>
			<ul class="palette-list-box">
				<li>
					<div class="color-box blue">DAELIM Blue</div>
					<p>Spot : Pantone 289</p>
					<p>Process : C100 / M65 / Y0 / K65</p>
					<p>RGB Web : R27 / G46 / B90</p>
				</li>
			</ul>
			<h4>BI</h4>
			<p class="sub-text">
				기술력을 바탕으로 고객 만족을 실천하는 제품입니다.<br>
				대림의 이름에 제품의 본질을 결합하여 품질에 대한 책임감과 자신감을 표현합니다. 
			</p>
			<div class="cibi-img-box">
				<div class="img-box">
					<img src="../static/images/common/img_bi_01.jpg" alt="DaelimOPP 영문로고">
					<a href="../static/images/logo/logo_Bi_opp.ai" class="btn btn-download02">BI 다운로드</a>
				</div>
				<div class="img-box">
					<img src="../static/images/common/img_bi_02.jpg" alt="DaelimOPP 영문로고 여백 가이드">
				</div>
			</div>
			<h5>Color Palette</h5>
			<ul class="palette-list-box">
				<li>
					<div class="color-box blue">DAELIM Blue</div>
					<p>Spot : Pantone 289</p>
					<p>Process : C100 / M65 / Y0 / K65</p>
					<p>RGB Web : R27 / G46 / B90</p>
				</li>
				<li>
					<div class="color-box red">DAELIMOPP Red</div>
					<p>Spot : Pantone 1785</p>
					<p>Process : C0 / M70 / Y55 / K0</p>
					<p>RGB Web : R255 / G110 / B100</p>
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