<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>


	<!-- //header -->

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">

			<h2>제품관리</h2>
			<s:form id="frm" action="/admin/bizModiExcute2.do" method="POST" enctype="multipart/form-data">
			<input type="hidden" id="atrb1" name="atrb1" value=""/>
			<!-- 
			<input type="text" id="noPrdtSral" name="noPrdtSral" value="${resultVo.noPrdtSral}"/>
			 -->
			<div class="gridwrap">
				<div class="hd_txt">
				<span class="expr">*</span> 항목은 필수입력입니다.
				</div>
				<table class="tblwrite">
				<colgroup>
					<col style="width:220px;"> <col >
				</colgroup>
				<tr>
					<th><span class="expr">*</span>제품구분</th>
					<td>
						<select class="srh-hpart" id="cdCtgr" name="cdCtgr">
							<option>제품선택</option>
							<option value="P4001" <c:if test="${resultVo.cdCtgr eq 'P4001'}">selected="selected"</c:if>>BOPP Film</option>
							<option value="P4002" <c:if test="${resultVo.cdCtgr eq 'P4002'}">selected="selected"</c:if>>EVA Coated Film</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><span class="expr">*</span>제품용도</th>
					<td>
						<select id="cdPdCtUse" class="srh-hpart"  name="cdPdCtUse">
							<option value="">제품용도선택</option>
							<option value="01" <c:if test="${resultVo.cdPdCtUse eq '01'}">selected="selected"</c:if>>인쇄/포장</option>
							<option value="02" <c:if test="${resultVo.cdPdCtUse eq '02'}">selected="selected"</c:if>>테이프</option>
							<option value="03" <c:if test="${resultVo.cdPdCtUse eq '03'}">selected="selected"</c:if>>일반합지</option>
							<option value="04" <c:if test="${resultVo.cdPdCtUse eq '04'}">selected="selected"</c:if>>Thermal용 합지</option>
							<option value="05" <c:if test="${resultVo.cdPdCtUse eq '05'}">selected="selected"</c:if>>기능성</option>
							<option value="06" <c:if test="${resultVo.cdPdCtUse eq '06'}">selected="selected"</c:if>>EVA</option>
						</select>

						<div class="chklist" id="op1">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="A00|" name="atrb" value="A00|" ${resultVo.atrb1 == "A00|" ? "CHECKED" : ""}><label for="A00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="A01|" name="atrb" value="A01|" ${resultVo.atrb1 == "A01|" ? "CHECKED" : ""}><label for="A01|">인쇄</label></li>
								<li class="radio-box"><input type="radio" id="A02|" name="atrb" value="A02|" ${resultVo.atrb1 == "A02|" ? "CHECKED" : ""}><label for="A02|">포장</label></li>
								<li class="radio-box"><input type="radio" id="A03|" name="atrb" value="A03|" ${resultVo.atrb1 == "A03|" ? "CHECKED" : ""}><label for="A03|">내열인쇄</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op2">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="B00|" name="atrb" value="B00|" ${resultVo.atrb1 == "B00|" ? "CHECKED" : ""}><label for="B00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="B01|" name="atrb" value="B01|" ${resultVo.atrb1 == "B01|" ? "CHECKED" : ""}><label for="B01|">테이프</label></li>
								<li class="radio-box"><input type="radio" id="B02|" name="atrb" value="B02|" ${resultVo.atrb1 == "B02|" ? "CHECKED" : ""}><label for="B02|">컬러테이프</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op3">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="C00|" name="atrb" value="C00|" ${resultVo.atrb1 == "C00|" ? "CHECKED" : ""}><label for="C00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="C01|" name="atrb" value="C01|" ${resultVo.atrb1 == "C01|" ? "CHECKED" : ""}><label for="C01|">무광합지</label></li>
								<li class="radio-box"><input type="radio" id="C02|" name="atrb" value="C02|" ${resultVo.atrb1 == "C02|" ? "CHECKED" : ""}><label for="C02|">유광합지</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op4">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="D00|" name="atrb" value="D00|" ${resultVo.atrb1 == "D00|" ? "CHECKED" : ""}><label for="D00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="D01|" name="atrb" value="D01|" ${resultVo.atrb1 == "D01|" ? "CHECKED" : ""}><label for="D01|">무광 D.T.L</label></li>
								<li class="radio-box"><input type="radio" id="D02|" name="atrb" value="D02|" ${resultVo.atrb1 == "D02|" ? "CHECKED" : ""}><label for="D02|">유광 D.T.L</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op5">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="E00|" name="atrb" value="E00|" ${resultVo.atrb1 == "E00|" ? "CHECKED" : ""}><label for="E00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="E01|" name="atrb" value="E01|" ${resultVo.atrb1 == "E01|" ? "CHECKED" : ""}><label for="E01|">방담</label></li>
								<li class="radio-box"><input type="radio" id="E02|" name="atrb" value="E02|" ${resultVo.atrb1 == "E02|" ? "CHECKED" : ""}><label for="E02|">열접착</label></li>
								<li class="radio-box"><input type="radio" id="E03|" name="atrb" value="E03|" ${resultVo.atrb1 == "E03|" ? "CHECKED" : ""}><label for="E03|">담배</label></li>
								<li class="radio-box"><input type="radio" id="E04|" name="atrb" value="E04|" ${resultVo.atrb1 == "E04|" ? "CHECKED" : ""}><label for="E04|">빨대포장</label></li>
								<li class="radio-box"><input type="radio" id="E05|" name="atrb" value="E05|" ${resultVo.atrb1 == "E05|" ? "CHECKED" : ""}><label for="E05|">White</label></li>
								<li class="radio-box"><input type="radio" id="E06|" name="atrb" value="E06|" ${resultVo.atrb1 == "E06|" ? "CHECKED" : ""}><label for="E06|">합성지</label></li>
								<li class="radio-box"><input type="radio" id="E07|" name="atrb" value="E07|" ${resultVo.atrb1 == "E07|" ? "CHECKED" : ""}><label for="E07|">데코시트</label></li>
								<li class="radio-box"><input type="radio" id="E08|" name="atrb" value="E08|" ${resultVo.atrb1 == "E08|" ? "CHECKED" : ""}><label for="E08|">Anti_Scuff</label></li>
								<li class="radio-box"><input type="radio" id="E09|" name="atrb" value="E09|" ${resultVo.atrb1 == "E09|" ? "CHECKED" : ""}><label for="E09|">Soft Feel</label></li>
								<li class="radio-box"><input type="radio" id="E10|" name="atrb" value="E10|" ${resultVo.atrb1 == "E10|" ? "CHECKED" : ""}><label for="E10|">내열/리딩</label></li>
								<li class="radio-box"><input type="radio" id="E11|" name="atrb" value="E11|" ${resultVo.atrb1 == "E11|" ? "CHECKED" : ""}><label for="E11|">세미매트</label></li>
								<li class="radio-box"><input type="radio" id="E12|" name="atrb" value="E12|" ${resultVo.atrb1 == "E12|" ? "CHECKED" : ""}><label for="E12|">앨범</label></li>
								<li class="radio-box"><input type="radio" id="E13|" name="atrb" value="E13|" ${resultVo.atrb1 == "E13|" ? "CHECKED" : ""}><label for="E13|">영구대전방지</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op6">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="F00|" name="atrb" value="F00|" ${resultVo.atrb1 == "F00|" ? "CHECKED" : ""}><label for="F00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="F01|" name="atrb" value="F01|" ${resultVo.atrb1 == "F01|" ? "CHECKED" : ""}><label for="F01|">무광 EVA</label></li>
								<li class="radio-box"><input type="radio" id="F02|" name="atrb" value="F02|" ${resultVo.atrb1 == "F02|" ? "CHECKED" : ""}><label for="F02|">유광 EVA</label></li>
								<li class="radio-box"><input type="radio" id="F03|" name="atrb" value="F03|" ${resultVo.atrb1 == "F03|" ? "CHECKED" : ""}><label for="F03|">EVA Anti Suff</label></li>
								<li class="radio-box"><input type="radio" id="F04|" name="atrb" value="F04|" ${resultVo.atrb1 == "F04|" ? "CHECKED" : ""}><label for="F04|">EVA Soft Feel</label></li>
								
							</ul>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="expr">*</span>제품명(GRADE)</th>
					<td>
						<input type="text" id="nmPdCt" name="nmPdCt" class="iptful" value="${resultVo.nmPdCt}">
					</td>
				</tr>
				<tr>
					<th>상세용도(영문)</th>
					<td>
						<textarea class="textarea-basic" id="atrb2" name="atrb_2_en" >${resultVo.atrb_2_en}</textarea>
					</td>
				</tr>
				<tr>
					<th>두께</th>
					<td>
						<input type="text" id="atrb3" name="atrb3" class="iptful" placeholder="" value="${resultVo.atrb3}">
					</td>
				</tr>
				<tr>
					<th>표면처리(영문)</th>
					<td>
						<input type="text" id="atrb4" name="atrb_4_en" class="iptful" placeholder="" value="${resultVo.atrb_4_en}">
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<div class="filebox">
						<input type="hidden" name="noAtchFileSral" value="${resultVo.noAtchFileSral}"/>	<!-- 파일 묶음 일련번호 -->
						<ul>
							<li>
								<div class="filebox-tit">
									<span>전체</span>
									<input class="upload-name fileName" name="fileName" value="${resultVo.fileName1}" disabled="disabled">
									<input type="hidden" id="orgFile1" name="orgFile" value="${resultVo.fileName1}" disabled="disabled">
									<input type="hidden" class="fileStatus" name="fileStatus" value="C"/>	<!-- 파일 상태값 => C:그대로, N: 신규, M: 수정, D: 수정 -->
									<input type="file" id="inputFile1" name="uploads" class="upload-hidden">
									<input type="hidden" class="noAtchFileDtilSral1" name="noAtchFileDtilSral" value="${resultVo.noAtchFileDtilSral1}"/>
									<input type="hidden" id="clFile1" name="clFile" value="1" >
								</div>
								<div class="btnr">
									<label for="inputFile1">파일첨부</label> 
									<a href="#" class="btn btn-del btnFileDel">삭제</a>
								</div>
							</li>
							<li>
								<div class="filebox-tit">
									<span>MSDS</span>
									<input class="upload-name fileName" name="fileName" value="${resultVo.fileName2}" disabled="disabled">
									<input type="hidden" id="orgFile2" name="orgFile" value="${resultVo.fileName2}" disabled="disabled">
									<input type="hidden" class="fileStatus" name="fileStatus" value="C"/>	<!-- 파일 상태값 => C:그대로, N: 신규, M: 수정, D: 수정 -->
									<input type="file" id="inputFile2" name="uploads" class="upload-hidden">
									<input type="hidden" class="noAtchFileDtilSral2" name="noAtchFileDtilSral" value="${resultVo.noAtchFileDtilSral2}"/>
									<input type="hidden" id="clFile2" name="clFile" value="2" >
								</div>
								<div class="btnr">
									<label for="inputFile2">파일첨부</label> 
									<a href="#" class="btn btn-del btnFileDel">삭제</a>
								</div>
							</li>
							<li>
								<div class="filebox-tit">
									<span>FDA</span>
									<input class="upload-name fileName" name="fileName" value="${resultVo.fileName3}" disabled="disabled">
									<input type="hidden" id="orgFile3" name="orgFile" value="${resultVo.fileName3}" disabled="disabled">
									<input type="hidden" class="fileStatus" name="fileStatus" value="C"/>	<!-- 파일 상태값 => C:그대로, N: 신규, M: 수정, D: 수정 -->
									<input type="file" id="inputFile3" name="uploads" class="upload-hidden">
									<input type="hidden" class="noAtchFileDtilSral3" name="noAtchFileDtilSral" value="${resultVo.noAtchFileDtilSral3}"/>
									<input type="hidden" id="clFile3" name="clFile" value="3" >
								</div>
								<div class="btnr">
									<label for="inputFile3">파일첨부</label> 
									<a href="#" class="btn btn-del btnFileDel">삭제</a>
								</div>
							</li>
							<li>
								<span class="upload-span">- 첨부파일은 전체파일 합계 50MB 이하로 등록</span>
							</li>
						</ul>
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="expr">*</span>게시여부</th>
					<td>
						<select class="srh-hpart" name="ynNtc" id="ynNtc">
							<option>게시여부선택</option>
							<option value="Y" <c:if test="${resultVo.ynNtc eq 'Y'}">selected="selected"</c:if>>게시</option>
							<option value="N" <c:if test="${resultVo.ynNtc eq 'N'}">selected="selected"</c:if>>게시중지</option>
						</select>
					</td>
				</tr>
				</table>
				
				<div class="bot-btn">
					<a href="javascript:;" class="btn btn-submit" onclick="javascript:fn_modi();">확인</a>
					<a href="/admin/bizList.do" class="btn btn-cancel">취소</a>
				</div>
			</div>
			<input type="hidden" id="noPrdtSral" name="noPrdtSral" value="${resultVo.noPrdtSral}">
		</s:form>
		</div>

	</div>
	<!-- container -->
