<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>안전문화정착 &lt; 안전경영활동 &lt; 안전·보건·환경 경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>
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
					<li><a href="/sus01_3_2.do">작업 및 공정안전</a></li>
					<li><a href="/sus01_3_3.do">비상사태 대응</a></li>
					<li class="active"><a href="/sus01_3_4.do">안전문화정착</a></li>
				</ul>
				<div class="sstnblt-tab-con">
					<h4>안전문화정착</h4>
					<div class="thumbnail-list type-full">
						<div class="img-box">
							<img src="../static/images/contents/img_sstnblt03_04.jpg" alt="안전경영활동 안전문화정착">
						</div>
						<div class="text-box">
							<ul class="list-style04">
								<li>
									<strong>맞춤형 교육</strong>
									<p>직원별 업무특성에 맞게 정기안전보건교육, 신규채용교육, 작업 변경시 교육 및 외부전문가 초빙 교육 실시</p>
								</li>
								<li>
									<strong>CEO 특별안전교육</strong>
									<p>매 정기보수 전, HSE 이슈 사항 발생 시 임직원 및 협력업체 대상 특별안전교육 실시</p>
								</li>
								<li>
									<strong>전직원 참여활동</strong>
									<p>아차사고 및 제안 제도를 통하여 전직원의 HSE 활동 참여 유도</p>
								</li>
								<li>
									<strong>안전관찰 활동</strong>
									<p>작업자 스스로가 동료의 위험한 행동을 관찰하고 대화하여 안전한 행동은 칭찬하고, 불안전한 행동은 훈수/지도하는 활동을 실시</p>
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