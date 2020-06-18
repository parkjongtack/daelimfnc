<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
  response.setHeader("Pragma-directive", "no-cache");
  response.setHeader("Cache-directive", "no-cache");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache");
  response.setDateHeader("Expires",0);
%>

    <footer>
<%					
    if(name.equals("ko_KR")){
%>				
		<div class="ft-top">
			<div class="innerwrap">
				<div class="footMenu">
					<ul>
						<li><a href="#customer_view" onclick="sendEmail()"><s:text name="footer_1_1"/></a></li>
						<li><a href="https://oc.daelimchem.co.kr" target="_blank" title="새창열기"><s:text name="footer_1_2"/></a></li>
						<li><a href="https://office.hiworks.com/daelimfnc.co.kr" target="_blank" title="새창열기"><s:text name="footer_1_3"/></a> </li>
						<li><a href="/ps01.do"><s:text name="footer_1_4"/></a></li>
						<li><a href="/md01.do"><s:text name="footer_1_5"/></a> </li>
						<li><a href="javascript:emailPop()" title="새창열기"><s:text name="footer_1_6"/></a> </li>
					</ul>
				</div>
				<dl class="familySitewrap">
					<dt><a href="javascript:void(0)" id="openFamily" class="off">FAMILY SITE</a></dt>
					<dd>
							<div class="familysite">
								<div class="family">
									<p><s:text name="footer_2_1"/></p>
									<ul>
										<li><a href="http://www.daelim-apt.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_3_1"/></a></li>
										<li><a href="http://www.daelimmuseum.org/" target="_blank" title="새창으로 열기"><s:text name="footer_3_2"/></a></li>
										<li><a href="http://ob.daelimchem.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_3_3"/></a></li>
										<li><a href="http://www.suam.or.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_3_4"/></a></li>
										<li><a href="https://office.hiworks.com/daelimfnc.co.kr" target="_blank" title="새창열기"><s:text name="footer_3_5"/></a> </li>
										<li><a href="http://oc.daelimchem.co.kr" target="_blank" title="새창으로 열기"><s:text name="footer_3_6"/></a></li>
									</ul>
								</div>
								<div class="group">
									<p><s:text name="footer_2_1"/></p>
									<ul>
										<li><a href="http://www.cariflex.com/en/main.do" target="_blank" title="새창으로 열기"><s:text name="footer_4_1"/></a></li>
										<li><a href="http://www.daelimcorp.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_2"/></a></li>
										<li><a href="http://www.daelimpnp.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_3"/></a></li>
										<li><a href="http://www.daelim.ac.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_4"/></a></li>
										<li><a href="http://www.dmc.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_5"/></a></li>
										<li><a href="http://www.d-motorcycle.com" target="_blank" title="새창으로 열기"><s:text name="footer_4_6"/></a></li>
										<li><a href="http://www.samho.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_7"/></a></li>
										<li><a href="http://glad-hotels.com/" target="_blank" title="새창으로 열기"><s:text name="footer_4_8"/></a></li>
										<li><a href="http://www.kdc.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_9"/></a></li>
										<li><a href="http://www.daelim.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_10"/></a></li>
										<li><a href="http://www.yncc.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_11"/></a></li>
										<li><a href="http://www.dcp.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_12"/></a></li>
										<li><a href="http://www.polymirae.co.kr/" target="_blank" title="새창으로 열기"><s:text name="footer_4_13"/></a></li>
									</ul>
								</div>
							</div>						
						</dd>
				</dl>
			</div>
		</div>
		
		<div class="ft-bottom" style="padding-top:30px;">
		<%}else{ %>
		<div class="ft-bottom" style="border-top:1px solid #ddd;">
		<%} %>
			<div class="innerwrap">
				<address>
				<s:text name="real_footer"/>
				</address>
				<p>Copyright © 2020 DAELIM FnC. All rights reserved.</p>
			</div>
		</div>
	</footer>
	<!-- 고객문의 popup  -->
        <div id="customer_view" class="popup-wrapper scroll-cstm">
            <div class="pophead">
                <h2><s:text name="layer01_1"/></h2>
                <a href="javascript:void(0);" id="close" class="layerPopClose" title="닫기" onclick="popclose()"><span class="blind">팝업닫기</span></a>
            </div>
            <div class="pop-contents">
                <div class="pop-contop">
                    <p class="l-txt"><s:text name="layer01_2"/></p>
                    <p class="txt"><s:text name="layer01_3"/>
                    </p>
