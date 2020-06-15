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
		
		result = pr01Dao.selectPr01(noNtcPlteSral);
		this.thumbVoList= fileDao.selectFileList(result.getNoAtchFileThumSral());
		this.fileVoList= fileDao.selectFileList(result.getNoAtchFileSral());		
		
		this.searchCls = StringManager.chkNull(paramMap.get("searchCls"));
		this.searchCnts = StringManager.chkNull(paramMap.get("searchCnts"));
		
		pr01Vo.setNoNtcPlteSral(noNtcPlteSral);
		if (!"".equals(this.searchCls)) {
			pr01Vo.setSearchCls(this.searchCls);
		}

		if (!"".equals(this.searchCnts)) {
			pr01Vo.setSearchCnts(this.searchCnts);
		}
		logger.debug("fileVoList  ======================== " + fileVoList.size());

		prev = pr01Dao.selectPrev(pr01Vo);
		next = pr01Dao.selectNext(pr01Vo);

		return SUCCESS;
	}
}
