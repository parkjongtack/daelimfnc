<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>작업 및 공정 안전 &lt; 안전경영활동 &lt; 안전·보건·환경 경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>
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
							<a href="javascript:void(0)">안전경영활동<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do">HSE 경영방침</a></li>
								<li><a href="/sus01_2.do">OEMS 구조</a></li>
								<li><a href="/sus01_3_1.do" class="active">안전경영활동</a></li>
								<li><a href="/sus01_4.do">환경경영활동</a></li>
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
				<h3>안전경영활동</h3>
				<!-- 200416 탭 및 컨텐트 영역 마크업 변경 -->
				<ul class="tab-ul-02">
					<li><a href="/sus01_3_1.do">HSE신조</a></li>
					<li class="active"><a href="/sus01_3_2.do">작업 및 공정안전</a></li>
					<li><a href="/sus01_3_3.do">비상사태 대응</a></li>
					<li><a href="/sus01_3_4.do">안전문화정착</a></li>
				</ul>
				<div class="sstnblt-tab-con">
					<h4>작업 및 공정안전</h4>
					<div class="thumbnail-list type-full">
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt03_02.jpg" alt="안전경영활동 작업 및 공정안전">
						</div>
						<div class="text-box">
							<ul class="list-style04">
								<li>
									<strong>안전점검</strong>
									<p>CEO부터 솔선수범하여 현장 안전 점검을 실시하고, 현장 중심 개선 활동을 전개하고 있습니다.</p>
								</li>
								<li>
									<strong>작업안전관리절차 준수</strong>
									<p>위험요소에 대한 발굴 및 제거를 통하여 안전을 확보한 후에 작업을 실시하고 있습니다.</p>
								</li>
								<li>
									<strong>현장 안전관리자 배치</strong>
									<p>공정, 작업 관련 전문가를 작업 현장에 배치하여 현장 위험요소를 사전에 파악하여 관리하고 있습니다. </p>
								</li>
								<li>
									<strong>공정안전관리 시스템</strong>
									<p>PSM(Process Safety Management)제도에 따른 체계적인 공정안전 관리를 하고 있습니다.</p>
								</li>
								<li>
									<strong>안전보건경영 시스템</strong>
									<p>KOSHA 18001 시스템에 따른 체계적인 안전보건 경영을 유지하고 있습니다.</p>
								</li>
							</ul>
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