<script type="text/javascript">
window.onload = function() {
	 hide();
	 show();
}
function hide(){
	$("#op1").find("div").hide();
	$("#op2").find("div").hide();
	$("#op3").find("div").hide();
	$("#op4").find("div").hide();
	$("#op5").find("div").hide();
	$("#op6").find("div").hide();
}

function show() {
	var cdPdCtUse = $("#cdPdCtUse option:selected").val();
	console.log(cdPdCtUse);
	if(cdPdCtUse == '01'){
		$("#op1").find("div").show();
	} else if(cdPdCtUse == '02') {
		$("#op2").find("div").show();
	} else if(cdPdCtUse == '03') {
		$("#op3").find("div").show();
	} else if(cdPdCtUse == '04') {
		$("#op4").find("div").show();
	} else if(cdPdCtUse == '05') {
		$("#op5").find("div").show();
	} else if(cdPdCtUse == '06') {
		$("#op6").find("div").show();
	}
}

$(".btnFileDel").on("click", function(e) {
	e.preventDefault();
	if (confirm("삭제하시겠습니까?")) {
		var $this = $(this).parent().parent();
		
		$this.find(".fileName").val("");
		$this.find('input[name="uploads"]').val("");
		$this.find('.isFile').val("Y");
		
		if ($this.find('.noAtchFileDtilSral').val() == '' || $this.find('.noAtchFileDtilSral').val() == '0') {
			$this.find('.noAtchFileDtilSral').val("");
			$this.find('.fileStatus').val("N");	// 파일 상태 신규로 변경
		} else {
			$this.find('.fileStatus').val("D");	// 파일 상태 삭제로 변경
		}
	}
});

