package com.fnc.front.action;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.FileVo;
import com.fnc.front.dao.Pr01Dao;
import com.fnc.front.vo.Pr01Vo;
import com.fnc.util.BaseAction;
import com.fnc.util.StringManager;

public class Pr01ViewAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Pr01ViewAction.class);
	
	Pr01Dao pr01Dao = new Pr01Dao();
	FileDao fileDao = new FileDao();

	private Pr01Vo result;
	private Pr01Vo prev;
	private Pr01Vo next;
	private String searchCls;
	private String searchCnts;
	private List<FileVo> thumbVoList;
	private List<FileVo> fileVoList;
	private String idx;
	private String idx_set;
	
	public String getIdx_set() {
		return idx_set;
	}

	public void setIdx_set(String idx_set) {
		this.idx_set = idx_set;
	}

	public List<FileVo> getFileVoList() {
		return fileVoList;
	}

	public void setFileVoList(List<FileVo> fileVoList) {
		this.fileVoList = fileVoList;
	}

	public Pr01Vo getResult() {
		return result;
	}

	public Pr01Vo getPrev() {
		return prev;
	}

	public Pr01Vo getNext() {
		return next;
	}

	public String execute() throws Exception {
		HashMap<String, Object> paramMap = getMap();
		Pr01Vo pr01Vo = new Pr01Vo();
		
		String noNtcPlteSral = StringManager.chkNull(paramMap.get("idx"));
		
		if(noNtcPlteSral == "" || noNtcPlteSral == null) {
			String noNtcPlteSral1 = StringManager.chkNull(paramMap.get("idx_set"));			
			result = pr01Dao.selectPr01(noNtcPlteSral1);
			
			pr01Vo.setNoNtcPlteSral(noNtcPlteSral1);

			this.idx = noNtcPlteSral1;
			this.idx_set = noNtcPlteSral1;
			
		} else {
			result = pr01Dao.selectPr01(noNtcPlteSral);			
			pr01Vo.setNoNtcPlteSral(noNtcPlteSral);
		}
		
		try {
			
			this.thumbVoList= fileDao.selectFileList(result.getNoAtchFileThumSral());			
			this.fileVoList= fileDao.selectFileList(result.getNoAtchFileSral());		
			
		}catch(NullPointerException e){

			
			
		}
		
		this.searchCls = StringManager.chkNull(paramMap.get("searchCls"));
		this.searchCnts = StringManager.chkNull(paramMap.get("searchCnts"));
		if (!"".equals(this.searchCls)) {
			pr01Vo.setSearchCls(this.searchCls);
		}

		if (!"".equals(this.searchCnts)) {
			pr01Vo.setSearchCnts(this.searchCnts);
		}
		
		//logger.debug("fileVoList  ======================== " + fileVoList.size());

		prev = pr01Dao.selectPrev(pr01Vo);
		next = pr01Dao.selectNext(pr01Vo);

		return SUCCESS;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}
}
