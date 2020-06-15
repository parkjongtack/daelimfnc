<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>환경경영활동 &lt; 안전·보건·환경 경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
				<div class="lnb">
					<ul>
						<li>
							<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
						</li>
						<li>
							<a href="javascript:void(0)">지속가능경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/com01.do">회사소개</a></li>
								<li><a href="/biz01.do">사업소개</a></li>
								<li><a href="/rnd01.do">기술개발</a></li>
								<li><a href="/sus01_1.do" class="active">지속가능경영</a></li>
								<li><a href="/pr01.do">홍보센터</a></li>
								<li><a href="/car01.do">인재채용</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)">안전·보건·환경 경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do" class="active">안전·보건·환경 경영</a></li>
								<li><a href="/sus02_1.do">정도경영</a></li>
							</ul>
						</li>
						<li> <!--20200416 추가-->
							<a href="javascript:void(0)">환경경영활동<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do">HSE 경영방침</a></li>
								<li><a href="/sus01_2.do">OEMS 구조</a></li>
								<li><a href="/sus01_3_1.do">안전경영활동</a></li>
								<li><a href="/sus01_4.do" class="active">환경경영활동</a></li>
								<li><a href="/sus01_5.do">보건경영활동</a></li>
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

			<div class="sub-visual Sustainability">
				<h2>지속가능경영</h2>
			</div>
			<div id="content">
				<h3>환경경영활동</h3>
				<!-- 20200416 탭 제거 -->
				<ul class="thumbnail-list">
					<li>
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt04_01.jpg" alt="환경경영활동 대기자가측정 실시">
						</div>
						<div class="text-box">
							<strong class="tit">대기자가측정 실시</strong>
							<p class="txt">대기배출시설에서 배출되는 먼지, 황산화물 배출허용기준 이하 관리를 위하여 대기자가<br>
							측정을 반기별 연2회 실시하고 있습니다.</p>
						</div>
					</li>
					<li>
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt04_02.jpg" alt="환경경영활동 폐기물 배출원 관리">
						</div>
						<div class="text-box">
							<strong class="tit">폐기물 배출원 관리</strong>
							<p class="txt">일반폐기물, 지정폐기물 등 현장에서 분리수거를 철저히하여 최소한의 폐기물이 나오도록<br> 배출원 관리를 실시하고 있습니다.</p>
						</div>
					<li>
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt04_03.jpg" alt="환경경영활동 지역사회 환경보존">
						</div>
						<div class="text-box">
							<strong class="tit">지역사회 환경보존</strong>
							<p class="txt">분기별로 환경협의회에 참석하여 지역 환경보존 활동을 전개하여, 산업단지 내외 환경<br> 정화활동을 통해 지역 사회의 환경 보존에 앞장서고 있습니다.</p>
						</div>
					</li>
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