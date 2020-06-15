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
        <div class="ft-top">
            <div class="innerwrap">
                <div class="footMenu">
                    <ul>
                        <li><a href="javascript:" onclick="sendEmail()" title="새창열기">고객문의</a></li>
                        <li><a href="https://oc.daelimchem.co.kr" target="_blank" title="새창열기">오더센터</a></li>
                        <li><a href="https://office.hiworks.com/daelimfnc.co.kr" target="_blank" title="새창열기">그룹웨어</a> </li>
                        <li><a href="/ps01.do">개인정보처리방침</a></li>
                        <li><a href="/md01.do">영상정보기기 운영관리방침</a></li>
                        <li><a href="javascript:emailPop()" title="새창열기">이메일 무단수집거부</a></li>
                    </ul>
                </div>
                <dl class="familySitewrap">
                    <dt><a href="javascript:void(0)" id="openFamily" class="off">FAMILY SITE</a></dt>
                    <dd>
                            <div class="familysite">
                                <div class="family">
                                    <p>패밀리사이트</p>
                                    <ul>
                                        <li><a href="http://www.daelim-apt.co.kr/" target="_blank" title="새창으로 열기">e편한세상</a></li>
                                        <li><a href="http://www.daelimmuseum.org/" target="_blank" title="새창으로 열기">대림미술관</a></li>
                                        <li><a href="http://ob.daelimchem.co.kr/" target="_blank" title="새창으로 열기">대림 유화사업부 OB</a></li>
                                        <li><a href="http://www.suam.or.kr/" target="_blank" title="새창으로 열기">대림수암장학문화재단</a></li>
                                        <li><a href="https://office.hiworks.com/daelimfnc.co.kr" target="_blank" title="새창열기">그룹웨어</a> </li>
                                        <li><a href="http://oc.daelimchem.co.kr" target="_blank" title="새창으로 열기">오더센터</a></li>
                                    </ul>
                                </div>
                                <div class="group">
                                    <p>그룹사사이트</p>
                                    <ul>
                                        <li><a href="http://www.cariflex.com/en/main.do" target="_blank" title="새창으로 열기">Cariflex</a></li>
                                        <li><a href="http://www.daelimcorp.co.kr/" target="_blank" title="새창으로 열기">대림코퍼레이션</a></li>
                                        <li><a href="http://www.daelimpnp.co.kr/" target="_blank" title="새창으로 열기">대림피앤피</a></li>
                                        <li><a href="http://www.daelim.ac.kr/" target="_blank" title="새창으로 열기">대림학원</a></li>
                                        <li><a href="http://www.dmc.co.kr/" target="_blank" title="새창으로 열기">대림자동차공업</a></li>
                                        <li><a href="http://www.d-motorcycle.com" target="_blank" title="새창으로 열기">대림오토바이</a></li>
                                        <li><a href="http://www.samho.co.kr/" target="_blank" title="새창으로 열기">삼호</a></li>
                                        <li><a href="http://glad-hotels.com/" target="_blank" title="새창으로 열기">글래드 호텔앤리조트㈜</a></li>
                                        <li><a href="http://www.kdc.co.kr/" target="_blank" title="새창으로 열기">고려개발</a></li>
                                        <li><a href="http://www.daelim.co.kr/" target="_blank" title="새창으로 열기">대림산업(주) 건설사업부</a></li>
                                        <li><a href="http://www.yncc.co.kr/" target="_blank" title="새창으로 열기">YNCC</a></li>
                                        <li><a href="http://www.dcp.co.kr/" target="_blank" title="새창으로 열기">대림C&amp;S</a></li>
                                        <li><a href="http://www.polymirae.co.kr/" target="_blank" title="새창으로 열기">폴리미래</a></li>
                                    </ul>
                                </div>
                            </div>                      
                        </dd>
                </dl>
            </div>
        </div>
        <div class="ft-bottom">
            <div class="innerwrap">
                <address>
                전라북도 완주군 봉동읍 과학로 802 (55323) 대림에프엔씨 주식회사 Tel. 063.260.1114<br>
                대표 김영호 | 사업자등록번호 669-86-01817
                </address>
                <p>Copyright © 2020 DAELIM FnC. All rights reserved.</p>
            </div>
        </div>
    </footer>
    
    <!-- 고객문의 popup  -->
        <div id="customer_view" class="popup-wrapper scroll-cstm">
            <div class="pophead">
                <h2>고객문의</h2>
                <a href="javascript:void(0);" id="close" class="layerPopClose" title="닫기" onclick="popclose()"><span class="blind">팝업닫기</span></a>
            </div>
            <div class="pop-contents">
                <div class="pop-contop">
                    <p class="l-txt">고객 여러분의 말씀에 귀 기울이겠습니다.</p>
                    <p class="txt">궁금하신 문의사항을 보내주시면 최대한 신속하게 답변을 해드리겠습니다.<br>
                        답변은 입력하신 연락처 또는 E-mail로 드릴 예정이므로 필수 항목을 정확하게 입력하여 주십시오.
                    </p>
                    <p class="box-txt">제품문의, 채용문의, 기타문의 경우 아래 항목에 작성하여 문의하시기 바랍니다.</p>
                </div>
                <div class="hd-txt">
                    <span class="expr">*</span>필수 입력사항
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
                            <th scope="row"><label for="sel1">문의분야</label><span class="expr">*</span></th>
                            <td>
                                <select id="sel1" name="sel1" class="ipt-basic full-size" data-b="hskang@daelimfnc.co.kr" data-c="sikim@daelimfnc.co.kr">
                                    <option value="1">제품문의</option>
                                    <option value="2">채용문의</option>
                                    <option value="3">기타문의</option>
                                </select>
                            </td>
                        </tr>
                        <tr id="tr_category" style="display: table-row;">
							<th scope="row"><label for="cate">카테고리</label><span class="expr">*</span></th>
							<td>
								<select id="cate" name="cate" class="ipt-basic full-size">
									<option value="">구분을 선택해 주세요</option>
									<option value="jshong@daelimfnc.co.kr">BOPP Film</option>
									<option value="edpark86@daelimfnc.co.kr">EVA Coated FilmBOPP Film</option>
									<option value="edpark86@daelimfnc.co.kr">EVA Coated Film</option>
									<option value="edpark86@daelimfnc.co.kr">특수코팅</option>
									<option value="mhjang@daelimfnc.co.kr">합성지</option>
									<option value="marcus24@daelimfnc.co.kr">수출</option>
								</select>
							</td>
						</tr>
                        <tr>
                            <th scope="row"><label for="name">이름</label><span class="expr">*</span></th>
                            <td><input type="text" id="name" name="name" class="ipt-basic full-size" value=""></td> 
                        </tr>
                        <tr>
                            <th scope="row">이메일<span class="expr">*</span></th>
                            <td>
                                <label for="emailId" class="blind">이메일 아이디</label>
                                <input type="text" id="emailId" name="emailId" class="ipt-basic pop-m-size" value="" maxlength="25">
                                <span class="hipn">@</span>
                                <label for="emailDomain" class="blind">도메인직접입력</label>
                                <input type="text" id="emailDomain" name="emailDomain" value="" class="ipt-basic pop-m-size" maxlength="25">
                                <label for="emailselect" class="blind">도메인선택</label>
                                <select id="emailselect" name="emailselect" class="ipt-basic pop-m-size" onchange="fncEmailSelect(this.value);">
                                    <option value="">직접입력</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="nate.com">nate.com</option>
                                </select>
                                <span class="info-txt">※ 입력하신 이메일로 답변이 전송되오니 정확히 입력해 주세요.</span>
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row">휴대폰</th>
                            <td>
                                <label for="tel1" class="blind">휴대폰번호 앞자리</label>
                                <select id="tel1" name="tel1" class="ipt-basic s-size">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                <label for="tel2" class="blind">휴대폰번호 가운데자리</label>
                                <input type="text" id="tel2" name="tel2" value="" maxlength="4" class="ipt-basic m-size numberOnly">
                                <span class="hipn">-</span>
                                <label for="tel3" class="blind">휴대폰번호 마지막자리</label>
                                <input type="text" id="tel3" name="tel3" value="" maxlength="4" class="ipt-basic m-size numberOnly">
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><label for="title">제목</label><span class="expr">*</span></th>
                            <td>
                                <input type="text" id="title" name="title" value="" class="ipt-basic full-size">
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><label for="cont">문의내용</label><span class="expr">*</span></th>
                            <td>
                                <textarea rows="1" cols="1" id="cont" name="cont" class="textarea-basic scroll-cstm"></textarea>
                            </td> 
                        </tr>
                        <tr>
                            <th scope="row"><label for="answer">인증</label><span class="expr">*</span></th>
                            <td>
                                <div class="crtfctn-area">
                                    <div id="catpcha" class="crtfctn-num"></div>
                                    <button type="button" class="btn btn-refresh" id="reLoad">새로고침</button>
                                    <input type="text" id="answer" name="answer" value="" class="ipt-basic pop-s-size">
                                    <strong>인증문자를 입력하세요.</strong>
                                </div>
                            </td> 
                        </tr>
                    </tbody>
                </table>
                </form>
                <div class="terms-agree-area scroll-cstm">
                    <strong class="tit">개인정보 수집 및 이용에 대한 안내</strong>
