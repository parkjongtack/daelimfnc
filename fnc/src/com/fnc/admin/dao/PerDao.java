package com.fnc.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.admin.vo.PerVo;
import com.fnc.util.SqlReaderXml;

public class PerDao {
	private static Logger logger = Logger.getLogger(PerDao.class);
	
	// 개인정보 등록 INSERT
	public void insertPer(HashMap<String, Object> paramMap) throws SQLException{
		Object result = SqlReaderXml.getInstance().insert("admin.insertPer",paramMap);
		logger.info(result);
	}
	
	// 개인정보 목록 개수
	public int selectPerListCnt(HashMap<String, Object> paramMap) throws SQLException{
		return (Integer)SqlReaderXml.getInstance().queryForObject("admin.selectPerListCnt", paramMap);
	}
	
	// 개인정보 목록 
	@SuppressWarnings("unchecked")
	public List<PerVo> selectPerList(HashMap<String, Object> paramMap) throws SQLException{
		return SqlReaderXml.getInstance().queryForList("admin.selectPerList", paramMap);
	}
	
	// 개인정보 상세 
	public PerVo selectPer(HashMap<String, Object> paramMap) throws SQLException{
		return (PerVo) SqlReaderXml.getInstance().queryForObject("admin.selectPer", paramMap);
	}
	// 개인정보 삭제
	public void updatePer(HashMap<String, Object> paramMap) throws SQLException{
		Object result = SqlReaderXml.getInstance().update("admin.updatePer",paramMap);
		logger.info("updatePer result -------------------------");
		logger.info(result);
	}
	// 개인정보 삭제
	public void updatePerYnElmn(HashMap<String, Object> paramMap) throws SQLException{
		Object result = SqlReaderXml.getInstance().update("admin.updatePerYnElmn",paramMap);
		logger.info("updatePerYnElmn result -------------------------");
		logger.info(result);
	}


}

