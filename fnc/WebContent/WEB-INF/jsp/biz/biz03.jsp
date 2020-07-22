<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>EVA Coated Film &lt; 사업소개 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_2"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do" class="active"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_2_3"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/biz01.do"><s:text name="header_sub_2_1"/></a></li>
							<li><a href="/biz02.do"><s:text name="header_sub_2_2"/></a></li>
							<li><a href="/biz03.do" class="active"><s:text name="header_sub_2_3"/></a></li>
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
		
		<div class="sub-visual Biz">
			<h2><s:text name="biz_title"/></h2>
		</div>
		<div id="content">
			<h3><s:text name="biz03_1"/></h3>
			
			<h4><s:text name="biz03_2"/></h4>
			<p class="sub-text">
				<s:text name="biz03_3"/>
			</p>
			<strong class="sub-text-tit"><s:text name="biz03_4"/></strong>
			<p class="sub-text">Soft Feel, Anti Scratch, Digital Printing</p>
			<h4><s:text name="biz03_6"/></h4>

			<table class="brdList d-line-type">
				<colgroup>
					<col style="width:15%;">
					<col style="width:7%;">
					<col >
					<col style="width:11%;">
					<col style="width:11%;">
					<col style="width:6%;">
					<col style="width:6%;">
					<col style="width:6%;">
				</colgroup>
				<thead>
				<tr>
					<th rowspan="2"><s:text name="biz03_7"/></th>
					<th rowspan="2">Grade</th>
					<th rowspan="2"><s:text name="biz03_9"/></th>
					<th rowspan="2"><s:text name="biz03_10"/></th>
					<th rowspan="2"><s:text name="biz03_11"/></th>
					<th colspan="3"><s:text name="biz03_12"/></th>
				</tr>
				<tr>
					<th><s:text name="biz03_13"/></th>
					<th>MSDS</th>
					<th>FDA</th>
				</tr>
				</thead>
				<tbody id="tbody">
