package com.fnc.front.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.fnc.front.vo.Biz01Vo;
import com.fnc.util.SqlReaderXml;
import com.opensymphony.xwork2.util.logging.Logger;

public class Biz01Dao {

   /*// 단일 객체
	public Biz01Vo selectBiz01() throws SQLException {      
   	//데이터베이스 연결 테스트
   	return (Biz01Vo) SqlReaderXml.getInstance().queryForObject("front.selectBiz01");
   }
   
	// 리스트 객체
   @SuppressWarnings("unchecked")
   public List<Biz01Vo> selectBiz01List() throws SQLException {      
   	//데이터베이스 연결 테스트
   	return SqlReaderXml.getInstance().queryForList("front.selectBiz01List");
   }*/
   
	// 목록
    @SuppressWarnings("unchecked")
    public List<Biz01Vo> selectList(HashMap<String, Object> paramMap) throws SQLException {
    	
    	
    	return SqlReaderXml.getInstance().queryForList("front.selectBiz01List", paramMap);
    }
   
   
}
