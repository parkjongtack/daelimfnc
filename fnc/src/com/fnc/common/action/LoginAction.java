package com.fnc.common.action;

import java.util.Date;
import java.util.Map;
import java.util.Random;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.log4j.Logger;

import com.fnc.common.dao.AdminDao;
import com.fnc.common.vo.AdminVo;
import com.fnc.util.BaseAction;
import com.fnc.util.Sha512Util;
import com.fnc.util.SmsSender;

public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(LoginAction.class);

	private SmsSender sms = new SmsSender();

	private AdminDao dao = new AdminDao();
	private AdminVo paramVo, resultVo;

	private String userId;
	private transient String userPw;
	private String userPwSha512;
	private String newPw;
	private String confirmPw;
	private String errMsg;

	private String deptNm;
	private String userNm;
	private String email;
	private String noMphn;

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}
	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
	}
	public String getErrMsg() {
		return errMsg;
	}


	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setNoMphn(String noMphn) {
		this.noMphn = noMphn;
	}


	public String loginForm() throws Exception {
		return SUCCESS;
	}

	public String login() throws Exception {
		if ( StringUtils.isNotBlank(userId) && StringUtils.isNotBlank(userPw) ) {
			boolean bEncChk = true;
			session.put("errMsg", null);

			try {
				logger.debug("### before userPw : " + userPw + " ###");
				userPwSha512 = StringUtils.stripToNull(Sha512Util.getSha512(userPw));
				logger.debug("### after userPw : " + userPwSha512 + " ###");
			}
			catch(Exception e) {
				logger.error("##########################################");
				logger.error("########## Encryption Error..!! ##########");
				logger.error("##########################################");

				bEncChk = false;
			}

			if ( bEncChk ) {
				resultVo = dao.selectAdminInfoChk(userId);

				// 관리자 정보 존재 시
				if ( resultVo != null && StringUtils.isNotBlank(resultVo.getUserId()) ) {
					logger.debug("### " + resultVo.toString() + " ###");
					// 로그인 가능 여부 체크
					if ( "Y".equals(resultVo.getYnLinAble()) ) {
						// 비밀번호 ( O )
						if ( userPwSha512.equals(resultVo.getUserPw()) ) {
							resultVo.setUserPw(""); // 비밀번호 제거
							Date day = new Date();
							String today = DateFormatUtils.format(day, "yyyy.MM.dd HH:mm:ss");
							resultVo.setLoginDate(today);
							resultVo.setIpAdmnPrsn(getClientIP());
							session.put(ADMIN_INFO, resultVo);
							logger.debug("### " + resultVo.toString() + " ###");

							// 비밀번호 만료 여부 체크
							if ( "Y".equals(resultVo.getYnExpiredPwd()) ) {
								return "adminExpirePwd";
							}
							sendOtp(resultVo.getNoMphn());
							return SUCCESS;
						}
						// 비밀번호 ( X )
						else {
							// 로그인 오류 횟수 체크
							if ( resultVo.getNotmEror() < 4 ) {
								// 오류 횟수 증가 처리
								int resultCnt = dao.updateLoginFailCnt(userId);
								logger.debug("### resultCnt : " + resultCnt + " ###");
								session.put("errMsg", "E01");
							}
							else if ( resultVo.getNotmEror() == 4 ) {
								// 계정정보 Lock 처리
								int resultCnt = dao.updateLoginLock(userId);
								logger.debug("### resultCnt : " + resultCnt + " ###");
								session.put("errMsg", "E02");
							}
						}
					}
					else {
						logger.error("### Your login account is locked. ###");
						session.put("errMsg", "E02");
					}
				}
				else {
					logger.error("### The login account information does not exist. ###");
				}
			}
		}

		return "adminLogin";
	}

	public String expirePwd() throws Exception {

		return SUCCESS;
	}

	public String changePwdAjax() throws Exception {
		if ( StringUtils.isNotBlank(userPw) && StringUtils.isNotBlank(newPw) && StringUtils.isNotBlank(confirmPw) ) {
			boolean bEncChk = true;
			errMsg = null;
			paramVo = new AdminVo();
			paramVo.setUserId(adminVo.getUserId());

			try {
				logger.debug("### before userPw : " + userPw + " ###");
				logger.debug("### before newPw : " + newPw + " ###");
				paramVo.setUserPw(Sha512Util.getSha512(userPw));
				paramVo.setNewPw(Sha512Util.getSha512(newPw));
				logger.debug("### after userPw : " + paramVo.getUserPw() + " ###");
				logger.debug("### after newPw : " + paramVo.getNewPw() + " ###");
			}
			catch(Exception e) {
				logger.error("##########################################");
				logger.error("########## Encryption Error..!! ##########");
				logger.error("##########################################");

				bEncChk = false;
			}

			if ( bEncChk ) {
				resultVo = dao.selectAdminInfo(paramVo);

				if ( resultVo != null && StringUtils.isNotBlank(resultVo.getUserId()) ) {
					paramVo.setIpAdmnPrsn(getClientIP());
					int resultCnt = dao.updatePwdChange(paramVo);
					logger.debug("### resultCnt : " + resultCnt + " ###");

					if ( resultCnt > 0 ) {
						paramVo.setUserPw(paramVo.getNewPw());
						resultVo = dao.selectAdminInfo(paramVo);

						if ( resultVo != null && StringUtils.isNotBlank(resultVo.getUserId()) ) {
							Date day = new Date();
							String today = DateFormatUtils.format(day, "yyyy.MM.dd HH:mm:ss");
							resultVo.setLoginDate(today);
							resultVo.setIpAdmnPrsn(getClientIP());
							session.put(ADMIN_INFO, resultVo);
							logger.debug("### " + resultVo.toString() + " ###");
						}
						else {
							errMsg = "E04"; // 변경된 사용자정보 조회 중 오류가 발생했습니다.
						}
					}
					else {
						errMsg = "E03"; // 비밀번호 변경에 실패하였습니다.
					}
				}
				else {
					errMsg = "E02"; // 현재 비밀번호가 일치하지 않습니다.
				}
			}
			else {
				errMsg = "E01"; // 비밀번호 암호화 오류 발생.
			}
		}
		else {
			errMsg = "E00"; // 파라미터 오류 발생.
		}

		return SUCCESS;
	}

	public String updateAccountInfoAjax() throws Exception {
		if ( StringUtils.isNotBlank(deptNm) && StringUtils.isNotBlank(userNm) && StringUtils.isNotBlank(email) && StringUtils.isNotBlank(noMphn)
			&& ( (StringUtils.isBlank(newPw) && StringUtils.isBlank(confirmPw))
				|| (StringUtils.isNotBlank(newPw) && StringUtils.isNotBlank(confirmPw)) && (StringUtils.stripToEmpty(newPw).equals(StringUtils.stripToEmpty(confirmPw))) ) ) {

			boolean bEncChk = true;
			boolean bPwdChk = false;
			errMsg = null;
			paramVo = new AdminVo();
			paramVo.setUserId(adminVo.getUserId());

			if ( StringUtils.isNotBlank(newPw) && StringUtils.isNotBlank(confirmPw) ) {
				bPwdChk = true;
			}

			if ( bPwdChk ) {
				try {
					logger.debug("### before newPw : " + newPw + " ###");
					logger.debug("### before confirmPw : " + confirmPw + " ###");
					paramVo.setNewPw(Sha512Util.getSha512(newPw));
					paramVo.setConfirmPw(Sha512Util.getSha512(confirmPw));
					logger.debug("### after newPw : " + paramVo.getNewPw() + " ###");
					logger.debug("### after confirmPw : " + paramVo.getConfirmPw() + " ###");
				}
				catch(Exception e) {
					logger.error("##########################################");
					logger.error("########## Encryption Error..!! ##########");
					logger.error("##########################################");

					bEncChk = false;
				}
			}

			if ( bEncChk ) {
				paramVo.setDeptNm(deptNm);
				paramVo.setUserNm(userNm);
				paramVo.setEmail(email);
				paramVo.setNoMphn(noMphn);
				paramVo.setIpAdmnPrsn(getClientIP());

				resultVo = dao.selectAdminInfoChk(adminVo.getUserId());

				if ( resultVo != null && StringUtils.isNotBlank(resultVo.getUserId()) ) {
					// 비밀번호 변경 ( O )
					if ( bPwdChk ) {
						String newPw = paramVo.getNewPw();
						String oldPw = resultVo.getUserPw();
						logger.debug("### newPw : " + newPw + " ###");
						logger.debug("### oldPw : " + oldPw + " ###");
//						if ( paramVo.getNewPw().equals(resultVo.getUserPw()) ) {
						if (!newPw.equals(oldPw)) {
							int resultCnt = dao.updateAccountInfoAjax(paramVo);
							logger.debug("### resultCnt : " + resultCnt + " ###");

							if ( resultCnt > 0 ) {
								paramVo.setUserPw(paramVo.getNewPw());
								resultVo = dao.selectAdminInfoChk(adminVo.getUserId());

								if ( resultVo != null && StringUtils.isNotBlank(resultVo.getUserId()) ) {
									resultVo.setUserPw(""); // 비밀번호 제거
									Date day = new Date();
									String today = DateFormatUtils.format(day, "yyyy.MM.dd HH:mm:ss");
									resultVo.setLoginDate(today);
									resultVo.setIpAdmnPrsn(getClientIP());
									session.put(ADMIN_INFO, resultVo);
									logger.debug("### " + resultVo.toString() + " ###");
								}
								else {
									session.remove(ADMIN_INFO);
									errMsg = "E05"; // 변경된 사용자정보 조회 중 오류가 발생했습니다.
								}
							}
							else {
								errMsg = "E04"; // 계정정보 변경에 실패하였습니다.
							}
						}
						else {
							errMsg = "E03"; // 현재 비밀번호와 동일합니다.
						}
					}
					// 비밀번호 변경 ( X )
					else {
						int resultCnt = dao.updateAccountInfoAjax(paramVo);
						logger.debug("### resultCnt : " + resultCnt + " ###");

						if ( resultCnt > 0 ) {
							resultVo = dao.selectAdminInfoChk(adminVo.getUserId());

							if ( resultVo != null && StringUtils.isNotBlank(resultVo.getUserId()) ) {
								resultVo.setUserPw(""); // 비밀번호 제거
								Date day = new Date();
								String today = DateFormatUtils.format(day, "yyyy.MM.dd HH:mm:ss");
								resultVo.setLoginDate(today);
								resultVo.setIpAdmnPrsn(getClientIP());
								session.put(ADMIN_INFO, resultVo);
								logger.debug("### " + resultVo.toString() + " ###");
							}
							else {
								session.remove(ADMIN_INFO);
								errMsg = "E05"; // 변경된 사용자정보 조회 중 오류가 발생했습니다.
							}
						}
						else {
							errMsg = "E04"; // 계정정보 변경에 실패하였습니다.
						}
					}
				}
				else {
					errMsg = "E02"; // 사용자정보 조회 중 오류가 발생했습니다.
				}
			}
			else {
				errMsg = "E01"; // 비밀번호 암호화 오류 발생.
			}
		}
		else {
			errMsg = "E00"; // 파라미터 오류 발생.
		}

		return SUCCESS;
	}

	public String logout() throws Exception {
		session.remove(ADMIN_INFO);

		return "adminLogin";
	}

	/**
	 * 인증번호 발송
	 * @param mobNo 수신자 번호
	 * @return otp 번호
	 * @throws Exception
	 */
