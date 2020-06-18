<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>HSE 경영방침 &lt; 안전·보건·환경 경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
				<div class="lnb">
					<ul>
						<li>
							<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
						</li>
						<li>
						<a href="javascript:void(0)"><s:text name="header_sub_4"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do" class="active"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_4_1"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/rnd01.do" class="active"><s:text name="header_sub_4_1"/></a></li>
<%					
    if(name.equals("ko_KR")){
%>									
							<li><a href="/rnd02.do"><s:text name="header_sub_2_2"/></a></li>
							<%} %>
						</ul>
					</li>
<%					
    if(name.equals("ko_KR")){
%>								
						<li>
							<a href="javascript:void(0)"><s:text name="header_sub_3"/><i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do" class="active"><s:text name="header_sub_3"/></a></li>
								<li><a href="/sus01_2.do">OEMS 구조</a></li>
								<li><a href="/sus01_3_1.do">안전경영활동</a></li>
								<li><a href="/sus01_4.do">환경경영활동</a></li>
								<li><a href="/sus01_5.do">보건경영활동</a></li>
							</ul>
						</li>
						<%} %>
					</ul>
				</div>
			</div>
			<div class="gnbBg"></div>
		</header>
		<!-- //header -->

		<!-- Container -->
		<div id="container">

			<div class="sub-visual Sustainability">
				<h2><s:text name="header_sub_4"/></h2>
			</div>
			<div id="content" class="infowrap">
				<div class="inner-area">
					<h3><s:text name="sus01_1"/></h3>
					<div class="vision-img-box">
						<img src="../static/images/contents/img_vision.png" 
							alt="HSE 비전 및 목표. 목표 : 무질병 - 쾌적한 작업환경으로 건강한 일터 구축, 무사고 - 본질안전 추구로 안전한 일터 실현, 무오염 - 오염물질 배출 저감으로 환경보전 기여, 비전 : 보건.안전.환경을 최우선으로 하는 글로벌 리더쉽을 토대로 지속가능경영을 실천하는 사회적 기업."> 
					</div>
					<h4><s:text name="sus01_2"/></h4>
					<p class="sub-text"><s:text name="sus01_3"/></p>
				</div>
				<div class="banner-bg vision">
					<div class="inner-area">
						<div class="text-lst">
							<strong><s:text name="sus01_4"/></strong>
							<ul class="list-style02">
								<li><s:text name="sus01_5"/></li>
								<li><s:text name="sus01_6"/></li>
								<li><s:text name="sus01_7"/></li>
								<li><s:text name="sus01_8"/></li>
								<li><s:text name="sus01_9"/></li>
							</ul>
						</div>
						<div class="txt-b-box">
							<p class="sub-texts gap-none"><s:text name="sus01_10"/></p>
							<p class="b-txt"><s:text name="sus01_11"/> </p>
						</div>
					</div>
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