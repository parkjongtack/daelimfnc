<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header -->
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>

	<!-- container -->
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">

			<h2>팝업관리</h2>
			<div class="gridwrap">
				<div class="hd_txt">
					<span class="expr">*</span> 항목은 필수입력입니다.
				</div>

				<!-- 팝업등록 -->
				<form id="popForm" action="/admin/popRegiExcute.do" method="post" enctype="multipart/form-data">
				<table class="tblwrite">
					<colgroup>
						<col style="width:220px;">
						<col >
					</colgroup>
					<tbody>
						<tr>
							<th><span class="expr">*</span>배너이미지<span class="expr-bt-txt">(1920*190)</span></th>
							<td>
								<div class="filebox">
									<ul>
										<li>
											<input class="upload-name" id="fileNameLogi" disabled="disabled">
											<input type="file" class="upload-hidden" id="pthFileLogi" name="uploads" value="" />
											<input type="hidden" id="pthFileYn" name="pthFileYn" value="N"/>
											<input type="hidden" id="noPpupSral" name="noPpupSral" value="">
											<input type="hidden" id="noAtchFileSral" name="noAtchFileSral" value=""/>
											<input type="hidden" id="nmPhysFile" name="nmPhysFile" value=""/>
											<input type="hidden" id="pthFilePhys" name="pthFilePhys" value=""/>
											<input type="hidden" id="noAtchFileDtilSral" name="noAtchFileDtilSral" value=""/>
											<input type="hidden" class="fileStatus" name="fileStatus" value="C"/>	<!-- 파일 상태값 => C:그대로, N: 신규, M: 수정, D: 수정 -->
											<div class="btnr">
												<label for="pthFileLogi">찾아보기</label>
												<a href="#" class="btn btn-del" id="pthFileDel">삭제</a>
											</div>
										</li>
									</ul>
								</div>
								<input type="text" class="iptful inline-space" id="cntsFileDtil" name="cntsFileDtil" placeholder="대체텍스트 입력">
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>링크 입력 (URL)</th>
							<td>
								<input type="text" class="iptful" id="urlAddrLnk" name="urlAddrLnk" value="" placeholder="">
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>팝업기간</th>
							<td>
								<input type="text" id="dtBegn" name="dtBegn" class="datepicker" value="" readonly>
								<span class="hipn">~</span>
								<input type="text" id="dtEnd" name="dtEnd" class="datepicker" value="" readonly>
							</td>
						</tr>
						<tr style="display:none;">
							<th><span class="expr">*</span>새창여부</th>
							<td>
								<select class="srh-hpart" name="ynNewwdw" id="ynNewwdw">
									<option value="">새창여부선택</option>
									<option value="Y">네(새창)</option>
									<option value="N">아니오(본창)</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>게시여부</th>
							<td>
								<select class="srh-hpart" name="ynNtc" id="ynNtc" >
									<option value="">게시여부선택</option>
									<option value="Y">게시</option>
									<option value="N">게시중지</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				</form>

				<div class="bot-btn">
					<a href="#" id="btnSubmit" class="btn btn-submit" value="">확인</a>
					<a href="#" id="btnDelete" class="btn btn-cancel" style="display: none;">삭제</a>
					<a href="#" id="btnCancel" class="btn btn-cancel">취소</a>
				</div>

				<!-- //팝업등록  end -->

				<!-- 팝업 리스트 -->

				<table class="brdList tbl-hasbtn">
					<colgroup>
						<col style="width:5%;"><col style="width:25%;">
						<col style="width:25%;"><col style="width:13%;">
						<col style="width:13%;"><col style="width:10%;">
						<col style="width:;">
					</colgroup>
					<thead>
					<tr>
						<th>번호</th>
						<th>배너이미지명</th>
						<th>대체텍스트</th>
						<th>등록일</th>
						<th>게시여부</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
					</thead>
					<tbody id="listBody">
					</tbody>
				</table>
				<div class="paging" id="paging" style="display: none;"></div>
			</div>
		</div>
	</div>
	<form id="delForm" action="popDelte.do">
		<input type="hidden" id="noPpupSralDel" name="noPpupSral" value="" />
	</form>
	<!-- container -->



<script type="text/javascript">
$(document).ready(function() {
// 	$("#btnDelete").hide();
});
$(function() {
	/* ======= 데이터 피커  ======= */
    $(".datepicker").datepicker();
    /* =======  팝업 리스트 가져오기  ======= */
    fn_popList(startNum, endNum);
});

