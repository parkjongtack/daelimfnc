<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>보건경영활동 &lt; 안전·보건·환경 경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>
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
							<a href="javascript:void(0)">보건경영활동<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do">HSE 경영방침</a></li>
								<li><a href="/sus01_2.do">OEMS 구조</a></li>
								<li><a href="/sus01_3_1.do">안전경영활동</a></li>
								<li><a href="/sus01_4.do">환경경영활동</a></li>
								<li><a href="/sus01_5.do" class="active">보건경영활동</a></li>
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
				<h3>보건경영활동</h3>
				<!-- 20200416 탭 제거 -->
				<ul class="thumbnail-list">
					<li>
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt05_01.jpg" alt="보건경영활동 작업환경 관리">
						</div>
						<div class="text-box">
							<strong class="tit">작업환경 관리</strong>
							<p class="txt">작업환경측정 및 지속적 작업환경 개선을 통해 건강한 일터를 만들어가고 있습니다.</p>
						</div>
					</li>
					<li>
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt05_02.jpg" alt="보건경영활동 심폐소생술(CPR) 실습">
						</div>
						<div class="text-box">
							<strong class="tit">심폐소생술(CPR) 실습</strong>
							<p class="txt">매년 1회 심폐소생술 전문가를 초빙하여, 전 직원들에게 CPR 실습을 실시하고 있습니다.<br>
								최근에는 공장동 및 행정동에 자동심장충격기(AED) 장비를 4대 비치 완료 하였습니다.</p>
						</div>
					</li>
					<li>
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt05_03.jpg" alt="보건경영활동 개인건강 관리">
						</div>
						<div class="text-box">
							<strong class="tit">개인건강 관리</strong>
							<p class="txt">개인별 맞춤형 종합건강검진, 일반 및 특수검진을 실시하고, 건강증진 프로그램을 실행하여 건강한 일터 구축에 앞장서고 있습니다.</p>
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