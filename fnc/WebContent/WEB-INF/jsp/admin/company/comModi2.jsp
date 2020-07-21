<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
		<!-- //header -->

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">
			<h2>회사소식관리</h2>
			<s:form id="frm" action="modiExcute2.do" method="POST" enctype="multipart/form-data">
				<input type="hidden" id="noNtcPlteSral" name="noNtcPlteSral" value="${resultVo.noNtcPlteSral}"/>
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
								<th><span class="expr">*</span>제목(영문)</th>
								<td>
									<input type="text" id="title" name="sbjtNtcPlteEn" class="iptful" placeholder="" value="${resultVo.sbjtNtcPlteEn}">
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>구분</th>
								<td>
									<select class="srh-hpart" id="comGroup" name="clGbn">
										<option value="">구분선택</option>
										<option value="01" <c:if test="${resultVo.clGbn eq '01'}">selected="selected"</c:if>>Notice</option>
										<option value="02" <c:if test="${resultVo.clGbn eq '02'}">selected="selected"</c:if>>Program/Event</option>
										<option value="03" <c:if test="${resultVo.clGbn eq '03'}">selected="selected"</c:if>>Award</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>등록일</th>
								<td>
									<input type="text" id="regDate" name="dtRgst" class="datepicker" value="${fn:substring(resultVo.dtRgst,0,4)}-${fn:substring(resultVo.dtRgst,4,6)}-${fn:substring(resultVo.dtRgst,6,8)}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>썸네일 이미지<span class="expr-bt-txt">(316*190)</span></th>
								<td>
									<div class="filebox">
										<ul>
											<li>
												<input class="upload-name" id="thumbName" disabled="disabled" value="${thumbVoList[0].nmLogiFile}">
												<input type="file" id="thumbFile" name="uploadsThum" class="upload-hidden">
												<input type="hidden" id="thumbYn" name="thumbYn" value="N"/>
												<input type="hidden" id="thumbFileSeq" name="noAtchFileThumSral" value="${thumbVoList[0].noAtchFileDtilSral}"/>
												<div class="btnr">
													<label for="thumbFile">찾아보기</label> 
													<a href="#" class="btn btn-del" id="thumbDel">삭제</a>
												</div>
											</li>
										</ul>
									</div>
									<input type="text" id="cntsFileDtil" name="cntsFileDtil" class="iptful inline-space" placeholder="대체텍스트 입력" value="${thumbVoList[0].cntsFileDtil}">
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>요약설명(영문)</th>
								<td>
									<textarea class="textarea-basic" id="cntsSmry" name="cntsSmryEn">${resultVo.cntsSmryEn}</textarea>
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>내용(영문)</th>
								<td>
									<textarea class="textarea-basic edit-type" id="txtContent" name="cntsNtcPlteEn">${resultVo.cntsNtcPlteEn}</textarea>
								</td>
							</tr>
 							<tr>
 								<th>첨부파일</th>
 								<td>
 									<div class="filebox">
									<input type="hidden" name="noAtchFileSral" value="${resultVo.noAtchFileSral}"/>	<!-- 파일 묶음 일련번호 -->
 										<ul>
										<c:forEach items="${fileVoList}" var="fileList" varStatus="status">
 												<li>
												<input class="upload-name fileName" value="${fileList.nmLogiFile}" disabled="disabled">
 													<input type="hidden" class="fileStatus" name="fileStatus" value="C"/>	<!-- 파일 상태값 => C:그대로, N: 신규, M: 수정, D: 수정 -->
												<input type="hidden" class="noAtchFileDtilSral" name="noAtchFileDtilSral" value="${fileList.noAtchFileDtilSral}"/>
												<input type="file" id="inputFile${status.count}" name="uploads" class="upload-hidden">
 													<div class="btnr">
 														<label for="inputFile1">찾아보기</label>
 														<a href="#" class="btn btn-del btnFileDel">삭제</a>
 													</div>
 												</li>
										</c:forEach>
										<c:forEach begin="${fn:length(fileVoList) + 1}" end="3" var="fileIndex" varStatus="toStatus">
 												<li>
 													<input class="upload-name fileName" disabled="disabled">
 													<input type="hidden" class="fileStatus" name="fileStatus" value="N"/>
 													<input type="hidden" class="noAtchFileDtilSral" name="noAtchFileDtilSral" value=""/>
												<input type="file" id="inputFile${fileIndex}" name="uploads" class="upload-hidden">
 													<div class="btnr">
													<label for="inputFile${fileIndex}">찾아보기</label> 
 														<a href="#" class="btn btn-del btnFileDel">삭제</a>
 													</div>
 												</li>
										</c:forEach>
 										</ul>
 									</div>
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
						<a href="#" id="btnSubmit" class="btn btn-submit">확인</a>
						<a href="/admin/comList.do" id="btnCancel" class="btn btn-cancel">취소</a>
					</div>
	
				</div>
			</s:form>
		</div>

	</div>
	<!-- container -->

