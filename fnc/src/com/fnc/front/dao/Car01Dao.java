package com.fnc.front.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.common.vo.FileVo;
import com.fnc.front.vo.Car01Vo;
import com.fnc.front.vo.Pr01Vo;
import com.fnc.util.SqlReaderXml;

public class Car01Dao {
	
	private static Logger logger = Logger.getLogger(Car01Dao.class);
	
	// 채용정보 목록 개수
	public int selectCar01ListCnt(HashMap<String, Object> paramMap) throws SQLException{
		return (Integer)SqlReaderXml.getInstance().queryForObject("selectCar01ListCnt", paramMap);
	}
	
	// 채용정보 목록 
	@SuppressWarnings("unchecked")
	public List<Car01Vo> selectCar01List(HashMap<String, Object> paramMap) throws SQLException{
		return SqlReaderXml.getInstance().queryForList("selectCar01List", paramMap);
	}
	
	// 채용정보 상세 
	public Car01Vo selectOne(HashMap<String, Object> paramMap) throws SQLException{
		return (Car01Vo) SqlReaderXml.getInstance().queryForObject("selectOne", paramMap);
	}

	// 이전 게시글
	public Car01Vo selectBfore(HashMap<String, Object> paramMap) throws SQLException {      
		//데이터베이스 연결 테스트
		return (Car01Vo)SqlReaderXml.getInstance().queryForObject("selectBfore", paramMap);
	}

	// 다음 게시글
	public Car01Vo selectNxt(HashMap<String, Object> paramMap) throws SQLException {      
		//데이터베이스 연결 테스트
		return (Car01Vo)SqlReaderXml.getInstance().queryForObject("selectNxt", paramMap);
	}

}

