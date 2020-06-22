package com.fnc.admin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.admin.dao.BizDao;
import com.fnc.admin.vo.BizVo;
import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.AdminVo;
import com.fnc.common.vo.FileVo;
import com.fnc.util.BaseAction;
import com.fnc.util.StringManager;
import com.opensymphony.xwork2.ActionContext;	
public class BizAction2 extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(BizAction2.class);
	
	BizDao dao = new BizDao();
	FileDao fileDao = new FileDao();
	
	//객체 변수
	private List<BizVo> resultList;
	private BizVo resultVo;
	private int cnt;
	private String resultCd;
	private List<FileVo> fileVoList; // 첨부파일

	public BizVo getResultVo() {
		return resultVo;
	}
	public void setResultVo(BizVo resultVo) {
		this.resultVo = resultVo;
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
	public List<BizVo> getResultList() {
		return resultList;
	}
	public void setResultList(List<BizVo> resultList) {
		this.resultList = resultList;
	}
	public int noPrdtSral;
	
	public int getNoPrdtSral() {
		return noPrdtSral;
	}
	public void setNoPrdtSral(int noPrdtSral) {
		this.noPrdtSral = noPrdtSral;
	}
	public List<FileVo> getFileVoList() {
		return fileVoList;
	}
	public void setFileVoList(List<FileVo> fileVoList) {
		this.fileVoList = fileVoList;
	}

	public String execute() throws Exception {
		return "success";
	}
	
	public String regi() throws Exception {
		return "success";
	}
	
	public String list() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		this.resultList = dao.selectBizList(paramMap);
		
		return "success";
	}
	
	public String listAjax() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		this.cnt = dao.selectBizListCnt(paramMap);
		this.resultList = dao.selectBizList(paramMap);
		
		return SUCCESS;
	}
	
	/**
	 *제품등록 
	 */
	public String bizRegiExcute() throws Exception{
		HashMap<String, Object> paramMap = getMap();
		
		if (getMap() != null) {
			// 세션 값 세팅
			ActionContext context = ActionContext.getContext();
			Map<String, Object> session = (Map<String, Object>)context.getSession();
			AdminVo adminVo = (AdminVo) session.get("adminVo");
			paramMap.put("idCrtnPrsn", adminVo.getUserId());
			paramMap.put("ipAdmnPrsn", request.getRemoteAddr());
			paramMap.put("dtRgst", StringManager.chkNull(paramMap.get("dtRgst")).replaceAll("-", "").replaceAll("/", ""));	// 등록일   20200424
			// 이미지 저장
			HashMap<String, Object> fileMap = new HashMap<String, Object>();
			List<HashMap<String, String>> uploadMap = getProductFiles();	// 일반 파일 업로드
			
			fileMap.put("uploadList", uploadMap);
			fileMap.put("cntsFileDtil", "");
			fileMap.put("clFile", paramMap.get("clFile"));
			
			// 이미지 키값 세팅
			HashMap<String, Object> fileResult = fileDao.insertFile(fileMap);
			paramMap.put("noAtchFileSral", fileResult.get("fileKey"));
			
			dao.insertBiz(paramMap);
		}
		return SUCCESS;
	}
	
	/**
	 * 수정화면
	 */
	public String modi() throws Exception {
		int noPrdtSral = this.noPrdtSral; 
		resultVo = dao.selectBizInfo(noPrdtSral);
		this.fileVoList= fileDao.selectFileList(resultVo.getNoAtchFileSral());
		logger.debug("### resultVo.getNmPdCt(); ###" + resultVo.getNmPdCt());

		return SUCCESS;
	}
	
	/**
	 * 제품 수정
	 */
	public String modiExcute() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		HashMap<String, Object> fileMap = new HashMap<String, Object>();	// 이미지용 객체
		
		// 세션 값 세팅
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		AdminVo adminVo = (AdminVo) session.get("adminVo");
		paramMap.put("idRevPrsn", adminVo.getUserId());
		paramMap.put("ipAdmnPrsn", request.getRemoteAddr());
		paramMap.put("dtRgst", StringManager.chkNull(paramMap.get("dtRgst")).replaceAll("-", ""));	// 등록일
		
		// 파일 수정
		if (paramMap.get("noAtchFileSral") != null && !"".equals(paramMap.get("noAtchFileSral"))) {
			// 파일 시퀀스가 있다면 - 파일이 하나라도 있다면 수정
			HashMap<String, String[]> paramMaps = getMaps();
			logger.debug("파일 수정");
			String[] fileStatus = paramMaps.get("fileStatus");
			String[] noAtchFileDtilSral = paramMaps.get("noAtchFileDtilSral");
			String[] clFile = paramMaps.get("clFile");
			
			List<String> clFileList = new ArrayList<String>();
			List<String> updateList = new ArrayList<String>();
			List<String> deleteList = new ArrayList<String>();
			List<String> updateSeqList = new ArrayList<String>();
			List<String> deleteSeqList = new ArrayList<String>();
			
			// 신규or수정 , 삭제 분리
			for (int i = 0; i < fileStatus.length; i++) {
				if (("N".equals(fileStatus[i]) && "".equals(noAtchFileDtilSral[i])) || "M".equals(fileStatus[i])) {
					clFileList.add(clFile[i]);
					updateList.add(fileStatus[i]);
					updateSeqList.add(noAtchFileDtilSral[i]);
				} else if ("D".equals(fileStatus[i])) {
					deleteList.add(fileStatus[i]);
					deleteSeqList.add(noAtchFileDtilSral[i]);
				}
			}
			
			// 이미지 저장
			List<HashMap<String, String>> uploadMap = getProductFiles();	// 일반 파일 업로드
			fileMap.put("noAtchFileSral", paramMap.get("noAtchFileSral"));
			fileMap.put("clFileList", clFileList);
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
		
		dao.updateBiz(paramMap);

		return SUCCESS;
	}
	
	/**
	 * 삭제
	 */
	public String delAjax() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		int cnt = dao.deleteBiz(paramMap);
		this.resultList = dao.selectBizList(paramMap);
		if(cnt > 0) {
			this.resultCd = "SUCCESS";
		} else {
			this.resultCd = "FALE";
		}
		
		return SUCCESS;
	}

	
	
}