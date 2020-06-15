<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/main_header.jsp" %>
	<!-- //header -->

	<!-- Container -->
	<div id="container">

		<div id="content">

			<div class="main-visual">
				<h2 class="main-title">DAELIM FnC</h2>
				<p class="main-sub-text">대림에프엔씨는 플라스틱가공 전문기업으로 BOPP Film, EVA Coated Film을 생산하며<br>
				지속적인 성장과 차별화된 고객가치를 실현하고 있습니다.</p>
				<div class="swiper-pagination-area">
					<div class="progressbar-box">
						<div class="bar"></div>
					</div>
					<div class="arrowSlider">
						<span class="s-btn-prev">이전슬라이드</span>
						<span class="s-btn-next">다음슬라이드</span>
					</div>
				</div>
				<div class="main-swiper">
					<div class="swiper-slide main_01" data-thumb="1">DAELIM FnC FILM 관련 배경</div>
					<div class="swiper-slide main_02" data-thumb="2">DAELIM FnC FILM 관련 배경</div>
					<div class="swiper-slide main_03" data-thumb="3">DAELIM FnC FILM 관련 배경</div>
				</div>
			</div>
			<!-- 
<h2>국제화 테스트</h2>
<s:text name="say.hello"/><p>
<s:text name="title"/><p>
<s:text name="subject"/><p>
<s:text name="content"/><p>
	 		-->
			<div class="main-info-box">
				<!-- slide -->
				<div class="subinfo-slide-box">
					<div class="slider-t detail-con">
						<div class="m-biz-slide m-biz-01">
							<strong class="de-tit">BUSINESS</strong>
							<span class="de-item">특수코팅</span>
							<p class="de-info-txt">고객의 다양한 요구와 인쇄 조건에 맞춘<br>특수코팅 솔루션을 제공</p>
							<a href="/biz03.do" class="btn-detail-link">제품정보 상세보기</a>
						</div>
						<div class="m-biz-slide m-biz-02">
							<strong class="de-tit">BUSINESS</strong>
							<span class="de-item">EVA Coated FILM</span>
							<p class="de-info-txt">투명한 색상 & 인쇄성이 뛰어난<br>안정적인 생산을 바탕으로 우수한 품질의 제품을 공급</p>
							<a href="/biz02.do" class="btn-detail-link">제품정보 상세보기</a>
						</div>
						<div class="m-biz-slide m-biz-03">
							<strong class="de-tit">BUSINESS</strong>
							<span class="de-item">BOPP film</span>
							<p class="de-info-txt">뛰어난 광택과 투명성, 우수한 인쇄성으로<br>포장/인쇄를 비롯한 다양한 분야 활용</p>
							<a href="/biz01.do" class="btn-detail-link">제품정보 상세보기</a>
						</div>
					</div>
					<div class="slider-i">
						<div class="m-biz-slide m-biz-01"></div>
						<div class="m-biz-slide m-biz-02"></div>
						<div class="m-biz-slide m-biz-03"></div>
					</div>
				</div>

				<!-- about list -->
				<div class="about-list-box">
					<strong class="tit">ABOUT</strong>
					<ul class="about-list">
						<li class="about01">
							<a href="/com03.do">
								<strong class="item-tit">대림 FnC</strong>
								<span class="item-txt">국내 유일의 5Layer 설비를<br>통해 차별화된 고부가 제품 생산</span>
							</a>
						</li>
						<li class="about02">
							<a href="/sus01_1.do">
								<strong class="item-tit">지속경영</strong>
								<span class="item-txt">보건.안전.환경을 최우선으로<br>지속가능경영을<br>실천하는 사회적 기업</span>
							</a>
						</li>
						<li class="about03">
							<a href="/rnd01.do">
								<strong class="item-tit">인증서</strong>
								<span class="item-txt">대림FnC 보유 인증서 / 지적재산권<br>다운로드 서비스</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="main-bnnr-con detail-con">
				<div class="innerwrap">
				<strong class="de-tit">RECRUITMENT</strong>
				<span class="de-item">인재채용관</span>
				<p class="de-info-txt">대림FnC와 함께 성장할 인재를 기다립니다.</p>
				<a href="car01List.do" class="btn-detail-link">채용관 바로가기</a>
				</div>
			</div>

		</div>
	</div>
	<!-- //Container -->
