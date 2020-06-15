package com.fnc.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


import org.apache.log4j.Logger;

import com.fnc.admin.vo.PopVo;
import com.fnc.util.SqlReaderXml;

public class PopDao {
	
	private static Logger logger = Logger.getLogger(ComDao.class);
	
	// 팝업리스트
	@SuppressWarnings("unchecked")
	public List<PopVo> popList(HashMap<String, Object> paramMap) throws SQLException { 
		return SqlReaderXml.getInstance().queryForList("popList", paramMap);
	}
	
	// 팝업리스트 cnt
	public int popListCnt(HashMap<String, Object> paramMap) throws Exception {
		return (Integer)SqlReaderXml.getInstance().queryForObject("popListCnt", paramMap);
	}

	// 팝업 등록
	public int insertPop(HashMap<String, Object> paramMap) throws Exception {
		try {
			SqlReaderXml.getInstance().insert("insertPop", paramMap);
			return 1;
		} catch(SQLException e) {
			return 0;
		}	
	}
	
	// 팝업 상세
    public PopVo selectPop(HashMap<String, Object> paramMap) throws SQLException {      
		return (PopVo) SqlReaderXml.getInstance().queryForObject("selectPop", paramMap);
	}
	
	// 팝업 수정
	public void updatePop(HashMap<String, Object> paramMap) throws SQLException {
		Object result = SqlReaderXml.getInstance().update("updatePop", paramMap);
		logger.info("updatePop result -------------------------");
		logger.info(result);
	}
	
	// 팝업 삭제
	public int deletePop(HashMap<String, Object> paramMap) throws SQLException {      
		return SqlReaderXml.getInstance().update("deletePop", paramMap);
   }

}
