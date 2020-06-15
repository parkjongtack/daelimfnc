<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/admin/main_header.jsp"%>
<!-- wrapper -->
<div id="wrapper">

	<div class="loginwrap">
		<div class="ileft">
			<h1><img src="/static/admin/images/common/logo.png" alt="대림 Fnc 관리자"></h1>
			<p>개인정보 보호를 위해 관리자 본인인증을<br>실시하고 있습니다.</p>
		</div>
		<div class="loginbox">
			<fieldset>
				<legend>관리자 비밀번호</legend>
				<form method="post">
					<ul class="chglist">
						<li>
							<span class="iptline">${adminVo.userId}</span>
						</li>
						<li>
							<input type="password" id="userPw" name="userPw" placeholder="현재 비밀번호" required="required" autofocus>
						</li>
						<li>
							<input type="password" id="newPw" name="newPw" placeholder="새 비밀번호" required="required">
						</li>
						<li>
							<input type="password" id="confirmPw" name="confirmPw" placeholder="새 비밀번호 확인" required="required">
						</li>
					</ul>
					<div class="btnc"><input type="submit" id="" name="" onclick="return fn_pwd_check()" value="비밀번호 변경"></div>
					<p id="msg04" class="notice-txt">한글, 특수문자 공백은 사용할 수 없습니다</p>
					
					<address>Copyright 2020. DAELIM FnC all rights reserved.</address>
				</form>
			</fieldset>
		</div>
	</div>

</div>
<!-- //wrapper -->

<script type="text/javascript">
	function fn_pwd_check() {
    	var userPw    = $.trim($('#userPw').val());
    	var newPw     = $.trim($('#newPw').val());
    	var confirmPw = $.trim($('#confirmPw').val());
        var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,20}$/;
    	var check2 = /[a-zA-Z]{3,}/;
    	var check3 = /\d{3,}/;
    	var check4 = /\s/;
    	
        if ( userPw == null || userPw == "" ) {
            alert("현재비밀번호를 입력해주세요.");
            return false;
        }
        if ( newPw == null || newPw == "" ) {
            alert("새비밀번호를 입력해주세요.");
            return false;
        }
        if ( confirmPw == null || confirmPw == "" ) {
            alert("새비밀번호확인을 입력해주세요.");
            return false;
        }
    	
    	if ( !check1.test(newPw) ) {
    	    alert("영문, 숫자, 특수문자 3종류를 사용하여 8자 이상 20자 이하로 입력해주세요.");
    	    //console.log("영문, 숫자, 특수문자 3종류를 사용하여 8자 이상 20자 이하로 입력해주세요.");
    	    return false;
    	}
    	if ( check2.test(newPw) || check3.test(newPw) ) {
    	    alert("연속된 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. abc, 123 등)");
    	    //console.log("연속된 문자, 숫자 3자리 이상은 사용할 수 없습니다. (ex. abc, 123 등)");
    	    return false;
    	}
    	if ( check4.test(newPw) ) {
    	    alert("공백은 사용하실 수 없습니다.");
    	    //console.log("공백은 사용하실 수 없습니다.");
    	    return false;
    	}
    	if ( newPw != confirmPw ) {
    	    alert("새 비밀번호가 일치하지 않습니다.");
    	    //console.log("새 비밀번호지 일치하기 않습니다.");
    	    return false;
    	}
    	if ( userPw == newPw ) {
    	    alert("현재 비밀번호와 동일합니다.");
    	    //console.log("현재 비밀번호와 동일합니다.");
    	    return false;
    	}
    	
        $.ajax({
            url : "/admin/changePwdAjax.do"
          , type: 'POST'
          , data: {
        	    userPw    : userPw
              , newPw     : newPw
              , confirmPw : confirmPw
            }
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
                    	alert("현재 비밀번호가 일치하지 않습니다.");
                	}
                	else if ( data.errMsg == "E03" ) {
                    	alert("비밀번호 변경에 실패하였습니다.");
                	}
                	else if ( data.errMsg == "E04" ) {
                    	alert("변경된 사용자정보 조회 중 오류가 발생했습니다.");
                	}
                }
                else {
                	location.href = "/admin/bnnList.do";
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
        
        return false;
    }
</script>

<%@include file="/WEB-INF/jsp/admin/main_footer.jsp"%>