<!-- 컨텐츠 들여쓰기 정렬 금지 -->
<div class="prewrap-txt-box">'대림에프엔씨'는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 
준수하고 있습니다. 회사는 고객의 소리 이용과 관련하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 
개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

회사는 취급방침 개정 시 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

ο 본 방침은 2020년 4월 29일부터 시행됩니다.

<strong>1. 수집 목적 : 본인 확인, 고객 불만 민원 처리, 시정사항 고지</strong>

<strong>2. 개인정보 수집 항목</strong>
    - 필수 항목 : 문의분야, 이름, 이메일
    - 선택 항목 : 휴대폰
    - 수집 방법 : 홈페이지 입력
    
<strong>3. 보유 및 이용 기간 : 접수 후 6개월 간</strong>
    - 수집 목적이 달성된 경우, 5일 이내 예외 없이 파기합니다.
    
<strong>4. 정보주체의 권리, 의무 및 그 행사방법 안내</strong>
    - 이용자는 개인정보주체로서 다음 권리 행사가 가능합니다.   
    : 개인정보 열람 요구 / 오류 발생 시 정정 요구 / 삭제 요구 / 처리 정지 요구
    - 열람 요구는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX)을 
    통하여 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다. 또한 법정대리인 및 위임을 
    받은 자를 통해 요구가 가능하나, 이 경우 개인정보보호법 시행규칙 별지 제11호 서식에 따른 
    위임장을 제출하셔야 합니다.
    
