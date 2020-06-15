<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>BOPP film &lt; 사업소개 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascr ipt:void(0)">사업소개<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do">회사소개</a></li>
							<li><a href="/biz01.do" class="active">사업소개</a></li>
							<li><a href="/rnd01.do">기술개발</a></li>
							<li><a href="/sus01_1.do">지속가능경영</a></li>
							<li><a href="/pr01.do">홍보센터</a></li>
							<li><a href="/car01.do">인재채용</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)">BOPP film<i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/biz01.do" class="active">BOPP film</a></li>
							<li><a href="/biz02.do">EVA Coated film</a></li>
							<li><a href="/biz03.do">특수코팅</a></li>
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

		<div class="sub-visual Biz">
			<h2>사업소개</h2>
		</div>
		<div id="content">
			<h3>BOPP film</h3>
			<div class="tit-img-box">
				<img src="../static/images/common/img_subtit_01.jpg" alt="" />
			</div>
			<h4>제품특징</h4>
			<table class="brdList row-type">
				<colgroup>
					<col width="320px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>투명한 색상 &amp; 인쇄성</th>
						<td>인쇄성 뛰어난 광택과 투명성, 우수한 인쇄성으로<br>포장/인쇄를 비롯한 다양한 분야 활용</td>
					</tr>
					<tr>
						<th>고기능성</th>
						<td>국내 유일 5-layer 설비 활용,<br>다양한 고기능성 제품 생산 가능</td>
					</tr>
					<tr>
						<th>고객 가치 향상</th>
						<td>방담, White, 내스크레치, 영구대전방지 등<br>다양한 용도 제품 생산으로 고객 가치 향상</td>
					</tr>
				</tbody>
			</table>
			<h4>제품규격</h4>
			<div class="search-chkbox-area">
				<strong class="search-tit">용도별 검색</strong>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_00" class="chk" name="checkbox" value="" checked>
					<label for="checkbox_00">전체</label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_01" class="chk" name="search" value="A">
					<label for="checkbox_01">인쇄/포장</label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_02" class="chk" name="search" value="B">
					<label for="checkbox_02">테이프</label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_03" class="chk" name="search" value="C">
					<label for="checkbox_03">일반합지</label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_04" class="chk" name="search" value="D">
					<label for="checkbox_04">Thermal용 합지</label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_05" class="chk" name="search" value="E">
					<label for="checkbox_05">기능성</label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_06" class="chk" name="search" value="F">
					<label for="checkbox_06">EVA</label>
				</span>
				<button type="button" class="btn btn-search" onclick="searchList();">검색</button>
			</div>

			<div class="rule-box">
				<strong class="rule-tit">명명규칙</strong>
				<span class="b-box">D</span><span>Daelim</span>
				<span class="b-box">G</span><span class="b-box">P</span><span>용도</span>
				<span class="b-box">2</span><span class="b-box">0</span><span>두께</span>
				<span class="b-box">1</span><span>표면처리</span>
			</div>

			<table class="brdList d-line-type">
				<colgroup>
					<col style="width:11%;">
					<col style="width:10%;">
					<col style="width:10%;">
					<col >
					<col style="width:11%;">
					<col style="width:10%;">
					<col style="width:6%;">
					<col style="width:6%;">
					<col style="width:6%;">
				</colgroup>
				<thead>
				<tr>
					<th scope="col" rowspan="2" colspan="2">구분</th>
					<th scope="col" rowspan="2">Grade</th>
					<th scope="col" rowspan="2">상세용도</th>
					<th scope="col" rowspan="2">두께</th>
					<th scope="col" rowspan="2">표면처리</th>
					<th colspan="3">제품인증서</th>
				</tr>
				<tr>
					<th scope="col">전체</th>
					<th scope="col">MSDS</th>
					<th scope="col">FDA</th>
				</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
			</table>
			<span class="tbl-info-txt">※ MIE 2.16kg, MIP 5kg, MIF 21.6kg</span>
			<div class="btn-area">
				<button type="button" class="btn btn-primary i-confirm" onclick="sendEmail('sikim@daelimfnc.co.kr','3','기타문의');">인증서 추가요청</button>
			</div>

			<h4>제품문의</h4>
			<table class="brdList">
				<colgroup>
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:25%;">
					<col style="width:25%;">
				</colgroup>
				<thead>
				<tr>
					<th>제품</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>BOPP</td>
					<td>홍준석</td>
					<td>031-688-3431</td>
					<td><a href="mailto:jshong@daelimfnc.co.kr" class="btn-mail">메일발송</a></td>
				</tr>
				<tr>
					<td>합성지</td>
					<td>장명훈</td>
					<td>031-688-3441</td>
                    <td><a href="mailto:mhjang@daelimfnc.co.kr" class="btn-mail">메일발송</a></td>
				</tr>
				<tr>
					<td>수출</td>
					<td>강병권</td>
					<td>031-688-3451</td>
                    <td><a href="mailto:marcus24@daelimfnc.co.kr" class="btn-mail">메일발송</a></td>
				</tr>
				</tbody>
			</table>
		
			<h4>대리점</h4>
			<table class="brdList">
				<colgroup>
					<col style="width:20%;">
					<col style="width:40%;">
					<col style="width:20%;">
					<col style="width:20%;">
				</colgroup>
				<thead>
				<tr>
					<th>대리점명</th>
					<th>주소</th>
					<th>연락처</th>
					<th>팩스</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>대림판매(주)</td>
					<td class="align-l">(04561) 서울특별시 중구 동호로34길 29 (광희동1가) 2층 </td>
					<td>02-2264-1600</td>
					<td>02-2273-9316</td>
				</tr>
				<tr>
					<td>(주)대인포리</td>
					<td class="align-l">(12737) 경기도 광주시 초월읍 산수로 45-11</td>
					<td>031-769-0061~3</td>
					<td>031-769-0064</td>
				</tr>
				<tr>
					<td>유한피엔피</td>
					<td class="align-l">(17311) 경기도 이천시 백사면 이여로 282-66</td>
					<td>031-634-6831</td>
					<td>031-634-6833</td>
				</tr>
				<tr>
					<td> (주)유창필름</td>
					<td class="align-l">(41587) 대구광역시 북구 침산로 40-1</td>
					<td>053-353-6558</td>
					<td>053-354-4470</td>
				</tr>
				<tr>
					<td>대림화성(주)</td>
					<td class="align-l">(10316) 경기도 고양시 일산동구 견달산로210번길 11</td>
					<td>031-969-0030~1</td>
					<td>031-969-1044</td>
				</tr>
				</tbody>
			</table>
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
<script type="text/javascript">
$(document).ready(function() {
	fn_getList();
	
	//체크박스 전체선택 및 전체해제
	$("#checkbox_00").click(function(){
	    if($("#checkbox_00").is(":checked")){
	        $(".chk").prop("checked", false);
	    } 
	    else{
	        $("#checkbox_00").prop("checked", true);
	    }
	    
	});
	    
	// 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
	$(".chk").click(function(){
	    if($("input[name='search']:checked").length == 0){
	    	$("#checkbox_00").prop("checked", true);
	    }else{
	        $("#checkbox_00").prop("checked", false);
	    }
	});
});

