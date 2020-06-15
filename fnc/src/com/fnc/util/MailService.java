package com.fnc.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class MailService {

	final static String HOST = getConfig("resource.host");
	final static String SMTP_HOST = getConfig("resource.smtp.host.name");
	final static int SMTP_PORT = Integer.parseInt(getConfig("resource.smtp.port"));
	final static String SENDER = getConfig("resource.send.mail.addr");
	
	final static String USER = getConfig("resource.smtp.user");
//	final static String PASSWORD = "12345!@#$%";
	final static String PASSWORD = getConfig("resource.smtp.user.pwd");
	

	/*
	 * 메일 전송 
	*/
	public static boolean sendMail(Map<String, Object> map, HttpServletRequest request) throws UnsupportedEncodingException {
		
		ServletContext context = request.getSession().getServletContext();
				
		String kind = (String)map.get("kind");
		String recipient = (String)map.get("recipient");
		String title = (String)map.get("title");			//제목
		title = "[국문] "+title;

		Properties props = System.getProperties();

		// smtp 서버 정보 설정
		props.put("mail.smtp.host", SMTP_HOST); 
		props.put("mail.smtp.port", SMTP_PORT); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", SMTP_HOST);

		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER, PASSWORD);
            }
        });

		session.setDebug(true); //for debug 
		
		//html 추가 부분 S
		StringBuilder mailform = new StringBuilder();
        String filePath = "";

        //메일 타입이 신문고 	
        if ("sinmungo".equals(kind)) { 
        	//신문고의 경우 답변 메일이 없다. (신문고는 한국만 사용)
        	filePath = "/support/mailform/report_receipt.html";
        //메일 타입이 고객문의
        } else if ("inquiry".equals(kind)) { 
    		filePath = "/support/mailform/customer_inquiry.html";
        }

        InputStream inputStream = null;
        
        try {
            inputStream = context.getResourceAsStream(filePath);		//이부분 error
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream,"UTF-8"));

            String line = "";
            try {
				while( (line = bufferedReader.readLine()) != null) {
					mailform.append(line);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
        } finally {
            if (inputStream != null) {
               try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
            }
        }
		//html 추가 부분 E

		try {
			String msg = "";
			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
			mimeMessage.setFrom(new InternetAddress(SENDER)); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
			
			mimeMessage.setSubject(title); //제목셋팅
			//신문고일경우 html 치환이 많아지기 때문에 따로 함수를 만듬
			if ("sinmungo".equals(kind)) {
				msg = sinmungoMsg(map, mailform.toString());				
			} else if ("inquiry".equals(kind)) { 
				msg = inquiryMsg(map, mailform.toString());		
			}

			System.out.println(msg);
			System.out.println("=====================================================");
			mimeMessage.setContent(msg, "text/html; charset=utf-8"); 
			Transport.send(mimeMessage);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("mail send Fail : "+e);
			return false;
		}
		return true;
	}
	
	public static InternetAddress[] makeRecipient(ArrayList<HashMap<String, Object>> param) throws AddressException {
		
		InternetAddress[] inet = new InternetAddress[param.size()];
		
		for (int i = 0; i < param.size(); i ++) {
			HashMap<String, Object> map = (HashMap<String, Object>)param.get(i);
			
			inet[i] = new InternetAddress(map.get("EMAIL_BIC_PRSN").toString());
		}
		
		return inet;
	}
	
	public static String today(){
		
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

        Calendar c1 = Calendar.getInstance();

        String strToday = sdf.format(c1.getTime());
        
		return strToday;

	}
	
	/*	신문고 관리자에게 메일 전송시 
	 * 	입력내용 치환 메소드
	*/
	@SuppressWarnings("unchecked")
	public static String sinmungoMsg(Map<String, Object> map, String msg){
		String returnStr = "", uploadStr = "";
		System.out.println("신문고 메세지 치환 ");
		
		String masking = !"Y".equals(StringManager.mapValue(map, "masking")) ? "" : "masking";
		
		returnStr = msg.toString().replace("${host}", HOST);
		returnStr = returnStr.toString().replace("${type}", (String)map.get("type"));
		returnStr = returnStr.toString().replace("${name}", nameFormat((String)map.get("name"), masking));
		returnStr = returnStr.toString().replace("${email}", emailFormat((String)map.get("email"), masking));
		returnStr = returnStr.toString().replace("${htel}", mtelFormat((String)map.get("htel"), masking));
		returnStr = returnStr.toString().replace("${mtel}", mtelFormat((String)map.get("mtel"), masking));

		ArrayList<HashMap<String, String>> uploadFiles = (ArrayList<HashMap<String,String>>)map.get("uploads");
		for (int i = 0; i < uploadFiles.size(); i ++) {
			HashMap<String, String> uploadMap = (HashMap<String, String>)uploadFiles.get(i);

			String fileNo = StringManager.mapValue(uploadMap , "fileNo");
			String orgFileName = StringManager.mapValue(uploadMap , "orgFileName");
			System.out.println("filename : " + orgFileName);
			if (!"".equals(orgFileName)) {
				uploadStr += uploadsHtml(fileNo, orgFileName);
			}
		}
		if ("".equals(uploadStr)) {
			uploadStr = "등록된 첨부파일이 없습니다.";
		}

		returnStr = returnStr.toString().replace("${uploads}", uploadStr);
		returnStr = returnStr.toString().replace("${title}", (String)map.get("title"));
		returnStr = returnStr.toString().replace("${contents}", (String)map.get("contents"));

		return returnStr;
	}
	
	public static String uploadsHtml(String idx, String ofilename) {
		
		String msg = "";
        msg += "<p style=\"padding:0px;margin:0px;margin-auto:0px;mso-line-height-rule: exactly;line-height:110%;font-size:13px;\"><a href=\""+HOST+"/filedownload.do?idx="+idx+"&dir=sinmungo\">${filename}</a></p>";
        msg = msg.toString().replace("${filename}", ofilename);

		return msg;
	}
	
	/**
	 * 고객문의 내용 치환
	 * @param map
	 * @param msg
	 * @return
	 */
	public static String inquiryMsg(Map<String, Object> map, String msg){
		String returnStr = "";
		System.out.println("고객문의 메세지 치환 ");
		String masking = !"Y".equals(StringManager.mapValue(map, "masking")) ? "" : "masking";
		
		returnStr = msg.toString().replace("${host}", HOST);
		returnStr = returnStr.toString().replace("${nmClItem}", (String)map.get("type"));
		returnStr = returnStr.toString().replace("${category}", (String)map.get("category"));
		returnStr = returnStr.toString().replace("${name}", nameFormat((String)map.get("name"), masking));
		returnStr = returnStr.toString().replace("${email}", emailFormat((String)map.get("email"), masking));
		returnStr = returnStr.toString().replace("${htel}", mtelFormat((String)map.get("htel"), masking));
		returnStr = returnStr.toString().replace("${title}", (String)map.get("title"));
		returnStr = returnStr.toString().replace("${contents}", (String)map.get("contents"));

		return returnStr;
	}

	public static String mtelFormat(String mtel, String masking) {
		String rtnValue = "";
		
		if (masking.equals("masking")){
			if (!"".equals(mtel)) {
				for (int i = 0; i < mtel.length(); i ++) {
					if ("-".equals(mtel.substring(i, i+1))) {
						rtnValue += "-";
					} else {
						rtnValue += "*";
					}
				}
			} else {
				rtnValue = "";
			}
		} else {
			rtnValue = mtel;
		}
		
		return rtnValue;
	}
	
	public static String emailFormat(String email, String masking) {
		
		String rtnValue = "";
		
		if (masking.equals("masking")){
			for (int i = 0; i < email.length(); i ++) {
				rtnValue += "*"; 
			}
		} else {
			rtnValue = email;
		}
		
		return rtnValue;
	}
	
	
	//고객이름 포맷 , 및 마스킹
	public static String nameFormat(String name, String masking){
		if (name.length() == 0){
			 return name;
		}
		String strName = name;
		
		if(strName.length() < 3){
			if(masking.equals("masking")){
				strName = strName.substring(0,1) + "**";
			  }
		}else if(strName.length() > 3){
			if(masking.equals("masking")){
				strName = strName.substring(0,1) + "**" + strName.substring(strName.length() -2, strName.length());
			  }
		}else{
			if(masking.equals("masking")){
				strName = strName.substring(0,1) + "*" + strName.substring(strName.length() -1, strName.length());
			  }
		}
		return strName;
	}
	
	private static String getConfig(String argc){
		String rtn = "";
		rtn = ResourceBundle.getBundle("config").getString(argc);
		return rtn;
	}
}
