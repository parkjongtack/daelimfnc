<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>신고내용입력 &lt; 사이버신문고 &lt; 정도경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("인증절차를 거치신 후 접속해 주세요.");
  document.location.href="/sus02_1.do";
 </script>
<%
  return;
 }
%>

<script type="text/javascript">

$(document).ready(function(){

	if ((location.href.indexOf("http://localhost:8080") < 0)) {					// 운영반영시 수정
		if ("<c:out value="${name}" />" == "" || "<c:out value="${mobileNo}" />" == "") {
			alert("인증절차를 거치신 후 접속해 주세요.");
			location.href = "/sus02_1.do";
		}
	} else {
		$("#cyberForm #name").removeAttr("readonly");
		$("#cyberForm #mobileNo").removeAttr("readonly");
	}

	$(".numberOnly").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$("#cyberForm #emailselect").on("click", function() {
		if ($.trim($(this).val()) == "") {
			$("#cyberForm #emailDomain").val("");
			$("#cyberForm #emailDomain").removeAttr("readonly");
		} else {
			$("#cyberForm #emailDomain").val($.trim($(this).val()));
			$("#cyberForm #emailDomain").attr("readonly",true);
		}
	});

	//파일 확장자, 용량 체크
	$('input:file[name=uploads]').each(function(idx) {
		$(this).change(function() {
			var fileValue = $(this).val();
			var ext = fileValue.slice(fileValue.lastIndexOf(".") + 1).toLowerCase();
			var extnsList = ";jpg;gif;png;ppt;pptx;xlsx;xls;pdf;hwp;docx;doc;zip;JPG;GIF;PNG;PPT;PPTX;XLSX;XLS;PDF;HWP;DOCX;DOC;ZIP;";
			
			//파일 확장자 체크
			if (ext != "") {
				if(extnsList.indexOf(ext+";")<=0) {
					alert('첨부할 수 없는 파일입니다.');
					$('input:file[name=uploads]').eq(idx).val('');
					$('input:text[name=filename]').eq(idx).val('');
					return;
				}
			}
			
			//파일 용량체크 
			var maxSize = 10 * 1024 * 1024;	//10MB
			var mb = Math.floor(maxSize/1024000);
			var fileSize = Math.round(document.getElementById("uploads"+(idx+1)).files[0].size);
			
			if (fileSize > maxSize) {
				alert("첨부파일 사이즈는 "+mb+"MB이내로 등록 가능합니다.");
				$('input:file[name=uploads]').eq(idx).val('');
				$('input:text[name=filename]').eq(idx).val('');
				return;
			}
			
		});
	});

});

function cyberSend() {
	var frm = document.cyberForm;
	var typeChk = false;
	var typeValue = "";

	if ($.trim($("#cyberForm #name").val()) == "") {
		alert("이름을  입력해 주세요");
		$("#cyberForm #name").focus();
		return false;
	}
	
	if ($.trim($("#cyberForm #emailId").val()) == "") {
		alert("이메일 주소를 입력해 주세요");
		$("#cyberForm #emailId").focus();
		return false;
	}

	if ($.trim($("#cyberForm #emailDomain").val()) == "") {
		alert("이메일 주소를 입력해 주세요");
		$("#cyberForm #emailDomain").focus();
		return false;
	}
	
	var email = $.trim($("#cyberForm #emailId").val()) + "@" + $.trim($("#cyberForm #emailDomain").val());
	
	if (!emailCheck(email)) {
		alert("이메일 주소 형식이 맞지 않습니다.");
		return false;
	}

	if ($.trim($("#cyberForm #mobileNo").val()) == "") {
		alert("휴대폰번호를  입력해 주세요");
		$("#cyberForm #mobileNo").focus();
		return false;
	}

	if ($.trim($("#cyberForm #subject").val()) == "") {
		alert("제목을 입력해 주세요");
		$("#cyberForm #subject").focus();
		return false;
	}

	if ($.trim($("#cyberForm #contents").val()) == "") {
		alert("내용을 입력해 주세요");
		$("#cyberForm #contents").focus();
		return false;
	}

	if (confirm("사이버 신문고 접수를 하시겠습니까?")) {
		$("#cyberForm #btnSubmit").text("전송중");
		$("#cyberForm #btnSubmit").attr("disabled",true);

		var form = $("#cyberForm")[0];
        var formData = new FormData(form);

// 		$.ajax({
// 			url : '/cyberSend.do',
// 			type : 'POST',
// 			data : formData,
// 			processData : false,
//             contentType : false,
//             cache: false,
// 			success: function (result) {
// 				location.replace("/sus02_3.do");
// 			},
// 			error: function() {
// 				alert("사이버 신문고 접수 중 오류가 발생했습니다. 다시 입력해 주십시요.");
// 				$("#cyberForm #btnSubmit").text("보내기");
// 				$("#cyberForm #btnSubmit").attr("disabled",false);
// 			}
// 		});

		$("#cyberForm").attr("action", "/cyberSend.do");
		$("#cyberForm").submit();

		return true;
	}else{
		return false;
	}
}

