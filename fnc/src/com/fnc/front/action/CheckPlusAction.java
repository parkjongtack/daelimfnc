package com.fnc.front.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.util.BaseAction;
import com.opensymphony.xwork2.ActionContext;

import freemarker.template.utility.StringUtil;

public class CheckPlusAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(CheckPlusAction.class);

	private static final String sSiteCode = getConfig("resource.sitecode");
	private static final String sSitePassword = getConfig("resource.sitepassword");
	
	private String menu01;
	private String menu02;
	
	public String getMenu01() {
		return menu01;
	}
	public String getMenu02() {
		return menu02;
	}

	private String sName = "";
	private String sMobileNo = "";
	private String sResponseNumber = "";
	private String sAuthType = "";
	private String sMessage = "";

	public String getsName() {
		return sName;
	}

	public String getsMobileNo() {
		return sMobileNo;
	}
	public String getsResponseNumber() {
		return sResponseNumber;
	}
	public String getsAuthType() {
		return sAuthType;
	}

	public String getsMessage() {
		return sMessage;
	}

	@SuppressWarnings({ "unchecked", "unused" })
	public String success() throws Exception {
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		
		NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

		String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

		int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

		if( iReturn == 0 ) {
			String sPlainData = niceCheck.getPlainData();
			String sCipherTime = niceCheck.getCipherDateTime();			// 복호화한 시간

			// 데이타를 추출합니다.
			HashMap<String, String> mapresult = niceCheck.fnParse(sPlainData);
			
			String mobileNo = StringUtil.replace(mapresult.get("MOBILE_NO"), "-", "");
			String htel1 = mobileNo.substring(0,3);
			String htel2 = mobileNo.substring(3,7);
			String htel3 = mobileNo.substring(7,11);
			String htel = htel1 + "-" + htel2 + "-" + htel3;
			
			String sRequestNumber  	= (String)mapresult.get("REQ_SEQ");			// 요청 번호
			this.sResponseNumber 	= (String)mapresult.get("RES_SEQ");			// 인증 고유번호
			this.sAuthType 			= (String)mapresult.get("AUTH_TYPE");		// 인증 수단
			this.sName 				= (String)mapresult.get("NAME");			// 성명
			this.sMobileNo			= htel;										// 휴대폰번호
			String sBirthDate 		= (String)mapresult.get("BIRTHDATE");		// 생일
			String sGender 			= (String)mapresult.get("GENDER");			// 성별
			String sNationalInfo  	= (String)mapresult.get("NATIONALINFO");	// 내/외국인정보 (개발가이드 참조)
			String sDupInfo 		= (String)mapresult.get("DI");
			String sConnInfo 		= (String)mapresult.get("CI");

			String session_sRequestNumber = (String)session.get("REQ_SEQ");

			if(!sRequestNumber.equals(session_sRequestNumber)) {
				this.sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
				this.sResponseNumber = "";
				this.sAuthType = "";
			}

		} else if( iReturn == -1) {
			this.sMessage = "복호화 시스템 에러입니다.";
		} else if( iReturn == -4) {
			this.sMessage = "복호화 처리오류입니다.";
		} else if( iReturn == -5) {
			this.sMessage = "복호화 해쉬 오류입니다.";
		} else if( iReturn == -6) {
			this.sMessage = "복호화 데이터 오류입니다.";
		} else if( iReturn == -9) {
			this.sMessage = "입력 데이터 오류입니다.";
		} else if( iReturn == -12) {
			this.sMessage = "사이트 패스워드 오류입니다.";
		} else {
			this.sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
		}

		logger.debug("sMessage =====" + sMessage);

		return "success";
	}
	
	@SuppressWarnings({ "unused", "unchecked" })
	public String fail() throws Exception {
		
		NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
	    
		String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

		int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

		if( iReturn == 0 ) {
			String sPlainData = niceCheck.getPlainData();
			String sCipherTime = niceCheck.getCipherDateTime();			// 복호화한 시간

			// 데이타를 추출합니다.
			HashMap<String, String> mapresult = niceCheck.fnParse(sPlainData);
			
			String sRequestNumber  	= (String)mapresult.get("REQ_SEQ");			// 요청 번호
			String sErrorCode 		= (String)mapresult.get("ERR_CODE");		// 오류코드
			String sAuthType 		= (String)mapresult.get("AUTH_TYPE");		// 인증 수단

		} else if( iReturn == -1) {
			this.sMessage = "복호화 시스템 에러입니다.";
		} else if( iReturn == -4) {
			this.sMessage = "복호화 처리오류입니다.";
		} else if( iReturn == -5) {
			this.sMessage = "복호화 해쉬 오류입니다.";
		} else if( iReturn == -6) {
			this.sMessage = "복호화 데이터 오류입니다.";
		} else if( iReturn == -9) {
			this.sMessage = "입력 데이터 오류입니다.";
		} else if( iReturn == -12) {
			this.sMessage = "사이트 패스워드 오류입니다.";
		} else {
			this.sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
		}

		return "success";
	}

	public static String requestReplace (String paramValue, String gubun) {
		String result = "";

		if (paramValue != null) {

			paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

			paramValue = paramValue.replaceAll("\\*", "");
			paramValue = paramValue.replaceAll("\\?", "");
			paramValue = paramValue.replaceAll("\\[", "");
			paramValue = paramValue.replaceAll("\\{", "");
			paramValue = paramValue.replaceAll("\\(", "");
			paramValue = paramValue.replaceAll("\\)", "");
			paramValue = paramValue.replaceAll("\\^", "");
			paramValue = paramValue.replaceAll("\\$", "");
			paramValue = paramValue.replaceAll("'", "");
			paramValue = paramValue.replaceAll("@", "");
			paramValue = paramValue.replaceAll("%", "");
			paramValue = paramValue.replaceAll(";", "");
			paramValue = paramValue.replaceAll(":", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll("#", "");
			paramValue = paramValue.replaceAll("--", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll(",", "");

			if(gubun != "encodeData"){
				paramValue = paramValue.replaceAll("\\+", "");
				paramValue = paramValue.replaceAll("/", "");
				paramValue = paramValue.replaceAll("=", "");
			}

			result = paramValue;
		}

		return result;
	}
}
