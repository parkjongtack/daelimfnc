package com.fnc.front.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.fnc.admin.vo.BnnVo;
import com.fnc.admin.vo.PopVo;
import com.fnc.util.SqlReaderXml;

public class MainDao {


	/**
	 * 메인팝업 목록조회
	 * @return List<PopVo> 팝업 리스트
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<PopVo> selectMainPopList() throws SQLException{
		return SqlReaderXml.getInstance().queryForList("selectMainPop");
	}


	public HashMap<String, Object> selectMainBnnInfo() throws SQLException {
		return (HashMap<String, Object>) SqlReaderXml.getInstance().queryForObject("selectMainBnnInfo");
	}

}
