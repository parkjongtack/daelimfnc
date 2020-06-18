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
						<a href="javascript:void(0)"><s:text name="header_sub_1"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do" class="active"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_1_2"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1_1"/></a></li>
							<!-- <li><a href="/com02.do">CEO인사말</a></li> -->
							<li><a href="/com03.do" class="active"><s:text name="header_sub_1_2"/></a></li>
							<li><a href="/com04_1.do"><s:text name="header_sub_1_3"/></a></li>
							<li><a href="/com05.do"><s:text name="header_sub_1_4"/></a></li>
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
			<h2><s:text name="com01_1"/></h2>
		</div>
		<div id="content">
			<h3><s:text name="com03_1"/></h3>
			<!-- 200416 ui 변경으로 인한 전체 마크업 수정-->
			<div class="cmpny-hstry-top">
				<p class="term">2000 ~ 2020</p>
				<p class="term-info"><s:text name="com03_3"/><i class="icon-arrow">화살표</i><s:text name="com03_4"/></p>
			</div>
			<ul class="cmpny-hstry-list bg01">
				<li>
					<strong class="y">2020</strong>
					<div class="text-box">
						<p><span class="date">04</span><s:text name="com03_7"/></p>
					</div>
				</li>
				<li>
					<strong class="y">2019</strong>
					<div class="text-box">
						<p><span class="date">01</span><s:text name="com03_10"/></p>
					</div>
				</li>
				<li>
					<strong class="y">2016</strong>
					<div class="text-box">
						<p><span class="date">05</span><s:text name="com03_13"/></p>
					</div>
				</li>
				<li>
					<strong class="y">2013</strong>
					<div class="text-box">
						<p><span class="date">05</span><s:text name="com03_16"/></p>
					</div>
				</li>
				<li>
					<strong class="y">2011</strong>
					<div class="text-box">
						<p><span class="date">01</span><s:text name="com03_19"/></p>
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
						<p><span class="date">02</span><s:text name="com03_27"/></p>
					</div>
				</li>
			</ul>
			<div class="cmpny-hstry-top">
				<p class="term">1995 ~ 1999</p>
				<p class="term-info"><s:text name="com03_29"/><i class="icon-arrow">화살표</i><s:text name="com03_30"/></p>
			</div>
			<ul class="cmpny-hstry-list bg02">
				<li>
					<strong class="y">1997</strong>
					<div class="text-box">
						<p><span class="date">04</span><s:text name="com03_33"/></p>
						<p><span class="date">07</span><s:text name="com03_35"/></p>
					</div>
				</li>
				<li>
					<strong class="y">1996</strong>
					<div class="text-box">
						<p><span class="date">05</span><s:text name="com03_38"/></p>
						<p><span class="date">05</span><s:text name="com03_40"/></p>
						<p><span class="date">07</span><s:text name="com03_42"/></p>						
					</div>
				</li>
				<li>
					<strong class="y">1995</strong>
					<div class="text-box">
						<p><span class="date">04</span><s:text name="com03_45"/></p>
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