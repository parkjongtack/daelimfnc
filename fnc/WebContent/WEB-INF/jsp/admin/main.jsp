<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/jsp/admin/adm_header.jsp"%>

<div id="container">
	<%@include file="/WEB-INF/jsp/admin/adm_left.jsp"%>

		<div id="contents">
			<h2>메인이미지관리</h2>
			<div class="gridwrap">
				<div class="hd_txt">
					<span class="expr">*</span> 항목은 필수입력입니다.
				</div>
				<form action="" method="post">
				<table class="tblwrite">
					<colgroup>
						<col style="width:220px;">
						<col >
					</colgroup>
					<tbody>
						<c:forEach var="i" begin="1" end="3" step="1">
						<tr>
							<th><span class="expr">*</span>이미지영역 ${i}<span class="expr-bt-txt">(1920*950)</span></th>
							<td>
								<div class="filebox">
								<ul>
									<li>
										<input id="upload-name${i}" class="upload-name" disabled="disabled" >
										<input type="file" id="input_file${i}" name="input_file" class="upload-hidden" accept="image/*" required="required">
										<div class="btnr">
											<label for="input_file${i}">찾아보기</label> 
											<button class="btn btn-del" onclick="delBtnClick();">삭제</button>
										</div>
									</li>
								</ul>
								</div>
								<input type="text" id="imgAltText${i}" name="" class="iptful inline-space" placeholder="대체텍스트 입력 (100byte)" required="required">
							</td>
						</tr>
						<tr>
							<th><span class="expr">*</span>링크 입력 (URL) ${i}</th>
							<td><input type="text" id="" name="" class="iptful" placeholder="http://" required="required"></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="bot-btn">
					<input type="submit" class="btn btn-submit" value="확인">
					<input type="reset" class="btn btn-cancel" value="취소">
				</div>
				</form>
			</div>
			<h2>현재 등록된 이미지</h2>
			<div class="gridwrap">
				<ul class="thumbnail-list">
					<c:forEach var="i" begin="1" end="3" step="1">
					<li>
						<div class="img-box${i}"></div>
						<p class="info-txt">메인 이미지 영역 ${i}</p>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- container -->
	
<script>
$(document).ready(function (e){
	
	/*--- 대체 텍스트 100byte 제한 관련 Start ---*/
	// byte 체크 할 타겟 (input, textarea) 
	var $target = $('#imgAltText1'); 
	
	// 값이 들어올때는 input, 커서가 들어오고 나갈때는 focus, focusout 
	$target.on('input focus focusout', function(){ 
		bytesValidationChk($(this),100); // 100byte까지 
	}); 
	
	// 체크 함수 
	function bytesValidationChk(target, maxByte) { 
		// byte 체크 할 때 사용하는 함수들 선언
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
			// length 체크
			// codeByte 값이 내가 지정한 maxByte보다 작을 때 = currentLength 값을 1씩 증가 
			if(codeByte <= maxByte) { 
				currentLength = i + 1;
			}
		} 
		
		// codyByte가 내가 지정한 maxByte보다 커지면 
		if(codeByte >= maxByte){ 
			// currentLength만큼 targetVal를 잘라줘서 returnVal에 담아줌 
			returnVal = targetVal.substr(0, currentLength); // 한글로 100byte면 currentLength가 50임 
			// maxByte만큼 자른 returnVal를 target(input)에 value로 넣어줌 
			target.val(returnVal);
		}
	}
	/*--- 대체 텍스트 100byte 제한 관련 End ---*/
	

	/*--- 이미지 파일 업로드 관련 Start ---*/
    $('#input_file1').change(function(e){

      var files = e.target.files;
      var arr = Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        } else {
        	preview(arr);
        }
      }
      
    });
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(jpeg|jpg|gif|bmp)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('20MB가 넘는 파일은 업로드 할 수 없습니다.');
        $('#input_file1').val("");  //파일 초기화
        $('#upload-name1').val("");  //이름 초기화
        return false;
      }
      
      if(!regex.test(fileName)){
        alert('(jpeg,jpg,gif,bmp) 파일만 등록이 가능합니다.');
        $('#input_file1').val("");  //파일 초기화
        $('#upload-name1').val("");  //이름 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        var str = '';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
        	if($('.img-box1 img') != null) {
        		$('img').remove();
        		str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100%>';
                $(str).appendTo('.img-box1');
        	} else {
        		str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100%>';
                $(str).appendTo('.img-box1');
        	}
          } 
          reader.readAsDataURL(f);
        }
      });//arr.forEach
    }
    /*--- 이미지 파일 업로드 관련 End ---*/
    
    function delBtnClick() {
    	
    }
    
  });
</script>
<%@include file="/WEB-INF/jsp/admin/adm_footer.jsp" %>