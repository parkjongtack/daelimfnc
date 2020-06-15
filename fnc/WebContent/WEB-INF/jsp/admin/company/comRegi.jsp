<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
		<!-- //header -->

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">
			<h2>회사소식관리</h2>
			
			<form id="frm" action="regiExcute.do" method="POST" enctype="multipart/form-data">
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
									<input type="text" id="title" name="sbjtNtcPlte" class="iptful" placeholder="">
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>구분</th>
								<td>
									<select class="srh-hpart" id="comGroup" name="clGbn">
										<option value="">구분선택</option>
										<option value="01">공지사항</option>
										<option value="02">프로그램/행사</option>
										<option value="03">수상</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>등록일</th>
								<td>
									<input type="text" id="regDate" name="dtRgst" class="datepicker" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>썸네일 이미지<span class="expr-bt-txt">(316*190)</span></th>
								<td>
									<div class="filebox">
										<ul>
											<li>
												<input class="upload-name" id="thumbName" disabled="disabled">
												<input type="file" id="thumbFile" name="uploadsThum" class="upload-hidden">
												<div class="btnr">
													<label for="thumbFile">찾아보기</label> 
													<a href="#" class="btn btn-del" id="thumbDel">삭제</a>
												</div>
											</li>
										</ul>
									</div>
									<input type="text" id="cntsFileDtil" name="cntsFileDtil" class="iptful inline-space" placeholder="대체텍스트 입력">
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>요약설명</th>
								<td>
									<textarea class="textarea-basic" id="cntsSmry" name="cntsSmry"></textarea>
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>내용</th>
								<td>
									<textarea class="textarea-basic edit-type" id="txtContent" name="cntsNtcPlte"></textarea>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<div class="filebox">
										<ul>
											<li>
												<input class="upload-name fileName" disabled="disabled">
												<input type="file" id="inputFile1" name="uploads" class="upload-hidden">
												<div class="btnr">
													<label for="inputFile1">찾아보기</label> 
													<a href="#" class="btn btn-del btnFileDel">삭제</a>
												</div>
											</li>
											<li>
												<input class="upload-name fileName" disabled="disabled">
												<input type="file" id="inputFile2" name="uploads" class="upload-hidden">
												<div class="btnr">
													<label for="inputFile2">찾아보기</label> 
													<a href="#" class="btn btn-del btnFileDel">삭제</a>
												</div>
											</li>
											<li>
												<input class="upload-name fileName" disabled="disabled">
												<input type="file" id="inputFile3" name="uploads" class="upload-hidden">
												<div class="btnr">
													<label for="inputFile3">찾아보기</label> 
													<a href="#" class="btn btn-del btnFileDel">삭제</a>
												</div>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="expr">*</span>게시여부</th>
								<td>
									<select class="srh-hpart" id="ynNtc" name="ynNtc">
										<option value="">게시여부선택</option>
										<option value="Y">게시함</option>
										<option value="N">게시안함</option>
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
			</form>
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
			
			
		}
	});
	
	$("#thumbDel").on("click", function(e) {
		e.preventDefault();
		if (confirm("썸네일 이미지를 삭제하시겠습니까?")) {
			$("#thumbName").val("");
			$("#thumbFile").val("");
			$("#cntsFileDtil").val("");
		}
	});
	
	$(".btnFileDel").on("click", function(e) {
		e.preventDefault();
		if (confirm("삭제하시겠습니까?")) {
			var $this = $(this).parent().parent();
			
			$this.find(".fileName").val("");
			$this.find('input[name="inputFile"]').val("");
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
			$("#comGroup").focus()
			return false;
		}
		
		if (regDate == undefined || regDate == null || regDate == "") {
			alert("등록일을 입력해주세요. ex)2020-01-01");
			$("#regDate").focus()
			return false;
		} else {
			
		}
		
		if ($thumbFile.val() == undefined || $thumbFile.val() == null || $thumbFile.val() == "") {
			alert("썸네일 이미지를 등록해주세요.");
			$thumbFile.focus()
			return false;
		}
		
		if (cntsFileDtil == undefined || cntsFileDtil == null || cntsFileDtil == "") {
			alert("썸네일 이미지 대체텍스트를 입력해주세요.");
			$("#cntsFileDtil").focus()
			return false;
		}
		
		if (cntsSmry == undefined || cntsSmry == null || cntsSmry == "") {
			alert("요약설명을 입력해주세요.");
			$("#cntsSmry").focus()
			return false;
		}
		
		if (editorData == "<p><br></p>") {
			alert("내용을 입력해주세요.");
			oEditors.getById["txtContent"].exec("FOCUS");
			return false;
		}
		
		if (ynNtc == undefined || ynNtc == null || ynNtc == "") {
			alert("게시여부를 선택해주세요.");
			$("#ynNtc").focus()
			return false;
		}
		
		/* validation check : end */
		// console.log("submit ok");
		$("#frm").submit();
	});
	
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors, 
		elPlaceHolder: 'txtContent',
		sSkinURI: '/static/admin/editor/SmartEditor2Skin.html', 
		fCreator: 'createSEditor2',
	    fOnAppLoad : function() {
	        oEditors.getById['txtContent'].setDefaultFont("돋움", 18);    
	    }
	});
	
});

</script>
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>