$( function() {
	$("#cdPdCtUse").on('change', function() {
		var option = this.value;
		if(option == ""){
			$("#op1").find("div").hide();
			$("#op2").find("div").hide();
			$("#op3").find("div").hide();
			$("#op4").find("div").hide();
			$("#op5").find("div").hide();
			$("#op6").find("div").hide();
			$("input[type=radio]").prop("checked",false);
		} else if(option == "01"){
			$("#op1").find("div").show();
			$("#op2").find("div").hide();
			$("#op3").find("div").hide();
			$("#op4").find("div").hide();
			$("#op5").find("div").hide();
			$("#op6").find("div").hide();
			$("input[type=radio]").prop("checked",false);
		} else if(option == "02"){
			$("#op1").find("div").hide();
			$("#op2").find("div").show();
			$("#op3").find("div").hide();
			$("#op4").find("div").hide();
			$("#op5").find("div").hide();
			$("#op6").find("div").hide();
			$("input[type=radio]").prop("checked",false);
		} else if(option == "03"){
			$("#op1").find("div").hide();
			$("#op2").find("div").hide();
			$("#op3").find("div").show();
			$("#op4").find("div").hide();
			$("#op5").find("div").hide();
			$("#op6").find("div").hide();
			$("input[type=radio]").prop("checked",false);
		} else if(option == "04"){
			$("#op1").find("div").hide();
			$("#op2").find("div").hide();
			$("#op3").find("div").hide();
			$("#op4").find("div").show();
			$("#op5").find("div").hide();
			$("#op6").find("div").hide();
			$("input[type=radio]").prop("checked",false);
		} else if(option == "05"){
			$("#op1").find("div").hide();
			$("#op2").find("div").hide();
			$("#op3").find("div").hide();
			$("#op4").find("div").hide();
			$("#op5").find("div").show();
			$("#op6").find("div").hide();
			$("input[type=radio]").prop("checked",false);
		} else if(option == "06"){
			$("#op1").find("div").hide();
			$("#op2").find("div").hide();
			$("#op3").find("div").hide();
			$("#op4").find("div").hide();
			$("#op5").find("div").hide();
			$("#op6").find("div").show();
			$("input[type=radio]").prop("checked",false);
		}
	});
});

