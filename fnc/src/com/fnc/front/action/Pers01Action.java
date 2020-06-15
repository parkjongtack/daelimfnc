package com.fnc.front.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.front.dao.Pers01Dao;
import com.fnc.front.vo.Pers01Vo;
import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.AdminVo;
import com.fnc.common.vo.FileVo;
import com.fnc.util.BaseAction;
import com.fnc.util.StringManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class Pers01Action extends BaseAction {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Pers01Action.class);
	Pers01Dao dao = new Pers01Dao();
	FileDao fileDao = new FileDao();
	
	// 객체 변수
	private Pers01Vo resultVo;
	private List<Pers01Vo> resultList;
	private int cnt; 
	
	private List<FileVo> fileVoList; // 첨부파일
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Pers01Vo getCarVo() {
		return resultVo;
	}
	
	public List<Pers01Vo> getResultList() {
		return resultList;
	}
	
	public Pers01Vo getResultVo() {
		return resultVo;
	}

	public void setResultVo(Pers01Vo resultVo) {
		this.resultVo = resultVo;
	}

	public void setResultList(List<Pers01Vo> resultList) {
		this.resultList = resultList;
	}

	public List<FileVo> getFileVoList() {
		return fileVoList;
	}

	public void setFileVoList(List<FileVo> fileVoList) {
		this.fileVoList = fileVoList;
	}

	// 실행
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	public String list() throws Exception {
		
		return SUCCESS; 
	}
	
	public String regi() throws Exception {
		
		return SUCCESS;
	}
	
	
	//개인정보 리스트 목록 AJAX
	public String listAjax() throws Exception {
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ개인정보 목록");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		this.cnt = dao.selectPersListCnt(paramMap);
		this.resultList = dao.selectPersList(paramMap);
		
		return SUCCESS;
	}
	
	//개인정보 상세
	public String modi() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ개인정보 상세");
		logger.debug(getMap());
		this.resultVo = dao.selectPers(paramMap);
		this.fileVoList= fileDao.selectFileList(resultVo.getNoAtchFileSral());
		return SUCCESS;
	}
	
	public String listOne() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ개인정보 상세");
		logger.debug(getMap());

		this.resultVo = dao.selectPers(paramMap);
		return SUCCESS;
	}
	
}