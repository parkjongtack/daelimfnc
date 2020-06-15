package com.fnc.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.admin.vo.CarVo;
import com.fnc.util.SqlReaderXml;

public class CarDao {
	
	private static Logger logger = Logger.getLogger(CarDao.class);
	
	// 채용정보 등록 INSERT
	public void insertCar(HashMap<String, Object> paramMap) throws SQLException{
		Object result = SqlReaderXml.getInstance().insert("admin.insertCar",paramMap);
		logger.info(result);
	}
	
	// 채용정보 목록 개수
	public int selectCarListCnt(HashMap<String, Object> paramMap) throws SQLException{
		return (Integer)SqlReaderXml.getInstance().queryForObject("admin.selectCarListCnt", paramMap);
	}
	
	// 채용정보 목록 
	@SuppressWarnings("unchecked")
	public List<CarVo> selectCarList(HashMap<String, Object> paramMap) throws SQLException{
		return SqlReaderXml.getInstance().queryForList("admin.selectCarList", paramMap);
	}
	
	// 채용정보 상세 
	public CarVo selectCar(HashMap<String, Object> paramMap) throws SQLException{
		return (CarVo) SqlReaderXml.getInstance().queryForObject("admin.selectCar", paramMap);
	}
	// 채용정보 삭제
	public void updateCar(HashMap<String, Object> paramMap) throws SQLException{
		Object result = SqlReaderXml.getInstance().update("admin.updateCar",paramMap);
		logger.info("updateCar result -------------------------");
		logger.info(result);
	}
	// 채용정보 삭제
	public void updateCarYnElmn(HashMap<String, Object> paramMap) throws SQLException{
		Object result = SqlReaderXml.getInstance().update("admin.updateCarYnElmn",paramMap);
		logger.info("updateComYnElmn result -------------------------");
		logger.info(result);
	}


}
