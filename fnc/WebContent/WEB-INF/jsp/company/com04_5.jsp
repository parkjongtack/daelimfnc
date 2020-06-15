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
				<li class="active"><a href="/com04_5.do">IT</a></li>
				<li><a href="/com04_6.do">레저</a></li>
				<li><a href="/com04_7.do">교육/문화</a></li>
				<li><a href="/com04_8.do">에너지</a></li>
			</ul>
			<div class="cmpny-tabcon">
				<strong class="blind">IT</strong>
				<ul class="cmpny-info-list">
					<li id="come4_5_1">
						<h4>㈜대림코퍼레이션 IT컨버전스 부문</h4>
						<div class="half-info-box">
							<div class="l-box">
								<div class="logo-box">
									<img src="../static/images/contents/img_cmpny_logo_06.png" alt="㈜대림코퍼레이션 IT컨버전스 부문 로고">
								</div>
								<p class="info-txt top"><strong>설립</strong><span>1995년 3월 29일</span></p>
								<p class="info-txt">
									시스템 통합(SI) 및 관리(SM), 네트워크 컨설팅 및 e-business 등
									정보통신 각 분야에 토탈 솔루션 제공을 주 영업으로 하는 종합 정보
									서비스 회사입니다.
								</p>
								<a href="http://www.daelimcorp.co.kr" target="_blank" class="cmpny-link">http://www.daelimcorp.co.kr</a>
							</div>
							<div class="r-box">
								<strong class="blind">㈜대림코퍼레이션 IT컨버전스 부문 관련 이미지 슬라이드</strong>
								<div class="cmpny-slide-wrap">
									<div class="cmpny-slide">
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_itList01.jpg" alt="㈜대림코퍼레이션 IT컨버전스 부문">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_itList02.jpg" alt="㈜대림코퍼레이션 IT컨버전스 부문">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_itList03.jpg" alt="㈜대림코퍼레이션 IT컨버전스 부문">
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
									<span>서울특별시 중구 칠패로 36 (봉래동1가, 연세봉래빌딩) 12층</span>
									<div class="fr">
										<strong class="s-tit">전화</strong>
										<span>02.3704.8400</span>
										<strong class="s-tit">팩스</strong>
										<span>02.3704.8491</span>
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