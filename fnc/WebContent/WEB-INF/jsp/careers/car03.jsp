<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>목록 &lt; 인재채용 &lt; 홍보센터 &lt; DAELIM Fnc</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)">인재채용<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">회사소개</a></li>
							<li><a href="/biz01.do">사업소개</a></li>
							<li><a href="/rnd01.do">기술개발</a></li>
							<li><a href="/sus01_1.do">지속가능경영</a></li>
							<li><a href="/pr01.do">홍보센터</a></li>
							<li><a href="/car01.do" class="active">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">채용정보<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/car01.do">인재상</a></li>
							<li><a href="/car02.do">인사제도</a></li>
							<li><a href="/car01List.do" class="active">채용정보</a></li>
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

		<div class="sub-visual Careers"><h2>인재채용</h2></div>

		<div id="content" class="infowrap">
			<div class="inner-area">
				<h3>채용정보</h3>
				<p class="sub-text align-c">대림에프엔씨는 쾌적하고 풍요로운 세상을 함께 만들어 갈 인재를 찾습니다.<br>
					세계를 무대로 미래를 창조할 인재의 힘찬 도전을 기다립니다.
				</p>
				<form name="searchForm" method="post" onsubmit="return fn.search(this);">
					<fieldset>
						<div class="srchArea pd0">
							<input type="hidden" id="searchType" value="0">
							<input type="text" id="search_cnts" name="search_cnts" placeholder="검색어를 입력하세요"><label for="search_cnts" class="blind">검색어 입력</label>
							<input type="submit" class="btn btSrch" value="검색">
						</div>
					</fieldset>
				</form>
				<table class="brdList not-line-type">
					<colgroup>
						<col style="width:10%;">
						<col style="width:55%;">
						<col style="width:20%;">
						<col style="width:15%;">
					</colgroup>
					<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">접수기간</th>
						<th scope="col">상태</th>
					</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
 				<div class="paging" id="paging" style="display: none;"></div>
				
			</div>
			<input type="hidden" id="result" value="${result}" />
<script type="text/javascript">
$(function() {
	fn_getList(startNum,endNum);
});

//목록
function fn_getList(sNum,eNum) {
	var searchType = $("#searchType").val();
	var searchData = $("#searchData").val();
	console.log("searchData",searchData);
	
	$.ajax({
        url : "/car01ListAjax.do",
        type: 'POST',
        data: {
        		searchType: searchType,
        		searchData: searchData,
        		sNum: sNum,
        		eNum: eNum
        },
        dataType : "json",
        beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
		},
        success: function(data) {
        	 console.log("data: " + JSON.stringify(data));
    		
        	var html = "";
        	if(data.resultList != null && data.resultList.length > 0) {
	        	for(var i = 0; i < data.resultList.length; i++) {
	        		var clGbn = data.resultList[i].clGbn;
	        		var clGbnNm = "";
	        		if (clGbn == "01") {
	        			clGbnNm = '공지사항';
	        		} else if (clGbn == "02") {
	        			clGbnNm = '프로그램/행사';
	        		} else if (clGbn == "03") {
	        			clGbnNm = '수상';
	        		}
	        		var dtRgst = data.resultList[i].dtRgst;
	        		var dtBegnc = data.resultList[i].dtBegnc;
	        		var dtEnd = data.resultList[i].dtEnd;
//	        		var regDt = dtRgst.substring(0,4) + "-" + dtRgst.substring(4,6) + "-" + dtRgst.substring(6,8);
	        		var regDt01 = dtBegnc.substring(0,4) + "." + dtBegnc.substring(4,6) + "." + dtBegnc.substring(6,8);
	        		var regDt02 = dtEnd.substring(0,4) + "." + dtEnd.substring(4,6) + "." + dtEnd.substring(6,8);
	        		var regDtNM = regDt01 + " ~ " + regDt02;
	        		var ynNtcNm = "게시";
	        		
	        		if (data.resultList[i].ynNtc == "N") {
	        			ynNtcNm = "게시안함";
	        		}
	        		var statNtcNm = "대기";
	        		if (data.resultList[i].statNtc == "1") {
	        			statNtcNm = "대기"
	        		} else if (data.resultList[i].statNtc == "2") {
	        			statNtcNm = "접수중"
	        		} else if (data.resultList[i].statNtc == "3") {
	        			statNtcNm = "접수마감"
	        		} else {
	        			statNtcNm = "대기"
	        		}

		        	html += '<tr>';
		        	html += '	<td>' + (Number(data.cnt) - sNum - i + 1)  + '</td>';
//		        	html += '	<td>' + clGbnNm + '</td>';
		        	html += '	<td class="al-left"><a href="/car01Detail.do?noNtcPlteSral=' + data.resultList[i].noNtcPlteSral + '">' + data.resultList[i].sbjtNtcPlte + '</td>';
		        	html += '	<td>' + regDtNM + '</td>';
		        	html += '	<td>' + statNtcNm + '</td>';
//		        	html += '	<td>' + ynNtcNm  + '</td>';
//		        	html += '	<td><a href="/admin/comModi.do?noNtcPlteSral=' + data.resultList[i].noNtcPlteSral + '" class="btn btn-prim">수정</a></td>';
//		        	html += '	<td><a href="javascript:;" class="btn btn-secon" onclick="javascript:comDel(' + data.resultList[i].noNtcPlteSral + '); return false;">삭제</a></td>';
		        	html += '</tr>';
	        	}
	        	
        		$.paginView(data.cnt);
	        	
	        	$("#paging").show();
        	} else {
        		html += "<tr><td colspan='7'><div class='nolist'>등록된 게시물이 없습니다</div></td></tr>";
        		
        		$("#paging").hide();
        	}
        	
        	$("#tbody").html(html);
	       
        },
        error: function(xhr, textStatus, error) {
        	if(xhr.status == "500") {
        		alert("Session connection is lost.");
        		location.href = "/";
        	} else {
        		alert("error");
        	}
        }
    });
}

