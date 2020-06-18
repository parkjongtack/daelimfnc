<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>오시는길 &lt; 회사소개 &lt; DAELIMFnC</title> 
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
						<a href="javascript:void(0)"><s:text name="header_sub_1_4"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1_1"/></a></li>
							<!-- <li><a href="/com02.do">CEO인사말</a></li> -->
							<li><a href="/com03.do"><s:text name="header_sub_1_2"/></a></li>
							<li><a href="/com04_1.do"><s:text name="header_sub_1_3"/></a></li>
							<li><a href="/com05.do" class="active"><s:text name="header_sub_1_4"/></a></li>
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

			<h3><s:text name="com05_1"/></h3>
			<!-- 지도 영역 -->
			<div class="map-area">
				<img src="../static/images/contents/img_location1.png" alt="전주공장 오시는길 지도입니다. 자세한 정보는 하단을 참조하세요.">
			</div>

			<div class="use-btn hfmg">
				<h4><s:text name="com05_2"/></h4>
				<div class="rbtn">
				<a href="https://www.google.co.kr/maps/place/%EC%A0%84%EB%9D%BC%EB%B6%81%EB%8F%84+%EC%99%84%EC%A3%BC%EA%B5%B0+%EB%B4%89%EB%8F%99%EC%9D%8D+%EA%B3%BC%ED%95%99%EB%A1%9C+802/@35.9400597,127.1243206,17z/data=!4m13!1m7!3m6!1s0x357019d584b426c3:0xabdb7e4c435406e0!2z7KCE652867aB64-EIOyZhOyjvOq1sCDrtInrj5nsnY0g6rO87ZWZ66GcIDgwMg!3b1!8m2!3d35.9400597!4d127.1265093!3m4!1s0x357019d584b426c3:0xabdb7e4c435406e0!8m2!3d35.9400597!4d127.1265093" title="새창열기" target="_blank"  class="btn btn-googlemap"><s:text name="com05_3"/></a>
				</div>
			</div>
			<table class="tbl-loc row-type">
				<colgroup>
					<col width="96px"><col><col width="96px"><col width="180px"><col width="96px"><col width="110px">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="ico_addr"><s:text name="com05_4"/></span></th>
						<td><s:text name="com05_5"/></td>
						<th scope="row"><span class="ico_tel">TEL</span></th>
						<td>063.260.1114</td>
						<th scope="row"><span class="ico_fax">FAX</span></th>
						<td>063.260.0149</td>
					</tr>
				</tbody>
			</table>

			<!-- 지도 영역 -->
			<div class="map-area">
				<img src="../static/images/contents/img_location2.png" alt="영업소 오시는 길 지도입니다.자세한 정보는 하단을 참조하세요.">
			</div>
			
			<div class="use-btn hfmg">
				<h4><s:text name="com05_6"/></h4>
				<div class="rbtn">
				<a href="https://www.google.co.kr/maps/place/%EC%97%90%EC%8A%A4%EC%97%90%EC%9D%B4%ED%83%80%EC%9B%8C/@37.3751131,126.9413173,17z/data=!3m1!4b1!4m5!3m4!1s0x357b675aad737d55:0xb4ab05aee2cc4ed3!8m2!3d37.3751131!4d126.943506" title="새창열기" target="_blank"  class="btn btn-googlemap"><s:text name="com05_3"/></a>
				</div>
			</div>
			<table class="tbl-loc row-type">
				<colgroup>
					<col width="96px"><col><col width="96px"><col width="180px"><col width="96px"><col width="110px">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="ico_addr"><s:text name="com05_4"/></span></th>
						<td><s:text name="com05_7"/></td>
						<th scope="row"><span class="ico_tel">TEL</span></th>
						<td>031.688.3421</td>
						<th scope="row"><span class="ico_fax">FAX</span></th>
						<td>070.7547.4201</td>
					</tr>
				</tbody>
			</table>

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