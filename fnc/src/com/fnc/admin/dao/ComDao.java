package com.fnc.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.common.action.LoginAction;
import com.fnc.admin.vo.ComVo;
import com.fnc.front.vo.Biz01Vo;
import com.fnc.util.SqlReaderXml;

public class ComDao {
	

	private static Logger logger = Logger.getLogger(ComDao.class);
	
	// 회사정보 목록
	@SuppressWarnings("unchecked")
    public List<ComVo> selectComList(HashMap<String, Object> paramMap) throws SQLException {      
		return SqlReaderXml.getInstance().queryForList("selectComList", paramMap);
	}
	
	// 회사정보 목록 개수
	public int selectComListCnt(HashMap<String, Object> paramMap) throws SQLException {      
		return (Integer)SqlReaderXml.getInstance().queryForObject("selectComListCnt", paramMap);
	}
	
	// 회사정보 상세
    public ComVo selectCom(HashMap<String, Object> paramMap) throws SQLException {      
		return (ComVo) SqlReaderXml.getInstance().queryForObject("selectCom", paramMap);
	}
	
	// 회사정보 등록
	public void insertCom(HashMap<String, Object> paramMap) throws SQLException {
		Object result = SqlReaderXml.getInstance().insert("insertCom", paramMap);
		logger.info(result);
	}
	
	// 회사정보 수정
	public void updateCom(HashMap<String, Object> paramMap) throws SQLException {
		Object result = SqlReaderXml.getInstance().update("updateCom", paramMap);
		logger.info("updateCom result -------------------------");
		logger.info(result);
	}
	
	// 회사정보 삭제
	public void updateComYnElmn(HashMap<String, Object> paramMap) throws SQLException {
		Object result = SqlReaderXml.getInstance().update("updateComYnElmn", paramMap);
		logger.info("updateComYnElmn result -------------------------");
		logger.info(result);
	}
}
