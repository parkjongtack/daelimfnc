package com.fnc.admin.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.fnc.admin.dao.ComDao2;
import com.fnc.admin.vo.AdmVo;
import com.fnc.admin.vo.ComVo2;
import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.AdminVo;
import com.fnc.common.vo.AdminVo2;
import com.fnc.common.vo.FileVo;
import com.fnc.util.BaseAction;
import com.fnc.util.StringManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
public class ComAction2 extends BaseAction {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(ComAction2.class);
	
	ComDao2 dao = new ComDao2();
	FileDao fileDao = new FileDao();
	
	// 게시글 정보
	private ComVo2 resultVo;	// 결과 값
	private List<ComVo2> resultList;
	private int cnt;
	
	// 파일 정보
	private List<FileVo> thumbVoList;	// 섬네일 파일
	private List<FileVo> fileVoList; // 첨부파일
	
	public ComVo2 getResultVo() {
		return resultVo;
	}

	public void setResultVo(ComVo2 resultVo) {
		this.resultVo = resultVo;
	}

	public List<ComVo2> getResultList() {
		return resultList;
	}

	public void setResultList(List<ComVo2> resultList) {
		this.resultList = resultList;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public List<FileVo> getThumbVoList() {
		return thumbVoList;
	}

	public void setThumbVoList(List<FileVo> thumbVoList) {
		this.thumbVoList = thumbVoList;
	}

	public List<FileVo> getFileVoList() {
		return fileVoList;
	}

	public void setFileVoList(List<FileVo> fileVoList) {
		this.fileVoList = fileVoList;
	}

	// 실행
	public String execute() throws Exception {		
		return "success";
	}
	
	public String list() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		this.resultList = dao.selectComList2(paramMap);
		return "success";
	}
	
	public String listAjax() throws Exception {
		logger.debug("--------------------------목록 검색 데이터 확인");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		this.cnt = dao.selectComListCnt2(paramMap);		
		this.resultList = dao.selectComList2(paramMap);
		
		return "success";
	}
	
	public String regi() throws Exception {
		return "success";
	}
	
	public String comRegiExcute() throws Exception {
		logger.debug("--------------------------등록 데이터 확인");
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
			List<HashMap<String, String>> thumbMap = getImageThumMaps();	// 섬네일 파일 업로드
			List<HashMap<String, String>> uploadMap = getImageMaps();	// 일반 파일 업로드
			
			fileMap.put("thumbList", thumbMap);
			fileMap.put("uploadList", uploadMap);
			fileMap.put("cntsFileDtil", getMap().get("cntsFileDtil"));
			
			// 이미지 키값 세팅
			HashMap<String, Object> fileResult = fileDao.insertFile(fileMap);
			paramMap.put("noAtchFileThumSral", fileResult.get("thumbKey"));
			paramMap.put("noAtchFileSral", fileResult.get("fileKey"));
			
			dao.insertCom(paramMap);
		}
		return "success";
	}
	
	public String modi() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		logger.debug("--------------------------회사정보 상세");
		this.resultVo = dao.selectCom(paramMap);
		this.thumbVoList= fileDao.selectFileList(resultVo.getNoAtchFileThumSral());
		this.fileVoList= fileDao.selectFileList(resultVo.getNoAtchFileSral());
		
		return "success";
	}
	
	public String comModiExcute2() throws Exception {
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
		paramMap.put("dtRgst", StringManager.chkNull(paramMap.get("dtRgst")).replaceAll("-", ""));	// 등록일
		
		//System.out.println(request.getParameter("sbjtNtcPlteEn"));
		
		paramMap.put("sbjtNtcPlteEn", request.getParameter("sbjtNtcPlteEn"));
		paramMap.put("cntsSmryEn", request.getParameter("cntsSmryEn"));
		paramMap.put("cntsNtcPlteEn", request.getParameter("cntsNtcPlteEn"));		
		
		// 섬네일 수정
		if ("Y".equals(paramMap.get("thumbYn").toString())) {
			// 이미지 저장
			List<HashMap<String, String>> thumbMap = getImageThumMaps();	// 섬네일 파일 확인용
			
			fileMap.put("thumbList", thumbMap);	// 섬네일 객체
			fileMap.put("cntsFileDtil", paramMap.get("cntsFileDtil"));	// 대체 텍스트
			fileMap.put("noAtchFileDtilSral", paramMap.get("noAtchFileThumSral"));	// 섬네일 일련번호
			
			// 이미지 키값 세팅
			HashMap<String, Object> fileResult = fileDao.updateThumbFile(fileMap);
			// paramMap.put("noAtchFileThumSral", fileResult.get("thumbKey"));
			
			
			fileMap.clear();	// 일반 파일 사용을 위한 초기화
		}
		
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
		
		
		dao.updateCom(paramMap);
		return SUCCESS;
	}	
	
	public String comModiExcute() throws Exception {
		logger.debug("--------------------------수정 데이터 확인");
		logger.debug(getMap());
		HashMap<String, Object> paramMap = getMap();
		
		HashMap<String, Object> fileMap = new HashMap<String, Object>();	// 이미지용 객체
		
		// 세션 값 세팅
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = (Map<String, Object>)context.getSession();
		AdminVo2 adminVo2 = (AdminVo2) session.get("adminVo");
		paramMap.put("idRevPrsn", adminVo2.getUserId());
		paramMap.put("ipAdmnPrsn", request.getRemoteAddr());
		paramMap.put("dtRgst", StringManager.chkNull(paramMap.get("dtRgst")).replaceAll("-", ""));	// 등록일
		
		System.out.println(request.getParameter("sbjtNtcPlteEn"));
		
		/*
		paramMap.put("sbjtNtcPlteEn", request.getParameter("sbjtNtcPlteEn"));
		paramMap.put("cntsSmryEn", request.getParameter("cntsSmryEn"));
		paramMap.put("cntsNtcPlteEn", request.getParameter("cntsNtcPlteEn"));		
		*/
		// 섬네일 수정
		if ("Y".equals(paramMap.get("thumbYn").toString())) {
			// 이미지 저장
			List<HashMap<String, String>> thumbMap = getImageThumMaps();	// 섬네일 파일 확인용
			
			fileMap.put("thumbList", thumbMap);	// 섬네일 객체
			fileMap.put("cntsFileDtil", paramMap.get("cntsFileDtil"));	// 대체 텍스트
			fileMap.put("noAtchFileDtilSral", paramMap.get("noAtchFileThumSral"));	// 섬네일 일련번호
			
			// 이미지 키값 세팅
			HashMap<String, Object> fileResult = fileDao.updateThumbFile(fileMap);
			// paramMap.put("noAtchFileThumSral", fileResult.get("thumbKey"));
			
			
			fileMap.clear();	// 일반 파일 사용을 위한 초기화
		}
		
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
		
		
		dao.updateCom(paramMap);
		return "success";
	}
	
	public String dele() throws Exception {
		logger.debug("--------------------------삭제 데이터 확인");
		HashMap<String, Object> paramMap = getMap();
		// resultVo.setNoNtcPlteSral(getMap().get("noNtcPlteSral").toString());
		dao.updateComYnElmn(paramMap);
		return "success";
	}

}