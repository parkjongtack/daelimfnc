<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
<!-- //header -->

<!-- container -->
<div id="container">

	<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

	<div id="contents">

		<h2>관리자수정</h2>
		
		<form id="form">
			<div class="gridwrap">

				<div class="pw-policy">
					<strong>비밀번호 관리 정책</strong>
					<ul>
						<li>- 비밀번호 안전도에 따라 180일 내에 한번씩 주기적으로 바꾸어 사용하시는 것이 안전합니다.</li>
						<li>- 비밀번호는 영문+숫자+특수문자(3종류) 조합의 8~20자로 사용 가능합니다.</li>
						<li>- 3자 이상 연속 또는 중복되는 문자, 숫자는 사용할 수없으며, 공백도 사용할 수 없습니다.</li>
					</ul>
				</div>

				<div class="hd_txt">
					<span class="expr">*</span> 항목은 필수입력입니다.
				</div>

				<table class="tblwrite">
					<colgroup>
						<col style="width:220px;"><col >
					</colgroup>
					<tr>
						<th><span class="expr">*</span> 아이디</th>
						<td>
							${resultInfo.idAdmnPrsn}
							<input type="hidden" id="idAdmnPrsn" name="idAdmnPrsn" class="iptful" value="${resultInfo.idAdmnPrsn}" placeholder="" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th><span class="expr">*</span> 부서</th>
						<td>
							<input type="text" id="nmDeptAdmnprsn" name="nmDeptAdmnprsn" class="iptful" value="${resultInfo.nmDeptAdmnprsn}" placeholder="">
						</td>
					</tr>
					<tr>
						<th><span class="expr">*</span> 이름</th>
						<td>
							<input type="text" id="nmAdmnPrsn" name="nmAdmnPrsn" class="iptful" value="${resultInfo.nmAdmnPrsn}" placeholder="">
						</td>
					</tr>
					<tr>
						<th><span class="expr">*</span>이메일</th>
						<td>
							<input type="text" id="emailAdmnPrsn" name="emailAdmnPrsn" class="email-ipt" value="${fn:split(resultInfo.emailAdmnPrsn,'@')[0]}" placeholder=""> @ 
                            <input type="text" id="emailAdmnPrsn2" name="emailAdmnPrsn2" class="email-ipt" value="${fn:split(resultInfo.emailAdmnPrsn,'@')[1]}" placeholder="" >						
							<select class="email-slt" onchange="javascript:fn_emailChange(this);">
								<option value="">직접입력</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="naver.com">naver.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><span class="expr">*</span> 휴대전화</th>
						<td>
							<input type="text" id="noMphn" name="noMphn" class="iptful" value="${resultInfo.noMphn}" placeholder="">
							<p class="notice-txt">휴대전화번호를 정확히 입력해주세요</p>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" id="noAdmnScrt" name="noAdmnScrt" class="iptful" placeholder="">
							<!-- <p class="notice-txt">영문 + 숫자 + 특수문자 조합인 경우 8자리 이상 입력하거나 영문 + 숫자 조합인 경우 10자리 이상 입력해주세요.</p> -->
							<!-- <p class="notice-txt">동일한 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. 111, aaa 등)</p> -->
							<!-- <p class="notice-txt">연속된 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. abc, 123 등)</p> -->
							<p class="notice-txt">한글, 특수문자 공백은 사용할 수 없습니다</p>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" id="noAdmnScrtConfirm" name="noAdmnScrtConfirm" class="iptful" placeholder="">
							<p class="notice-txt">영문 + 숫자 + 특수문자 조합인 경우 8자리 이상 입력하거나 영문 + 숫자 조합인 경우 10자리 이상 입력해주세요.</p>
							<!-- <p class="notice-txt">동일한 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. 111, aaa 등)</p> -->
							<!-- <p class="notice-txt">연속된 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. abc, 123 등)</p> -->
							<!-- <p class="notice-txt">한글, 특수문자 공백은 사용할 수 없습니다</p> -->
						</td>
					</tr>
					<tr>
						<th><span class="expr">*</span> 사용기간설정</th>
						<td>
							<input type="text" id="dtBegnAtrt" name="dtBegnAtrt" class="datepicker" value="${resultInfo.dtBegnAtrt}" readonly="readonly"> 
							<span class="hipn">~</span> 
							<input type="text" id="dtEndAtrt" name="dtEndAtrt" class="datepicker"  value="${resultInfo.dtEndAtrt}"  readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>관리자 유형</th>
						<td>
							<span class="radio-box">
								<input type="radio" id="radio_01" name="clAdmnPrsn" value="Y" <c:if test="${resultInfo.clAdmnPrsn eq 'Y'}">checked="checked"</c:if>>
								<label for="radio_01">일반관리자</label>
							</span>
							<span class="radio-box">
								<input type="radio" id="radio_02" name="clAdmnPrsn" value="A" <c:if test="${resultInfo.clAdmnPrsn eq 'A'}">checked="checked"</c:if>>
								<label for="radio_02">슈퍼관리자</label>
							</span>
						</td>
					</tr>
				</table>

				<div class="bot-btn">
					<a href="javascript:;" class="btn btn-submit" onclick="javascript:fn_modi();">확인</a>
					<a href="javascript:;" class="btn btn-cancel" onclick="javascript:fn_cancel();">취소</a>
				</div>

			</div>
		</form>
	</div>

