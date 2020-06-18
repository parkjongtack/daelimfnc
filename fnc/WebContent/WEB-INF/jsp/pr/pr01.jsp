<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("newLineChar", "\n"); %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<title>목록 &lt; 회사소식 &lt; 홍보센터 &lt; DAELIM Fnc</title>
<%@ include file="/WEB-INF/jsp/header.jsp" %>
<script type="text/javascript">
var thumbPath = "${THUMB_PATH }";

$(function() {
	fn_getList(startNum,endNum);
});

//목록
function fn_getList(sNum,eNum) {
	
	
	var searchCls = $("#searchCls").val();
	var searchCnts = $("#searchCnts").val();

	$.ajax({
		url : "/pr01List.do",
		type: 'POST',
		data: {
			searchCls : searchCls,
			searchCnts : searchCnts,
			sNum : sNum,
			eNum : eNum
		},
		dataType : "json",
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
		},
		success: function(data) {
			console.log("data: " + JSON.stringify(data));
			$(".brdCount").find("strong").text(data.cnt);
			var html = "";
			if (data.resultList != null && data.resultList.length > 0) {
				for (var i = 0; i < data.resultList.length; i++) {
					var result = data.resultList[i];
					var cntsSmry = result.cntsSmry;
					var dtRgst = result.dtRgst;
					var dtRgst = dtRgst.substring(0,4) + "-" + dtRgst.substring(4,6) + "-" + dtRgst.substring(6,8);
					
					html += '<li>';
					html += '<a href="javascript:goView(' + result.noNtcPlteSral + ');" class="thumbnail"><img src="' + thumbPath + result.nmPhysFile + '" alt="' + result.cntsFileDtil + '"></a>';
					html += '<div class="highlight">';
					html += '<a href="javascript:goView(' + result.noNtcPlteSral +');"><span>[' + result.clGbnNm + ']</span> ' + result.sbjtNtcPlte + '</a>';
					html += '<p>' + cntsSmry.replace(/\n/g, "<br />") + '</p>';
					html += '<span>' + dtRgst + '</span>';
					html += '</div>';
					html += '</li>';

	        	}
      			/* $.paginView(data.cnt); */
				totalData = Number(data.cnt);
				
				toatalPage = Math.ceil(totalData/rowPer);

				var pageGroup = Math.ceil(currentPage/pagePer);
				
				var last = pageGroup*pagePer;

				if(last>toatalPage){
					last = toatalPage;
				}
				
				var fisrt = (pagePer*pageGroup)-(pagePer-1);
				var next = last+1;
				var prev = fisrt-1;
      		$(".btn-area").find("strong").text(currentPage);
      		$(".btn-area").find("span").text(toatalPage);

      		if (currentPage >= toatalPage) {
    			$(".btn-full-more").attr("disabled",true);
    		}
      	} else {
      		html += '<li>';
			html += '<div class="nolist">등록된 게시물이 없습니다</div>';
			html += '</li>';
      	}

      	$(".thumbnailList").append(html);
      },
      error: function(xhr, textStatus, error) {
      	if(xhr.status == "500") {
      		alert("Session connection is lost.");
      		location.href = "/";
      	} else {
      		alert("error");
      	}
      }
  });
}

$.pagingSet(5);

//페이징 처리
function pagingMore(num){

//	currentPage = num;
	
	endNum = (rowPer*num).toString();
	startNum = ((rowPer*num)-(rowPer-1)).toString();
	fn_getList(startNum, endNum);
}

function goSearch() {
	$.pagingSet();
	$(".thumbnailList").text("");
	fn_getList(startNum,endNum);
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

		<div class="sub-visual Pr"><h2>홍보센터</h2></div>

		<div id="content">

			<h3><s:text name="pr01_1"/></h3>

			<section>
				<form id="searchForm" name="searchForm" method="post">
					<input type="hidden" id="idx" name="idx" value="" />
					
					<fieldset>
						<div class="srchArea">
							<select id="searchCls" name="searchCls" title="검색조건선택">
								<option value="1" <c:if test="${searchCls == '1' }">selected="selected"</c:if>><s:text name="pr01_2"/></option>
								<option value="2" <c:if test="${searchCls == '2' }">selected="selected"</c:if>><s:text name="pr01_3"/></option>
								<option value="3" <c:if test="${searchCls == '3' }">selected="selected"</c:if>><s:text name="pr01_4"/></option>
							</select>
							<input type="text" id="searchCnts" name="searchCnts" placeholder="<s:text name="pr01_5"/>" value="${searchCnts}"><label for="searchCnts" class="blind">검색어 입력</label>
							<input type="button" class="btn btSrch" value="검색" onclick="goSearch();">
						</div>
					</fieldset>
				</form>
				<div class="brdCount">
					총 <strong>${conut}</strong>건
				</div>
				<ul class="thumbnailList"></ul>
				<c:if test="${count ne 0}">
					<div class="btn-area">
						<button type="button" class="btn btn-full-more" onclick="pagingMore(currentPage+1);">더보기 (<strong>1</strong>/<span></span>)</button>
					</div>
				</c:if>
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