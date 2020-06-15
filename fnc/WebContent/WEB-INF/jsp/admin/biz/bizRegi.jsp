<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
	<!-- //header -->

	<!-- container -->
	
	<div id="container">

		<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">

			<h2>제품관리</h2>

			<div class="gridwrap">
				<div class="hd_txt">
				<span class="expr">*</span> 항목은 필수입력입니다.
				</div>
				<form action="/admin/bizRegiExcute.do" name="frm" id="frm" method="post" enctype="multipart/form-data">
				<input type="hidden" id="atrb1" name="atrb1" value=""/>

				<table class="tblwrite">
				<colgroup>
					<col style="width:220px;"> <col >
				</colgroup>
				<tr>
					<th><span class="expr">*</span>제품구분</th>
					<td>
						<select class="srh-hpart" id="cdCtgr" name="cdCtgr">
							<option value="">제품선택</option>
							<option value="P4001">BOPP Film</option>
							<option value="P4002">EVA Coated Film</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><span class="expr">*</span>제품용도</th>
					<td>
						<select id="cdPdCtUse" class="srh-hpart" name="cdPdCtUse">
							<option value="">제품용도선택</option>
							<option value="01">인쇄/포장</option>
							<option value="02">테이프</option>
							<option value="03">일반합지</option>
							<option value="04">Thermal용 합지</option>
							<option value="05">기능성</option>
							<option value="06">EVA</option>
						</select>

						<div class="chklist" id="op1">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="A00|" name="atrb" value="A00|"><label for="A00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="A01|" name="atrb" value="A01|"><label for="A01|">인쇄</label></li>
								<li class="radio-box"><input type="radio" id="A02|" name="atrb" value="A02|"><label for="A02|">포장</label></li>
								<li class="radio-box"><input type="radio" id="A03|" name="atrb" value="A03|"><label for="A03|">내열인쇄</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op2">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="B00|" name="atrb" value="B00|"><label for="B00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="B01|" name="atrb" value="B01|" ><label for="B01|">테이프</label></li>
								<li class="radio-box"><input type="radio" id="B02|" name="atrb" value="B02|"><label for="B02|">컬러테이프</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op3">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="C00|" name="atrb" value="C00|"><label for="C00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="C01|" name="atrb" value="C01|"><label for="C01|">무광합지</label></li>
								<li class="radio-box"><input type="radio" id="C02|" name="atrb" value="C02|"><label for="C02|">유광합지</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op4">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="D00|" name="atrb" value="D00|"><label for="D00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="D01|" name="atrb" value="D01|"><label for="D01|">무광 D.T.L</label></li>
								<li class="radio-box"><input type="radio" id="D02|" name="atrb" value="D02|"><label for="D02|">유광 D.T.L</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op5">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="E00|" name="atrb" value="E00|"><label for="E00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="E01|" name="atrb" value="E01|"><label for="E01|">방담</label></li>
								<li class="radio-box"><input type="radio" id="E02|" name="atrb" value="E02|"><label for="E02|">열접착</label></li>
								<li class="radio-box"><input type="radio" id="E03|" name="atrb" value="E03|"><label for="E03|">담배</label></li>
								<li class="radio-box"><input type="radio" id="E04|" name="atrb" value="E04|"><label for="E04|">빨대포장</label></li>
								<li class="radio-box"><input type="radio" id="E05|" name="atrb" value="E05|"><label for="E05|">White</label></li>
								<li class="radio-box"><input type="radio" id="E06|" name="atrb" value="E06|"><label for="E06|">합성지</label></li>
								<li class="radio-box"><input type="radio" id="E07|" name="atrb" value="E07|"><label for="E07|">데코시트</label></li>
								<li class="radio-box"><input type="radio" id="E08|" name="atrb" value="E08|"><label for="E08|">Anti_Scuff</label></li>
								<li class="radio-box"><input type="radio" id="E09|" name="atrb" value="E09|"><label for="E09|">Soft Feel</label></li>
								<li class="radio-box"><input type="radio" id="E10|" name="atrb" value="E10|"><label for="E10|">내열/리딩</label></li>
								<li class="radio-box"><input type="radio" id="E11|" name="atrb" value="E11|"><label for="E11|">세미매트</label></li>
								<li class="radio-box"><input type="radio" id="E12|" name="atrb" value="E12|"><label for="E12|">앨범</label></li>
								<li class="radio-box"><input type="radio" id="E13|" name="atrb" value="E13|"><label for="E13|">영구대전방지</label></li>
							</ul>
							</div>
						</div>
						<div class="chklist" id="op6">
							<div class="opselct1">
							<ul>
								<li class="radio-box"><input type="radio" id="F00|" name="atrb" value="F00|"><label for="F00|">선택없음</label></li>
								<li class="radio-box"><input type="radio" id="F01|" name="atrb" value="F01|"><label for="F01|">무광 EVA</label></li>
								<li class="radio-box"><input type="radio" id="F02|" name="atrb" value="F02|"><label for="F02|">유광 EVA</label></li>
								<li class="radio-box"><input type="radio" id="F03|" name="atrb" value="F03|"><label for="F03|">EVA Anti Suff</label></li>
								<li class="radio-box"><input type="radio" id="F04|" name="atrb" value="F04|"><label for="F04|">EVA Soft Feel</label></li>
							</ul>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="expr">*</span>제품명(GRADE)</th>
					<td>
						<input type="text" id="nmPdCt" name="nmPdCt" class="iptful" placeholder="">
					</td>
				</tr>
				<tr>
					<th>상세용도</th>
					<td>
						<textarea class="textarea-basic" id="atrb2" name="atrb2"></textarea>
					</td>
				</tr>
				<tr>
					<th>두께</th>
					<td>
						<input type="text" id="atrb3" name="atrb3" class="iptful" placeholder="">
					</td>
				</tr>
				<tr>
					<th>표면처리</th>
					<td>
						<input type="text" id="atrb4" name="atrb4" class="iptful" placeholder="">
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<div class="filebox">
						<ul>
							<li>
								<div class="filebox-tit">
									<input type="hidden" id="clFile" name="clFile" value="${clFile }">
									<span>전체</span>
									<input class="upload-name fileName" disabled="disabled">
									<input type="file" id="inputFile1" name="uploads" class="upload-hidden">
									
								</div>
								<div class="btnr">
									<label for="inputFile1">파일첨부</label> 
									<a href="#" class="btn btn-del btnFileDel">삭제</a>
								</div>
							</li>
							<li>
								<div class="filebox-tit">
									<span>MSDS</span>
									<input class="upload-name fileName" disabled="disabled">
									<input type="file" id="inputFile2" name="uploads" class="upload-hidden">
								</div>
								<div class="btnr">
									<label for="inputFile2">파일첨부</label> 
									<a href="#" class="btn btn-del btnFileDel">삭제</a>
								</div>
							</li>
							<li>
								<div class="filebox-tit">
									<span>FDA</span>
									<input class="upload-name fileName" disabled="disabled">
									<input type="file" id="inputFile3" name="uploads" class="upload-hidden">
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
							<option value="">게시여부선택</option>
							<option value="Y">게시</option>
							<option value="N">게시중지</option>
						</select>
					</td>
				</tr>
				</table>
				</form>

				<div class="bot-btn">
					<a href="#" class="btn btn-submit" id="btnSubmit">확인</a>
					<a href="/admin/bizList.do" class="btn btn-cancel">취소</a>
				</div>
			</div>

		</div>

	</div>
	<!-- container -->
