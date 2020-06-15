package com.fnc.front.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.FileVo;
import com.fnc.front.dao.MailSendLogDao;
import com.fnc.front.vo.MailSendLogVo;
import com.fnc.util.BaseAction;
import com.fnc.util.MailService;
import com.fnc.util.StringManager;
import com.opensymphony.xwork2.ActionContext;

public class Sus02Action extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Sus02Action.class);
//	TODO : 서버간 통신 속도 문제로 주석 처리
	private static final String sSiteCode = getConfig("resource.sitecode");
	private static final String sSitePassword = getConfig("resource.sitepassword");
	private static final String HOST = getConfig("resource.host");
	private static final String sReturnUrl = getConfig("resource.nice.success.return.url");
	private static final String sErrorUrl = getConfig("resource.nice.fail.return.url");
	private static final String sSinmungo = getConfig("resource.sinmungo.mail.addr");
//  TODO : 종료
	MailSendLogDao dao = new MailSendLogDao();
	FileDao fileDao = new FileDao();
	
	private String menu01;
	private String menu02;

	public String getMenu01() {
		return menu01;
	}
	public String getMenu02() {
		return menu02;
	}
	private String sEncData = "";
	private String sMessage = "";

	public String getsEncData() {
		return sEncData;
	}
	public String getsMessage() {
		return sMessage;
	}

	private String name = "";
	private String mobileNo = "";

	public String getName() {
		return name;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public String sus02_1() throws Exception {
		// TODO : 서버간 통신 속도 문제로 주석 처리
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		session.put("REQ_SEQ", "");
		
	    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
	    
	    String sAuthType = "M";			// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
		String popgubun = "N";			//Y : 취소버튼 있음 / N : 취소버튼 없음
		String customize = "";			//없으면 기본 웹페이지 / Mobile : 모바일페이지
		
		String sRequestNumber = niceCheck.getRequestNO(sSiteCode);
		session.put("REQ_SEQ", sRequestNumber);
		String returnUrl = HOST + sReturnUrl;
		String errorUrl = HOST + sErrorUrl;
		
	  	String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                "7:RTN_URL" + returnUrl.getBytes().length + ":" + returnUrl +
                "7:ERR_URL" + errorUrl.getBytes().length + ":" + errorUrl +
                "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;

	    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
	    if (iReturn == 0) {
	        sEncData = niceCheck.getCipherData();
	    } else if( iReturn == -1) {
	        sMessage = "암호화 시스템 에러입니다.";
	    } else if( iReturn == -2) {
	        sMessage = "암호화 처리오류입니다.";
	    } else if( iReturn == -3) {
	        sMessage = "암호화 데이터 오류입니다.";
	    } else if( iReturn == -9) {
	        sMessage = "입력 데이터 오류입니다.";
	    } else {
	        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
	    }
// TODO : 종료
		return "success";
	}

	public String sus02_2() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		String sRequestNumber = (String)session.get("REQ_SEQ");

		if (!"".equals(sRequestNumber)) {
			this.name = request.getParameter("sName");
			this.mobileNo = request.getParameter("sMobileNo");
		}

		return "success";
	}

	public String sus02_3() throws Exception {
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		session.put("REQ_SEQ", "");

		return "success";
	}

	public String cyberSend() throws Exception {
		HashMap<String, Object> mailMap = new HashMap<String, Object>();
		String returnStr = "success";
		
		HashMap<String, Object> paramMap = getMap();

		// TODO : 운영반영시 수신자 변경
		/*String recipient = "sikim@daelimfnc.co.kr";*/

//		String recipient = "daelimitc@daelimfnc.co.kr";
		try {

			logger.debug("paramMap ============================= " + paramMap.toString());

			List<HashMap<String, String>> uploadList = getSinmungoFiles();	// 일반 파일 업로드
			ArrayList<HashMap<String, String>> uploadFiles = new ArrayList<HashMap<String, String>>();

			if (uploadList != null && uploadList.size() > 0) {
				HashMap<String, Object> fileMap = new HashMap<String, Object>();
				fileMap.put("uploadList", uploadList);
				HashMap<String, Object> fileResult = fileDao.insertFile(fileMap);
				
				List<FileVo> fileList = fileDao.selectFileList(fileResult.get("fileKey").toString());
				
				for (int i = 0; i < fileList.size(); i ++) {
					FileVo fVo = fileList.get(i);
					HashMap<String, String> fMap = new HashMap<String, String>();
					fMap.put("fileNo", fVo.getNoAtchFileDtilSral());
					fMap.put("fileName", fVo.getNmPhysFile());
					fMap.put("orgFileName", fVo.getNmLogiFile());

					uploadFiles.add(fMap);
				}

				logger.debug("uploadMap ============================= " + uploadList.toString());
			}

			

			String type = StringManager.chkNull(request.getParameter("cyberType"));
			String typeText = "";
			if (type.equals("01")) {
				typeText = "임직원 불공정 행위";
			} else if (type.equals("02")) {
				typeText = "윤리경영 관련 제안";
			} else if (type.equals("02")) {
				typeText = "기타 건의사항";
			}

			String tel1 = StringManager.chkNull(paramMap.get("tel1"));
			String tel2 = StringManager.chkNull(paramMap.get("tel2"));
			String tel3 = StringManager.chkNull(paramMap.get("tel3"));
			String mtel = "";
			if (!"".equals(tel2) && !"".equals(tel3)) {
				mtel = tel1 + "-" + tel2 + "-" + tel3;
			}

			String email = StringManager.chkNull(paramMap.get("emailId")) + "@" + StringManager.chkNull(paramMap.get("emailDomain"));

			mailMap.put("kind", "sinmungo");
			mailMap.put("recipient", sSinmungo);
			mailMap.put("masking", "N");
			mailMap.put("type", typeText);
			mailMap.put("name", StringManager.chkNull(paramMap.get("name")));
			mailMap.put("htel", StringManager.chkNull(paramMap.get("mobileNo")));
			mailMap.put("mtel", mtel);
			mailMap.put("email", email);
			mailMap.put("title", StringManager.chkNull(paramMap.get("subject")));
			mailMap.put("contents", StringManager.chkNull(paramMap.get("contents")));
			mailMap.put("uploads", uploadFiles);
			
			logger.debug(mailMap.toString());

			// TODO : 메일 전송
			MailService.sendMail(mailMap, request);

			// TODO : 메일전송로그 등록 시작
			MailSendLogVo vo = new MailSendLogVo();

			vo.setClMail("04");
			vo.setEmailSdng(email);
			vo.setEmailRcpn(sSinmungo);
			vo.setIpSdng(getClientIP());

			dao.insertMailSendLog(vo);

			// TODO : 메일전송로그 등록 끝
		} catch (Exception e) {
			returnStr = "fail";
			e.printStackTrace();
		}
		
		return returnStr;
	}

}