function fncTypeSelect(type) {

	$("#cyberForm #cyberType").val(type);
}

function emailCheck(str) {
	var regexp = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
	
	if(!regexp.test(str) ) {
		return false;
	}
	
	return true;
}

</script>
				<div class="lnb">
					<ul>
						<li>
							<a href="javascript:void(0)" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
						</li>
						<li>
							<a href="javascript:void(0)">지속가능경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/com01.do">회사소개</a></li>
								<li><a href="/biz01.do">사업소개</a></li>
								<li><a href="/rnd01.do">기술개발</a></li>
								<li><a href="/sus01_1.do" class="active">지속가능경영</a></li>
								<li><a href="/pr01.do">홍보센터</a></li>
								<li><a href="/car01.do">인재채용</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)">정도경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do">안전·보건·환경 경영</a></li>
								<li><a href="/sus02_1.do" class="active">정도경영</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)" class="active">사이버신문고<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus02_1.do" class="active">사이버신문고</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="gnbBg"></div>
		</header>
		<!-- //header -->

		<!-- Container -->
		<div id="container">

			<div class="sub-visual Sustainability">
				<h2>지속가능경영</h2>
			</div>
			<form name="cyberForm" id="cyberForm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="cyberType" name="cyberType" value="01" />

			<div id="content">
				<h3>사이버신문고</h3>
				<p class="sub-text align-c">
					대림에프엔씨와의 거래나 접촉 시 임직원의 부당한 요구나 불공정 행위로 인해 피해를 입으신 사항이나<br>
					윤리경영을 위한 제안, 건의사항 등을 보내주시면 확인 후 성실히 답변해 드리겠습니다.
				</p>
				<div class="bg-text-box type-notice">
					<p class="text">사이트 이용관련 또는 기타 문의는 고객문의를 이용해 주십시오.</p>
					<a href="javascript:void(0)" class="btn btn-arrow">고객문의 이용하기</a>
				</div>
				<ul class="step-list">
					<li class="step1 active">
						<span class="blind">1</span>
						<span class="txt">약관동의<br>본인인증</span>
					</li>
					<li class="step2 active">
						<span class="blind">2</span>
						<span class="txt">신고내용<br>등록하기</span>
					</li>
					<li class="step3">
						<span class="blind">3</span>
						<span class="txt">신고완료</span>
					</li>
				</ul>
				<h4 class="blind">신고내용입력</h4>
				<div class="hd-txt">
					<span class="expr">*</span>필수 입력사항
				</div>
				<table class="brdList row-input-type">
					<colgroup>
						<col width="300px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">신고분류<span class="expr">*</span></th>
							<td>
								<ul class="tab-ul-01">
									<li class="active" onclick="fncTypeSelect('01');">임직원 불공정 행위</li>
									<li onclick="fncTypeSelect('02');">윤리경영 관련 제안</li>
									<li onclick="fncTypeSelect('03');">기타 건의사항</li>
								</ul>
							</td> 
						</tr>
						<tr>
							<th scope="row"><label for="name">이름</label><span class="expr">*</span></th>
							<td><input type="text" id="name" name="name" class="ipt-basic full-size" value="<c:out value="${name}" />" readonly="readonly"></td> 
						</tr>
						<tr>
							<th scope="row">이메일<span class="expr">*</span></th>
							<td>
								<label for="emailId" class="blind">이메일 아이디</label><input type="text" id="emailId" name="emailId" class="ipt-basic" maxlength="25">
								<span class="hipn">@</span>
								<label for="emailDomain" class="blind">도메인직접입력</label><input type="text" id="emailDomain" name="emailDomain" class="ipt-basic size-300" maxlength="25">
								<label for="emailselect" class="blind">도메인선택</label>
								<select id="emailselect" class="ipt-basic size-320">
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
								</select>
								<span class="info-txt">※ 입력하신 이메일로 답변이 전송되오니 정확히 입력해 주세요.</span>
							</td> 
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td>
								<label for="tel1" class="blind">전화번호 국번</label>
								<select id="tel1" name="tel1" class="ipt-basic size-280">
									<option value="02">02</option>
									<option value="051">051</option>
									<option value="053">053</option>
									<option value="032">032</option>
									<option value="062">062</option>
									<option value="042">042</option>
									<option value="052">052</option>
									<option value="031">031</option>
									<option value="033">033</option>
									<option value="043">043</option>
									<option value="041">041</option>
									<option value="063">063</option>
									<option value="061">061</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="064">064</option>
									<option value="070">070</option>
								</select>
								<label for="tel2" class="blind">전화번호 앞자리</label><input type="text" id="tel2" name="tel2" maxlength="4" class="ipt-basic size-320 numberOnly">
								<span class="hipn">-</span>
								<label for="tel3" class="blind">전화번호 뒷자리</label><input type="text" id="tel3" name="tel3" maxlength="4" class="ipt-basic size-320 numberOnly">
							</td> 
						</tr>
						<tr>
							<th scope="row"><label for="mobileNo">휴대폰</label><span class="expr">*</span></th>
							<td>
								<input type="text" id="mobileNo" name="mobileNo" class="ipt-basic full-size" value="<c:out value="${mobileNo}" />" readonly="readonly">
							</td> 
						</tr>
						<tr>
							<th scope="row">첨부</th>
							<td>
								<ul class="filelist">
									<li class="filebox">
										<input type="text" id="filename1" name="filename" class="upload-name ipt-basic size-820" disabled="disabled"><label for="filename1" class="blind">첨부파일1</label>
										<input type="file" id="input_file1" name="uploads" class="upload-hidden">
										<label for="input_file1" class="btn btn-add">파일추가</label>
									</li>
									<li class="filebox">
										<input type="text" id="filename2" name="filename" class="upload-name ipt-basic size-820" disabled="disabled"><label for="filename2" class="blind">첨부파일1</label>
										<input type="file" id="input_file2" name="uploads" class="upload-hidden">
										<label for="input_file2" class="btn btn-add">파일추가</label>
									</li>
									<li class="filebox">
										<input type="text" id="filename3" name="filename" class="upload-name ipt-basic size-820" disabled="disabled"><label for="filename3" class="blind">첨부파일1</label>
										<input type="file" id="input_file3" name="uploads" class="upload-hidden">
										<label for="input_file3" class="btn btn-add">파일추가</label>
									</li>
								</ul>
								<span class="info-txt">※ 첨부파일은 3개까지, 한 파일당 최대 10MB까지 가능합니다. 파일이 많을 경우 압축파일로 첨부해 주세요.</span>
							</td> 
						</tr>
						<tr>
							<th scope="row"><label for="subject">제목</label><span class="expr">*</span></th>
							<td>
								<input type="text" id="subject" name="subject" class="ipt-basic full-size" placeholder="제목을 입력해 주세요." maxlength="100">
							</td> 
						</tr>
						<tr>
							<th colspan="2"  scope="col" class="txtartd"><label for="cont">내용</label><span class="expr">*</span></th>
						</tr>
						<tr>
							<td colspan="2">	
								<textarea rows="1" cols="1" id="contents" name="contents" class="textarea-basic" maxlength="4000"></textarea>
							</td> 
						</tr>
					</tbody>
				</table>
				<div class="btn-area">
					<button type="button" id="btnCancel" class="btn btn-secondary" onclick="location.href='/sus02_1.do';">신고취소</button>
					<button type="button" id="btnSubmit" onclick="cyberSend();" class="btn btn-primary">보내기</button>
				</div>
			</div>
			</form>
			<button type="button" class="btn-top">TOP</button>
		</div>
		<!-- //Container -->
		
	<!-- footer -->
		<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	<!-- //footer -->

	<!-- sitemap -->
		<%@ include file="/WEB-INF/jsp/ft/sitemap.jsp" %>
	<!-- //sitemap -->


		<div class="back"></div>
	</div>

	<!-- //wrapper -->
	
</body>

</html>