<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>기업정보 &lt; 회사소개 &lt; DAELIM Fnc</title>
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
						<a href="javascript:void(0)"><s:text name="header_sub_1_1"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do" class="active"><s:text name="header_sub_1_1"/></a></li>
							<!-- <li><a href="/com02.do">CEO인사말</a></li> -->
							<li><a href="/com03.do"><s:text name="header_sub_1_2"/></a></li>
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

		<div id="content" class="infowrap">
			<div class="inner-area">
				<h3><s:text name="com01_2"/></h3>
				<p class="sub-text">
					<s:text name="com01_3"/>
				</p>
				<h4><s:text name="com01_4"/> <span class="l-font"><s:text name="com01_5"/></span></h4>
				<ul class="text-lst re-intrvl">
					<li>
						<strong><s:text name="com01_6"/></strong>
						<p>
							<s:text name="com01_7"/>
						</p>
					</li>
					<li>
						<strong><s:text name="com01_8"/></strong>
						<p>
							<s:text name="com01_9"/>
						</p>
					</li>
				</ul>
				<div class="cmpny-info-img-box">
					<img src="../static/images/contents/img_cmpny_info_01.png" alt="한숲인상 한숲인의 7가지 덕목은 약속을 지킨다 , 멀리 내다본다 , 새로운 것을 찾는다 , 자기일에 으뜸이 된다 , 팀웍을 이룬다 , 근검절약한다 , 고객을 잘안다 입니다.">
				</div>
			</div>
			<div class="banner-bg company">
				<div class="inner-area">
					<h4><s:text name="com01_10"/></h4>
					<div class="cmpny-info-img-box-02">
						<img src="../static/images/contents/img_cmpny_info_02.png" alt="설립일 : 1995, 총자산 : 880억, 매출액 : 1000억">
					</div>
				</div>
			</div>
			<div class="inner-area">
				<h4><s:text name="com01_11"/></h4>
				<%					
				    if(name.equals("ko_KR")){
				%>							
				<p class="sub-text">
					<s:text name="com01_12"/>
				</p>
				<%} %>
				<div class="cmpny-info-img-box-03">
					<img src="../static/images/contents/img_cmpny_info_03.png" alt="
						미래창조(멀리보는 경영), 
						인간존중 (사람을 존중하고 성장하게 하는 경영),
						고객신뢰 (안락과 믿음을 주는 경영)
					">
				</div>
			</div>

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