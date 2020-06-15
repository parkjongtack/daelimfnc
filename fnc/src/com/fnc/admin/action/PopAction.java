package com.fnc.admin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.admin.dao.PopDao;
import com.fnc.admin.vo.PopVo;
import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.AdminVo;
import com.fnc.common.vo.FileVo;
import com.fnc.util.BaseAction;
import com.opensymphony.xwork2.ActionContext;

public class PopAction extends BaseAction { 
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(BizAction.class);
	
	PopDao dao = new PopDao();
	FileDao fileDao = new FileDao();
	
	// 게시글 정보
	private PopVo resultVo;
	private List<PopVo> resultList; 
	private int cnt;
	private String resultCd;
	
	// 파일 정보
	private List<FileVo> fileVoList; // 첨부파일
	
	
	public PopVo getResultVo() {
		return resultVo;
	}

	public void setResultVo(PopVo resultVo) {
		this.resultVo = resultVo;
	}

	public List<PopVo> getResultList() {
		return resultList;
	}

	public void setResultList(List<PopVo> resultList) {
		this.resultList = resultList;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getResultCd() {
		return resultCd;
	}

	public void setResultCd(String resultCd) {
		this.resultCd = resultCd;
	}

	public List<FileVo> getFileVoList() {
		return fileVoList;
	}

	public void setFileVoList(List<FileVo> fileVoList) {
		this.fileVoList = fileVoList;
	}

	//실행
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	public String popList() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		return SUCCESS;
	}
	
	//팝업리스트
	public String getPopList() throws Exception {
		logger.debug("--------------------------팝업 목록 데이터 확인");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		this.cnt = dao.popListCnt(paramMap);
		this.resultList = dao.popList(paramMap);
		System.out.println("********* 리 스 트 ***********"+this.cnt);
		return SUCCESS;
	}
	
	//팝업등록 
	public String popRegiExcute() throws Exception {
		logger.debug("--------------------------등록 데이터 확인");
		HashMap<String, Object> paramMap = getMap();
		
		if (getMap() != null) {
			// 세션 값 세팅
			ActionContext context = ActionContext.getContext();
			Map<String, Object> session = (Map<String, Object>)context.getSession();
			AdminVo adminVo = (AdminVo) session.get("adminVo");
			paramMap.put("idCrtnPrsn", adminVo.getUserId());
			paramMap.put("ipAdmnPrsn", request.getRemoteAddr());
			
			// 이미지 저장
			HashMap<String, Object> fileMap = new HashMap<String, Object>();
			List<HashMap<String, String>> uploadMap = getImageMaps();	// 일반 파일 업로드
			
			fileMap.put("uploadList", uploadMap);
			fileMap.put("cntsFileDtil", getMap().get("cntsFileDtil"));  //대체텍스트
		
			// 이미지 키값 세팅
			HashMap<String, Object> fileResult = fileDao.insertFile(fileMap);
			paramMap.put("noAtchFileSral", fileResult.get("fileKey"));
			
			//일자포맷제거
			String dtBgen = (String) paramMap.get("dtBegn");
			String dtEnd = (String) paramMap.get("dtEnd");
			paramMap.put("dtBegn",dtBgen.replaceAll("-",""));
			paramMap.put("dtEnd" ,dtEnd.replaceAll("-",""));
			
			int cnt = dao.insertPop(paramMap);
			if(cnt > 0) {
					this.resultCd = "SUCCESS";
			}else{
				this.resultCd = "FALE";
			}
		}
		return SUCCESS;
	}
	
	//팝업 상세
	public String getPopDetail() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		logger.debug("--------------------------팝업 상세 데이터 확인");
		this.resultVo = dao.selectPop(paramMap);
		return SUCCESS;
	}
		
	//팝업 수정
	public String popModi() throws Exception { 
		logger.debug("--------------------------수정 데이터 확인");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		// 파일 공통 필요 세팅
		HashMap<String, Object> fileMap = new HashMap<String, Object>();
		fileMap.put("noAtchFileSral", paramMap.get("noAtchFileSral"));
		fileMap.put("cntsFileDtil", paramMap.get("cntsFileDtil"));
		logger.debug("### 파일수정 ### noAtchFileDtilSral : " + paramMap.get("noAtchFileDtilSral"));
		// 세션 값 세팅
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		AdminVo adminVo = (AdminVo) session.get("adminVo");
		paramMap.put("idRevPrsn", adminVo.getUserId());
			
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
				if (("N".equals(fileStatus[i]) && "".equals(noAtchFileDtilSral[i])) || "M".equals(fileStatus[i])) {
					updateList.add(fileStatus[i]);
					updateSeqList.add(noAtchFileDtilSral[i]);
					logger.debug("@@!!@@ updateList : " + updateList);
				} else if ("D".equals(fileStatus[i])) {
					deleteList.add(fileStatus[i]);
					deleteSeqList.add(noAtchFileDtilSral[i]);
				}
			}
			
			// 이미지 저장
			List<HashMap<String, String>> uploadMap = getProductFiles();	// 일반 파일 업로드
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
		
		//일자포맷제거
		String dtBgen = (String) paramMap.get("dtBegn");
		String dtEnd = (String) paramMap.get("dtEnd");
		paramMap.put("dtBegn",dtBgen.replaceAll("-",""));
		paramMap.put("dtEnd" ,dtEnd.replaceAll("-",""));
		
		dao.updatePop(paramMap);
		return SUCCESS;
	}
	
	//팝업 삭제
	public String deletePop() throws Exception {
		logger.debug("--------------------------삭제 데이터 확인");
		HashMap<String, Object> paramMap = getMap();
		
		dao.deletePop(paramMap);
		return SUCCESS;
	}

}
