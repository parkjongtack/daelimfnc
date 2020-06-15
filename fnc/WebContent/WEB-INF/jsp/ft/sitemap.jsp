<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function underCon() {
	alert("준비중입니다.");
}
function emailPop() {
	window.open('/email01.do','email01','width=800px,height=400px,menubar=no,scrollbars=no');
}
function customerPop() {
	window.open('/cus01.do','cus01','width=800px,height=400px');
}
</script>
	<div id="sitemapop" class="lyrsitemap">
		<div>
			<div class="title"><img src="./static/images/common/logo_t.png" alt="DAERIM FNC"></div>
			<h2>전체메뉴</h2>
			<ul class="sitemap">
				<li><a href="/com01.do">회사소개</a>
					<ul>
						<li><a href="/com01.do">기업정보</a></li>
						<!-- li><a href="/com02.do">CEO인사말</a></li -->
						<li><a href="/com03.do">기업연혁</a></li>
						<li><a href="/com04_1.do">그룹사 현황</a>
							<ul>
								<li><a href="/com04_1.do">개요</a></li>
								<li><a href="/com04_2.do">석유화학</a></li>
								<li><a href="/com04_3.do">건설</a></li>
								<li><a href="/com04_4.do">제조/상사</a></li>
								<li><a href="/com04_5.do">IT</a></li>
								<li><a href="/com04_6.do">레저</a></li>
								<li><a href="/com04_7.do">교육/문화</a></li>
								<li><a href="/com04_8.do">에너지</a></li>
							</ul>
						</li>
						<li><a href="/com05.do">오시는길</a></li>
					</ul>
				</li>
				<li><a href="/biz01.do">사업소개</a>
					<ul>
						<li><a href="/biz01.do">BOPP film</a></li>
						<li><a href="/biz02.do">EVA Coated film</a></li>
						<li><a href="/biz03.do">특수코팅</a></li>
					</ul>
				</li>
				<li><a href="/rnd01.do">기술개발</a>
					<ul>
						<li><a href="/rnd01.do">인증서</a></li>
						<li><a href="/rnd02.do">지적재산권</a></li>
					</ul>
				</li>
				<li><a href="/sus01_1.do">지속가능경영</a>
					<ul>
						<li><a href="/sus01_1.do">안전&middot;보건&middot;환경 경영</a>
							<ul>
								<li><a href="/sus01_1.do">HSE 경영방침</a></li>
								<li><a href="/sus01_2.do">OEMS 구조</a></li>
								<li><a href="/sus01_3_1.do">안전경영활동</a>
									<ul>
										<li><a href="/sus01_3_1.do">HSE 신조</a></li>
										<li><a href="/sus01_3_2.do">작업 및 공정안전</a></li>
										<li><a href="/sus01_3_3.do">비상사태대응</a></li>
										<li><a href="/sus01_3_4.do">안전문화정착</a></li>
									</ul>
								</li>
								<li><a href="/sus01_4.do">환경경영활동</a></li>
								<li><a href="/sus01_5.do">보건경영활동</a></li>
							</ul>
						</li>
						<li><a href="/sus02_1.do">정도경영</a>
							<ul>
								<li><a href="javascript:void(0)">사이버신문고</a></li> <!-- TODO : /sus02_1.do -->
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="/pr01.do">홍보센터</a>
					<ul>
						<li><a href="/pr01.do">회사소식</a></li>
						<li><a href="/pr02.do">CI/BI 소개</a></li>
					</ul>
				</li>
				<li><a href="/car01.do">인재채용</a>
					<ul>
						<li><a href="/car01.do">인재상</a></li>
						<li><a href="/car02.do">인사제도</a></li>
						<li><a href="/car01List.do">채용정보</a></li>
					</ul>
				</li>
			</ul>

			<div class="subsite">
			<ul>
				<li><a href="/ps01.do">고객센터</a>
					<ul>
						<li><a href="javascript:void(0)" onclick="sendEmail()">고객문의</a></li>
						<li><a href="https://oc.daelimchem.co.kr" target="_blank">오더센터</a></li>
						<li><a href="https://office.hiworks.com/daelimfnc.co.kr" target="_blank" title="새창열기">그룹웨어</a> </li>
						<li><a href="/ps01.do">개인정보처리방침</a></li>
						<li><a href="/md01.do">영상정보기기운영관리 방침</a> </li>
						<li><a href="javascript:emailPop()" title="새창열기">이메일 무단수집거부</a> </li>
					</ul>
				</li>
			</ul>
			</div>
			<a href="javascript:void(0)" class="icons popClose" title="전체메뉴보기 닫기"><em class="blind">닫기</em></a>
		</div>
	</div>