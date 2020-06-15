<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>건설 &lt; 그룹사 현황 &lt; 회사소개 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)">회사소개<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do" class="active">회사소개</a></li>
							<li><a href="/biz01.do">사업소개</a></li>
							<li><a href="/rnd01.do">기술개발</a></li>
							<li><a href="/sus01_1.do">지속가능경영</a></li>
							<li><a href="/pr01.do">홍보센터</a></li>
							<li><a href="/car01.do">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">그룹사 현황<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">기업정보</a></li>
							<!-- <li><a href="/com02.do">CEO인사말</a></li> -->
							<li><a href="/com03.do">기업연혁</a></li>
							<li><a href="/com04_1.do" class="active">그룹사 현황</a></li>
							<li><a href="/com05.do">오시는길</a></li>
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
			<h2>회사소개</h2>
		</div>
		<div id="content">

			<h3>그룹사 현황</h3>
			<ul class="tab-ul-02">
				<li><a href="/com04_1.do">개요</a></li>
				<li><a href="/com04_2.do">석유화학</a></li>
				<li><a href="/com04_3.do">건설</a></li>
				<li><a href="/com04_4.do">제조/상사</a></li>
				<li><a href="/com04_5.do">IT</a></li>
				<li><a href="/com04_6.do">레저</a></li>
				<li><a href="/com04_7.do">교육/문화</a></li>
				<li class="active"><a href="/com04_8.do">에너지</a></li>
			</ul>
			<div class="cmpny-tabcon">
				<strong class="blind">에너지</strong>
				<ul class="cmpny-info-list">
					<li id="come4_8_1">
						<h4>대림에너지</h4>
						<div class="half-info-box">
							<div class="l-box">
								<div class="logo-box">
									<img src="../static/images/contents/img_cmpny_logo_13.png" alt="대림에너지 로고">
								</div>
								<p class="info-txt top"><strong>설립</strong><span>2013년 12월 31일</span></p>
								<p class="info-txt">
									글로벌 민자발전사업 Developer로서 국내외 발전 프로젝트에 대한
									투자ㆍ개발 및 운영을 통한 비즈니스 모델을 구축하고 있습니다.
								</p>
								<a href="http://www.daelimenergy.com" target="_blank" class="cmpny-link">http://www.daelimenergy.com</a>
							</div>
							<div class="r-box">
								<strong class="blind">대림에너지 관련 이미지 슬라이드</strong>
								<div class="cmpny-slide-wrap">
									<div class="cmpny-slide">
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_energeList01.jpg" alt="대림에너지">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_energeList02.jpg" alt="대림에너지">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_energeList03.jpg" alt="대림에너지">
										</div>
									</div>
									<button class="btn-auto play">재생</button>
								</div>
							</div>
						</div>
						<div class="address-item-wrap">
							<div class="address-item-list">
								<strong class="tit">본사</strong>
								<div class="address-item">
									<strong class="s-tit">주소</strong>
									<span>경기도 포천시 창수면 추동리 790</span>
									<div class="fr">
										<strong class="s-tit">전화</strong>
										<span>02.6711.4944</span>
										<strong class="s-tit">팩스</strong>
										<span>02.6711.4901</span>
									</div>
								</div>
							</div>
						</div>
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
<script>
	$(document).ready(function(){
		var arr = [];
		$('.cmpny-slide').each(function(i){
			var aa = $('.cmpny-slide').eq(i).slick({
				slidesToShow: 1,
				arrows: false,
				dots:true,
				loop:true, 
				infinite: true,
				speed: 1000,
				autoplay: true,
				autoplaySpeed: 3000,
				pauseOnHover : false,
				pauseOnFocus : false,
			});
			arr.push($('.cmpny-slide').eq(i))

			$('.btn-auto').eq(i).on('click', function(e) {
				if($(this).hasClass("play")){
					arr[i].slick('slickPause');
					$(this).removeClass("play");
					$(this).addClass("stop");
				} else {
					arr[i].slick('slickPlay');
					$(this).removeClass("stop");
					$(this).addClass("play");
				}
			});

		})
		// $('.pause').on('click', function() {
		// $('.slider')
		// 		.slick('slickPause')
		// });

		// $('.play').on('click', function() {
		// 	$('.slider')
		// 		.slick('slickPlay')
		// });
	});
</script>

<!-- //wrapper -->
</body>
</html>