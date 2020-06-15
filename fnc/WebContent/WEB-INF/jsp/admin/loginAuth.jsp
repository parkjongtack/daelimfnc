<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/jsp/admin/main_header.jsp"%>
<!-- wrapper -->
<div id="wrapper">
	<div class="loginwrap">
		<div class="ileft">
			<h1><img src="../../static/images/common/logo.png" alt="대림 Fnc 관리자"></h1>
			<p>개인정보 보호를 위해 관리자 본인인증을<br>실시하고 있습니다.</p>
		</div>
		<div class="loginbox">
			<fieldset>
				<legend>휴대폰 인증</legend>
					<ul>
						<li>
							<strong class="log-input-tit">휴대폰</strong>
							<span><c:out value="${adminVo.noMphn}"/></span>
							<a onclick="fn_resendOtp();" href="#" class="btn btn-secon w-auto fr">인증번호 재발송</a>
						</li>
						<li>
                            <input type="text" id="otp" name="otp" placeholder="인증번호" >
                        </li>
					</ul>
					<div class="btnc">
                        <input onclick="fn_authOtp();" type="submit" id="" name="" value="인증번호 확인">
                    </div>
					<address>Copyright 2020. DAELIM FnC all rights reserved.</address>
			</fieldset>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
    $(document).keypress(function(e){
        if(e.keyCode==13) fn_authOtp();
    });
});

function fn_resendOtp(){
    $.ajax({
    	url : "/admin/resendOtp.do"
    	,data: {noMphn:'<c:out value="${adminVo.noMphn}"/>'}
        ,type: 'POST'
        ,dataType : "json"
        ,success : function(result){
        	alert("인증번호를 재전송 했습니다.");
        }
        ,error : function(e){
        	alert("전송중 오류가 발생했습니다.");
        }
    });
}

function fn_authOtp(){
	$.ajax({
        url : "/admin/auth.do"
        ,data: {otp:$("#otp").val()}
        ,type: 'POST'
        ,dataType : "json"
        ,success : function(result){
            location.href="/admin/bnnList.do";
        }
        ,error : function(e){
            alert("인증에 실패했습니다.\n 인증번호를 확인 해 주세요.");
        }
    });
}
</script>
<!-- //wrapper -->
<%@include file="/WEB-INF/jsp/admin/main_footer.jsp"%>