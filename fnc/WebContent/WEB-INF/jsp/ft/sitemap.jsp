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
			<h2><s:text name="header_all_title"/></h2>
			<ul class="sitemap">
				<li><a href="/com01.do"><s:text name="header_all_1"/></a>
					<ul>
						<li><a href="/com01.do"><s:text name="header_all_1_1"/></a></li>
						<!-- li><a href="/com02.do">CEO인사말</a></li -->
						<li><a href="/com03.do"><s:text name="header_all_1_2"/></a></li>
						<li><a href="/com04_1.do"><s:text name="header_all_1_3"/></a>
							<ul>
								<li><a href="/com04_1.do"><s:text name="header_all_1_3_1"/></a></li>
								<li><a href="/com04_2.do"><s:text name="header_all_1_3_2"/></a></li>
								<li><a href="/com04_3.do"><s:text name="header_all_1_3_3"/></a></li>
								<li><a href="/com04_4.do"><s:text name="header_all_1_3_4"/></a></li>
								<li><a href="/com04_5.do"><s:text name="header_all_1_3_5"/></a></li>
								<li><a href="/com04_6.do"><s:text name="header_all_1_3_6"/></a></li>
								<li><a href="/com04_7.do"><s:text name="header_all_1_3_7"/></a></li>
								<li><a href="/com04_8.do"><s:text name="header_all_1_3_8"/></a></li>
							</ul>
						</li>
						<li><a href="/com05.do"><s:text name="오시는길"/></a></li>
					</ul>
				</li>
				<li><a href="/biz01.do"><s:text name="header_all_2"/></a>
					<ul>
						<li><a href="/biz01.do"><s:text name="header_all_2_1"/></a></li>
						<li><a href="/biz02.do"><s:text name="header_all_2_2"/></a></li>
						<li><a href="/biz03.do"><s:text name="header_all_2_3"/></a></li>
					</ul>
				</li>
				<li><a href="/rnd01.do"><s:text name="header_all_3"/></a>
					<ul>
						<li><a href="/rnd01.do"><s:text name="header_all_3_1"/></a></li>
						<li><a href="/rnd02.do"><s:text name="header_all_3_2"/></a></li>
					</ul>
				</li>
				<li><a href="/sus01_1.do"><s:text name="header_all_4"/></a>
					<ul>
						<li><a href="/sus01_1.do"><s:text name="header_all_4_1"/></a>
							<ul>
								<li><a href="/sus01_1.do"><s:text name="header_all_4_1"/></a></li>
								<li><a href="/sus01_2.do"><s:text name="header_all_4_2"/></a></li>
								<li><a href="/sus01_3_1.do"><s:text name="header_all_4_3"/></a>
									<ul>
										<li><a href="/sus01_3_1.do"><s:text name="header_all_4_1_3_1"/></a></li>
										<li><a href="/sus01_3_2.do"><s:text name="header_all_4_1_3_2"/></a></li>
										<li><a href="/sus01_3_3.do"><s:text name="header_all_4_1_3_3"/></a></li>
										<li><a href="/sus01_3_4.do"><s:text name="header_all_4_1_3_4"/></a></li>
									</ul>
								</li>
								<li><a href="/sus01_4.do"><s:text name="header_all_4_1_4"/></a></li>
								<li><a href="/sus01_5.do"><s:text name="header_all_4_1_5"/></a></li>
							</ul>
						</li>
						<li><a href="/sus02_1.do"><s:text name="header_all_4_2"/></a>
							<ul>
								<li><a href="javascript:void(0)"><s:text name="header_all_4_2_1"/></a></li> <!-- TODO : /sus02_1.do -->
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="/pr01.do"><s:text name="header_all_5"/></a>
					<ul>
						<li><a href="/pr01.do"><s:text name="header_all_5_1"/></a></li>
						<li><a href="/pr02.do"><s:text name="header_all_5_2"/></a></li>
					</ul>
				</li>
				<li><a href="/car01.do"><s:text name="header_all_6"/></a>
					<ul>
						<li><a href="/car01.do"><s:text name="header_all_6_1"/></a></li>
						<li><a href="/car02.do"><s:text name="header_all_6_2"/></a></li>
						<li><a href="/car01List.do"><s:text name="header_all_6_2"/></a></li>
					</ul>
				</li>
			</ul>

			<div class="subsite">
			<ul>
				<li><a href="/ps01.do"><s:text name="header_all_cs_1"/></a>
					<ul>
						<li><a href="javascript:void(0)" onclick="sendEmail()"><s:text name="header_all_cs_2"/></a></li>
						<li><a href="https://oc.daelimchem.co.kr" target="_blank"><s:text name="header_all_cs_3"/></a></li>
						<li><a href="https://office.hiworks.com/daelimfnc.co.kr" target="_blank" title="새창열기"><s:text name="header_all_cs_4"/></a> </li>
						<li><a href="/ps01.do"><s:text name="header_all_cs_5"/></a></li>
						<li><a href="/md01.do"><s:text name="header_all_cs_6"/></a> </li>
						<li><a href="javascript:emailPop()" title="새창열기"><s:text name="header_all_cs_7"/></a> </li>
					</ul>
				</li>
			</ul>
			</div>
			<a href="javascript:void(0)" class="icons popClose" title="전체메뉴보기 닫기"><em class="blind">닫기</em></a>
		</div>
	</div>