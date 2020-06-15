package com.fnc.front.action;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.FileVo;
import com.fnc.front.dao.Car01Dao;
import com.fnc.front.vo.Car01Vo;
import com.fnc.util.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
public class Car01Action extends BaseAction  {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Car01Action.class);
	
	Car01Dao dao = new Car01Dao();
	FileDao fileDao = new FileDao();
	
	// 객체 변수
	private Car01Vo resultVo;
	private List<Car01Vo> resultList;
	private int cnt; 
	
	private Car01Vo pageVo1;
	private Car01Vo pageVo2;
	
	private List<FileVo> thumbVoList;
	private List<FileVo> fileVoList;

	private int nextID;
	private int beforeID;
	private String nextNm;
	private String beforeNm;	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Car01Vo getCar01Vo() {
		return resultVo;
	}
	
	public List<Car01Vo> getResultList() {
		return resultList;
	}
	
	public Car01Vo getResultVo() {
		return resultVo;
	}

	public void setResultVo(Car01Vo resultVo) {
		this.resultVo = resultVo;
	}

	public void setResultList(List<Car01Vo> resultList) {
		this.resultList = resultList;
	}

	public List<FileVo> getFileVoList() {
		return fileVoList;
	}

	public void setFileVoList(List<FileVo> fileVoList) {
		this.fileVoList = fileVoList;
	}

	public String execute() throws Exception {
		return SUCCESS;
	}
/*	
	public String list() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		this.resultList = dao.selectCar01List(paramMap);
		return SUCCESS;
	}
*/
	public String list() throws Exception {
		
		return SUCCESS; 
	}
	
	//채용정보 리스트 목록 AJAX
	public String listAjax() throws Exception {
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ채용정보 목록");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		this.cnt = dao.selectCar01ListCnt(paramMap);
		this.resultList = dao.selectCar01List(paramMap);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡlist"+this.resultList);
		
		return SUCCESS;
	}
	
	//채용정보 상세
	public String listOne() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ채용정보 상세");
		logger.debug(getMap());

		this.resultVo = dao.selectOne(paramMap);
//		this.thumbVoList= fileDao.selectFileList(resultVo.getNoAtchFileThumSral());
		this.fileVoList= fileDao.selectFileList(resultVo.getNoAtchFileSral());
//		this.pageVo1 = dao.selectBfore(paramMap);	
//		this.pageVo2 = dao.selectNxt(paramMap);	

	
		logger.debug("fileVoList  ======================== " + fileVoList.size());
		
		
		return SUCCESS;
	}
	
	
}