package com.fnc.admin.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.admin.dao.AdmDao;
import com.fnc.admin.vo.AdmVo;
import com.fnc.common.vo.AdminVo;
import com.fnc.util.BaseAction;
import com.fnc.util.FormatDate;
import com.fnc.util.Sha512Util;
import com.fnc.util.StringManager;

public class AdmAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
    private static Logger logger = Logger.getLogger(AdmAction.class);
	
	// 객체 변수
	private List<AdmVo> resultList;	// 목록
	private AdmVo resultInfo;		// 정보
	private int cnt;				// 개수
	private String resultCd;		// 결과코드
	private String resultMsg;		// 결과메시지
	
	public List<AdmVo> getResultList() {
		return this.resultList;
	}
	
	public void setResultList(List<AdmVo> resultList) {
		this.resultList = resultList;
	}
	
	public AdmVo getResultInfo() {
		return resultInfo;
	}

	public void setResultInfo(AdmVo resultInfo) {
		this.resultInfo = resultInfo;
	}

	public int getCnt() {
		return this.cnt;
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

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	AdmDao dao = new AdmDao();
	
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 목록화면
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 목록
	 * @return
	 * @throws Exception
	 */
	public String listAjax() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		this.cnt = dao.selectAdmListCnt(paramMap);
		this.resultList = dao.selectAdmList(paramMap);
		
		return SUCCESS;
	}
	
	/**
	 * 등록화면
	 * @return
	 * @throws Exception
	 */
	public String regi() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 아이디 중복체크 
	 * @return
	 * @throws Exception
	 */
	public String idOverlapCheck() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		cnt = dao.selectAdmIdExist(paramMap);
		
		return SUCCESS;
		
	}
	
	/**
	 * 등록
	 * @return
	 * @throws Exception
	 */
	public String regiExcute() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		AdminVo adminVo = (AdminVo)session.get("adminVo");
		
		paramMap.put("noAdmnScrt", Sha512Util.getSha512(StringManager.chkNull(paramMap.get("noAdmnScrt"))));	// 비밀번호
		paramMap.put("dtBegnAtrt", StringManager.chkNull(paramMap.get("dtBegnAtrt")).replaceAll("-", ""));		// 접속시작일 
		paramMap.put("dtEndAtrt", StringManager.chkNull(paramMap.get("dtEndAtrt")).replaceAll("-", ""));		// 접속종료일
		paramMap.put("dtChgPwd", FormatDate.getYmdhms("yyyyMMdd"));												// 비밀번호 변경 일자
		paramMap.put("dtPlanChgPwd", FormatDate.getYmdByDay(FormatDate.getYmdhms("yyyyMMdd"), 180));			// 비밀번호 변경 예정 일자
		paramMap.put("idCrtnPrsn", adminVo.getUserId()); 														// 생성자
		paramMap.put("idRevPrsn", adminVo.getUserId());  														// 수정자
		paramMap.put("ipAdmnPrsn", request.getRemoteAddr()); 													// 접속 아이피
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int cnt = dao.insertAdm(paramMap);
		if(cnt > 0) {
			out.println("<script>alert('등록이 성공했습니다.'); location.href='/admin/admList.do';</script>");
			out.flush();
		} else { 
			out.println("<script>alert('등록이 실패했습니다.'); location.href='/admin/admList.do';</script>");
			out.flush();
		}
		
		return SUCCESS;
	}
	
	/** 
	 * 수정화면
	 * @return
	 * @throws Exception
	 */
	public String modi() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		this.resultInfo = dao.selectAdmInfo(paramMap);
		
		return SUCCESS;
	}
	
	/**
	 * 수정
	 * @return
	 * @throws Exception
	 */
	public String modiExcute() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		AdminVo adminVo = (AdminVo)session.get("adminVo");
		
		if(!"".equals(StringManager.chkNull(paramMap.get("noAdmnScrt")))) {			
			paramMap.put("noAdmnScrt", Sha512Util.getSha512(StringManager.chkNull(paramMap.get("noAdmnScrt"))));	// 비밀번호
			paramMap.put("dtChgPwd", FormatDate.getYmdhms("yyyyMMdd"));												// 비밀번호 변경 일자
			paramMap.put("dtPlanChgPwd", FormatDate.getYmdByDay(FormatDate.getYmdhms("yyyyMMdd"), 180));			// 비밀번호 변경 예정 일자
		}
		paramMap.put("dtBegnAtrt", StringManager.chkNull(paramMap.get("dtBegnAtrt")).replaceAll("-", ""));		// 접속시작일 
		paramMap.put("dtEndAtrt", StringManager.chkNull(paramMap.get("dtEndAtrt")).replaceAll("-", ""));		// 접속종료일
		paramMap.put("idRevPrsn", adminVo.getUserId());  														// 수정자
		paramMap.put("ipAdmnPrsn", request.getRemoteAddr()); 													// 접속 아이피
		
		int cnt = dao.updateAdm(paramMap);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(cnt > 0) {
			out.println("<script>alert('수정이 성공했습니다.'); location.href='/admin/admList.do';</script>");
			out.flush();
		} else {
			out.println("<script>alert('수정이 실패했습니다.'); location.href='/admin/admList.do';</script>");
			out.flush();
		}
		
		return SUCCESS;
	}
	
	/**
	 * 사용제한 복구
	 * @return
	 * @throws Exception
	 */
	public String useRecoveryAjax() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		int cnt = dao.updateAdmBynoteEror(paramMap);
		logger.debug("cnt:" + cnt);
		logger.debug(paramMap.get("idAdmnPrsn"));
		if(cnt > 0) {
			this.resultCd = "SUCCESS";
		} else {
			this.resultCd = "FALE";
		}
		
		return SUCCESS;
	}
	
	/**
	 * 삭제
	 * @return
	 * @throws Exception
	 */
	public String delAjax() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		
		int cnt = dao.deleteAdm(paramMap);
		if(cnt > 0) {
			this.resultCd = "SUCCESS";
		} else {
			this.resultCd = "FALE";
		}
		
		return SUCCESS;
	}

}


