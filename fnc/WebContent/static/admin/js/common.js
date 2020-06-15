$(document).ready(function(){
	$('#lnb > ul > li > a').click(function() {

		var checkElement = $(this).next();

		$('#lnb li').removeClass('active');
		$(this).closest('li').addClass('active');	
		$('#lnb > ul > li > a').next().slideUp('normal');
		
		if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
			$(this).closest('li').removeClass('active');
			checkElement.slideUp('normal');
		}

		if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
			$('#lnb ul ul:visible').slideUp('normal');
			checkElement.slideDown('normal');
		}

		if (checkElement.is('ul')) {
			return false;
		} else {
			return true;	
		}
	});

	$('header .name a').click(function() {
		layer_popup('#membermod');
	});

	var fileTarget = $('.filebox .upload-hidden');
	fileTarget.on('change', function(){
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		} 
		
		$(this).siblings('.upload-name').val(filename); 
	});
});

function layer_popup(el){

	var $el = $(el);
	var isDim = $el.prev().hasClass('back');

	isDim ? $('.popCont').fadeIn() : $el.fadeIn();
	$('.back').fadeIn();

	var $elWidth = ~~($el.outerWidth()),
		$elHeight = ~~($el.outerHeight()),
		docWidth = $(document).width(),
		docHeight = $(document).height();

	if ($elHeight < docHeight || $elWidth < docWidth) {
		$el.css({
			marginTop: -$elHeight /2,
			marginLeft: -$elWidth/2
		})
	} else {
		$el.css({top: 0, left: 0});
	}

	$el.find('a.popClose').click(function(){
		isDim ? $('.popCont').fadeOut() : $el.fadeOut();
		$('.back').fadeOut();
		return false;
	});
	
	$('.back').click(function(){
		$('.back').fadeOut();
		return false;
	});

}