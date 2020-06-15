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
								<li><a href="javascript:void(0)">정도경영</a></li><!-- TODO: /sus02_1.do -->
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)">HSE 경영방침<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do" class="active">HSE 경영방침</a></li>
								<li><a href="/sus01_2.do">OEMS 구조</a></li>
								<li><a href="/sus01_3_1.do">안전경영활동</a></li>
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
			<div id="content" class="infowrap">
				<div class="inner-area">
					<h3>HSE 경영방침</h3>
					<div class="vision-img-box">
						<img src="../static/images/contents/img_vision.png" 
							alt="HSE 비전 및 목표. 목표 : 무질병 - 쾌적한 작업환경으로 건강한 일터 구축, 무사고 - 본질안전 추구로 안전한 일터 실현, 무오염 - 오염물질 배출 저감으로 환경보전 기여, 비전 : 보건.안전.환경을 최우선으로 하는 글로벌 리더쉽을 토대로 지속가능경영을 실천하는 사회적 기업."> 
					</div>
					<h4>안전∙보건∙환경∙품질 방침</h4>
					<p class="sub-text">대림에프엔씨는 안전∙보건∙환경∙품질을 경영 활동의 핵심가치로 삼아 개발, 구매, 생산, 판매, 출하 및 서비스활동 등 전반의 사업활동영역에서 인명과 환경 보호를 위한 정책수립 및 이행에 최선을 다하고 고객만족을 위한 품질 개선활동을 지속적으로 추구한다.</p>
				</div>
				<div class="banner-bg vision">
					<div class="inner-area">
						<div class="text-lst">
							<strong>행동지침</strong>
							<ul class="list-style02">
								<li>1. 모든 임직원 및 협력업체는 보건∙안전∙환경∙품질 방침에 대한 법과 회사의 규정을 준수한다.</li>
								<li>2. 안전∙보건∙환경∙품질 방침의 핵심가치를 구현하는데 적합한 조직과 체계를 갖추고 지속적인 개선을 추구한다.</li>
								<li>3. 지속적인 기술개발과 교육∙훈련을 통하여 보건∙안전∙환경 위협 최소화 및 최고 품질의 제품제공을 추구한다.</li>
								<li>4. 안전, 보건  및 환경 비상사태시 회사 및 지역사회의 인명손실과 환경오염을 최소화할 수 있도록 비상사태조치 계획을 수립하여 이행에 만전을 기한다.</li>
								<li>5. 제품 생산, 취급의 전 과정에서 안전∙보건∙환경에 대한 영향을 평가하고 환경친화적 원료와 기술의 사용을 제고하여 자원절감 및 지구환경보호를 위한 사회적 책임을 다한다.</li>
							</ul>
						</div>
						<div class="txt-b-box">
							<p class="sub-texts gap-none">이 방침을 모든 임직원 및 이해관계자에게 공유하고 안전∙보건∙환경∙품질에 관한 활동을 RC선언에 입각하여 자발적으로 실행하며 그 성과를 이해관계자에게 공개함으로써 투명성을 확보한다.</p>
							<p class="b-txt">대림에프엔씨 대표이사 </p>
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