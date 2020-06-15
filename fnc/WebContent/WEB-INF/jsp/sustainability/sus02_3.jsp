<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>신고완료 &lt; 사이버신문고 &lt; 정도경영 &lt; 지속가능경영 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("인증절차를 거치신 후 접속해 주세요.");
  document.location.href="/sus02_1.do";
 </script>
<%
  return;
 }
%>
				<div class="lnb">
					<ul>
						<li>
							<a href="javascript:void(0)" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
						</li>
						<li>
							<a href="javascript:void(0)">지속가능경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/com01.do">회사소개</a></li>
								<li><a href="/biz01.do">사업소개</a></li>
								<li><a href="/rnd01.do">기술개발</a></li>
								<li><a href="/sus01_1.do" class="active">지속가능경영</a></li>
								<li><a href="/pr01.do">홍보센터</a></li>
								<li><a href="/car01.do">인재채용</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)">정도경영<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus01_1.do">안전·보건·환경 경영</a></li>
								<li><a href="/sus02_1.do" class="active">정도경영</a></li>
							</ul>
						</li>
						<li>
							<a href="javascript:void(0)" class="active">사이버신문고<i class="icon-arr"></i></a>
							<ul class="submenus">
								<li><a href="/sus02_1.do" class="active">사이버신문고</a></li>
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

			<div class="sub-visual Sustainability">
				<h2>지속가능경영</h2>
			</div>
			<div id="content">
				<h3>사이버신문고</h3>
				<p class="sub-text align-c">
					대림에프엔씨와의 거래나 접촉 시 임직원의 부당한 요구나 불공정 행위로 인해 피해를 입으신 사항이나<br>
					윤리경영을 위한 제안, 건의사항 등을 보내주시면 확인 후 성실히 답변해 드리겠습니다.
				</p>
				<div class="bg-text-box type-notice">
					<p class="text">사이트 이용관련 또는 기타 문의는 고객문의를 이용해 주십시오.</p>
					<a href="javascript:void(0)" class="btn btn-arrow" onclick="sendEmail('sikim@daelimfnc.co.kr','3','기타문의')">고객문의 이용하기</a>
				</div>
				<ul class="step-list">
					<li class="step1 active">
						<span class="blind">1</span>
						<span class="txt">약관동의<br>본인인증</span>
					</li>
					<li class="step2 active">
						<span class="blind">2</span>
						<span class="txt">신고내용<br>등록하기</span>
					</li>
					<li class="step3 active">
						<span class="blind">3</span>
						<span class="txt">신고완료</span>
					</li>
				</ul>
				<h4 class="blind">신고완료</h4>
				<div class="complete-box">
					<p>신고하신 내용이 접수되었습니다.</p>
				</div>
				<div class="btn-area">
					<button type="button" class="btn btn-secondary" onclick="location.href = '/sus02_1.do';">신고 초기페이지로</button>
					<button type="button" class="btn btn-primary" onclick="location.href = '/main.do';">메인페이지</button>
				</div>
			</div>
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