<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>

	<!-- //header -->

	<!-- container -->
	<div id="container">
		
		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">

			<h2>제품관리</h2>

			<div class="search">
			<fieldset>
				<legend>게시물검색</legend>

				<select id="searchType" name="searchType" class="srhoption">
					<option value="0">전체</option>
					<option value="1">제품구분</option>
					<option value="2">제품명</option>
					<option value="3">상세용도</option>
					<option value="4">두께</option>
					<option value="5">표면처리</option>
				</select>
				<input type="text" id="searchData" name="searchData" class="srhipt" onkeyup="javascript:fn_searchList();" placeholder="검색어를 입력해주세요.">
				<a href="#" class="btn btn-srh" onclick="javascript:fn_searchList(); return false;">조회</a>
			</fieldset>
			</div>

			<div class="gridwrap">

				<table class="brdList tbl-hasbtn">
				<colgroup>
					<col width="80px">
					<col>
					<col>
					<col>
					<col>
					<col width="140px">
					<col width="140px">
					<col width="140px">
				</colgroup>
				<thead>
				<tr>
					<th>번호</th>
					<th>제품구분</th>
					<th>제품용도</th>
					<th>제품명(GRADE)</th>
					<th>등록일</th>
					<th>게시여부</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				</thead>
				<tbody id="tbody">
				
				</tbody>
				</table>
				<!-- 
				<div class="list-btr al-right">
					<a href="/admin/bizRegi.do" class="btn btn-submit">등록</a>
				</div>
				 -->

				<div class="paging" id="paging" style="display: none;"></div>
			</div>
		</div>
	</div>
	<!-- container -->

<script type="text/javascript">
	$(function() {
		fn_getList(startNum,endNum);
	});
	
	// 목록
	function fn_getList(sNum,eNum) {
		var searchType = $("#searchType").val();
		var searchData = $("#searchData").val();
		
		$.ajax({
	        url : "/admin/bizListAjax2.do",
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
			        	html += "<tr>";
			        	html += "	<td>" + (Number(data.cnt) - sNum - i + 1)  + "</td>";
			        	html += "	<td>" + data.resultList[i].cdCtgr + "</td>";
			        	html += "	<td>" + data.resultList[i].cdPdCtUse + "</td>";
			        	html += "	<td>" + data.resultList[i].nmPdCt + "</td>";
			        	html += "	<td>" + data.resultList[i].dntCrtn + "</td>";
			        	html += "	<td>" + data.resultList[i].ynNtc + "</td>";
			        	html += "	<td><a href='/admin/bizModi2.do?noPrdtSral=" + data.resultList[i].noPrdtSral + "' class='btn btn-prim'>수정</a></td>";
			        	html += "	<td><a href='javascript:;' class='btn btn-secon'  onclick='javascript:fn_delete(" + data.resultList[i].noPrdtSral + ");'>삭제</a></td>";
			        	html += "</tr>";
			     
		        	}
		        	
	        		$.paginView(data.cnt);
		        	
		        	$("#paging").show();
	        	} else {
	        		html += "<tr><td style='text-align: center;' colspan='8'>검색 데이터가 없습니다.</td></tr>";
	        		
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
	
	// 페이징 처리
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
	
	// 삭제
	function fn_delete(noPrdtSral) {
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		$.ajax({
	        url : "/admin/bizDelAjax.do",
	        data: {
	        	noPrdtSral: noPrdtSral
        	},
	        type: 'POST',
	        dataType : "json",
	        beforeSend: function(xhr) {
				xhr.setRequestHeader("AJAX", "true");
			},
	        success: function(data) {
	        	// console.log(data.resultCd);
	        	
	        	fn_searchList();
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
</script>
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>