<strong>5. 개인정보수집 및 이용 동의 거부 안내 </strong>
    - 본 서비스의 개인정보 수집 및 이용 동의에 거부하실 수 있으나, 이 경우 본 서비스를 이용하실 수 
    없습니다. 
    - 개인정보 처리와 관련하여 문의사항이 있으신 분께서는 전화 063-260-1135나, 
    이메일 <a href="mailto:sikim@daelimfnc.co.kr">sikim@daelimfnc.co.kr</a>로 보내주시길 바랍니다.
</div>
<!-- // 컨텐츠 들여쓰기 정렬 금지 -->
                    <p class="info-txt02">개인정보의 수집 및 이용에 동의하십니까?</p>
                    <div class="radio-area">
                        <span class="info-txt02">(필수)</span>
                        <span class="radio-box">
                            <input type="radio" id="radio_01" name="agree" value="1">
                            <label for="radio_01">동의</label>
                        </span>
                        <span class="radio-box">
                            <input type="radio" id="radio_02" name="agree" value="2">
                            <label for="radio_02">동의하지않음</label>
                        </span>
                    </div>
                </div>

                <div class="btn-area">
                    <button type="button" class="btn btn-secondary" onclick="popclose()">취소</button>
                    <button type="submit" id="btnSubmit" onclick="reqSend();" class="btn btn-primary" >확인</button>
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