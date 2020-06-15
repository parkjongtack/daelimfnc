package com.fnc.front.action;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.FileVo;
import com.fnc.front.dao.Biz01Dao;
import com.fnc.front.dao.MailSendLogDao;
import com.fnc.front.vo.Biz01Vo;
import com.fnc.front.vo.MailSendLogVo;
import com.fnc.util.BaseAction;
import com.fnc.util.MailService;
import com.fnc.util.StringManager;

public class Biz01Action extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Biz01Action.class);
	
	MailSendLogDao mailSendLogDao = new MailSendLogDao();

	private String menu01;
	private String menu02;
	
	public String getMenu01() {
		return menu01;
	}
	public String getMenu02() {
		return menu02;
	}

	private Biz01Vo resultVo;
	
	private FileDao fileDao = new FileDao();
	
	private List<Biz01Vo> resultList;
	
	private List<FileVo> fileList;
	
	public Biz01Vo getResultVo() {
		return resultVo;
	}
	public List<Biz01Vo> getResultList() {
		return resultList;
	}
	
	Biz01Dao dao = new Biz01Dao();
	
public String execute() throws Exception {
		
		/*this.resultList = dao.selectBiz01List();
		
		// 조회 결과 리스트 결과값 출력 확인용
		if ( this.resultList != null ) {
			for ( int i = 0; i < this.resultList.size(); i++ ) {
				
				Biz01Vo vo = resultList.get(i);
				
				logger.debug("### resultList.get(" + i + ").getGubun1() : " + this.resultList.get(i).getGubun1() + " ###");
				logger.debug("### resultList.get(" + i + ").getGubun2() : " + this.resultList.get(i).getGubun2() + " ###");
				logger.debug("### resultList.get(" + i + ").getNmPdct() : " + this.resultList.get(i).getNmPdct() + " ###");
				logger.debug("### resultList.get(" + i + ").getAtrb2() : " + this.resultList.get(i).getAtrb2() + " ###");
				logger.debug("### resultList.get(" + i + ").getAtrb3() : " + this.resultList.get(i).getAtrb3() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getNoAtchFileSral() + " ###");
				
				fileList  = fileDao.selectFileList(vo.getNoAtchFileSral());
				if (fileList != null) {
					resultList.get(0).setFileList(fileList);
				}
				
			}
		}*/
	
		this.menu01 = "2";
		this.menu02 = "1";
		return "success";
	}
	
	public String bizlist() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		List<String> val = new ArrayList<String>();
		
		String[] searchVal = StringManager.chkNull((paramMap.get("searchVal"))).split("\\,");
		
//		for (int i=0; i < searchVal.length; i++) {
//			val.add((String)searchVal[i]);
//		}
//		
//		HashMap<String, Object> pMap = new HashMap<String, Object>();
		paramMap.put("val", searchVal);
		
		
		
		
		this.resultList = dao.selectList(paramMap);
		
		
		// 조회 결과 리스트 결과값 출력 확인용
		if ( this.resultList != null ) {
			for ( int i = 0; i < this.resultList.size(); i++ ) {
				
				Biz01Vo vo = resultList.get(i);
				
				logger.debug("### resultList.get(" + i + ").getGubun1() : " + this.resultList.get(i).getGubun1() + " ###");
				logger.debug("### resultList.get(" + i + ").getGubun2() : " + this.resultList.get(i).getGubun2() + " ###");
				logger.debug("### resultList.get(" + i + ").getNmPdct() : " + this.resultList.get(i).getNmPdct() + " ###");
				logger.debug("### resultList.get(" + i + ").getAtrb2() : " + this.resultList.get(i).getAtrb2() + " ###");
				logger.debug("### resultList.get(" + i + ").getAtrb3() : " + this.resultList.get(i).getAtrb3() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getNoAtchFileSral() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getFile1() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getFile2() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getFile3() + " ###");
				
//				fileList  = fileDao.selectFileList(vo.getNoAtchFileSral());
//				if (fileList != null) {
//					resultList.get(0).setFileList(fileList);
//				}
				
			}
		}
		
		return SUCCESS;
	}
	
	public String sendMail() throws Exception {
		Map<String, Object> object1 = new HashMap<String ,Object>();
		object1 = getMap();
		String returnStr = "success";
        logger.debug("### result.map : " + object1 + " ###");
        
        String htel = "";
        String tel1 = StringManager.chkNull(request.getParameter("tel1"));
		String tel2 = StringManager.chkNull(request.getParameter("tel2"));
		String tel3 = StringManager.chkNull(request.getParameter("tel3"));
		
		if (!"".equals(tel2) && !"".equals(tel3)) {
			htel = tel1 + "-" + tel2 + "-" + tel3;
		}
		
		String domain = "";
		
		String selfDomain = StringManager.chkNull(request.getParameter("emailDomain"));
		String selectDomain = StringManager.chkNull(request.getParameter("emailselect"));
		
		if(selfDomain==""){
			domain = selectDomain;
		} else if(selectDomain==""){
			domain = selfDomain;
		}
				
		String email = request.getParameter("emailId") + "@" + domain;
		String recipient = StringManager.chkNull(request.getParameter("emailVal"));
		String clMail = StringManager.chkNull(request.getParameter("sel1")); // 제품 문의 - "01", 채용문의 - "02" , 기타 문의 "03" 
		
		String select = StringManager.chkNull(request.getParameter("sel1"));
		String selectVal = "";
		if ("1".equals(select)) {
			selectVal = "제품문의";
		} else if ("2".equals(select)) {
			selectVal = "채용문의";
		} else if ("3".equals(select)) {
			selectVal = "기타문의";
		}

        object1.put("kind", "inquiry");
        object1.put("recipient", recipient);
        object1.put("category", StringManager.chkNull(request.getParameter("category"))); //제품문의 2댑스
        object1.put("masking", "N");
        object1.put("type", selectVal);//문의분야select값(제품문의,채용문의,기타문의)
        object1.put("name", StringManager.chkNull(request.getParameter("name")));
        object1.put("htel", htel);
        object1.put("email", email);
        object1.put("title", StringManager.chkNull(request.getParameter("title")));
        object1.put("contents", StringManager.chkNull(request.getParameter("cont")));
        
        logger.debug(object1.toString());
        
        
        try{
        	MailService.sendMail(object1, request);
        	
        	String ipAddr = request.getRemoteAddr();
			if (ipAddr.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
				InetAddress inetAddress = InetAddress.getLocalHost();
				ipAddr = inetAddress.getHostAddress();
			}

			MailSendLogVo vo = new MailSendLogVo();
			vo.setClMail(clMail);
			vo.setEmailSdng(email);
			vo.setEmailRcpn(recipient);
			vo.setIpSdng(ipAddr);
			
			mailSendLogDao.insertMailSendLog(vo);
        }catch (Exception e) {
        	returnStr = "fail";
			e.printStackTrace();
		}
        
        
        
		return returnStr;
	}
	
	
}