</div>
<!-- container -->
	
<script type="text/javascript">
	// 확인
	function fn_modi() {
		// 유효성 검사
		if(!fn_validate()) {
			return;
		}
		
		if(!confirm("수정하시겠습니까?")) {
			return;
		}
		
		var preTemp = $("#emailAdmnPrsn").val();
		var sufTemp = $("#emailAdmnPrsn2").val();
		$("#emailAdmnPrsn").val(preTemp+"@"+sufTemp);
		
		var form = $("#form")[0];
		form.action = "/admin/admModiExcute.do";
		form.method = "POST";
		form.submit();
	}
	
	// 유효성 검사
	function fn_validate() {
		var idAdmnPrsn = $("#idAdmnPrsn").val();				// 아이디
		var nmDeptAdmnprsn = $("#nmDeptAdmnprsn").val();		// 부서
		var nmAdmnPrsn = $("#nmAdmnPrsn").val();				// 이름
		var emailAdmnPrsn1 = $("#emailAdmnPrsn").val();		// 이메일 전
		var emailAdmnPrsn2 = $("#emailAdmnPrsn2").val();		// 이메일 후
		var noMphn = $("#noMphn").val();						// 휴대전화
		var noAdmnScrt = $("#noAdmnScrt").val();				// 비밀번호
		var noAdmnScrtConfirm = $("#noAdmnScrtConfirm").val();	// 비밀번호확인
		var dtBegnAtrt = $("#dtBegnAtrt").val();				// 사용기간설정 시작일
		var dtEndAtrt = $("#dtEndAtrt").val();					// 사용기간설정 종료일
		var clAdmnPrsn = $("#clAdmnPrsn").val();				// 관리자유형

		// 아이디
		if(idAdmnPrsn == null || $.trim(idAdmnPrsn) == "") {
			alert("아이디를 입력해주세요");
			return false;
		}

		// 아이디 길이
		if(2 > idAdmnPrsn.length > 15) {
			alert("영문+숫자 15자리 이내로 입력해주세요.");
			return false;
		}

		// 부서
		if(nmDeptAdmnprsn == null || $.trim(nmDeptAdmnprsn) == "") {
			alert("부서를 입력해주세요");
			return false;
		}

		// 이름
		if(nmAdmnPrsn == null || $.trim(nmAdmnPrsn) == "") {
			alert("이름를 입력해주세요");
			return false;
		}

		// 이메일
		if((emailAdmnPrsn1 == null || $.trim(emailAdmnPrsn1) == "") || (emailAdmnPrsn2 == null || $.trim(emailAdmnPrsn2) == "")) {
			alert("이메일을 입력해주세요");
			return false;
		}

		// 휴대전화
		if(noMphn == null || $.trim(noMphn) == "") {
			alert("휴대전화를 입력해주세요");
			return false;
		}

		if(dtBegnAtrt == null || $.trim(dtBegnAtrt) == "") {
			alert("사용기간 시작일을 입력해주세요.");
			return false;
		}

		if(dtEndAtrt == null || $.trim(dtEndAtrt) == "") {
			alert("사용기간 종료일을 입력해주세요.");
			return false;
		}

		return true;
	}
	
	// 취소
	function fn_cancel() {
		location.href = "/admin/admList.do";
	}
	 
	// 이메일 변경
    function fn_emailChange(obj) {
        var host = $(obj).val();
        if(host == "") {
            $("#emailAdmnPrsn2").val("");
            $("#emailAdmnPrsn2").prop("readonly", false);
        } else {
            $("#emailAdmnPrsn2").val(host);
            $("#emailAdmnPrsn2").prop("readonly", true);
        }
    }
</script>

<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>