<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인증서 &lt; 기술개발 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)">기술개발<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">회사소개</a></li>
							<li><a href="/biz01.do">사업소개</a></li>
							<li><a href="/rnd01.do" class="active">기술개발</a></li>
							<li><a href="/sus01_1.do">지속가능경영</a></li>
							<li><a href="/pr01.do">홍보센터</a></li>
							<li><a href="/car01.do">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">인증서<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/rnd01.do" class="active">인증서</a></li>
							<li><a href="/rnd02.do">지적 재산권</a></li>
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

		<div class="sub-visual Rnd">
			<h2>기술개발</h2>
		</div>
		<div id="content">
			<h3>인증서</h3>

			<div class="certifi-list">
			<ul>
				<li>
				<dl>
					<dt>
						<p class="img"><img src="../static/images/contents/img_certifi1.png" alt="KOREAN STANDARDS ASSOCIATION - KSA 한국표준협회"></p>
						<p><strong>ISO 9001</strong></p>
					</dt>
						<dd><a href="/static/bizfolder/certs/295KRQS_CERTIFICATE_2018.pdf" class="btn btn-download03" target="_blank" title="새창열기 다운로드">PDF Download</a></dd>
				</dl>
				</li>
				<li>
				<dl>
					<dt>
						<p class="img"><img src="../static/images/contents/img_certifi2.png" alt="HEALTHY BUILDING MATERIAL"></p>
						<p><strong>HB 마크</strong> (국문)</p>
					</dt>
						<dd><a href="/static/bizfolder/certs/HBMark_K.zip" class="btn btn-download03" target="_blank" title="새창열기 다운로드">PDF Download</a></dd>
				</dl>
				</li>
				<li>
				<dl>
					<dt>
						<p class="img"><img src="../static/images/contents/img_certifi3.png" alt="HEALTHY BUILDING MATERIAL"></p>
						<p><strong>HB 마크</strong> (영문)</p>
					</dt>
						<dd><a href="/static/bizfolder/certs/HBMark_E.zip" class="btn btn-download03" target="_blank" title="새창열기 다운로드">PDF Download</a></dd>
				</dl>
				</li>
				<li>
				<dl>
					<dt>
						<p class="img"><img src="../static/images/contents/img_certifi4.png" alt=""></p>
						<p><strong>KOSHA 18001</strong> (국문)</p>
					</dt>
						<dd><a href="/static/bizfolder/certs/KOSHA18001Cert_K171031.zip" class="btn btn-download03" target="_blank" title="새창열기 다운로드">PDF Download</a></dd>
				</dl>
				</li>
				<li>
				<dl>
					<dt>
						<p class="img"><img src="../static/images/contents/img_certifi5.png" alt=""></p>
						<p><strong>KOSHA 18001</strong> (영문)</p>
					</dt>
						<dd><a href="/static/bizfolder/certs/KOSHA18001Cert_E171031.zip" class="btn btn-download03" target="_blank" title="새창열기 다운로드">PDF Download</a></dd>
				</dl>
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