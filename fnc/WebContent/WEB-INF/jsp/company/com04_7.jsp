<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>석유화학 &lt; 그룹사 현황 &lt; 회사소개 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_1"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do" class="active"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_1_3"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1_1"/></a></li>
							<!-- <li><a href="/com02.do">CEO인사말</a></li> -->
							<li><a href="/com03.do"><s:text name="header_sub_1_2"/></a></li>
							<li><a href="/com04_1.do" class="active"><s:text name="header_sub_1_3"/></a></li>
							<li><a href="/com05.do"><s:text name="header_sub_1_4"/></a></li>
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
			<h2><s:text name="com01_1"/></h2>
		</div>
		<div id="content">

			<h3><s:text name="com04_1"/></h3>
			<ul class="tab-ul-02">
				<li><a href="/com04_1.do"><s:text name="com04_nav1"/></a></li>
				<li><a href="/com04_2.do"><s:text name="com04_nav2"/></a></li>
				<li><a href="/com04_3.do"><s:text name="com04_nav3"/></a></li>
				<li><a href="/com04_4.do"><s:text name="com04_nav4"/></a></li>
				<li><a href="/com04_5.do"><s:text name="com04_nav5"/></a></li>
				<li><a href="/com04_6.do"><s:text name="com04_nav6"/></a></li>
				<li class="active"><a href="/com04_7.do"><s:text name="com04_nav7"/></a></li>
				<li><a href="/com04_8.do"><s:text name="com04_nav8"/></a></li>
			</ul>
			<div class="cmpny-tabcon">
				<strong class="blind">교육/문화</strong>
				<ul class="cmpny-info-list">
					<li id="come4_7_1">
						<h4><s:text name="com04_208"/></h4>
						<div class="half-info-box">
							<div class="l-box">
								<div class="logo-box">
									<img src="../static/images/contents/img_cmpny_logo_11.png" alt="대림미술관/디뮤지엄 로고">
								</div>
								<p class="info-txt">
									<s:text name="com04_209"/>
								</p>
								<a href="http://www.daelimmuseum.org" target="_blank" class="cmpny-link">http://www.daelimmuseum.org</a>
							</div>
							<div class="r-box">
								<strong class="blind">대림미술관/디뮤지엄 관련 이미지 슬라이드</strong>
								<div class="cmpny-slide-wrap">
									<div class="cmpny-slide">
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_cultureList01.jpg" alt="대림미술관/디뮤지엄">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_cultureList02.jpg" alt="대림미술관/디뮤지엄">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_cultureList03.jpg" alt="대림미술관/디뮤지엄">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_cultureList04.jpg" alt="대림미술관/디뮤지엄">
										</div>
									</div>
									<button class="btn-auto play">재생</button>
								</div>
							</div>
						</div>
						<div class="address-item-wrap">
							<div class="address-item-list">
								<strong class="tit"><s:text name="com04_210"/></strong>
								<div class="address-item">
									<strong class="s-tit"><s:text name="com04_ad"/></strong>
									<span><s:text name="com04_212"/></span>
									<div class="fr">
										<strong class="s-tit"><s:text name="com04_tel"/></strong>
										<span><s:text name="com04_214"/></span>
										<strong class="s-tit"><s:text name="com04_fax"/></strong>
										<span><s:text name="com04_216"/></span>
									</div>
								</div>
							</div>
							<div class="address-item-list">
								<strong class="tit"><s:text name="com04_217"/></strong>
								<div class="address-item">
									<strong class="s-tit"><s:text name="com04_ad"/></strong>
									<span><s:text name="com04_219"/></span>
									<div class="fr">
										<strong class="s-tit"><s:text name="com04_tel"/></strong>
										<span><s:text name="com04_221"/></span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li id="come4_7_2">
						<h4><s:text name="com04_222"/></h4>
						<div class="half-info-box">
							<div class="l-box">
								<div class="logo-box">
									<%
									    if(name.equals("ko_KR")){
									%>
									<img src="../static/images/contents/img_cmpny_logo_12.png" alt="학교법인 대림학원 로고">
									<%
									    } else {
									%>			
									<img src="../static/images/contents/pic_dlogoList08en.gif" alt="학교법인 대림학원 로고">									
									<%
									    }
									%>					

								</div>
								<p class="info-txt top"><strong><s:text name="com04_sl"/></strong><span><s:text name="com04_224"/></span></p>
								<p class="info-txt">
									<s:text name="com04_225"/>
								</p>
								<a href="http://www.daelim.ac.kr" target="_blank" class="cmpny-link">http://www.daelim.ac.kr</a>
							</div>
							<div class="r-box">
								<strong class="blind">학교법인 대림학원 관련 이미지 슬라이드</strong>
								<div class="cmpny-slide-wrap">
									<div class="cmpny-slide">
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_schList01.jpg" alt="학교법인 대림학원">
										</div>
										<div class="swiper-slide">
											<img src="../static/images/contents/pic_schList02.jpg" alt="학교법인 대림학원">
										</div>
									</div>
									<button class="btn-auto play">재생</button>
								</div>
							</div>
						</div>
						<div class="address-item-wrap">
							<div class="address-item-list">
								<strong class="tit"><s:text name="com04_bs"/></strong>
								<div class="address-item">
									<strong class="s-tit"><s:text name="com04_ad"/></strong>
									<span><s:text name="com04_228"/></span>
									<div class="fr">
										<strong class="s-tit"><s:text name="com04_tel"/></strong>
										<span><s:text name="com04_230"/></span>
										<strong class="s-tit"><s:text name="com04_fax"/></strong>
										<span><s:text name="com04_232"/></span>
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