// 확인
function fn_modi() {
	
	var cdCtgr = document.getElementById("cdCtgr");
	var cdPdCtUse = document.getElementById("cdPdCtUse");
	var nmPdCt = document.getElementById("nmPdCt");
	var ynNtc = document.getElementById("ynNtc");
		
	if( cdCtgr.value == "" || cdCtgr.value == null || cdCtgr.value == undefined) {
		alert("제품구분을 선택해주세요");
		cdCtgr.focus();
		return false;
	}
	if( cdPdCtUse.value == "" || cdPdCtUse.value == null || cdPdCtUse.value == undefined) {
		alert("제품용도를 선택해주세요");
		cdPdCtUse.focus();
		return false;
	}
	if( $("input:radio[name=atrb]:checked").length < 1) {
		alert("제품속성을 선택해주세요");
		cdPdCtUse.focus();
		return false;
	} else {
		$("#atrb1").val($("input:radio[name=atrb]:checked").val());
	}
	if( $("#nmPdCt").val() == "") {
		alert("제품명을 입력해주세요");
		nmPdCt.focus();
		return false;
	}
	if( ynNtc.value == "" || ynNtc.value == null || ynNtc.value == undefined) {
		alert("게시여부를 선택해주세요");
		ynNtc.focus();
		return false;
	}
	

	for (var i=0; i < $("input[name=uploads]").length; i++) {
		if ($("input[name=uploads]:eq("+i+")").val() != "") {
			if ($("input[name=noAtchFileDtilSral]:eq("+i+")").val() == "") {
				$("input[name=fileStatus]:eq("+i+")").val("N");
			} else {
				$("input[name=fileStatus]:eq("+i+")").val("M");
			}
		}
	}
	
	$("#frm").submit();
}
	
// 취소
function fn_cancel() {
	location.href = "/admin/bizList.do";
}
</script>

<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>