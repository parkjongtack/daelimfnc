<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
	<!-- //header -->

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">

			<h2>관리자등록</h2>

			<div class="search">
			<fieldset>
				<legend>게시물검색</legend>

				<select id="searchType" name="searchType" class="srhoption">
					<option value="">전체</option>
					<option value="1">아이디</option>
					<option value="2">부서</option>
					<option value="3">이름</option>
					<option value="4">이메일</option>
					<option value="5">휴대전화</option>
				</select>
				<input type="text" id="searchData" name="searchData" class="srhipt" onkeyup="javascript:fn_searchList();" placeholder="검색어를 입력해주세요.">
				<a href="javascript:;" class="btn btn-srh" onclick="javascript:fn_searchList();">조회</a>
			</fieldset>
			</div>

			<div class="gridwrap">

				<table class="brdList tbl-hasbtn">
					<colgroup>
						<col width="80px">
						<col>
						<col>
						<col>
						<col width="150px">
						<col width="140px">
						<col width="140px">
					</colgroup>
					<thead>				
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>부서</th>
							<th>이름</th>
							<th>상태</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>

				<div class="list-btr al-right">
					<a href="/admin/admRegi.do" class="btn btn-submit">등록</a>
				</div>

				<div class="paging" id="paging" style="display: none;"></div>
			</div>
		</div>
	</div>
	<!-- container -->

<script type="text/javascript">
	$(document).ready(function (e){
		fn_getList(startNum,endNum);
	});
		
	// 목록
	function fn_getList(sNum,eNum) {
		var searchType = $("#searchType").val();
		var searchData = $("#searchData").val();
		
		$.ajax({
	        url : "/admin/admListAjax.do",
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
			        	html += "	<td>" + (Number(data.resultList.length) - sNum - i + 1)  + "</td>";
			        	html += "	<td>" + data.resultList[i].idAdmnPrsn + "</td>";
			        	html += "	<td>" + data.resultList[i].nmDeptAdmnprsn + "</td>";
			        	html += "	<td>" + data.resultList[i].nmAdmnPrsn + "</td>";
			        	html += "	<td>";
			        	if(data.resultList[i].ynLinAble=='N') {
			        		html += "		<a href='#' class='btn btn-prim w-auto' onclick=\"javascript:fn_useRecovery('" + data.resultList[i].idAdmnPrsn + "');\">사용제한복구</a>";
			        	} else {
			        		html += "사용중";
			        	}
			        	html += "	</td>";
			        	html += "	<td><a href='/admin/admModi.do?idAdmnPrsn=" + data.resultList[i].idAdmnPrsn + "' class='btn btn-prim'>수정</a></td>";
			        	html += "	<td><a href='javascript:;' class='btn btn-secon' onclick='fn_admDelete(\""+data.resultList[i].idAdmnPrsn + "\");'>삭제</a></td>";
			        	html += "</tr>";
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
	
	// 사용제한복구
	function fn_useRecovery(idAdmnPrsn) {
		if(!confirm("사용제한을 복구하시겠습니까?")) {
			return;
		}
		
		$.ajax({
	        url : "/admin/admUseRecoveryAjax.do",
	        data: {
	        	idAdmnPrsn: idAdmnPrsn
        	},
	        type: 'POST',
	        dataType : "json",
	        beforeSend: function(xhr) {
				xhr.setRequestHeader("AJAX", "true");
			},
	        success: function(data) {
	        	// console.log(data.resultCd);
	        	
//	        	fn_searchList();
	        	window.location.reload(true);
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
	
	// 삭제
	function fn_admDelete(idAdmnPrsn) {
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		$.ajax({
	        url : "/admin/admDelAjax.do",
	        data: {
	        	idAdmnPrsn: idAdmnPrsn
        	},
	        type: 'POST',
	        dataType : "json",
	        beforeSend: function(xhr) {
				xhr.setRequestHeader("AJAX", "true");
			},
	        success: function(data) {
	        	// console.log(data.resultCd);
	        	alert("삭제가 완료되었습니다.");
	        	window.location.reload(true);
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