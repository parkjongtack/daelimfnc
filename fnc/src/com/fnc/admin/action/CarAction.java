package com.fnc.admin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.admin.dao.CarDao;
import com.fnc.admin.vo.CarVo;
import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.AdminVo;
import com.fnc.common.vo.FileVo;
import com.fnc.util.BaseAction;
import com.fnc.util.StringManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
public class CarAction extends BaseAction  {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(CarAction.class);
	
	CarDao dao = new CarDao();
	FileDao fileDao = new FileDao();
	
	// 객체 변수
	private CarVo resultVo;
	private List<CarVo> resultList;
	private int cnt; 
	
	private List<FileVo> fileVoList; // 첨부파일
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public CarVo getCarVo() {
		return resultVo;
	}
	
	public List<CarVo> getResultList() {
		return resultList;
	}
	
	public CarVo getResultVo() {
		return resultVo;
	}

	public void setResultVo(CarVo resultVo) {
		this.resultVo = resultVo;
	}

	public void setResultList(List<CarVo> resultList) {
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
	
	
	
	//채용정보 등록
	public String carRegiExcute() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ채용정보 등록");
		
		if(getMap() !=null) {
			// 세션 값 세팅
			ActionContext context = ActionContext.getContext();
			Map<String, Object> session = (Map<String, Object>)context.getSession();
			AdminVo adminVo = (AdminVo) session.get("adminVo");
			paramMap.put("idCrtnPrsn", adminVo.getUserId());
			paramMap.put("ipAdmnPrsn", request.getRemoteAddr());
			paramMap.put("dtRgst", StringManager.chkNull(paramMap.get("dtRgst")).replaceAll("-", "").replaceAll("/", ""));	// 작성일   20200424
			paramMap.put("dtBegnc", StringManager.chkNull(paramMap.get("dtBegnc")).replaceAll("-", "").replaceAll("/", ""));	// 접수 시작일   20200424
			paramMap.put("dtEnd", StringManager.chkNull(paramMap.get("dtEnd")).replaceAll("-", "").replaceAll("/", ""));	// 접수 종료일   20200424
			
			// 파일 저장
			HashMap<String, Object> fileMap = new HashMap<String, Object>();
			List<HashMap<String, String>> uploadMap = getImageMaps();

			fileMap.put("uploadList", uploadMap);
			
			// 이미지 키값 세팅
			HashMap<String, Object> fileResult = fileDao.insertFile(fileMap);
			paramMap.put("noAtchFileSral", fileResult.get("fileKey"));
			
			dao.insertCar(paramMap);
		}
		
		return SUCCESS;
	}
	
	//채용정보 리스트 목록 AJAX
	public String listAjax() throws Exception {
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ채용정보 목록");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		this.cnt = dao.selectCarListCnt(paramMap);
		this.resultList = dao.selectCarList(paramMap);
		
		return SUCCESS;
	}
	
	//채용정보 상세
	public String modi() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ채용정보 상세");
		logger.debug(getMap());
		this.resultVo = dao.selectCar(paramMap);
		this.fileVoList= fileDao.selectFileList(resultVo.getNoAtchFileSral());
		return SUCCESS;
	}
	
	public String carModiExcute() throws Exception {
		logger.debug("--------------------------수정 데이터 확인");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		HashMap<String, Object> fileMap = new HashMap<String, Object>();	// 이미지용 객체
		
		// 세션 값 세팅
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		AdminVo adminVo = (AdminVo) session.get("adminVo");
		paramMap.put("idRevPrsn", adminVo.getUserId());
		paramMap.put("ipAdmnPrsn", request.getRemoteAddr());
		paramMap.put("dtRgst", StringManager.chkNull(paramMap.get("dtRgst")).replaceAll("-", "").replaceAll("/", ""));	// 작성일   20200424
		paramMap.put("dtBegnc", StringManager.chkNull(paramMap.get("dtBegnc")).replaceAll("-", "").replaceAll("/", ""));	// 접수 시작일   20200424
		paramMap.put("dtEnd", StringManager.chkNull(paramMap.get("dtEnd")).replaceAll("-", "").replaceAll("/", ""));	// 접수 종료일   20200424
		
		// 파일 수정
		if (paramMap.get("noAtchFileSral") != null && !"".equals(paramMap.get("noAtchFileSral"))) {
			// 파일 시퀀스가 있다면 - 파일이 하나라도 있다면 수정
			HashMap<String, String[]> paramMaps = getMaps();
			logger.debug("파일 수정");
			String[] fileStatus = paramMaps.get("fileStatus");
			String[] noAtchFileDtilSral = paramMaps.get("noAtchFileDtilSral");

			List<String> updateList = new ArrayList<String>();
			List<String> deleteList = new ArrayList<String>();
			List<String> updateSeqList = new ArrayList<String>();
			List<String> deleteSeqList = new ArrayList<String>();
			
			// 신규or수정 , 삭제 분리
			for (int i = 0; i < fileStatus.length; i++) {
				if (("N".equals(fileStatus[i]) && "0".equals(noAtchFileDtilSral[i])) || "M".equals(fileStatus[i])) {
					updateList.add(fileStatus[i]);
					updateSeqList.add(noAtchFileDtilSral[i]);
				} else if ("D".equals(fileStatus[i])) {
					deleteList.add(fileStatus[i]);
					deleteSeqList.add(noAtchFileDtilSral[i]);
				}
			}
			
			// 이미지 저장
			List<HashMap<String, String>> uploadMap = getImageMaps();	// 일반 파일 업로드
			fileMap.put("noAtchFileSral", paramMap.get("noAtchFileSral"));
			fileMap.put("updateList", updateList);
			fileMap.put("deleteList", deleteList);
			fileMap.put("updateSeqList", updateSeqList);
			fileMap.put("deleteSeqList", deleteSeqList);
			fileMap.put("uploadList", uploadMap);
			
			fileDao.updateFile(fileMap);
		} else {
			// 파일 시퀀스가 없다면 신규 생성
			logger.debug("파일 신규");
			
			// 이미지 저장
			List<HashMap<String, String>> uploadMap = getImageMaps();	// 일반 파일 업로드
			fileMap.put("uploadList", uploadMap);
			
			// 이미지 키값 세팅
			HashMap<String, Object> fileResult = fileDao.insertFile(fileMap);
			paramMap.put("noAtchFileSral", fileResult.get("fileKey"));
		}
		
		dao.updateCar(paramMap);
		
		return SUCCESS;
	}
	
	public String dele() throws Exception{
		HashMap<String, Object> paramMap = getMap();
		logger.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ채용정보 삭제");
		logger.debug(getMap());
		dao.updateCarYnElmn(paramMap);
		return SUCCESS;
	}
	
	
	
	
	
}