<%
    if(name.equals("ko_KR")){
%>
                    <p class="box-txt"><s:text name="layer01_4"/></p>
<%} %>                    
                </div>
                <div class="hd-txt">
                    <span class="expr">*</span><s:text name="layer01_4_1"/>
                </div>
                <form name="reqForm" id="reqForm" method="post">
                    <input type="hidden" id="emailVal" name="emailVal" />
                    <input type="hidden" id="gbnNumber" name="gbnNumber" />
                    <input type="hidden" id="select" name="select" />
                    <input type="hidden" id="category" name="category" />
                <table class="brdList row-input-type">
                    <colgroup>
                        <col width="173px">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><label for="sel1"><s:text name="layer01_5"/></label><span class="expr">*</span></th>
                            <td>
                                <select id="sel1" name="sel1" class="ipt-basic full-size" data-b="hskang@daelimfnc.co.kr" data-c="sikim@daelimfnc.co.kr">
                                    <option value="1"><s:text name="layer01_6"/></option>
                                    <option value="2"><s:text name="layer01_7"/></option>
                                    <option value="3"><s:text name="layer01_8"/></option>
                                </select>
                            </td>
                        </tr>
                        <tr id="tr_category" style="display: table-row;">
							<th scope="row"><label for="cate"><s:text name="layer01_9"/></label><span class="expr">*</span></th>
							<td>
								<select id="cate" name="cate" class="ipt-basic full-size">
									<option value=""><s:text name="layer01_10"/></option>
									<option value="jshong@daelimfnc.co.kr">BOPP Film</option>
									<option value="edpark86@daelimfnc.co.kr">EVA Coated FilmBOPP Film</option>
									<option value="edpark86@daelimfnc.co.kr">EVA Coated Film</option>
									<option value="edpark86@daelimfnc.co.kr"><s:text name="layer01_14"/></option>
									<option value="mhjang@daelimfnc.co.kr"><s:text name="layer01_15"/></option>
									<option value="marcus24@daelimfnc.co.kr"><s:text name="layer01_16"/></option>
								</select>
							</td>
						</tr>
                        <tr>
                            <th scope="row"><label for="name"><s:text name="layer01_17"/></label><span class="expr">*</span></th>
                            <td><input type="text" id="name" name="name" class="ipt-basic full-size" value=""></td> 
                        </tr>
                        <tr>
                            <th scope="row"><s:text name="layer01_18"/><span class="expr">*</span></th>
                            <td>
                                <label for="emailId" class="blind">이메일 아이디</label>
                                <input type="text" id="emailId" name="emailId" class="ipt-basic pop-m-size" value="" maxlength="25">
                                <span class="hipn">@</span>
                                <label for="emailDomain" class="blind">도메인직접입력</label>
                                <input type="text" id="emailDomain" name="emailDomain" value="" class="ipt-basic pop-m-size" maxlength="25">
                                <label for="emailselect" class="blind">도메인선택</label>
                                <select id="emailselect" name="emailselect" class="ipt-basic pop-m-size" onchange="fncEmailSelect(this.value);">
                                    <option value=""><s:text name="layer01_17"/></option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
<%
    if(name.equals("ko_KR")){
%>                                
                                <span class="info-txt">※ 입력하신 이메일로 답변이 전송되오니 정확히 입력해 주세요.</span>
<%} %>
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><s:text name="layer01_19"/></th>
                            <td>
                                <label for="tel1" class="blind"><s:text name="footer_4_13"/></label>
                                <select id="tel1" name="tel1" class="ipt-basic s-size">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                <label for="tel2" class="blind"><s:text name="footer_4_13"/></label>
                                <input type="text" id="tel2" name="tel2" value="" maxlength="4" class="ipt-basic m-size numberOnly">
                                <span class="hipn">-</span>
                                <label for="tel3" class="blind"><s:text name="footer_4_13"/></label>
                                <input type="text" id="tel3" name="tel3" value="" maxlength="4" class="ipt-basic m-size numberOnly">
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><label for="title"><s:text name="layer01_20"/></label><span class="expr">*</span></th>
                            <td>
                                <input type="text" id="title" name="title" value="" class="ipt-basic full-size">
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><label for="cont"><s:text name="layer01_21"/></label><span class="expr">*</span></th>
                            <td>
                                <textarea rows="1" cols="1" id="cont" name="cont" class="textarea-basic scroll-cstm"></textarea>
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><label for="answer"><s:text name="layer01_22"/></label><span class="expr">*</span></th>
                            <td>
                                <div class="crtfctn-area">
                                    <div id="catpcha" class="crtfctn-num"></div>
                                    <button type="button" class="btn btn-refresh" id="reLoad"><s:text name="layer01_23"/></button>
                                    <input type="text" id="answer" name="answer" value="" class="ipt-basic pop-s-size">
                                    <strong><s:text name="layer01_24"/></strong>
                                </div>
                            </td> 
                        </tr>
                    </tbody>
                </table>
                </form>
                <div class="terms-agree-area scroll-cstm">
                    <strong class="tit"><s:text name="layer01_25"/></strong>
