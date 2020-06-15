package com.fnc.front.action;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.front.dao.Pr01Dao;
import com.fnc.front.vo.Pr01Vo;
import com.fnc.util.BaseAction;
import com.fnc.util.StringManager;

public class Pr01Action extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Pr01Action.class);
	
	private String THUMB_PATH = getConfig("resource.thumbnail.upload.folder");       //이미지 업로드 Temp 경로
	private String menu01;
	private String menu02;
	private int cnt;

	private String searchCls;
	private String searchCnts;

	public String getMenu01() {
		return menu01;
	}
	public String getMenu02() {
		return menu02;
	}
	public int getCnt() {
		return cnt;
	}
	public String getSearchCls() {
		return searchCls;
	}
	public String getSearchCnts() {
		return searchCnts;
	}
	public String getTHUMB_PATH() {
		return THUMB_PATH;
	}

	private Pr01Vo resultVo;
	private List<Pr01Vo> resultList;
	
	public Pr01Vo getResultVo() {
		return resultVo;
	}
	public List<Pr01Vo> getResultList() {
		return resultList;
	}
	
	public List<Pr01Vo> getResultSearch() {
		return resultList;
	}
	
	Pr01Dao dao = new Pr01Dao();
	
	public String execute() throws Exception {
		HashMap<String, Object> paramMap = getMap();

		this.searchCls = StringManager.chkNull(paramMap.get("searchCls"));
		this.searchCnts = StringManager.chkNull(paramMap.get("searchCnts"));

		this.menu01 = "5";
		this.menu02 = "1";
		return "success";
	}
	
	public String list() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		Pr01Vo pr01Vo = new Pr01Vo();
		
		this.searchCls = StringManager.chkNull(paramMap.get("searchCls"));
		this.searchCnts = StringManager.chkNull(paramMap.get("searchCnts"));
		String sNum = StringManager.chkNull(paramMap.get("sNum"));
		String eNum = StringManager.chkNull(paramMap.get("eNum"));
		
		if (!"".equals(this.searchCls)) {
			pr01Vo.setSearchCls(this.searchCls);
		}

		if (!"".equals(this.searchCnts)) {
			pr01Vo.setSearchCnts(this.searchCnts);
		}
		
		if (!"".equals(sNum)) {
			pr01Vo.setsNum(sNum);
		}
		
		if (!"".equals(eNum)) {
			pr01Vo.seteNum(eNum);
		}

		this.cnt = dao.selectPr01ListCnt(pr01Vo);
		this.resultList = dao.selectPr01List(pr01Vo);
			
		// 조회 결과 리스트 결과값 출력 확인용
		if (this.resultList != null ) {
			logger.debug("### resultList.size() : " + this.resultList.size() + " ###");
			
			for ( int i = 0; i < this.resultList.size(); i++ ) {
				logger.debug("### resultList.get(" + i + ").getClNtcPlte() : " + this.resultList.get(i).getClNtcPlte() + " ###");
				logger.debug("### resultList.get(" + i + ").getNoAtchFileThumSral() : " + this.resultList.get(i).getNoAtchFileThumSral() + " ###");
				logger.debug("### resultList.get(" + i + ").getSbjtNtcPlte() : " + this.resultList.get(i).getSbjtNtcPlte() + " ###");
				logger.debug("### resultList.get(" + i + ").getCntsSmry() : " + this.resultList.get(i).getCntsSmry() + " ###");
				logger.debug("### resultList.get(" + i + ").getDtRgst() : " + this.resultList.get(i).getDtRgst() + " ###");
			}
		}

		return "success";
	}
}
