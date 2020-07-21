<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>목록 &lt; 회사소식 &lt; 홍보센터 &lt; DAELIM Fnc</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<script type="text/javascript">
function goList() {
	
	$("#searchForm").prop("action", "/pr01.do");
	$("#searchForm").submit();
}

function goView(idx){

	$("#idx").val(idx);
	$("#searchForm").prop("action", "/pr01view.do");
	$("#searchForm").submit();
}
</script>

			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_5"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do" class="active"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="pr01_1"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/pr01.do" class="active"><s:text name="pr01_1"/></a></li>
							<li><a href="/pr02.do"><s:text name="pr02_1"/></a></li>
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

		<div class="sub-visual Pr"><h2><s:text name="header_sub_5"/></h2></div>

		<div id="content">
			
			<h3><s:text name="pr01_1"/></h3>

			<section>
				<div class="newsView">
					<div class="newsHead">
					 <%
				     	if(name.equals("ko_KR")){
				 	 %>						
						<h4><span>[${result.clGbnNm}]</span> ${result.sbjtNtcPlte}</h4>
						<p>${fn:substring(result.dtRgst,0,4)}.${fn:substring(result.dtRgst,4,6)}.${fn:substring(result.dtRgst,6,8)}</p>
					<%
				     	} else {
					%>
						<h4><span>[${result.clGbnNm2}]</span> ${result.sbjtNtcPlteEn}</h4>
						<p>${fn:substring(result.dtRgst,0,4)}.${fn:substring(result.dtRgst,4,6)}.${fn:substring(result.dtRgst,6,8)}</p>					
					<%
				     	}
					%>
					</div>
				<c:choose>	
					<c:when test="${fileVoList.size() > 0}">					
					<div class="newsHead_b">
						<div class="fr">
							<strong class="r-tit">다운로드</strong>
							<c:forEach var="file" items="${fileVoList}" varStatus="status">
							<a href="/fileDownload.do?idx=${file.noAtchFileDtilSral }&dir=community"><c:out value="${file.nmLogiFile }"/></a>
							</c:forEach>
						</div>
					</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>						
				<div class="newsContent">
					 <%
				     	if(name.equals("ko_KR")){
				 	 %>					
					<article><c:out value="${result.cntsNtcPlte}" escapeXml="false"/></article>
					<%
				     	} else {
					%>
					<article><c:out value="${result.cntsNtcPlteEn}" escapeXml="false"/></article>					
					<%
				     	}
					%>
				</div>
				</div>
				
				<form id="searchForm" name="searchForm" method="post">
					<input type="hidden" id="idx" name="idx" value="" />
					<input type="hidden" id="searchCls" name="searchCls" value="${searchCls}" />
					<input type="hidden" id="searchCnts" name="searchCnts" value="${searchCnts}" />
				</form>

				<div class="brdViewNav">
				<c:choose>	
					<c:when test="${prev != null }">
					<div class="nav prev"><a href="javascript:goView('${prev.noNtcPlteSral }');" class="btn btn-brdnav">${prev.sbjtNtcPlte }</a></div>
					</c:when>
					<c:otherwise>
					<div class="nav prev nonelst"><a href="javascript:void(0);" class="btn btn-brdnav">이전 글이 없습니다.</a></div>
					</c:otherwise>
				</c:choose>	
					<a href="javascript:goList();" class="btn btn-brdnav list">목록으로 이동</a>
				<c:choose>	
					<c:when test="${next != null }">
					<div class="nav next"><a href="javascript:goView('${next.noNtcPlteSral }');" class="btn btn-brdnav">${next.sbjtNtcPlte }</a></div>
					</c:when>
					<c:otherwise>
					<div class="nav next nonelst"><a href="javascript:void(0);" class="btn btn-brdnav">다음 글이 없습니다.</a></div>
					</c:otherwise>
				</c:choose>	
				</div>
			</section>
			

		</div>
		<!-- // #content -->
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