package com.fnc.front.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.front.dao.Pers01Dao;
import com.fnc.front.vo.Pers01Vo;
import com.fnc.util.SqlReaderXml;

public class Pers01Dao {
	private static Logger logger = Logger.getLogger(Pers01Dao.class);
		
	// 개인정보 목록 개수
	public int selectPersListCnt(HashMap<String, Object> paramMap) throws SQLException{
		return (Integer)SqlReaderXml.getInstance().queryForObject("selectPersListCnt", paramMap);
	}
	
	// 개인정보 목록 
	@SuppressWarnings("unchecked")
	public List<Pers01Vo> selectPersList(HashMap<String, Object> paramMap) throws SQLException{
		return SqlReaderXml.getInstance().queryForList("selectPersList", paramMap);
	}
	
	// 개인정보 상세 
	public Pers01Vo selectPers(HashMap<String, Object> paramMap) throws SQLException{
		return (Pers01Vo) SqlReaderXml.getInstance().queryForObject("selectPers", paramMap);
	}
}