//목록
function fn_getList(){
	var chkVal = "";
	
	for (var i=1; i <= $('input:checkbox[name=search]').length; i++) {
		if ($('#checkbox_0' + i).is(":checked")) {
			if (chkVal != "") {
				chkVal += ",";
			}

			chkVal += $.trim($('#checkbox_0' + i).val());
		}
	}

	$.ajax({
        url : "/bizlist.do",
        type: 'POST',
        data: {
        	searchVal: chkVal
        },
        dataType : "json",
        beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
		},
        success: function(data) {
        	var html = "";
        	if(data.resultList != null && data.resultList.length > 0) {
	        	for(var i = 0; i < data.resultList.length; i++) {
		        			
	        		html += "<tr>";
		        	html += "	<td>" + data.resultList[i].gubun1 + "</td>";
		        	html += "	<td>" + data.resultList[i].gubun2 + "</td>";
		        	html += "	<td>" + data.resultList[i].nmPdct + "</td>";
		        	html += "	<td class='align-l'>" + data.resultList[i].atrb2 + "</td>";
		        	html += "	<td>" + data.resultList[i].atrb3 + "</td>";
		        	html += "	<td>" + data.resultList[i].atrb4 + "</td>";
		        	html += "<td>";
		        	if ($.trim(data.resultList[i].file1) != "") {
		        	html += "<a href='/fileDownload.do?idx=" + data.resultList[i].file1 + "&dir=product' class='btn-download type-all'><span class='blind'>전체다운로드</span></a>";
		        	}
		        	html += "</td>";
		        	html += "<td>";
		        	if ($.trim(data.resultList[i].file2) != "") {
		        	html += "<a href='/fileDownload.do?idx=" + data.resultList[i].file2 + "&dir=product' class='btn-download'><span class='blind'>MSDS</span></a>";
		        	}
		        	html += "</td>";
		        	html += "<td>";
		        	if ($.trim(data.resultList[i].file3) != "") {
		        	html += "<a href='/fileDownload.do?idx=" + data.resultList[i].file3 + "&dir=product' class='btn-download'><span class='blind'>FDA</span></a>";
		        	}
		        	html += "</td>";
		        	html += "</tr>";
	        	}
        	} else {
        		html += "<tr><td style='text-align: center;' colspan='9'>검색 데이터가 없습니다.</td></tr>";
        	}
        	
        	$("#tbody").html(html);
        }
	});
}

function searchList(){
	fn_getList();
}
</script>