$.pagingSet();

//페이징 처리
function pagingPage(num){
	currentPage = num;
	endNum = (rowPer*num).toString();
	startNum = ((rowPer*num)-(rowPer-1)).toString();
	fn_getList(startNum, endNum);
}

//검색
function fn_searchList() {
	$.pagingSet();
	fn_getList(startNum,endNum);
}

</script>		
			<div class="banner-bg">
				<div class="inner-area">
					<h4>채용절차</h4>
					<ol class="career-step-list">
						<li class="step1">
							<span class="blind">1</span>
							<strong class="tit">서류 전형</strong>
							<p class="txt">입사지원서를 기준으로 지원자의<br> 채용부문 적합성 여부 판단</p>
						</li>
						<li class="step2">
							<span class="blind">2</span>
							<strong class="tit">인. 적성 검사</strong>
							<p class="txt">지원자의 업무적합성,<br> 잠재성 및 사회성 평가</p>
						</li>
						<li class="step3">
							<span class="blind">3</span>
							<strong class="tit">1차 면접</strong>
							<p class="txt">실무 면접</p>
						</li>
						<li class="step4">
							<span class="blind">4</span>
							<strong class="tit">2차 면접</strong>
							<p class="txt">임원 면접</p>
						</li>
						<li class="step5">
							<span class="blind">5</span>
							<strong class="tit">채용 검진</strong>
							<p class="txt">신체 조건상 업무수행<br> 가능 여부 판단</p>
						</li>
						<li class="step6">
							<span class="blind">6</span>
							<strong class="tit">채용확정</strong>
							<p class="txt">전체 채용 전형을 바탕으로 최종 채용 확정</p>
						</li>
					</ol>
				</div>
			</div>
			<div class="inner-area">
				<p class="tbl-info-txt align-r">상기 채용절차는 상황에 따라 변경될 수 있습니다.</p>
			</div>

			<p class="career-info-text">
				<strong>채용문의당담자</strong>경원지원팀 강희성 차장
			</p>
			<div class="btn-area">
				<button type="button" class="btn btn-primary i-hire" onclick="sendEmail('hskang@daelimfnc.co.kr','2','채용문의');">채용문의</button>
			</div>
		</div>
		<!-- // #content -->
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
