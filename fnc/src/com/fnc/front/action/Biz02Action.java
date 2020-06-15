package com.fnc.front.action;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.front.dao.Biz02Dao;
import com.fnc.front.vo.Biz02Vo;
import com.fnc.util.BaseAction;
import com.fnc.util.StringManager;

public class Biz02Action extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Biz02Action.class);
	
	private String menu01;
	private String menu02;
	
	public String getMenu01() {
		return menu01;
	}
	public String getMenu02() {
		return menu02;
	}
	
	private String testYn;
	private Biz02Vo resultVo;
	private List<Biz02Vo> resultList;
	
	public String getTestYn() {
		return testYn;
	}
	public Biz02Vo getResultVo() {
		return resultVo;
	}
	public List<Biz02Vo> getResultList() {
		return resultList;
	}

	Biz02Dao dao = new Biz02Dao();
	
	public String execute() throws Exception {
		
		
		this.menu01 = "2";
		this.menu02 = "2";
		
		return "success";
	}
	
	public String biz02List() throws Exception{
		HashMap<String, Object> paramMap = getMap();
		
		String[] searchVal = StringManager.chkNull((paramMap.get("searchVal"))).split("\\,");
		
		paramMap.put("val", searchVal);
		
		this.resultList = dao.selectBiz02List(paramMap);
		
		// 조회 결과 리스트 결과값 출력 확인용
		if ( this.resultList != null ) {
			logger.debug("### this.resultList.size() : " + this.resultList.size() + " ###");
			
			for ( int i = 0; i < this.resultList.size(); i++ ) {
				logger.debug("### resultList.get(" + i + ").getGubun1() : " + this.resultList.get(i).getGubun1() + " ###");
				logger.debug("### resultList.get(" + i + ").getGubun2() : " + this.resultList.get(i).getGubun2() + " ###");
				logger.debug("### resultList.get(" + i + ").getNmPdct() : " + this.resultList.get(i).getNmPdct() + " ###");
				logger.debug("### resultList.get(" + i + ").getAtrb2() : " + this.resultList.get(i).getAtrb2() + " ###");
				logger.debug("### resultList.get(" + i + ").getAtrb3() : " + this.resultList.get(i).getAtrb3() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getNoAtchFileSral() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getFile1() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getFile2() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileSral() : " + this.resultList.get(i).getFile3() + " ###");
			}
		}
		return SUCCESS;
	}

}
