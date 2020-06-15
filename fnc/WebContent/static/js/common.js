$(document).ready(function(){

	/* top banner */
	$("body").on("click",".topbnr .topbnrClose .btnClose",function(e){
		$('#main .topbnr').stop(true,true).slideUp(300);      
		$('#main header').animate({top: "0"}, 300);
	});

	/* gnb */
	$('body').on("mouseover focusin",'#gnb>li>a, #gnb',function(e){
		e.stopPropagation();
		$('.gnbBg').stop(true,true).slideDown(300);    
		$('#gnb>li>ul').stop(true,true).slideDown(300);
		$('header').addClass("active");
	});
	$("body").on("mouseleave","#gnb",function(e){
		e.stopPropagation();
		$('.gnbBg').stop(true,true).slideUp(300);      
		$('#gnb>li>ul').stop(true,true).slideUp(300);
		$('header').removeClass("active");
	});
	$("body").on("focusout","#siteMap",function(e){
		e.stopPropagation();
		$('.gnbBg').stop(true,true).slideUp(300);      
		$('#gnb>li>ul').stop(true,true).slideUp(300);
		$('header').removeClass("active");
	});

	openLayer( $('header #showSitemap'),$('#sitemapop'),$('.popClose') );// sitemap
	openLayer( $('#emailPop'),$('#emailPop_view'),$('#email_c') );// 이메일 무단수집거부 popup
	openLayer( $('#customer'),$('#customer_view'),$('#customer_c') );// 고객문의 popup

	familySiteLayer( $('#openFamily'),$('footer .familysite'),$('.familysite a.close') );// footer familysite layer
	
	/* lnb */
	$('.lnb>ul>li').each(function(i){
		$('.lnb>ul>li>a').eq(i).on("mouseover focusin", function(){
			//e.stopPropagation();
			$(".lnb>ul>li").eq(i).find("ul").stop(true,true).slideDown(300);
		});
		$('.lnb>ul>li').eq(i).on("mouseleave focusout", function(){      
			//e.stopPropagation();
			$(".lnb>ul>li").eq(i).find("ul").stop(true,true).slideUp(300);
		});
	});

	/* submenus */
	$(".lnb>ul>li").each(function(){
		var lnd_width = $(this).outerWidth(true)+1; 
		$(this).find(".submenus").css("width",lnd_width);
	});
	
	//sns box
	$("body").on("click focusin",".lnbAside",function(e){
		$(".snsbox").show();
	});
	$("body").on("mouseleave",".snsbox",function(e){
		$(this).hide();
	});
	$("body").on("focusout",".linkCopy",function(e){
		$('.snsbox').hide();
	});

	$("body").on("focusin","#openFamily",function(e){
		$('.familysite').show();
	});
	$("body").on("focusout",".familysite .btn.close",function(e){
		$('.familysite').hide();
	});

	$(window).scroll(function () { 
		if ($(window).scrollTop() > 435) {
		  $('header').addClass('fixed');
		}
		if ($(window).scrollTop() < 435) {
		  $('header').removeClass('fixed');
		}
	  });

	// top button click

	$(".btn-top").click(function(){
		$("html, body").animate({scrollTop:0})
	})
	// scroll top button
	$(window).scroll(function(){
		var scroll_top = $(window).scrollTop();
		var window_h = $(window).height();
		var document_h = $(document).height();
		if (document_h - window_h <= scroll_top || scroll_top > 1000) {
			$(".btn-top").fadeIn();
		} else {
			$(".btn-top").fadeOut();
		}
	})
	// tab ui 01 
	$(".tab-ul-01 li").click(function(){
		$(this).parent().find("li").removeClass("active");
		if(!$(this).hasClass("active")) {
			$(this).addClass("active");
		} 
	})
	
	//file upload
	var fileTarget = $('.filebox .upload-hidden');
	fileTarget.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
			console.log('filename: ', filename);
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		} 
		
		$(this).siblings('.upload-name').val(filename); 
	});

});

//onClick open layer
var openLayer = function(a,b,c){  
	a.click(function(){
		if( $(this).hasClass('on') == true ){
			$(this).removeClass('on').addClass('off');
			b.css('display','none');
			$(".back").css('display','none');
			// $("html").css("overflow-y","auto");
		} else {
			$(this).removeClass('off').addClass('on');
			b.css('display','block');
			$(".back").css('display','block');
			// $("html").css("overflow-y","hidden");
			
		}
	});
	c.click(function(){
		if( a.hasClass('on') ){
			a.removeClass('on').addClass('off');
			b.css('display','none');
			$(".back").css('display','none');
			console.log(a,"aaaa");
			// $("html").css("overflow-y","auto");
		} else {
			a.removeClass('off').addClass('on');
			b.css('display','block');
			$(".back").css('display','block');
			console.log(a,"a");
			// $("html").css("overflow-y","hidden")
		}
	});
	return false;
}
var familySiteLayer = function(a,b,c){  
	a.click(function(){
		if( $(this).hasClass('on') == true ){
			$(this).removeClass('on').addClass('off');
			b.css('display','none');
		} else {
			$(this).removeClass('off').addClass('on');
			b.css('display','block');
		}
	});
	c.click(function(){
		if( a.hasClass('on') == true ){
			a.removeClass('on').addClass('off');
			b.css('display','none');
		} else {
			a.removeClass('off').addClass('on');
			b.css('display','block');
		}
	});
	return false;
}

function centerPop(_url, _width, _height, _name, _scroll){ 
	var left = (screen.width/2) - _width/2; 
	var top = (screen.height/2) - _height/2-50; 
	var ops="width="+_width+",height="+_height+", top="+top+",left="+left+",resizable=0,status=0" 
	if(_scroll=='yes') ops+=",scrollbars=yes";
	
	window.open(_url , _name , ops); 
}