//	private void sendOtp(String mobNo) throws Exception{
//		String otp = makeOtp();
//		String subject = "";
//		String receiverNo = mobNo.replaceAll("-", "");
//		String senderNo = getConfig("resource.sms.send.mob");
//		String userId   = getConfig("resource.sms.send.userId");
//		String token    = getConfig("resource.sms.send.token");
//		String tel      = getConfig("resource.sms.send.tel");
//
//		//FIXME 메세지 계행시 전송 오류 발생
////		StringBuffer msgSb = new StringBuffer();
////		msgSb.append("대림F&B Admin Sysyem")
////		.append("\n로그인 인증번호 : ").append(otp)
////		.append("대표번호 : ").append(tel);
////		String message = msgSb.toString();
//		String message = "대림F&B Sysyem Admin 로그인 인증번호 : "+otp+" 대표번호:"+tel;
//
//		//파라미터 SET
//		StringBuffer paramSb = new StringBuffer();
//		paramSb.append("{\n\t\"user_id\":").append("\""+userId+"\"")
//		.append(",\n\t\"sender\":"   ).append("\""+senderNo+"\"")
//		.append(",\n\t\"receiver\":" ).append("\""+receiverNo+"\"")
//		.append(",\n\t\"subject\":"  ).append("\""+subject+"\"")
//		.append(",\n\t\"message\":"  ).append("\""+message+"\"")
//		.append(",\n\t\"sms_type\": \"S\"")
//		.append(",\n\t\"file\":\"\"\n}");
//
//		OkHttpClient client = new OkHttpClient().newBuilder() .build();
//		MediaType mediaType = MediaType.parse("application/json");
//		RequestBody body = RequestBody.create(mediaType, paramSb.toString());
//		Request request = new Request.Builder()
//				.url("https://api.hiworks.com/office/v2/sms/send")
//				.method("POST", body)
//				.addHeader("Authorization", "Bearer "+token)
//				.addHeader("Content-Type", "application/json")
//				.build();
//		Response response = null;
//		try {
//			response = client.newCall(request).execute();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		// 표준출력으로 한 라인씩 출력
//		BufferedReader br = new BufferedReader(new InputStreamReader(response.body().byteStream(),"UTF-8"));
//	    String data = br.readLine();
//	    StringBuffer retStr = new StringBuffer();
//	    while(data != null ) {
//	      if(retStr.length() > 0) {
//	        retStr.append("\n");
//	      }
//	      retStr.append(data);
//	      data = br.readLine();
//	    }
//
//	    //JSON String > Map 변환
//	    ObjectMapper mapper = new ObjectMapper();
//	    Map<String, Object> resultMap = mapper.readValue(retStr.toString(), Map.class);
//	    logger.debug("TEST:"+resultMap);
//	    Map result = (Map) resultMap.get("result");
//
//	    if(result != null){ //전송 결과값이 있고
//	    	int succcess = (int) result.get("success");
//	    	if(succcess != 0){ // 성공 결과값이 0이 아니면
//	    		session.remove("otp");
//	    		session.put("otp", otp);
//	    	}else{
//	    		throw new Exception("SMS 전송오류");
//	    	}
//	    }else{
//	    	throw new Exception("SMS 전송오류");
//	    }
//	}
	private void sendOtp(String mobNo) throws Exception{
		String otp = makeOtp();
		String receiverNo = mobNo.replaceAll("-", "");

		//FIXME 메세지 계행시 전송 오류 발생
//		StringBuffer msgSb = new StringBuffer();
//		msgSb.append("대림F&B Admin Sysyem")
//		.append("\n로그인 인증번호 : ").append(otp)
//		String message = msgSb.toString();
		String message = "[대림F&C] 인증번호는 "+otp+"입니다.정확히 입력해주세요.";

		Map result = sms.sendSms(receiverNo, message);
		int succcess = (int) result.get("success");
		if(succcess != 0){
			session.remove("otp");
			session.put("otp", otp);
		}
	}

	/**
	 * 6자리 난수 생성
	 * @return otp 번호
	 */
	private String makeOtp(){
		String otp = "";
		Random random = new Random(System.currentTimeMillis());

        int range = (int)Math.pow(10,6);
        int trim = (int)Math.pow(10, 6-1);
        int result = random.nextInt(range)+trim;

        if(result>range){
            result = result - trim;
        }
        return String.valueOf(result);

	}

	/**
	 * OTP 인증
	 * @return
	 * @throws Exception
	 */
	public String authOtp() throws Exception{
		Map paramMap = getMap();
		String enteredOtp = (String) paramMap.get("otp");
		String sendedOtp = (String) session.get("otp");
		if(!enteredOtp.equals(sendedOtp)) throw new Exception();
		session.remove("otp");
		return SUCCESS;
	}

	public String reSendOtp() throws Exception{
		Map paramMap = getMap();
		String mobNo = (String) paramMap.get("noMphn");
		sendOtp(mobNo);
		return SUCCESS;
	}
}