<!-- 컨텐츠 들여쓰기 정렬 금지 -->
<div class="prewrap-txt-box"><s:text name="layer01_26"/>
</div>
<!-- // 컨텐츠 들여쓰기 정렬 금지 -->
                    <p class="info-txt02"><s:text name="layer01_27"/></p>
                    <div class="radio-area">
                        <span class="info-txt02"><s:text name="layer01_28"/></span>
                        <span class="radio-box">
                            <input type="radio" id="radio_01" name="agree" value="1">
                            <label for="radio_01"><s:text name="layer01_29"/></label>
                        </span>
                        <span class="radio-box">
                            <input type="radio" id="radio_02" name="agree" value="2">
                            <label for="radio_02"><s:text name="layer01_30"/></label>
                        </span>
                    </div>
                </div>

                <div class="btn-area">
                    <button type="button" class="btn btn-secondary" onclick="popclose()"><s:text name="layer01_31"/></button>
                    <button type="submit" id="btnSubmit" onclick="reqSend();" class="btn btn-primary" ><s:text name="layer01_32"/></button>
                </div>
            </div>
        </div>
        <!-- // 고객문의 popup  -->
    
<script type="text/javascript">
	$(document).ready(function() {
	    $(".numberOnly").on("keyup", function() {
	        $(this).val($(this).val().replace(/[^0-9]/g,""));
	    });
	    
	    $("#sel1").on("change", function() {
	    	$('#reqForm #select').val($('#sel1 option:checked').text());
	    	$('#reqForm #gbnNumber').val($(this).val());
	    	
	    	if ($(this).val() != "1") {
	    		if ($(this).val() == "2") {
	    			$('#reqForm #emailVal').val($(this).data("b"));  //이메일 수신자
	    		} else {
	    			$('#reqForm #emailVal').val($(this).data("c"));  //이메일 수신자
	    		}
	    		$('#tr_category').hide();
	    	} else {
	    		$('#tr_category').show();
	    	}
	    });
	    
		$("#cate").on("change", function() {
	    	$('#reqForm #emailVal').val($(this).val());  //이메일 수신자
	    	$('#reqForm #category').val($('#cate option:checked').text());  //이메일 수신자
	    });
	    
	    
	    $('#close').on("click", function() {
			$('#customer_view').hide();
			$('.back').hide();
		});
	
		$('#reLoad').on("click", function() { 
			changeCaptcha(); 
		}); //'새로고침'버튼의 Click 이벤트 발생시 'changeCaptcha()'호출
		//팝업
	   
	});

	//메일발송,인증서
	function sendEmail(emailVal,gbnNumber,obj) {
		
		var gbn = $('#reqForm #gbnNumber').val(gbnNumber); //제품문의 구분 카테고리값
		$('#customer_view').show();
		$('#sitemapop').hide();
		$('.back').show();
		
		if (gbnNumber == "2" || gbnNumber == "3") {
		   	$('#reqForm #emailVal').val(emailVal);  //이메일 수신자
			$("#reqForm #select").val(obj);     
		   	$("#reqForm #sel1").val(gbnNumber);
		   	$("#reqForm #sel1").attr("disabled","disabled");
		   	$('#tr_category').hide();
		} else {
			$('#tr_category').show();
			$("#reqForm #sel1").removeAttr("disabled");
			$("#reqForm #sel1 option:eq(0)").prop("selected", true);
		}	
	
		//캡챠
		changeCaptcha(); //Captcha Image 요청
	}
    
    
	function popclose() {
	       $('#customer_view').hide();
	       $('.back').hide();
	       location.reload();
	}

