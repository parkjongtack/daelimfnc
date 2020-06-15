<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>DAERIM Fnc</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="expires" content="0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />
<link rel="shortcut icon" href="../../static/images/common/daelim.ico" />
<!--[if lt IE 9]>
<script src="./static/admin/js/html5shiv.js"></script>
<![endif]-->
<link rel="stylesheet" href="../../static/admin/css/common.css" media="all">
<link rel="stylesheet" href="../../static/admin/css/jquery-ui.css" media="all">
<script type="text/javascript" src="../../static/admin/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../../static/admin/js/jquery-ui.js"></script>
<script type="text/javascript" src="../../static/admin/js/common.js"></script>
<script type="text/javascript" src="../../static/admin/js/paging.js"></script>
<script type="text/javascript" src="../../static/admin/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$( function() {
	$(".datepicker").datepicker(
		{dateFormat: "yy-mm-dd"}	   		
	);
} );
</script>
</head>
<body>
<!-- wrapper -->
<div id="wrapper"> 

	<!-- header -->
	<header>
		<div class="inrwrap">
			<h1><img src="../../static/admin/images/common/logo.png" alt="DARIM Fnc"></h1>
			<h2><img src="../../static/admin/images/common/tit_login.png" alt="Admin"></h2>
			<div class="fncdv">
				<div class="info">
					<p><span class="txtip">접속 IP : ${adminVo.ipAdmnPrsn}</span><span>${adminVo.loginDate}</span></p>
					<p class="name"><a href="#">${adminVo.userNm}</a></p>
				</div>
				<div class="fnc">
					<a href="/admin/logout.do" class="btn btnlogout">로그아웃</a>
				</div>
			</div>
		</div>
	</header>