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
				<h2 class="main-title"><s:text name="main_slide_title"/></h2>
				<p class="main-sub-text"><s:text name="main_slide_txt"/></p>
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
<s:text name=""/>
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
							<strong class="de-tit"><s:text name="main_sub_slide_head"/></strong>
							<span class="de-item"><s:text name="main_sub_slide_1_1"/></span>
							<p class="de-info-txt"><s:text name="main_sub_slide_1_2"/></p>
							<a href="/biz03.do" class="btn-detail-link"><s:text name="main_sub_slide_more"/></a>
						</div>
						<div class="m-biz-slide m-biz-02">
							<strong class="de-tit"><s:text name="main_sub_slide_head"/></strong>
							<span class="de-item"><s:text name="main_sub_slide_2_1"/></span>
							<p class="de-info-txt"><s:text name="main_sub_slide_2_2"/></p>
							<a href="/biz02.do" class="btn-detail-link"><s:text name="main_sub_slide_more"/></a>
						</div>
						<div class="m-biz-slide m-biz-03">
							<strong class="de-tit"><s:text name="main_sub_slide_head"/></strong>
							<span class="de-item"><s:text name="main_sub_slide_3_1"/></span>
							<p class="de-info-txt"><s:text name="main_sub_slide_3_2"/></p>
							<a href="/biz01.do" class="btn-detail-link"><s:text name="main_sub_slide_more"/></a>
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
								<strong class="item-tit"><s:text name="main_about_1_1"/></strong>
								<span class="item-txt"><s:text name="main_about_1_2"/></span>
							</a>
						</li>
						<li class="about02">
							<a href="/sus01_1.do">
								<strong class="item-tit"><s:text name="main_about_2_1"/></strong>
								<span class="item-txt"><s:text name="main_about_2_2"/></span>
							</a>
						</li>
						<li class="about03">
							<a href="/rnd01.do">
								<strong class="item-tit"><s:text name="main_about_3_1"/></strong>
								<span class="item-txt"><s:text name="main_about_3_2"/></span>
							</a>
						</li>
					</ul>
				</div>
			</div>
<%					
    if(name.equals("ko_KR")){
%>
			<div class="main-bnnr-con detail-con">
				<div class="innerwrap">
				<strong class="de-tit">RECRUITMENT</strong>
				<span class="de-item"><s:text name="main_last_1"/></span>
				<p class="de-info-txt"><s:text name="main_last_2"/></p>
				<a href="car01List.do" class="btn-detail-link"><s:text name="main_last_3"/></a>
				</div>
			</div>
			<%} %>

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

		$(".main_01").css("background-image","url('${fn:split(bnnInfo.IMG_1,'|')[0]}')")
		$(".main_02").css("background-image","url('${fn:split(bnnInfo.IMG_2,'|')[0]}')")
		$(".main_03").css("background-image","url('${fn:split(bnnInfo.IMG_3,'|')[0]}')")

		/*        		
		$(".main_01").css("background-image","url('/static/2020051319201495cIZ.jpg")
		$(".main_02").css("background-image","url('/static/20200513192014g7l04.jpg")
		$(".main_03").css("background-image","url('/static/20200513192014XSkQP.jpg")
		*/

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