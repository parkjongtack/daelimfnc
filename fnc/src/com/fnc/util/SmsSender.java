package com.fnc.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class SmsSender {
	
	private static Logger logger = Logger.getLogger(SmsSender.class);
	
	private String subject    = "";
	private String senderNo   = ResourceBundle.getBundle("config").getString("resource.sms.send.mob");
	private String userId     = ResourceBundle.getBundle("config").getString("resource.sms.send.userId");
	private String token      = ResourceBundle.getBundle("config").getString("resource.sms.send.token");
	private String tel        = ResourceBundle.getBundle("config").getString("resource.sms.send.tel");
	
	/**
	 * 인증번호 발송
	 * @param mobNo 수신자 번호
	 * @return result 문자발송결과
	 * @throws Exception 
	 */
	public Map sendSms(String mobNo , String message) throws Exception{
		String receiverNo = mobNo.replaceAll("-", "");
		//파라미터 SET
		StringBuffer paramSb = new StringBuffer();
		paramSb.append("{\n\t\"user_id\":").append("\""+userId+"\"")
		.append(",\n\t\"sender\":"   ).append("\""+senderNo+"\"")
		.append(",\n\t\"receiver\":" ).append("\""+receiverNo+"\"")
		.append(",\n\t\"subject\":"  ).append("\""+subject+"\"")
		.append(",\n\t\"message\":"  ).append("\""+message+"\"")
		.append(",\n\t\"sms_type\": \"S\"")
		.append(",\n\t\"file\":\"\"\n}");
		
		OkHttpClient client = new OkHttpClient().newBuilder() .build();
		MediaType mediaType = MediaType.parse("application/json");
		RequestBody body = RequestBody.create(mediaType, paramSb.toString());
		Request request = new Request.Builder()
				.url("https://api.hiworks.com/office/v2/sms/send")
				.method("POST", body)
				.addHeader("Authorization", "Bearer "+token)
				.addHeader("Content-Type", "application/json")
				.build();
		Response response = null;
		try {
			response = client.newCall(request).execute();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 표준출력으로 한 라인씩 출력
		BufferedReader br = new BufferedReader(new InputStreamReader(response.body().byteStream(),"UTF-8"));
	    String data = br.readLine();
	    StringBuffer retStr = new StringBuffer();
	    while(data != null ) {
	      if(retStr.length() > 0) {
	        retStr.append("\n");
	      } 
	      retStr.append(data);
	      data = br.readLine();
	    }
	    
	    //JSON String > Map 변환
	    ObjectMapper mapper = new ObjectMapper();
	    Map<String, Object> resultMap = mapper.readValue(retStr.toString(), Map.class);
	    logger.debug("TEST:"+resultMap);
	    Map result = (Map) resultMap.get("result");
	    
	    if(result == null) throw new Exception("SMS 전송오류");
	    int succcess = (int) result.get("success");
	    if(succcess == 0) throw new Exception("SMS 전송오류");
	    
	    return result;
	}
}
