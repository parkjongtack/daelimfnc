package com.fnc.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.admin.vo.BnnVo;
import com.fnc.util.SqlReaderXml;

public class BnnDao {

	private static Logger logger = Logger.getLogger(BnnDao.class);

	// 메인이미지 등록
	public void insertMainImg(HashMap<String, Object> paramMap) throws SQLException {
		Object result = SqlReaderXml.getInstance().insert("insertMainImg", paramMap);
	}

	public void deleteMainImg() throws SQLException {
		Object result = SqlReaderXml.getInstance().delete("deleteMainImg");
	}

	 // 메인이미지 조회
	public HashMap selectMainImg() throws SQLException{
		return (HashMap) SqlReaderXml.getInstance().queryForObject("selectMainImg");
	}


	// 테이블에 등록된 메인이미지 데이터의 개수(열) 카운터
	public int selectMainImgCnt() throws SQLException{
		int count = (int) SqlReaderXml.getInstance().queryForObject("selectMainImgCnt");
		return count;
	}

	// 메인이미지 정보 수정
	public void updateMainImg(HashMap<String, Object> paramMap) throws SQLException {
		Object result = SqlReaderXml.getInstance().update("updateMainImg", paramMap);
		logger.info("-----------------------------------updateCom result -------------------------");
		logger.info(result);
	}
}
