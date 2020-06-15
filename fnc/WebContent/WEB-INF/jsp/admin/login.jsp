<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/admin/main_header.jsp"%>
<!-- wrapper -->
<div id="wrapper">

	<div class="loginwrap">
		<div class="ileft">
			<h1><img src="../../static/admin/images/common/logo.png" alt="대림 Fnc 관리자"></h1>
			<p>개인정보 보호를 위해 관리자 본인인증을<br>실시하고 있습니다.</p>
		</div>
		<div class="loginbox">
			<fieldset>
				<legend>관리자 로그인</legend>
				<form action="/admin/login.do" method="post">
						<ul>
							<li>
								<input type="text" id="userId" name="userId" placeholder="아이디" required="required" autofocus>
							</li>
							<li>
								<input type="password" id="userPw" name="userPw" placeholder="비밀번호" required="required">
							</li>
						</ul>
						<div class="btnc"><input type="submit" id="" name="" value="로그인"></div>

						<!-- <p class="notice-txt">영문 + 숫자 + 특수문자 조합인 경우 8자리 이상 입력하거나 영문 + 숫자 조합인 경우 10자리 이상 입력해주세요.</p> -->
						<!-- <p class="notice-txt">동일한 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. 111, aaa 등)</p> -->
						<!-- <p class="notice-txt">연속된 문자, 숫자 3자리 이상은 사용할 수 없습니다(ex. abc, 123 등)</p> -->
                        <!-- <p class="notice-txt">한글, 특수문자 공백은 사용할 수 없습니다</p> -->

						<address>Copyright 2020. DAELIM FnC all rights reserved.</address>
				</form>
			</fieldset>
		</div>
	</div>

</div>

<!-- //wrapper -->
<script type="text/javascript">
    $(document).ready(function() {
    	if ( "${errMsg}" == "E01" ) {
    		alert("비밀번호가 일치하지 않습니다.");
    	}
    	else if ( "${errMsg}" == "E02" ) {
    		alert("계정이 잠겨 있습니다.");
    	}
    });
</script>

<%@include file="/WEB-INF/jsp/admin/main_footer.jsp"%>