function changeCaptcha() {
       //IE에서 '새로고침'버튼을 클릭시 CaptChaImg.jsp가 호출되지 않는 문제를 해결하기 위해 "?rand='+ Math.random()" 추가
       $('#catpcha').html('<img src="<%=ctx%>/captcha/CaptChaImg.jsp?rand='+ Math.random() + '"/>');
    }

function emailCheck(str) {
        var regexp = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
        
        if(!regexp.test(str) ) {
            return false;
        }
        
        return true;
    }

/* E-mail Selectbox 선택시 email2 input에 값 넘겨주기*/
function fncEmailSelect(value) {

    if (value == "") {
        $("#reqForm #emailDomain").val("");
        $("#reqForm #emailDomain").removeAttr("readonly");
    } else {
        $("#reqForm #emailDomain").val(value);
        $("#reqForm #emailDomain").attr("readonly",true);
    }
}


function reqSend(){
       var frm = document.reqForm;
       
    /*    var cate = $('#cate option:selected').val();
       var chk11 = $('#cate').val();
       
       
       $('#category').val(chk11);
       var chk2 = $('#category').val(chk11);
       alert("chk::"+chk2);
*/

       var select = $("#select option:selected").val();
       var name = $("#reqForm #name").val();
       var title = $('#reqForm #title').val();
       var cont = $('#reqForm #cont').val();
       
       
       if(select == ""){
           alert('모의분야를 선택해 주세요.');
            return false;
       }
       
       if(select == "제품문의" && cate == ""){
           alert('카테고리를 선택해 주세요.');
           return false;
       }
       
       if(name == ""){
           alert('이름을 입력해 주세요.');
           $("#name").focus();
           return false;
       }
       
       if($('#reqForm #emailId').val() == ""){
           alert('이메일ID를 입력해 주세요.');
           $("#reqForm #emailId").focus();
           return false;
       }
       
       if($('#reqForm #emailDomain').val() == ""){
           alert('이메일 도메인을 입력해 주세요');
           $("#reqForm #emailDomain").focus();
           return false;
       }
       
       var email = $.trim($("#reqForm #emailId").val()) + "@" + $.trim($("#reqForm #emailDomain").val());
       
        
        if (!emailCheck(email)) {
            alert("이메일 주소 형식이 맞지 않습니다.");
            return false;
        }
       
       /* if($("#tel1 option:selected").val() == "" || $("#tel2").val() == "" || $("#tel3").val() == ""){
           alert('전화번호를 입력해 주세요.');
           $("#tel2").focus();
           return false;
       } */
       
       if(title == ""){
           alert('제목을 입력해 주세요.');
           $("#title").focus();
           return false;
       }
       
       if(cont == ""){
           alert('내용을 입력해 주세요.');
           $("#cont").focus();
           return false;
       }
        
        var check = true;
        
   if ( !$('#answer').val() ) {
        alert('이미지에 보이는 숫자를 입력해 주세요.');
        return false;
   } else {
        $.ajax({
            url: '<%=ctx%>/captcha/CaptchaSubmit.jsp',
            type: 'POST',
            dataType: 'text',
            data: 'answer=' + $('#answer').val(),
            async: false,
            success: function(resp) {
                 if($.trim(resp) == "N"){
                    alert("인증문자가 일치하지 않습니다.");
                        $('#reLoad').click();
                        $('#answer').val('').focus();
                        check = false;
                 }
           }
      });
   }
   if(check==false){
      return;
   }
    var check = $('input[name="agree"]:checked').val();
       if(check != "1"){
           alert("개인정보의 수집 및 이용에 동의하여 주세요.");
           return false;
       }
      
       if (confirm("고객문의 접수를 하시겠습니까?")) {
            $("#btnSubmit").text("전송중");
            $("#btnSubmit").attr("disabled",true);
            
            var params = $("#reqForm").serialize();   // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
            $.ajax({
                url: '/sendMail02.do',
                type: 'POST',
                data:params,
                dataType: 'html',
                success: function () {
                    
                }
            });
            alert('고객문의가 발송되었습니다. 감사합니다.');
            popclose();

            return true;
        }else{
            return false;
        }
    };
    
</script>   