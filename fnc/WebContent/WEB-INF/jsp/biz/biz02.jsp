<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>EVA Coated Film &lt; 사업소개 &lt; DAELIMFnC</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
						<div class="lnb">
				<ul>
					<li>
						<a href="/main.do" class="home"><i class="icon-home"></i><span class="blind">홈</span></a>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_2"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/com01.do"><s:text name="header_sub_1"/></a></li>
							<li><a href="/biz01.do" class="active"><s:text name="header_sub_2"/></a></li>
							<li><a href="/rnd01.do"><s:text name="header_sub_3"/></a></li>
							<li><a href="/sus01_1.do"><s:text name="header_sub_4"/></a></li>
							<li><a href="/pr01.do"><s:text name="header_sub_5"/></a></li>
							<li><a href="/car01.do"><s:text name="header_sub_6"/></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:void(0)"><s:text name="header_sub_2_2"/><i class="icon-arr"></i></a>
						<ul class="submenus">
							<li><a href="/biz01.do"><s:text name="header_sub_2_1"/></a></li>
							<li><a href="/biz02.do" class="active"><s:text name="header_sub_2_2"/></a></li>
							<li><a href="/biz03.do"><s:text name="header_sub_2_3"/></a></li>
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
			<h2><s:text name="biz_title"/></h2>
		</div>
		<div id="content">
			<h3>EVA Coated Film</h3>
			<div class="tit-img-box">
				<img src="../static/images/common/img_subtit_02.jpg" alt="" />
			</div>
			<h4><s:text name="biz02_1"/></h4>
			<table class="brdList row-type">
				<colgroup>
					<col width="320px">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th><s:text name="biz02_2"/></th>
						<td><s:text name="biz02_3"/></td>
					</tr>
					<tr>
						<th><s:text name="biz02_4"/></th>
						<td><s:text name="biz02_5"/></td>
					</tr>
					<tr>
						<th><s:text name="biz02_6"/></th>
						<td><s:text name="biz02_7"/></td>
					</tr>
				</tbody>
			</table>
			<h4><s:text name="biz02_8"/></h4>
			<div class="search-chkbox-area">
				<strong class="search-tit"><s:text name="biz01_9"/></strong>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_00" class="chk" name="checkbox" value="" checked>
					<label for="checkbox_00"><s:text name="biz01_10"/></label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_01" class="chk" name="search" value="A">
					<label for="checkbox_01"><s:text name="biz01_11"/></label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_02" class="chk" name="search" value="B">
					<label for="checkbox_02"><s:text name="biz01_12"/></label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_03" class="chk" name="search" value="C">
					<label for="checkbox_03"><s:text name="biz01_13"/></label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_04" class="chk" name="search" value="D">
					<label for="checkbox_04"><s:text name="biz01_14"/></label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_05" class="chk" name="search" value="E">
					<label for="checkbox_05"><s:text name="biz01_15"/></label>
				</span>
				<span class="checkbox-area">
					<input type="checkbox" id="checkbox_06" class="chk" name="search" value="F">
					<label for="checkbox_06">EVA</label>
				</span>
				<button type="button" class="btn btn-search" onclick="searchList();"><s:text name="biz01_17"/></button>
			</div>
			
			<div class="rule-box">
				<strong class="rule-tit"><s:text name="biz01_17"/></strong>
				<span class="b-box">D</span><span>Daelim</span>
				<span class="b-box">G</span><span class="b-box">P</span><span><s:text name="biz01_19"/></span>
				<span class="b-box">2</span><span class="b-box">0</span><span><s:text name="biz01_20"/></span>
				<span class="b-box">1</span><span><s:text name="biz01_21"/></span>
			</div>

			<table class="brdList d-line-type">
				<colgroup>
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col >
                    <col style="width:11%;">
                    <col style="width:11%;">
                    <col style="width:6%;">
                    <col style="width:6%;">
                    <col style="width:6%;">
				</colgroup>
				<thead>
				<tr>
                    <th scope="col" rowspan="2" colspan="2"><s:text name="biz01_22"/></th>
					<th scope="col" rowspan="2">Grade</th>
					<th scope="col" rowspan="2"><s:text name="biz01_23"/></th>
					<th scope="col" rowspan="2"><s:text name="biz01_24"/></th>
					<th scope="col" rowspan="2"><s:text name="biz01_25"/></th>
					<th colspan="3"><s:text name="biz01_26"/></th>
				</tr>
				<tr>
                    <th scope="col"><s:text name="biz01_27"/></th>
                    <th scope="col">MSDS</th>
                    <th scope="col">FDA</th>
				</tr>
				</thead>
				<tbody id="tbody">
				
				</tbody>
			</table>
			<span class="tbl-info-txt">※ MIE 2.16kg, MIP 5kg, MIF 21.6kg</span>
			<%					
			    if(name.equals("ko_KR")){
			%>	
			<div class="btn-area">
				<button type="button" class="btn btn-primary i-confirm" onclick="sendEmail('sikim@daelimfnc.co.kr','3','기타문의');"><s:text name="biz02_32"/></button>
			</div>
			<%} %>
			
			<h4><s:text name="biz01_28"/></h4>
			<table class="brdList">
				<colgroup>
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:25%;">
					<col style="width:25%;">
				</colgroup>
				<thead>
				<tr>
					<th><s:text name="biz01_29"/></th>
					<th><s:text name="biz01_30"/></th>
					<th><s:text name="biz01_31"/></th>
					<th><s:text name="biz01_32"/></th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><s:text name="biz01_33"/></td>
					<td><s:text name="biz01_34"/></td>
					<td><s:text name="biz01_35"/></td>
					<td><a href="<s:text name="biz_mail_1"/>" class="btn-mail"><s:text name="biz01_36"/></a></td>
				</tr>
				<tr>
					<td><s:text name="biz01_33"/></td>
					<td><s:text name="biz01_38"/></td>
					<td><s:text name="biz01_39"/></td>
					<td><a href="<s:text name="biz_mail_2"/>" class="btn-mail"><s:text name="biz01_36"/></a></td>
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
		url : "./biz02List.do",
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
					<%					
				    	if(name.equals("ko_KR")){
					%>			        	
		        	html += "	<td>" + data.resultList[i].atrb2 + "</td>";
		        	html += "	<td class='align-l'>" + data.resultList[i].atrb3 + "</td>";
		        	html += "	<td>" + data.resultList[i].atrb4 + "</td>";
		        	<%
				    	} else {
		        	%>
		        	html += "	<td>" + data.resultList[i].atrb_2_en + "</td>";
		        	html += "	<td class='align-l'>" + data.resultList[i].atrb_3_en + "</td>";
		        	html += "	<td>" + data.resultList[i].atrb_4_en + "</td>";

		        	<%
				    	}
		        	%>
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
        	console.log(html);
        	$("#tbody").html(html);
        }
	});
}

function searchList(){
	fn_getList();
}
</script>