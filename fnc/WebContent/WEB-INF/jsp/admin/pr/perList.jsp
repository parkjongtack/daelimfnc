<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
		<!-- //header -->

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>


		<div id="contents">
			<h2>개인정보관리</h2>
			<div class="search">
				<fieldset>
					<legend>게시물검색</legend>
					<select id="searchType" name="searchType" class="srhoption">
						<option value="0" selected="selected">전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select>
					<input type="text" id="searchData" name="searchData" class="srhipt" onkeyup="javascript:fn_searchList();" placeholder="검색어를 입력해주세요.">
					<a href="#" class="btn btn-srh" onclick="javascript:fn_searchList(); return false;">조회</a>
				</fieldset>
			</div>
			<div class="gridwrap">
				<table class="brdList tbl-hasbtn">
					<colgroup>
						<col style="width:5%;">
						<col style="width:53%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:11%;">
						<col style="width:11%;">
					</colgroup>
					<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>게시여부</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
				<div class="list-btr al-right">
					<a href="/admin/perRegi.do" class="btn btn-submit">등록</a>
				</div>
				<div class="paging"></div>
			</div>
			
		</div>
		<form id="delFrm" action="perDele.do">
			<input type="hidden" id="noNtcPlteSral" name="noNtcPlteSral" value="" />
		</form>

	</div>
	<!-- container -->
	
<script>
$(document).ready(function() {
	fn_getList(startNum,endNum);
});

$(function() {
	fn_getList(startNum,endNum);
});

function fn_getList(sNum,eNum){
	var searchType = $("#searchType").val();
	var searchData = $("#searchData").val();
//	var searchStat = $("#searchStat").val();
	console.log("searchData",searchData);
	
	$.ajax({
        url : "/admin/perListAjax.do",
        type: 'POST',
        data: {
	        	searchType: searchType,
	    		searchData: searchData,
//	    		searchStat : searchStat,
        		sNum: sNum,
        		eNum: eNum
        },
        dataType : "json",
        beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
		},
        success: function(data) {
        	var html = "";
        	console.log("ㅎㅎ",data.resultList);
        	if(data.resultList != null && data.resultList.length>0){
        		for(var i = 0; i < data.resultList.length; i++){
        			var statNtc = data.resultList[i].statNtc;	 //상태 정보
        			var statNtcNm = ""; 						 // 1.대기 2.진행중 3.접수마감
        			
        			if(statNtc==1){
        				statNtcNm = '대기';
        			}else if(statNtc==2){
        				statNtcNm = '접수중';
        			}else if(statNtc==3){
        				statNtcNm = '접수마감';
        			}
        			
        			var dtRgst = data.resultList[i].dtRgst;
	        		var regDt = dtRgst.substring(0,4) + "-" + dtRgst.substring(4,6) + "-" + dtRgst.substring(6,8);
	        		
					var ynNtcNm = "게시";
	        		if (data.resultList[i].ynNtc == "N") {
	        			ynNtcNm = "게시안함";
	        		}
	        		
	        		
	        		html += '<tr>';
		        	html += '	<td>' + (Number(data.cnt) - sNum - i + 1)  + '</td>';
		        	html += '	<td class="al-left">' + data.resultList[i].sbjtNtcPlte + '</td>';
		        	html += '	<td>' + regDt + '</td>';
//		        	html += '	<td>' + statNtcNm + '</td>';
		        	html += '	<td>' + ynNtcNm  + '</td>';
		        	html += '	<td><a href="/admin/perModi.do?noNtcPlteSral=' + data.resultList[i].noNtcPlteSral + '" class="btn btn-prim">수정</a></td>';
		        	html += '	<td><a href="javascript:;" class="btn btn-secon" onclick="javascript:perDel('+ data.resultList[i].noNtcPlteSral +'); return false;">삭제</a></td>';
		        	html += '</tr>';
        		}
        		console.log("CNT",data.cnt);
        		$.paginView(data.cnt);
        		$("#paging").show();
        	}else{
        		html += "<tr><td style='text-align: center;' colspan='7'>검색 데이터가 없습니다.</td></tr>";
        		$("#paging").hide();
        	}
        	
        	$("#tbody").html(html);
        	
        },error: function(xhr, textStatus, error) {
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
//삭제
function perDel(no){
	if(confirm("삭제하시겠습니까?")){
		$("#noNtcPlteSral").val(no);
		$("#delFrm").submit();
	}
}


</script>	
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>