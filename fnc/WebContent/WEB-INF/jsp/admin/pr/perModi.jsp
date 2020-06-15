<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
		<!-- //header -->

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">
			<h2>개인정보관리</h2>
			<form id="frm" action="perModiExcute.do" method="POST" enctype="multipart/form-data">
				<input type="hidden" id="noNtcPlteSral" name="noNtcPlteSral" value="${resultVo.noNtcPlteSral}"/>
				<input type="hidden" name="noAtchFileSral" value="${resultVo.noAtchFileSral}"/>
			<div class="gridwrap">
				<div class="hd_txt">
					<span class="expr">*</span> 항목은 필수입력입니다.
				</div>
				<table class="tblwrite">
					<colgroup>
						<col style="width:220px;">
						<col >
					</colgroup>
					<tbody>
						<tr>
							<th><span class="expr">*</span>제목</th>
							<td>
								<input type="text" id="title" name="sbjtNtcPlte" class="iptful" placeholder="" value="${resultVo.sbjtNtcPlte}">
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>등록일</th>
							<td>
								<input type="text" id="dtRgst" name="dtRgst" class="datepicker dateType" value="${fn:substring(resultVo.dtRgst,0,4)}-${fn:substring(resultVo.dtRgst,4,6)}-${fn:substring(resultVo.dtRgst,6,8)}" readOnly>
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>내용</th>
							<td>
								<textarea class="textarea-basic edit-type"  id="txtContent" name="cntsNtcPlte">${resultVo.cntsNtcPlte}</textarea>
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>게시여부</th>
							<td>
								<select class="srh-hpart" id="ynNtc" name="ynNtc">
									<option value="">게시여부선택</option>
									<option value="Y" <c:if test="${resultVo.ynNtc eq 'Y'}">selected="selected"</c:if>>게시함</option>
									<option value="N" <c:if test="${resultVo.ynNtc eq 'N'}">selected="selected"</c:if>>게시안함</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="bot-btn">
					<a href="#" class="btn btn-submit" id="btnSubmit">확인</a>
					<a href="/admin/perList.do" class="btn btn-cancel">취소</a>
				</div>

			</div>
			</form> <!-- form END -->

		</div>

	</div>
	<!-- container -->
<script type="text/javascript">
$(document).ready(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors, 
		elPlaceHolder: 'txtContent',
		sSkinURI: '../../static/admin/editor/SmartEditor2Skin.html', 
		fCreator: 'createSEditor2',
        fOnAppLoad : function() {
            oEditors.getById['txtContent'].setDefaultFont("돋움", 18);    
        }
	});
/*	
	$('input[name="uploads"]').on("change", function() {
		var $this = $(this).parent();
		if ($this.find('.noAtchFileDtilSral').val() == '' || $this.find('.noAtchFileDtilSral').val() == '0') {
			$this.find('.noAtchFileDtilSral').val('0');
			$this.find('.fileStatus').val("N"); // 파일 상태 신규로 변경
		} else {
			$this.find('.fileStatus').val("M"); // 파일 상태 수정으로 변경
		}
	});
		
	$(".btnFileDel").on("click", function(e) {
		e.preventDefault();
		if (confirm("삭제하시겠습니까?")) {
			var $this = $(this).parent().parent();
			
			$this.find(".fileName").val("");
			$this.find('input[name="inputFile"]').val("");
			$this.find('.isFile').val("Y");
			
			if ($this.find('.noAtchFileDtilSral').val() == '' || $this.find('.noAtchFileDtilSral').val() == '0') {
				$this.find('.noAtchFileDtilSral').val("");
				$this.find('.fileStatus').val("N");	// 파일 상태 신규로 변경
			} else {
				$this.find('.fileStatus').val("D");	// 파일 상태 삭제로 변경
			}
		}
	});

	$("#dtBegnc").on("change", function() {
		var startDate = $("#dtBegnc").val(); //2017-12-10
        var startDateArr = startDate.split('/');
         
        var endDate = $("#dtEnd").val() //2017-12-09
        var endDateArr = endDate.split('/');
		
        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
        
        if(startDateCompare.getTime() > endDateCompare.getTime()) {
            alert("접수 시작일이 종료일보다 클 수 없습니다.");
            
            $("#dtBegnc").val($("#dtEnd").val());
            return;
        }
	});
	
	$("#dtEnd").on("change", function() {
		var startDate = $("#dtBegnc").val(); //2017-12-10
        var startDateArr = startDate.split('/');
         
        var endDate = $("#dtEnd").val() //2017-12-09
        var endDateArr = endDate.split('/');
		
        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
        
        if(startDateCompare.getTime() > endDateCompare.getTime()) {
            alert("접수 종료일이 시작일보다 작을 수 없습니다.");
            
            $("#dtEnd").val($("#dtBegnc").val());
            return;
        }
	});
*/	
	$("#btnSubmit").on("click", function(e){
		e.preventDefault();
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
		
		/* validation check : start */
		var title = $("#title").val();					// 제목
		var dtRgst = $("#dtRgst").val();				// 등록일
		var ynNtc = $("#ynNtc").val();					// 게시여부
//		var dtBegnc = $("#dtBegnc").val();				// 접수 시작일
//		var dtEnd = $("#dtEnd").val();						// 접수 종료일
		
		if (title == undefined || title == null || title == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus()
			return false;
		}
		
		if (dtRgst == undefined || dtRgst == null || dtRgst == "") {
			alert("작성일을 입력해주세요. ex)20200101");
			$("#dtRgst").focus();
			return false;
		}
/*		
		if (dtBegnc == undefined || dtBegnc == null || dtBegnc == "") {
			alert("접수 시작일을 입력해주세요. ex)20200101");
			$("#dtBegnc").focus();
			return false;
		}
		
		if (dtEnd == undefined || dtEnd == null || dtEnd == "") {
			alert("접수 종료일을 입력해주세요. ex)20200101");
			$("#dtEnd").focus();
			return false;
		}
*/		
		if ($("#txtContent").val() == "<p><br></p>") {
			alert("내용을 입력해주세요.");
			oEditors.getById["txtContent"].exec("FOCUS");
			return false;
		}
		
		if (ynNtc == undefined || ynNtc == null || ynNtc == "") {
			alert("게시여부를 선택해주세요.");
			$("#ynNtc").focus();
			return false;
		}
		
		
		
		//replace함수
		fn_replaceDate();
		$("#frm").submit();
	});
});

//날짜 "/"제거
function fn_replaceDate(){
	$(".dateType").each(function(idx,item){
		var dateBefore = $(item).val() ; 
		var dateAfter = dateBefore.replace(/-/gi, "");
		$(item).val(dateAfter);
	});
}
</script>
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>
