var totalData = 0;		// 전체데이터
var toatalPage = 0;		// 전체 페이지
var currentPage = 0;	// 현제페이지
var pagePer = 0;		// 선택 페이지 노출 개수
var endNum = "";		// 페이지 마지막번호
var startNum = "";		// 페이지 시작번호
var rowPer = 0;			// 페이지 목록 개수

$.pagingSet = (function(row){

	totalData = 0;
	pagePer = 10;
	currentPage = 1;
	startNum = "1";
	
	if (row == null || row == undefined) {
		endNum = "10";
	} else {
		endNum = row;
	}
	if (row == null || row == undefined) {
		rowPer = 10;
	} else {
		rowPer = row;
	}
});

$.paginView = (function(cnt){
	totalData = Number(cnt);
	
	toatalPage = Math.ceil(totalData/rowPer);

	var pageGroup = Math.ceil(currentPage/pagePer);
	
	var last = pageGroup*pagePer;

	if(last>toatalPage){
		last = toatalPage;
	}
	
	var fisrt = (pagePer*pageGroup)-(pagePer-1);
	var next = last+1;
	var prev = fisrt-1;
	
	var pagingHtml = "";
	
	if(prev>0){
		
		pagingHtml +="<a href='#' class='first' onClick=pagingPage(1)>first</a>";
		pagingHtml +="<a href='#' class='prev' onClick='pagingPage("+(fisrt-pagePer)+")'>prev</a>";
	
	}
	
	for(var i=fisrt; i<=last; i++){
		if(i == currentPage){
			pagingHtml +="<strong>"+i+"</strong>";
			
		}else{
			pagingHtml +="<a href='javascript:void(0);' onClick='pagingPage("+i+")'>"+i+"</a>";
		}
	}
	
	if(last<toatalPage){
		pagingHtml +="<a href='javascript:void(0);' class='next' onClick='pagingPage("+next+")'>next</a>";
		pagingHtml +="<a href='javascript:void(0);' class='last' onClick='pagingPage("+toatalPage+")'>last</a>";
	}
	
	$("#paging").html(pagingHtml);
});