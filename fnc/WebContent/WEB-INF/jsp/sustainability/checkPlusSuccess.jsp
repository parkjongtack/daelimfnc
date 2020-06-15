<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../static/js/jquery-1.10.2.js"></script>

<script type="text/javascript">

// 인증완료 후 openner 이동
function goCyber() {
	//document.domain = "daelim.co.kr";
	var frm = window.opener.cyberForm;
	frm.sName.value = "<c:out value="${sName}" />";
	frm.sMobileNo.value="<c:out value="${sMobileNo}" />";
	frm.sResponseNumber.value="<c:out value="${sResponseNumber}" />";
	frm.sBirthDate.value="<c:out value="${sBirthDate}" />";

	frm.action = "/sus02_2.do";
	frm.target = "";
	frm.submit();

	setTimeout(function(){
		self.close();
	}, 500);
}

</script>
<c:choose>
	<c:when test="${!empty sResponseNumber}">
		<script type="text/javascript">
		$(document).ready(function(){
			alert("<c:out value="${sName}" /> 님 본인인증이 정상적으로 확인 되었습니다.");
			goCyber();
		});
		</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
	$(document).ready(function(){
		alert("본인인증은 확인 되었으나 다음의 문제가 발생하였습니다.\n\n자세한 사항은 고객컨택센터(080-783-3000)로 문의해 주시기 바랍니다");
		/* if (!(location.href.indexOf("http://localhost:8080") < 0)) {					// 운영반영시 수정
			goCyber();
		} */
		goCyber();
		self.close();
	});
	</script>
	</c:otherwise>
</c:choose>