/* ======= 파일 변경 이벤트 ======= */
$("#pthFileLogi").on("change", function() {
	var fileNameLogi = $("#fileNameLogi").val();
	var pthFileLogi = $("#pthFileLogi").val();
	if ($(this).val() != "") {
		$("#pthFileYn").val("Y");
		console.log("파일변경 이벤트");
		console.log(fileNameLogi);
		console.log(pthFileLogi);
	}
		// 확장자 체크
		var ext = $(this).val().split(".").pop().toLowerCase();
		if ($.inArray(ext, ["jpg", "jpeg", "gif", "bmp"]) == -1) {
			alert("jpg, jpeg, gif, bmp 파일만 업로드 해주세요.");
			$(this).val("");
			return;
	}
});

/* ======= 첨부파일 삭제  ======= */
$("#pthFileDel").on("click", function() {
	if (confirm("삭제하시겠습니까?")) {
	 	$("#fileNameLogi").val("");
	 	$("#cntsFileDtil").val("");
	 	$("#pthFileYn").val("Y");
	}
});

/* =======  대체텍스트  글자수 제한   ======= */
$("#cntsFileDtil").keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 50자)");    //글자수 실시간 카운팅

    if (content.length > 50){
        alert("최대 50자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 50));
        $('#counter').html("(50 / 최대 50자)");
    }
});

/* =======  팝업 등록  ======= */
$("#btnSubmit").on("click", function() {

	var fileNameLogi = $("#fileNameLogi").val();		//파일명
	var cntsFileDtil= $("#cntsFileDtil").val();		//대체문구
	var urlAddrLnk  = $("#urlAddrLnk").val();		//이미지 경로 url
	var dtBegn		= $("#dtBegn").val();			//게시 시작일
	var dtEnd		= $("#dtEnd").val();			//게시 종료일
	var ynNewwdw	= 'N'			                //새창 여부
	var ynNtc		= $("#ynNtc").val();			//게시 여부

	if (fileNameLogi == undefined || fileNameLogi == null || fileNameLogi == "" ){
		alert("배너이미지를 첨부해주세요.");
		return false;
	}

	if (cntsFileDtil == ""){
		alert("대체 문구를 입력해주세요.");
		$("#cntsFileDtil").focus();
		return flase;
	}
	if (urlAddrLnk == "") {
		alert("이미지 경로를 입력해주세요.");
		$("#urlAddrLnk").focus();
		return flase;
	}
	if (dtBegn == undefined || dtBegn == null || dtBegn == "" ){
		alert("게시 시작일을 선택해주세요.");
		return false;
	}
	if (dtEnd == undefined || dtEnd == null || dtEnd == "" ){
		alert("게시 종료일을 선택해주세요.");
		return false;
	}
	if (ynNewwdw == undefined || ynNewwdw == null || ynNewwdw == "" ){
		alert("새창 여부를 선택해주세요.");
		$("#ynNewwdw").focus();
		return false;
	}
	if (ynNtc == undefined || ynNtc == null || ynNtc == "" ){
		alert("게시 여부를 선택해주세요.");
		$("#ynNtc").focus();
		return false;
	}
 	$("#popForm").submit();
});


/* ======= 상세 ======= */
function fn_update(noPpupSral) {

	$.ajax({
		url : "/admin/getPopDetail.do",
		type : "post",
		data : { noPpupSral : noPpupSral },
		dataType : "json",
		success : function(data) {
			console.log("수정 데이타", data);
 			var result = data.resultVo;
			$("#noAtchFileSral").val(result.noAtchFileSral);	//첨부파일 시퀀스
			$("#fileNameLogi").val(result.nmLogiFile);		//파일명	 nmLogiFile
			$("#cntsFileDtil").val(result.cntsFileDtil);	//대체문구
			$("#urlAddrLnk").val(result.urlAddrLnk);		//이미지 경로 url
			$("#dtBegn").val(result.dtBegn);				//게시 시작일
			$("#dtEnd").val(result.dtEnd);					//게시 종료일
			$("#ynNewwdw").val(result.ynNewwdw);			//새창 여부
			$("#ynNtc").val(result.ynNtc);					//게시 여부
			$("#noPpupSral").val(result.noPpupSral); 		//팝업 시퀀스
			$("#noAtchFileDtilSral").val(result.noAtchFileDtilSral); //상세파일시퀀스
	 		/* $("#pthFileLogi").val(result.pthFileLogi); */
			$("#pthFilePhys").val(result.pthFilePhys);
			$("#nmPhysFile").val(result.nmPhysFile);
			$("#nmLogiFile").val(result.nmLogiFile);

			// 수정 버튼 전환
			$("#btnSubmit").text("수정");
			$("#btnDelete").show();
			$("#popForm").attr("action", "/admin/popModi.do");
		}
	});
}

