<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>
<script>
console.log("TEST","${resultMap}");
</script>
<div id="container">
	<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">
			<h2>메인이미지관리</h2>
			<div class="gridwrap">
				<div class="hd_txt">
					<span class="expr">*</span> 항목은 필수입력입니다.
				</div>
				<form id="mainImgForm" action="bnnReg.do" method="post" enctype="multipart/form-data">
				<table class="tblwrite">
					<colgroup>
						<col style="width:220px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th><span class="expr">*</span>이미지영역 1<span class="expr-bt-txt">(1920*950)</span></th>
							<td>
								<div class="filebox">
								<ul>
									<li>
										<input id="upload-name1" class="upload-name" disabled="disabled" name="" value="${fn:split(resultMap.IMG_1,'|')[1]}">
										<input type="file" id="input_file1" name="uploads" class="iptful upload-hidden" accept="image/*">
										<div class="btnr">
											<label for="input_file1">찾아보기</label>
											<input type="button" id="delBtn1" name="deleteBtn" class="btn btn-del" value="삭제">
										</div>
									</li>
								</ul>
								</div>
								<input type="text" id="imgAltText1" class="iptful inline-space" placeholder="대체텍스트 입력 (100byte)" required="required" value="${resultMap.TEXT_1}" name="text1">
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>링크 입력 (URL) 1</th>
							<td><input type="text" id="iptful1" class="iptful" placeholder="http://" required="required" value="${resultMap.LNK_1}" name="link1"></td>
						</tr>

						<tr>
							<th><span class="expr">*</span>이미지영역 2<span class="expr-bt-txt">(1920*950)</span></th>
							<td>
								<div class="filebox">
								<ul>
									<li>
										<input id="upload-name2" class="upload-name" disabled="disabled" name="" value="${fn:split(resultMap.IMG_2,'|')[1]}">
										<input type="file" id="input_file2" name="uploads" class="upload-hidden" accept="image/*" >
										<div class="btnr">
											<label for="input_file2">찾아보기</label>
											<input type="button" id="delBtn2" name="deleteBtn" class="btn btn-del" value="삭제">
										</div>
									</li>
								</ul>
								</div>
								<input type="text" id="imgAltText2" class="iptful inline-space" placeholder="대체텍스트 입력 (100byte)" required="required" value="${resultMap.TEXT_2}" name="text2">
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>링크 입력 (URL) 2</th>
							<td><input type="text" id="iptful2" class="iptful" placeholder="http://" required="required" value="${resultMap.LNK_2}" name="link2"></td>
						</tr>

						<tr>
							<th><span class="expr">*</span>이미지영역 3<span class="expr-bt-txt">(1920*950)</span></th>
							<td>
								<div class="filebox">
								<ul>
									<li>
										<input id="upload-name3" class="upload-name" disabled="disabled" name="" value="${fn:split(resultMap.IMG_3,'|')[1]}">
										<input type="file" id="input_file3" name="uploads" class="upload-hidden" accept="image/*" >
										<div class="btnr">
											<label for="input_file3">찾아보기</label>
											<input type="button" id="delBtn3" name="deleteBtn" class="btn btn-del" value="삭제">
										</div>
									</li>
								</ul>
								</div>
								<input type="text" id="imgAltText3" class="iptful inline-space" placeholder="대체텍스트 입력 (100byte)" required="required" value="${resultMap.TEXT_3}" name="text3">
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>링크 입력 (URL) 3</th>
							<td><input type="text" id="iptful3" class="iptful" placeholder="http://" required="required" value="${resultMap.LNK_3}" name="link3"></td>
						</tr>
					</tbody>
				</table>
				<div class="bot-btn">
					<button id="btnSubmit" class="btn btn-submit">확인</button>
					<!-- <button id="btnSubmit" class="btn btn-submit" onlclick="submitValidChk()">확인</button> -->
					<!-- <a href="main.do" class="btn btn-cancel">취소</a> -->
				</div>
                <input type="hidden" value="" name="uploadIdxs" id="uploadIdxs" >
				</form>
			</div>
			<h2>현재 등록된 이미지</h2>
			<div class="gridwrap">
				<ul class="thumbnail-list">
					<li>
						<div id="img-box1" class="img-box"><img src="${fn:split(resultMap.IMG_1,'|')[0]}" id="mainImg1"></div>
						<p class="info-txt">메인 이미지 영역 1</p>
					</li>
					<li>
						<div id="img-box2" class="img-box"><img src="${fn:split(resultMap.IMG_2,'|')[0]}" id="mainImg2"></div>
						<p class="info-txt">메인 이미지 영역 2</p>
					</li>
					<li>
						<div id="img-box3" class="img-box"><img src="${fn:split(resultMap.IMG_3,'|')[0]}" id="mainImg3"></div>
						<p class="info-txt">메인 이미지 영역 3</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- container -->

