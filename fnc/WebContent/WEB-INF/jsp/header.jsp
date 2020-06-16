<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="expires" content="0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />
<meta name="keywords" content="BOPP Film, EVA Coated Film 소개" />
<meta name="description" content="대림에프엔씨는 플라스틱가공 전문기업으로 BOPP Film, EVA Coated Film을 생산하며 지속적인 성장과 차별화된 고객가치를 실현하고 있습니다." />
<meta property="og:title" name="og_title" content="대림에프엔씨 주식회사" />
<meta property="og:type" name="og_type" content="website" />
<!-- <meta property="og:url" name="og_url" content="/main.do" /> -->
<meta property="og:description" name="og_description" content="대림에프엔씨는 플라스틱가공 전문기업으로 BOPP Film, EVA Coated Film을 생산하며 지속적인 성장과 차별화된 고객가치를 실현하고 있습니다." />
<!-- <link rel="canonical" href="/main.do" /> -->
<link rel="shortcut icon" href="../static/images/common/daelim.ico" />
<!-- [if lt IE 9] -->
<script type="text/javascript" src="../static/js/html5shiv.min.js"></script>
<link rel="stylesheet" type="text/css" href="../static/css/ie8.css">
<!-- <![endif] -->
<link rel="stylesheet" href="../static/css/common.css">
<link rel="stylesheet" href="../static/css/contents.css">
<link rel="stylesheet" href="../static/css/print.css">
<link rel="stylesheet" href="../static/css/slick.css">
<link rel="stylesheet" href="../static/css/main.css">
<script type="text/javascript" src="../static/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../static/js/slick.min.js"></script>
<script type="text/javascript" src="../static/js/common.js"></script>
<script type="text/javascript" src="../static/js/paging.js"></script>
<script type="text/javascript">
function underCon() {
	alert("준비중입니다.");
}
function emailPop() {
	window.open('/email01.do','email01','width=800px,height=400px,menubar=no,scrollbars=no');
}
function downloadFileAll(){
	alert('준비중입니다.');
}
</script>
<!-- Global site tag (gtag.js) - Google Analytics -->

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-162305477-1"></script>

<script>

  window.dataLayer = window.dataLayer || [];

  function gtag(){dataLayer.push(arguments);}

  gtag('js', new Date());

 

  gtag('config', 'UA-162305477-1');

</script>

 
</head>
<body>
<!-- wrapper -->
<div id="wrapper">

	<ul id="skipnavi">
		<li><a href="#content">본문 바로가기</a></li>
	</ul>
  
	<header>
		<div class="innerwrap">
			<div class="gnbwrap">
				<h1><a href="/main.do">대림Fnc</a></h1>
				<ul id="gnb">
					<li><a href="/com01.do"><s:text name="header_sub_1"/></a>
						<ul>
							<li><a href="/com01.do"><s:text name="header_sub_1_1"/></a></li>
							<!-- li><a href="/com02.do">CEO 인사말</a></li  -->
							<li><a href="/com03.do"><s:text name="header_sub_1_2"/></a></li>
							<li><a href="/com04_1.do"><s:text name="header_sub_1_3"/></a></li>
							<li><a href="/com05.do"><s:text name="header_sub_1_4"/></a></li>
						</ul>
					</li>
					<li><a href="/biz01.do"><s:text name="header_sub_2"/></a>
						<ul>
							<li><a href="/biz01.do"><s:text name="header_sub_2_1"/></a></li>
							<li><a href="/biz02.do"><s:text name="header_sub_2_2"/></a></li>
							<li><a href="/biz03.do"><s:text name="header_sub_2_3"/></a></li>
						</ul>
					</li>
					<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a>
						<ul>
							<li><a href="/rnd01.do"><s:text name="header_sub_3_1"/></a></li>
							<li><a href="/rnd02.do"><s:text name="header_sub_3_2"/></a></li>
						</ul>
					</li>
					<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a>
						<ul>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4_1"/></a></li>
							<li><a href="/sus02_1.do"><s:text name="header_sub_4_2"/></a></li>
						</ul>
					</li>
					<li><a href="/pr01.do"><s:text name="header_sub_5"/></a>
						<ul>
							<li><a href="/pr01.do"><s:text name="header_sub_5_1"/></a></li>
							<li><a href="/pr02.do"><s:text name="header_sub_5_2"/></a></li>
						</ul>
					</li>
					<li><a href="/car01.do"><s:text name="header_sub_6"/></a>
						<ul>
							<li><a href="/car01.do"><s:text name="header_sub_6_1"/></a></li>
							<li><a href="/car02.do"><s:text name="header_sub_6_2"/></a></li>
							<li><a href="/car01List.do"><s:text name="header_sub_6_3"/></a></li>
						</ul>
					</li>
                </ul>
                <%
                String lang_session = (String)session.getAttribute("lang");
            	out.println(lang_session);
                	//out.println(request.getParameter("request_locale"));
	    			String request_locale = request.getParameter("request_locale");
                	
                	if(request_locale == null){
                		request_locale = "ko";
                	}
                	
                	session.setAttribute("request_locale", request_locale);
                	//out.println(request_locale);
                %>
                <form action="<% request.getRequestURI(); %>" method="post" name="form_lang">
			    	<select name="request_locale" class="lang_select">
			    		<%
							
                            if(request_locale.equals("en")){
                        %>
			    		<option value="en">EN</option>
                        <option value="ko">KO</option>
                        <%
                            }else{
                        %>
                        <option value="ko">KO</option>
                        <option value="en">EN</option>
                        <%
                            }
                        %>
                    </select>
                </form>
				<div class="gnbAside">
					<a href="javascript:void(0)" id="showSitemap" class="icon-gnb" title="전체메뉴보기"><em class="blind">사이트맵</em></a>
				</div>
			</div>
    <script>
        var form_lang = document.form_lang;
        var w_href = location.href
        console.log(w_href);
        $('.lang_select').change(function(){
            var lang_ = $(this).val();
            //sessionStorage.setItem("lang",lang_);
            //alert(lang_);
            location.href = "<% request.getRequestURI(); %>?request_locale="+lang_;
            //var form = document.form_lang;
            //form.submit();
        });
    </script>