<script>
	$(document).ready(function(){
		/* 상단공지사항 스크립트 */

		if($(".notice-swiper").length){
			$('.notice-swiper').on('init', function(event, slick) {
	            $(this).parents(".topbnr").find(".arrowSlider").append('<div class="slick-counter"><span class="current"></span> <span class="bar">|</span> <span class="total"></span></div>');
	            $('.current').text(slick.currentSlide + 1);
	            $('.total').text(slick.slideCount);
	        });

	        $('.notice-swiper').on('afterChange', function(event, slick) {
	            $(this).find(".slick-active").css("background-size","100% 100%");
	        });



	        $('.notice-swiper').slick({
	            slidesToShow: 1,
	            arrows: true,
	            loop:true,
	            // fade: true,
	            infinite: true,
	            speed: 1500,
	            autoplay: $(".notice-swiper .swiper-slide").length > 1,
	            autoplaySpeed: 4000,
	            pauseOnHover : false,
	            pauseOnFocus : false,
	            prevArrow: $('.s-btn-prev-top'),
	            nextArrow: $('.s-btn-next-top'),
	        });
		}

		$('.main-swiper').on('init', function(event, slick) {
			$(this).parents(".main-visual").find(".arrowSlider").append('<div class="slick-counter"><span class="current"></span> / <span class="total"></span></div>');
			$(this).find(".slick-active").css("background-size","1920px 950px ");
			$('.current').text(slick.currentSlide + 1);
			$('.total').text(slick.slideCount);
			//console.log("ASASASAS");
		})

		$('.main-swiper').on('afterChange', function(event, slick) {
			$('.current').text(slick.currentSlide + 1);
			$(this).find(".slick-active").css("background-size","1920px 950px");
		})
		$('.main-swiper').on('beforeChange', function(event, slick) {
			$(this).find(".slick-active").css("background-size","2208px 1093px");
		})

		/**
		FIXME ,,, MAIN IMG (운영배포 후 주석 해제) [S]
		*/
		/*
		$(".main_01").css("background-image","url('${fn:split(bnnInfo.IMG_1,'|')[0]}')")
		$(".main_02").css("background-image","url('${fn:split(bnnInfo.IMG_2,'|')[0]}')")
		$(".main_03").css("background-image","url('${fn:split(bnnInfo.IMG_3,'|')[0]}')")
        */
		$(".main_01").css("background-image","url('/static/2020051319201495cIZ.jpg")
		$(".main_02").css("background-image","url('/static/20200513192014g7l04.jpg")
		$(".main_03").css("background-image","url('/static/20200513192014XSkQP.jpg")

        /**
        FIXME ... [E]
        */

		$('.main-swiper').slick({
			slidesToShow: 1,
			arrows: true,
			loop:true,
			// fade: true,
			infinite: true,
			speed: 1500,
			autoplay: true,
			autoplaySpeed: 4000,
			pauseOnHover : false,
			pauseOnFocus : false,
			prevArrow: $('.s-btn-prev'),
			nextArrow: $('.s-btn-next'),
		});

		var time = 4;
		var isPause, tick, percentTime;

		function startProgressbar() {
			resetProgressbar();
			percentTime = 0;
			isPause = false;
			tick = setInterval(interval, 10);
		}

		function interval() {
			if(isPause === false) {
				percentTime += 1 / (time + 0.1);
				$(".progressbar-box .bar").css({
					width: percentTime+"%"
				});
				if(percentTime >= 100) {
					$('.main-swiper').slick('slickNext');
					startProgressbar();
				}
			}
		}
		function resetProgressbar() {
			$(".progressbar-box .bar").css({
				width: 0+'%'
			});
			clearTimeout(tick);
		}

		startProgressbar();

		/*  */
		$('.slider-t').slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			asNavFor: '.slider-i',
			dots: false,
			// centerMode: true,
			focusOnSelect: true,
		});
		$('.slider-i').slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: false,
			fade: false,
			asNavFor: '.slider-t'
		});
	})
</script>
	<!-- footer -->
		<%@ include file="/WEB-INF/jsp/main_footer.jsp" %>
	<!-- //footer -->

	<!-- sitemap -->
		<%@ include file="/WEB-INF/jsp/ft/sitemap.jsp" %>
	<!-- //sitemap -->

	<div class="back"></div>
</div>


<!-- //wrapper -->
</body>
</html>