<script>
window.onload = function(e){
// 	if($("#upload-name1").val() != null && $("#upload-name1").val() != ""){
// 		indexLength1 = $("#upload-name1").val().lastIndexOf("/");
// 		imgNm1 = $("#upload-name1").val().substr(indexLength1+1)
// 		$("#upload-name1").val(imgNm1);

// 	}

// 	if($("#upload-name2").val() != null && $("#upload-name2").val() != ""){
// 		indexLength2 = $("#upload-name2").val().lastIndexOf("/");
// 		imgNm2 = $("#upload-name2").val().substr(indexLength2+1)
// 		$("#upload-name2").val(imgNm2);

// 	}

// 	if($("#upload-name3").val() != null && $("#upload-name3").val() != ""){
// 		indexLength3 = $("#upload-name3").val().lastIndexOf("/");
// 		imgNm3 = $("#upload-name3").val().substr(indexLength3+1)
// 		$("#upload-name3").val(imgNm3);

// 	}

}
//파일변경플래그 이벤트
// $("input[type='file']").on("change",function(){
// 	$(this).attr("chgYn","Y");
// });

$(document).ready(function (e){
	$("#btnSubmit").on("click", function(e) {
		/* validation check : start */
		var uploadName1 = $("#upload-name1").val();
		var imgAltText1 = $("#imgAltText1").val();
		var iptful1 = $("#iptful1").val();

		var uploadName2 = $("#upload-name2").val();
		var imgAltText2 = $("#imgAltText2").val();
		var iptful2 = $("#iptful2").val();

		var uploadName3 = $("#upload-name3").val();
		var imgAltText3 = $("#imgAltText3").val();
		var iptful3 = $("#iptful3").val();

		if (uploadName1 == undefined || uploadName1 == null || uploadName1 == "") {
			alert("파일을 입력해주세요.");
			$("#input_file1").focus()
			return false;
		}
		if (imgAltText1 == undefined || imgAltText1 == null || imgAltText1 == "") {
			alert("텍스트를 입력해주세요.");
			$("#imgAltText1").focus()
			return false;
		}
		if (iptful1 == undefined || iptful1 == null || iptful1 == "") {
			alert("링크를 입력해주세요.");
			$("#iptful1").focus()
			return false;
		}
		if (uploadName2 == undefined || uploadName2 == null || uploadName2 == "") {
			alert("파일을 입력해주세요.");
			$("#input_file2").focus()
			return false;
		}
		if (imgAltText2 == undefined || imgAltText2 == null || imgAltText2 == "") {
			alert("텍스트를 입력해주세요.");
			$("#imgAltText2").focus()
			return false;
		}
		if (iptful2 == undefined || iptful2 == null || iptful2 == "") {
			alert("링크를 입력해주세요.");
			$("#iptful2").focus()
			return false;
		}
		if (uploadName3 == undefined || uploadName3 == null || uploadName3 == "") {
			alert("파일을 입력해주세요.");
			$("#input_file3").focus()
			return false;
		}
		if (imgAltText3 == undefined || imgAltText3 == null || imgAltText3 == "") {
			alert("텍스트를 입력해주세요.");
			$("#imgAltText3").focus()
			return false;
		}
		if (iptful3 == undefined || iptful3 == null || iptful3 == "") {
			alert("링크를 입력해주세요.");
			$("#iptful3").focus()
			return false;
		}

		$("input[type='file']").each(function(i,item){
			if($(item).attr("chgYn") == "Y"){
			    var uplodedIdx = $("#uploadIdxs").val();
			    var chgIdx = Number(i)+1;
			    $("#uploadIdxs").val(uplodedIdx +","+ chgIdx);
			}
		});
		$("#uploadIdxs").val($("#uploadIdxs").val().substr(1));
		$("#btnSubmit").submit();
	});

	/*------------------------ 이미지 삭제 버튼 관련 Start ------------------------*/
	$("input[name='deleteBtn']").on('click', function(){
		deleteValidationChk($(this).context);
	});

	function deleteValidationChk(e) {
		var target = e.getAttribute('id');
		if(target == 'delBtn1') {
// 			if(!$('#input_file1').val()) {
// 				alert('이미지를 등록해주세요.');
// 			} else {
				var result = confirm("해당 이미지를 삭제하시겠습니까?");
				if(result) {
					$('#input_file1').val("");
		        	$('#input_file1').prev().val("");
		        	$('#imgAltText1').val("");
		        	$('#iptful1').val("");
		        	$('#mainImg1').remove();
				}
// 			}
		} else if(target == 'delBtn2') {
// 			if(!$('#input_file2').val()) {
// 				alert('이미지를 등록해주세요.');
// 			} else {
				var result = confirm("해당 이미지를 삭제하시겠습니까?");
				if(result) {
					$('#input_file2').val("");
		        	$('#input_file2').prev().val("");
		        	$('#imgAltText2').val("");
		        	$('#iptful2').val("");
		        	$('#mainImg2').remove();
				}
// 			}
		} else if(target == 'delBtn3') {
// 			if(!$('#input_file3').val()) {
// 				alert('이미지를 등록해주세요.');
// 			} else {
				var result = confirm("해당 이미지를 삭제하시겠습니까?");
				if(result) {
					$('#input_file3').val("");
		        	$('#input_file3').prev().val("");
		        	$('#imgAltText3').val("");
		        	$('#iptful3').val("");
		        	$('#mainImg3').remove();
				}
// 			}
		} else {
			return false;
		}
	}
	/*------------------------ 이미지 삭제 버튼 관련 End ------------------------*/



	/*------------------------ 대체 텍스트 100byte 제한 관련 Start ------------------------*/
	$('.iptful').on('input focus focusout', function(){
		bytesValidationChk($(this),100);
	});

	// byte 체크 함수
	function bytesValidationChk(target, maxByte) {
		var returnVal = '';
		var currentLength = 0;
		var codeByte = 0;

		// input의 value
		var targetVal = target.val();

		// input.length만큼 반복
		for(var i = 0; i < targetVal.length; i++){
			// 한글, 영문 등의 byte만큼 codeByte를 증가
			var oneChar = escape(targetVal.charAt(i));
			// 한글 = 2byte 나머지 = 1byte
			if(oneChar.length > 4) {
				codeByte += 2;
			} else {
				codeByte++;
			}
			// codeByte 값이 내가 지정한 maxByte보다 작을 때 = currentLength 값을 1씩 증가
			if(codeByte <= maxByte) currentLength = i + 1;
		}

		// codyByte가 내가 지정한 maxByte보다 커지면
		if(codeByte >= maxByte){
			// currentLength만큼 targetVal를 잘라줘서 returnVal에 담아줌
			returnVal = targetVal.substr(0, currentLength); // 한글로 100byte면 currentLength가 50임
			// maxByte만큼 자른 returnVal를 target(input)에 value로 넣어줌
			console.log("returnVal ::: ", returnVal);
			target.val(returnVal);
		}
	}
	/*------------------------ 대체 텍스트 100byte 제한 관련 End ------------------------*/


	/*------------------------ 이미지 파일 업로드 관련 Start ------------------------*/
	$('.upload-hidden').change(function(e){
      var files = e.target.files;
      var arr = Array.prototype.slice.call(files);
      var target = $(this).context.getAttribute('id');
      var target_len = target.substr(target.length-1, 1);
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
        	$(this).val("");		// 첨부 파일 삭제
        	$(this).prev().val("");	// 첨부 파일 이름 삭제
        	if(target_len == '1') $('#mainImg1').remove();
        	if(target_len == '2') $('#mainImg2').remove();
        	if(target_len == '3') $('#mainImg3').remove();
        	return false;
        } else {
        	preview($(this).context, arr);
        	$(this).attr("chgYn","Y");
        }
      }
    });

    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(jpeg|jpg|gif|bmp)$");
      var maxSize = 20971520;  //20MB

      if(fileSize >= maxSize){
        alert('20MB가 넘는 파일은 업로드 할 수 없습니다.');
        return false;
      }

      if(!regex.test(fileName)){
        alert('(jpeg,jpg,gif,bmp) 파일만 등록이 가능합니다.');
        return false;
      }
      return true;
    }

    function preview(element, arr){
		arr.forEach(function(f){
		var elementId = element.getAttribute('id');
        var str = '';

        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); // 파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { // 파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			if(elementId == 'input_file1') {
				$('#mainImg1').remove();
				str += '<img src="'+e.target.result+'" id="mainImg1" title="'+f.name+'" width=100%>';
				$(str).appendTo('#img-box1');
			} else if (elementId == 'input_file2') {
				$('#mainImg2').remove();
				str += '<img src="'+e.target.result+'" id="mainImg2" title="'+f.name+'" width=100%>';
				$(str).appendTo('#img-box2');
			} else if (elementId == 'input_file3') {
				$('#mainImg3').remove();
				str += '<img src="'+e.target.result+'" id="mainImg3" title="'+f.name+'" width=100%>';
				$(str).appendTo('#img-box3');
			} else {
				return false;
			}

          }
          reader.readAsDataURL(f);
        }
      });//arr.forEach
    }
    /*------------------------ 이미지 파일 업로드 관련 End ------------------------*/

  });
</script>
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>