/* =======  등록 취소  ======= */
$("#btnCancel").on("click", function(e){
	e.preventDefault();

	// $("#pthFileLogi").val("");		//파일명
	$("#fileNameLogi").val("");
	$("#cntsFileDtil").val("");		//대체문구
	$("#urlAddrLnk").val("");		//이미지 경로 url
	$("#dtBegn").val("");			//게시 시작일
	$("#dtEnd").val("");			//게시 종료일
	$("#ynNewwdw").val("");			//새창 여부
	$("#ynNtc").val("");			//게시 여부
	$("#noPpupSral").val(""); //팝업 시퀀스
	$("#noAtchFileDtilSral").val(""); //파일시퀀스

	// 수정 버튼 전환
	$("#btnSubmit").text("확인");
	$("#popForm").attr("action", "/admin/popRegiExcute.do");
	$("#btnDelete").hide();
});

/* ======= 파일 상태 값 변경  ======= */
$('input[name="uploads"]').on("change", function() {
	var $this = $(this).parent();
	if ($this.find('.noAtchFileDtilSral').val() == '' || $this.find('.noAtchFileDtilSral').val() == '0') {
		$this.find('.noAtchFileDtilSral').val('0');
		$this.find('.fileStatus').val("N"); // 파일 상태 신규로 변경
	} else {
		$this.find('.fileStatus').val("M"); // 파일 상태 수정으로 변경
	}
});

/* ======= 대체 텍스트 상태 값 변경  ======= */
$('input[name="cntsFileDtil"]').on("change", function() {
	var $this = $(this).parent();
	if ($this.find('.noAtchFileDtilSral').val() == '' || $this.find('.noAtchFileDtilSral').val() == '0') {
		$this.find('.noAtchFileDtilSral').val('0');
		$this.find('.fileStatus').val("N"); // 파일 상태 신규로 변경
	} else {
		$this.find('.fileStatus').val("M"); // 파일 상태 수정으로 변경
	}
});

/* =======  팝업리스트 ajax  =======	 */
function fn_popList(sNum, eNum){
	$.ajax({
		url : "/admin/getPopList.do",
		type : "post",
		data : {  sNum: sNum,
    			  eNum: eNum
    			},
		dataType : "json",
		success : function(data) {
			var htmlBody = "";
			if(data.resultList.length > 0){
				for(var i=0; i< data.resultList.length; i++){
 					var idx = Number(data.cnt)-sNum - i + 1;
					htmlBody += "<tr>";
					htmlBody += "<td>" + idx + "</td>";
					/* htmlBody += "<td>" + data.resultList[i].pthFileLogi + "</td>"; */
					htmlBody += "<td>" + data.resultList[i].nmLogiFile + "</td>";
					htmlBody += "<td>" + data.resultList[i].cntsFileDtil + "</td>";
					htmlBody += "<td>" + data.resultList[i].dntCrtn + "</td>";
					htmlBody += "<td>" + data.resultList[i].ynNtc + "</td>";
					htmlBody += "<td><a class='btn btn-prim' onclick=fn_update("+ data.resultList[i].noPpupSral +");>수정</a></td>";
 					htmlBody += "<td><a class='btn btn-secon' onclick=fn_delete("+ data.resultList[i].noPpupSral +");return false;'>삭제</a></td>";
					htmlBody += "</tr>";
				}
				$.paginView(data.cnt);
				$("#paging").show();
			}else{
				htmlBody += "<tr><td style='text-align: center;' colspan='7'>검색 데이터가 없습니다.</td></tr>";
				$("#paging").hide();
			}
			$("#listBody").html(htmlBody);  // html 또는 append
		}
	});
}

/* ======= 페이지 초기화  ======= */
$.pagingSet();

/* =======  페이징 처리  ======= */
function pagingPage(num){
	currentPage = num;
	endNum = (rowPer*num).toString();
	startNum = ((rowPer*num)-(rowPer-1)).toString();
	fn_popList(startNum, endNum);
}

/* =======  삭제   ======= */
function fn_delete(no) {

	if(confirm("삭제하시겠습니까?")) {
		$("#noPpupSralDel").val(no);
		$("#delForm").submit();
	}
}


</script>

<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>
