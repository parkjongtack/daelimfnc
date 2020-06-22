<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
		<!-- //header -->

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">
			<h2>회사소식관리</h2>
			<div class="search">
				<fieldset>
					<legend>게시물검색</legend>
	
					<select id="searchType" name="searchType" class="srhoption">
						<option value="0" selected="selected">전체</option>
						<option value="1">제목</option>
						<option value="2">요약설명</option>
						<option value="3">내용</option>
					</select>
					<input type="text" id="searchData" name="searchData" class="srhipt" onkeyup="javascript:fn_searchList();" placeholder="검색어를 입력해주세요.">
					<a href="#" class="btn btn-srh" onclick="javascript:fn_searchList(); return false;">조회</a>
				</fieldset>
			</div>
			<div class="gridwrap">
				<table class="brdList tbl-hasbtn">
					<colgroup>
						<col style="width:5%;">
						<col style="width:12%;">
						<col style="width:41%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:11%;">
						<col style="width:11%;">
					</colgroup>
					<thead>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>등록일</th>
						<th>게시여부</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
				<div class="list-btr al-right">
					<a href="/admin/comRegi.do" class="btn btn-submit">등록</a>
				</div>
				
				<div class="paging" id="paging" style="display: none;"></div>
			</div>
		</div>
	</div>
	<form id="delFrm" action="comDele.do">
		<input type="hidden" id="noNtcPlteSral" name="noNtcPlteSral" value="" />
	</form>
	
	
	<input type="hidden" id="result" value="${result}" />
	<!-- container -->

<script type="text/javascript">
$(function() {
	fn_getList(startNum,endNum);
});

//목록
function fn_getList(sNum,eNum) {
	var searchType = $("#searchType").val();
	var searchData = $("#searchData").val();
	$.ajax({
        url : "/admin/comListAjax.do",
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
        	// console.log("data: " + JSON.stringify(data));
    		
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
	        		var regDt = dtRgst.substring(0,4) + "-" + dtRgst.substring(4,6) + "-" + dtRgst.substring(6,8);
	        		var ynNtcNm = "게시";
	        		
	        		if (data.resultList[i].ynNtc == "N") {
	        			ynNtcNm = "게시안함";
	        		}
	        		
		        	html += '<tr>';
		        	html += '	<td>' + (Number(data.cnt) - sNum - i + 1)  + '</td>';
		        	html += '	<td>' + clGbnNm + '</td>';
		        	html += '	<td class="al-left">' + data.resultList[i].sbjtNtcPlteEn + '</td>';
		        	html += '	<td>' + regDt + '</td>';
		        	html += '	<td>' + ynNtcNm  + '</td>';
		        	html += '	<td><a href="/admin/comModi2.do?noNtcPlteSral=' + data.resultList[i].noNtcPlteSral + '" class="btn btn-prim">수정</a></td>';
		        	html += '	<td><a href="javascript:;" class="btn btn-secon" onclick="javascript:comDel(' + data.resultList[i].noNtcPlteSral + '); return false;">삭제</a></td>';
		        	html += '</tr>';
	        	}
	        	
        		$.paginView(data.cnt);
	        	
	        	$("#paging").show();
        	} else {
        		html += "<tr><td style='text-align: center;' colspan='7'>검색 데이터가 없습니다.</td></tr>";
        		
        		$("#paging").hide();
        	}
        	
        	$("#tbody").html(html);
	       
        },
        error: function(xhr, textStatus, error) {
        	console.log(xhr.responseText);
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

//검색 엔터키 이벤트
function fn_searchList() {
    if (window.event.keyCode == 13) {
    	fn_resultSearchList();
    }
}

//검색
function fn_resultSearchList() {
	$.pagingSet();
	fn_getList(startNum,endNum);
}



$(document).ready(function() {
	
});

function comDel(no) {
	if (confirm("삭제하시겠습니까?")) {
		$("#noNtcPlteSral").val(no);
		$("#delFrm").submit();
	}
} 
</script>
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>