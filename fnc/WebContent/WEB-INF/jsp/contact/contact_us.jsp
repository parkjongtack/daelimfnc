<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>EVA Coated Film &lt; 사업소개 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
						<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_6"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do" class="active"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_6_1"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/contact.do" class="active"><s:text name="header_sub_6_1"/></a></li>
							<li><a href="javascript:" onclick="sendEmail()"><s:text name="header_sub_6_2"/></a></li>
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
			
			<h4><s:text name="biz01_28"/></h4>
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
				<tr>
					<td><s:text name="biz01_33"/></td>
					<td><s:text name="biz01_34"/></td>
					<td><s:text name="biz01_35"/></td>
					<td><a href="<s:text name="biz_mail_1"/>" class="btn-mail"><s:text name="biz01_36"/></a></td>
				</tr>
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