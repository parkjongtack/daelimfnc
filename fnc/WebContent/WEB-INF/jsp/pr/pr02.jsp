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
						<a href="javascript:void(0)"><s:text name="header_sub_5"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do" class="active"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="pr02_1"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/pr01.do"><s:text name="pr01_1"/></a></li>
							<li><a href="/pr02.do" class="active">pr02_3</a></li>
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
			
			<h3><s:text name="pr02_1"/></h3>
			<h4>CI</h4>
			<p class="sub-text">
				<s:text name="pr02_3"/>
			</p>
			<div class="cibi-img-box">
				<div class="img-box">
					<img src="../static/images/common/img_ci_01.jpg" alt="블루계열 색상의 DAELIM FnC 로고">
					<a href="../static/images/logo/logo_CI.ai" class="btn btn-download02"><s:text name="pr02_4"/></a>
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
				<s:text name="pr02_6"/>
			</p>
			<div class="cibi-img-box">
				<div class="img-box">
					<img src="../static/images/common/img_bi_01.jpg" alt="DaelimOPP 영문로고">
					<a href="../static/images/logo/logo_Bi_opp.ai" class="btn btn-download02"><s:text name="pr02_7"/></a>
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