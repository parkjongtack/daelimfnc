<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>목록 &lt; 채용정보 &lt; 인재채용 &lt; DAELIM Fnc</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
			<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)">인재채용<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">회사소개</a></li>
							<li><a href="/biz01.do">사업소개</a></li>
							<li><a href="/rnd01.do">기술개발</a></li>
							<li><a href="/sus01_1.do">지속가능경영</a></li>
							<li><a href="/pr01.do">홍보센터</a></li>
							<li><a href="/car01.do" class="active">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">채용정보<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/car01.do">인재상</a></li>
							<li><a href="/car02.do">인사제도</a></li>
							<li><a href="/car01List.do" class="active">채용정보</a></li>
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

		<div class="sub-visual Careers"><h2>인재채용</h2></div>

		<div id="content">
			
			<h3>채용정보</h3>

			<section>
				<div class="newsView">
					<div class="newsHead">
						<h4>${resultVo.sbjtNtcPlte}</h4>
						<p>${resultVo.dtRgst }</p>
					</div>
					<div class="newsHead_b">
						<!-- <span class="badge bg01">접수마감</span> -->
						<span class="badge bg02">${resultVo.statNtc}</span>
						<span class="date">${resultVo.dtBegnc } ~ ${resultVo.dtEnd }</span>
						<div class="fr">
							<strong class="r-tit">다운로드</strong>
							<c:forEach var="file" items="${fileVoList}" varStatus="status">
							<a href="/fileDownload.do?idx=${file.noAtchFileDtilSral }&dir=community"><c:out value="${file.nmLogiFile }"/></a>
							</c:forEach>
						</div>
					</div>
				<div class="newsContent">
					<article>
						<p>
							${resultVo.cntsNtcPlte}
						</p>
					</article>
				</div>
				</div>
				<div class="brdViewNav">
					<div class="nav prev"><a href="javascript:goBefore('${resultVo.beforeID }');" class="btn btn-brdnav">${resultVo.beforeNm } </a></div>
					<a href="/car01List.do" class="btn btn-brdnav list">목록으로 이동</a>
					<div class="nav next"><a href="javascript:goNext('${resultVo.nextID }');" class="btn btn-brdnav">${resultVo.nextNm }</a></div>
				</div>
			</section>
<script language="javascript">
	function goBefore(idx) {
		if (idx > 0) {
			location.href="/car01Detail.do?noNtcPlteSral="+idx;
		} else{
		}		
	}
	
	function goNext(idx) {
		if (idx > 0) {
			location.href="/car01Detail.do?noNtcPlteSral="+idx;
		} else{
		}
	}
</script>			

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