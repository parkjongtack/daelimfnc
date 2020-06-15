<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>인재상 &lt; 인재채용 &lt; 홍보센터 &lt; DAELIM Fnc</title>
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
						<a href="javascript:void(0)">인재상<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/car01.do" class="active">인재상</a></li>
							<li><a href="/car02.do">인사제도</a></li>
							<li><a href="/car01List.do">채용정보</a></li>
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
			
			<h3>인재상</h3>
			<p class="sub-text-l">대림은 여러분의 창의적 도전을 기다립니다.</p>
			<div class="talent-box">
				<strong class="tit">한숲人상</strong>
				<p class="txt">
					세상의 중심이 되는 숲에서 모든 생명체는 각자의 생명력으로<br>조화를 이루며 살아갑니다.
				</p>
				<p class="txt">
					대림은 쾌적하고 풍요로운 세상을 함께 만들어갈 <br>
					인재를 찾습니다. <br>
					세계를 무대로 미래를 창조할 인재의 힘찬 도전을 <br>
					기다립니다.
				</p>
			</div>
			<ul class="talent-list">
				<li><strong>새로운</strong> 것을 찾는다</li>
				<li>자기 일에 <strong> 으뜸이</strong> 된다</li>
				<li><strong>팀웍</strong>을 이룬다</li>
				<li><strong>멀리</strong> 내려다본다</li>
				<li><strong>고객</strong> 을 잘안다</li>
				<li><strong>약속</strong> 을 지킨다</li>
				<li><strong>근검절약</strong> 을 한다</li>
			</ul>
		
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