<script type="text/javascript">
$(document).ready(function() {
	$("#thumbFile").on("change", function() {
		if ($(this).val() != "") {
			// 확장자 체크
			var ext = $(this).val().split(".").pop().toLowerCase();
			if ($.inArray(ext, ["jpg", "jpeg", "gif", "bmp"]) == -1) {
				alert("jpg, jpeg, gif, bmp 파일만 업로드 해주세요.");
				$(this).val("");
				return;
			}
			
			// 파일 용량 체크
			/* 
			var fileSize = this.files[0].size;
			var maxSize = 1 * 1024 * 1024;
			if (fileSize > maxSize) {
				alert("파일 용량이 1Mb를 초과했습니다.");
				$(this).val("");
				return;
			}
			 */
			 
			// 가로, 세로 사이즈 체크
			var file = this.files[0];
			var _URL = window.URL || window.webkitURL;
			var img = new Image();
			
			img.src = _URL.createObjectURL(file);
			img.onload = function() {
				if (img.width > 316) {
					alert("이미지 가로 길이가 316px를 초과했습니다.");
					return;
				}
				
				if (img.height > 190) {
					alert("이미지 세로 길이가 190px를 초과했습니다.");
					return;
				}
			}
			$("#thumbYn").val("Y");
		}
	});
	
	$("#thumbDel").on("click", function(e) {
		e.preventDefault();
		if (confirm("썸네일 이미지를 삭제하시겠습니까?")) {
			$("#thumbName").val("");
			$("#thumbFile").val("");
			$("#cntsFileDtil").val("");
			$("#thumbFileSeq").val("");
			$("#thumbYn").val("Y");
		}
	});
	
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
	
	
	$("#btnSubmit").on("click", function(e) {
		e.preventDefault();
		// 에디터 데이터 세팅
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
		var editorData = $("#txtContent").val();
		
		/* validation check : start */
		var title = $("#title").val();					// 제목
		var comGroup = $("#comGroup").val();			// 구분
		var regDate = $("#regDate").val();				// 등록일
		var $thumbFile = $("#thumbFile");				// 섬네일 파일
		var cntsFileDtil = $("#cntsFileDtil").val();	// 섬네일 대체택스트
		var cntsSmry = $("#cntsSmry").val();			// 요약설명
		var ynNtc = $("#ynNtc").val();					// 게시여부
		
		if (title == undefined || title == null || title == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus()
			return false;
		}
		
		if (comGroup == "") {
			alert("구분을 선택해주세요.");
			$("#comGroup").focus();
			return false;
		}
		
		if (regDate == undefined || regDate == null || regDate == "") {
			alert("등록일을 입력해주세요. ex)20200101");
			$("#regDate").focus();
			return false;
		}
		
		if ($("#thumbYn").val() == 'Y' && ($thumbFile.val() == undefined || $thumbFile.val() == null || $thumbFile.val() == "")) {
			alert("썸네일 이미지를 등록해주세요.");
			$thumbFile.focus();
			return false;
		}
		
		if (cntsFileDtil == undefined || cntsFileDtil == null || cntsFileDtil == "") {
			alert("썸네일 이미지 대체텍스트를 입력해주세요.");
			$("#cntsFileDtil").focus();
			return false;
		}
		
		if (cntsSmry == undefined || cntsSmry == null || cntsSmry == "") {
			alert("요약설명을 입력해주세요.");
			$("#cntsSmry").focus();
			return false;
		}
		
		if (editorData == "<p><br></p>") {
			alert("내용을 입력해주세요.");
			oEditors.getById["txtContent"].exec("FOCUS");
			return false;
		}
		
		if (ynNtc == undefined || ynNtc == null || ynNtc == "") {
			alert("게시여부를 선택해주세요.");
			$("#ynNtc").focus();
			return false;
		}

		/**  프론트 미개발로 첨부파일 업로드 임시 정지 - 추후 프론트 개발시 주석 삭제  */
		/* validation check : end */
// 		var length = $(".noAtchFileDtilSral").length - 1;
// 		$(".noAtchFileDtilSral").each(function(i) {
// 			if ($(this).val() == '') {
// 				$(this).parent().find(".fileStatus").remove();
// 				$(this).remove();
// 			}
// 			if (length == i) {
// 				console.log("종료구문");
// 				$("#frm").submit();
// 			}
// 		});
		
		$("#frm").submit();
		// console.log("submit ok");
	});
	
	
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
	
});

function delFile(){
	$(".noAtchFileDtilSral").each(function() {
		if ($(this).val() == '') {
			$(this).remove();
		}
	});
}

</script>
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>