<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<footer>
		<address>Copyright 2020. DAELIM FnC all rights reserved.</address>
	</footer>

	<div id="membermod" class="lyrpop">
		<div class="hd">
			<h3>개인정보수정</h3>
			<a href="#" class="popClose">팝업닫기</a>
		</div>

		<div class="page">

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
					<td>${adminVo.userId}</td>
				</tr>
				<tr>
					<th><span class="expr">*</span> 부서</th>
					<td>
						<input type="text" id="deptNm" name="deptNm" class="iptful" placeholder="" value="${adminVo.deptNm}" required="required">
					</td>
				</tr>
				<tr>
					<th><span class="expr">*</span> 이름</th>
					<td>
						<input type="text" id="userNm" name="userNm" class="iptful" placeholder="" value="${adminVo.userNm}" required="required">
					</td>
				</tr>
				<tr>
					<th><span class="expr">*</span>이메일</th>
					<td>
						<input type="text" id="email1" name="email1" class="email-ipt" placeholder="" value="${fn:split(adminVo.email,'@')[0]}" required="required">
                        @ <input type="text" id="email2" name="email2" class="email-ipt" placeholder="" value="${fn:split(adminVo.email,'@')[1]}" required="required">
                        <select class="email-slt" onchange="javascript:fn_emailChangePop(this);">
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
						<input type="text" id="noMphn" name="noMphn" class="iptful" placeholder="" value="${adminVo.noMphn}" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="newPw" name="newPw" class="iptful" placeholder="" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" id="confirmPw" name="confirmPw" class="iptful" placeholder="" required="required">
					</td>
				</tr>
				</table>

				<div class="bot-btn">
					<a href="javascript:;" class="btn btn-submit" onclick="javascript:fn_mod();">확인</a>
					<a href="javascript:;" class="btn btn-cancel" onclick="javascript:fn_cancelPop();">취소</a>
				</div>

			</div>
	</div>

	<div class="back"></div>
    
</div>

<script type="text/javascript">
    // 이메일 변경
    function fn_emailChangePop(obj) {
        var host = $(obj).val();
        
        if ( host == "" ) {
            $("#email2").val("");
            $("#email2").prop("readonly", false);
        }
        else {
            $("#email2").val(host);
            $("#email2").prop("readonly", true);
        }
    }
    
    // 확인
    function fn_mod() {
        var deptNm    = $.trim($("#deptNm").val());     // 부서
        var userNm    = $.trim($("#userNm").val());     // 이름
        var email1    = $.trim($("#email1").val());     // 이메일 앞
        var email2    = $.trim($("#email2").val());     // 이메일 뒤
        var noMphn    = $.trim($("#noMphn").val());     // 휴대전화
        var newPw     = $.trim($("#newPw").val());      // 새비밀번호
        var confirmPw = $.trim($("#confirmPw").val());  // 새비밀번호확인
        
        if ( deptNm == null || deptNm == "" ) {
            alert("부서를 입력해주세요.");
            return;
        }
        if ( userNm == null || userNm == "" ) {
            alert("이름을 입력해주세요.");
            return;
        }
        if ( email1 == null || email1 == "" ) {
            alert("이메일 앞 부분을 입력해주세요.");
            return false;
        }
        if ( email2 == null || email2 == "" ) {
            alert("이메일 뒷 부분을 입력해주세요.");
            return false;
        }
        if ( noMphn == null || noMphn == "" ) {
            alert("휴대전화를 입력해주세요.");
            return;
        }
        if ( (newPw == null || newPw == "") && (confirmPw != null && confirmPw != "") ) {
            alert("새비밀번호를 입력해주세요.");
            return;
        }
        if ( (newPw != null && newPw != "") && (confirmPw == null || confirmPw == "") ) {
            alert("새비밀번호확인을 입력해주세요.");
            return;
        }
        
        var paramData;
        if ( newPw != null && newPw != "" && confirmPw != null && confirmPw != "" ) {
            var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,20}$/;
            var check2 = /[a-zA-Z]{3,}/;
            var check3 = /\d{3,}/;
            var check4 = /\s/;
            
            if ( !check1.test(newPw) ) {
                alert("영문, 숫자, 특수문자 3종류를 사용하여 8자 이상 20자 이하로 입력해주세요.");
                //console.log("영문, 숫자, 특수문자 3종류를 사용하여 8자 이상 20자 이하로 입력해주세요.");
                return;
            }
            if ( check2.test(newPw) || check3.test(newPw) ) {
                alert("연속된 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. abc, 123 등)");
                //console.log("연속된 문자, 숫자 3자리 이상은 사용할 수 없습니다. (ex. abc, 123 등)");
                return;
            }
            if ( check4.test(newPw) ) {
                alert("공백은 사용하실 수 없습니다.");
                //console.log("공백은 사용하실 수 없습니다.");
                return;
            }
            if ( newPw != confirmPw ) {
                alert("새 비밀번호가 일치하지 않습니다.");
                //console.log("새 비밀번호가 일치하기 않습니다.");
                return;
            }
            
            paramData = {
                deptNm    : deptNm
              , userNm    : userNm
              , email     : $("#email1").val() + "@" + $("#email2").val()
              , noMphn    : noMphn
              , newPw     : newPw
              , confirmPw : confirmPw
            }
        }
        else {
            paramData = {
                deptNm    : deptNm
              , userNm    : userNm
              , email     : $("#email1").val() + "@" + $("#email2").val()
              , noMphn    : noMphn
            }
        }

        if ( !confirm("수정하시겠습니까?") ) {
            return;
        }
        
        $.ajax({
            url : "/admin/updateAccountInfoAjax.do"
          , type: 'POST'
          , data: paramData
          , dataType : "json"
          , beforeSend: function(xhr) {
                xhr.setRequestHeader("AJAX", "true");
            }
          , success: function(data) {
                console.log("data : " + JSON.stringify(data));
                
                if ( data.errMsg != null && data.errMsg != "" ) {
                    if ( data.errMsg == "E00" ) {
                        alert("파라미터 오류 발생.");
                    }
                    else if ( data.errMsg == "E01" ) {
                        alert("비밀번호 암호화 오류 발생.");
                    }
                    else if ( data.errMsg == "E02" ) {
                        alert("사용자정보 조회 중 오류가 발생했습니다.");
                    }
                    else if ( data.errMsg == "E03" ) {
                        alert("현재 비밀번호와 동일합니다.");
                    }
                    else if ( data.errMsg == "E04" ) {
                        alert("계정정보 변경에 실패하였습니다.");
                    }
                    else if ( data.errMsg == "E05" ) {
                        alert("변경된 사용자정보 조회 중 오류가 발생했습니다.");
                    }
                }
                else {
                	$(".popClose").click();
                	location.reload(true);
                }
            }
          , error: function(xhr, textStatus, error) {
                if(xhr.status == "500") {
                    alert("Session connection is lost.");
                    location.href = "/admin";
                } else {
                    alert("error");
                }
            }
        });
    }
    
    // 취소
    function fn_cancelPop() {
        $(".popClose").click();
    	$("#newPw").val("");
    	$("#confirmPw").val("");
    }
</script>
<!-- //wrapper -->
</body>
</html>