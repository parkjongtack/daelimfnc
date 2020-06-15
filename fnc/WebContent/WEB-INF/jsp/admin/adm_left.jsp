<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="left">
	<nav id="lnb">
		<ul>
			<li>
				<a href="/admin/comList.do">국문관리</a>
				<ul>
					<li><a href="/admin/bnnList.do" class="main">메인 이미지 관리(준비중)</a></li>
					<li><a href="/admin/popList.do" class="pop">팝업 관리(준비중)</a></li>
					<li><a href="/admin/comList.do" class="com">회사 소식 관리</a></li>
					<li><a href="/admin/carList.do" class="car">채용정보 관리</a></li>
					<li><a href="/admin/perList.do" class="per">개인정보 관리(준비중)</a></li>
					<li><a href="/admin/bizList.do" class="biz">제품 관리</a></li>
				</ul>
			</li>
<c:if test="${adminVo.clAdmnPrsn eq 'A'}">
			<li>
				<a href="/admin/admList.do">관리자 관리</a>
				<ul>
					<li><a href="/admin/admList.do" class="adm">관리자 등록</a></li>
				</ul>
			</li>
</c:if>
		</ul>
	</nav>
</div>

<script type="text/javascript">
	$(function() {
		/* 좌측메뉴 선택 기능 : S */
		$("#lnb a").removeClass("active"); // active 클래스 제거

		if($(location).attr('pathname').toLowerCase().indexOf("bnn") > -1) { // 메인이미지
			lnbShow("0", "main");
		} else if($(location).attr('pathname').toLowerCase().indexOf("pop") > -1) { // 팝업관리
			lnbShow("0", "pop");
		} else if($(location).attr('pathname').toLowerCase().indexOf("com") > -1) { // 회사소식관리
			lnbShow("0", "com");
		} else if($(location).attr('pathname').toLowerCase().indexOf("car") > -1) { // 채용정보관리
			lnbShow("0", "car");
		} else if($(location).attr('pathname').toLowerCase().indexOf("biz") > -1) { // 제품관리
			lnbShow("0", "biz");
		} else if($(location).attr('pathname').toLowerCase().indexOf("per") > -1) { // 제품관리
			lnbShow("0", "per");
		} else { // 관리자 관리
			lnbShow("1", "adm");
		}
		/* 좌측메뉴 선택 기능 : E */
	});
	
	// active 클래스 부여
	function lnbShow(no, classNm) {
		$("#lnb > ul > li:eq(" + no + ")").addClass("active");
		$("#lnb > ul > li:eq(" + no + ") ul").show();
		$("#lnb > ul > li:eq(" + no + ") ." + classNm).addClass("active");
	}
</script>