<script type="text/javascript">
/* $( function() {
	$('#productoption').on('change', function() {
		var option = this.value;
	  $(".chklist").find("div").hide();
	  $(".chklist").find("."+option).show();
	});
}); */
function hide(){
	$("#op1").find("div").hide();
	$("#op2").find("div").hide();
	$("#op3").find("div").hide();
	$("#op4").find("div").hide();
	$("#op5").find("div").hide();
	$("#op6").find("div").hide();
}
window.onload=hide;

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


$(".btnFileDel").on("click", function(e) {
	e.preventDefault();
	if (confirm("삭제하시겠습니까?")) {
		var $this = $(this).parent().parent();
		
		$this.find(".fileName").val("");
		$this.find('input[name="inputFile"]').val("");
	}
});

$(document).ready(function(){
	fn_init();
});

function fn_init(){
	
	
	$("#btnSubmit").on("click", function(e){
		var cdCtgr = document.getElementById("cdCtgr");
		var cdPdCtUse = document.getElementById("cdPdCtUse");
		var nmPdCt = document.getElementById("nmPdCt");
		var ynNtc = document.getElementById("ynNtc");
		
		if( cdCtgr.value == "") {
			alert("제품구분을 선택해주세요");
			cdCtgr.focus();
			return false;
		}
		if( cdPdCtUse.value == "") {
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

		if( nmPdCt.value == "") {
			alert("제품명을 입력해주세요");
			nmPdCt.focus();
			return false;
		}
		if( ynNtc.value == "") {
			alert("게시여부를 선택해주세요");
			ynNtc.focus();
			return false;
		}
		
		var clFile = "";
		for (var i=0; i < $("input[name=uploads]").length; i++) {
			if ($("input[name=uploads]:eq("+i+")").val() != "") {
				if (clFile != "") {
					clFile += "|";
				}
				clFile += Number(i+1);
			}
		}

		$("#clFile").val(clFile);
		$("#frm").submit();
	});
	
}

</script>

<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>