<%					
	if(name.equals("ko_KR")){
%>
 				<tr>
					<td>EVA Anti Scuff</td>
					<td>ENS</td>
					<td class="align-l">고급 판플렛, 종이가방, 종이박스</td>
					<td>30</td>
					<td>양면</td>
					<td><a href="/static/bizfolder/1ENS/EVA_ENS.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/1ENS/BOPP_FILM(ENS)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
<!-- 					<td><a href="javascript:downloadFileAll('0', '193', 'BOPP_DHT');" class="btn-download"><span class="blind">FDA 다운로드</span></a></td> -->
					<td><a href="/static/bizfolder/1ENS/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>EVA Soft Feel</td>
					<td>EVT</td>
					<td class="align-l">고급 판플렛, 종이가방, 종이박스</td>
					<td>34, 38</td>
					<td>양면</td>
					<td><a href="/static/bizfolder/2EVT/EVA_EVT.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/2EVT/BOPP_FILM(EVT)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/2EVT/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Wet Anti Scuff</td>
					<td>DAS</td>
					<td class="align-l">고급 판플렛, 종이가방, 종이박스</td>
					<td>18</td>
					<td>양면</td>
					<td><a href="/static/bizfolder/3DAS/BOPP_DAS.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/3DAS/BOPP_FILM(DAS)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/3DAS/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Thermal Anti Scuff</td>
					<td>DNS</td>
					<td class="align-l">고급 판플렛, 종이가방, 종이박스</td>
					<td>18</td>
					<td>양면</td>
					<td><a href="/static/bizfolder/4DNS/BOPP_DNS.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/4DNS/BOPP_FILM(DNS)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/4DNS/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Wet Soft Feel</td>
					<td>DVW</td>
					<td class="align-l">고급 판플렛, 종이가방, 종이박스</td>
					<td>18</td>
					<td>양면</td>
					<td><a href="/static/bizfolder/5DVW/BOPP_DVW.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/5DVW/BOPP_FILM(DVM)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/5DVW/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Thermal Soft Feel</td>
					<td>DVT</td>
					<td class="align-l">고급 판플렛, 종이가방, 종이박스</td>
					<td>18</td>
					<td>양면</td>
					<td><a href="/static/bizfolder/6DVT/BOPP_DVT.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/6DVT/BOPP_FILM(DVT)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/6DVT/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
<% } else { %>
 				<tr>
					<td>EVA Anti Scuff</td>
					<td>ENS</td>
					<td class="align-l">PREMIUM PAMPHLET, PAPER BAG, PAPER BOX</td>
					<td>30</td>
					<td>Both</td>
					<td><a href="/static/bizfolder/1ENS/EVA_ENS.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/1ENS/BOPP_FILM(ENS)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
<!-- 					<td><a href="javascript:downloadFileAll('0', '193', 'BOPP_DHT');" class="btn-download"><span class="blind">FDA 다운로드</span></a></td> -->
					<td><a href="/static/bizfolder/1ENS/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>EVA Soft Feel</td>
					<td>EVT</td>
					<td class="align-l">PREMIUM PAMPHLET, PAPER BAG, PAPER BOX</td>
					<td>34, 38</td>
					<td>Both</td>
					<td><a href="/static/bizfolder/2EVT/EVA_EVT.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/2EVT/BOPP_FILM(EVT)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/2EVT/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Wet Anti Scuff</td>
					<td>DAS</td>
					<td class="align-l">PREMIUM PAMPHLET, PAPER BAG, PAPER BOX</td>
					<td>18</td>
					<td>Both</td>
					<td><a href="/static/bizfolder/3DAS/BOPP_DAS.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/3DAS/BOPP_FILM(DAS)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/3DAS/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Thermal Anti Scuff</td>
					<td>DNS</td>
					<td class="align-l">PREMIUM PAMPHLET, PAPER BAG, PAPER BOX</td>
					<td>18</td>
					<td>Both</td>
					<td><a href="/static/bizfolder/4DNS/BOPP_DNS.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/4DNS/BOPP_FILM(DNS)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/4DNS/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Wet Soft Feel</td>
					<td>DVW</td>
					<td class="align-l">PREMIUM PAMPHLET, PAPER BAG, PAPER BOX</td>
					<td>18</td>
					<td>Both</td>
					<td><a href="/static/bizfolder/5DVW/BOPP_DVW.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/5DVW/BOPP_FILM(DVM)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/5DVW/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
				<tr>
					<td>Thermal Soft Feel</td>
					<td>DVT</td>
					<td class="align-l">PREMIUM PAMPHLET, PAPER BAG, PAPER BOX</td>
					<td>18</td>
					<td>Both</td>
					<td><a href="/static/bizfolder/6DVT/BOPP_DVT.zip" class="btn-download type-all"><span class="blind">전체다운로드</span></a></td>
					<td><a href="/static/bizfolder/6DVT/BOPP_FILM(DVT)_MSDS.pdf" class="btn-download"><span class="blind">MSDS 다운로드</span></a></td>
					<td><a href="/static/bizfolder/6DVT/film_FDA.pdf" class="btn-download"><span class="blind">FDA 다운로드</span></a></td>
				</tr>
<% } %>	

				</tbody>
			</table>
<%					
    if(name.equals("ko_KR")){
%>	
			<div class="btn-area">
				<button type="button" class="btn btn-primary i-confirm" onclick="sendEmail('sikim@daelimfnc.co.kr','3','기타문의');"><s:text name="biz02_32"/></button>
			</div>
<%} %>
			
			<h4>제품문의</h4>
			<table class="brdList">
				<colgroup>
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:25%;">
					<col style="width:25%;">
				</colgroup>
				<thead>
				<tr>
					<th><s:text name="biz01_29"/></th>
					<th><s:text name="biz01_30"/></th>
					<th><s:text name="biz01_31"/></th>
					<th><s:text name="biz01_32"/></th>
				</tr>
				</thead>
				<tbody>
				<!-- <tr>
					<td><s:text name="biz01_33"/></td>
					<td><s:text name="biz01_34"/></td>
					<td><s:text name="biz01_35"/></td>
					<td><a href="<s:text name="biz_mail_1"/>" class="btn-mail"><s:text name="biz01_36"/></a></td>
				</tr> -->
				<tr>
					<td><s:text name="biz01_33"/></td>
					<td><s:text name="biz01_38"/></td>
					<td><s:text name="biz01_39"/></td>
					<td><a href="<s:text name="biz_mail_2"/>" class="btn-mail"><s:text name="biz01_36"/></a></td>
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