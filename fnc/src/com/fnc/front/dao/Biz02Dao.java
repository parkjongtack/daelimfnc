package com.fnc.front.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.fnc.front.vo.Biz02Vo;
import com.fnc.util.SqlReaderXml;

public class Biz02Dao {

    @SuppressWarnings("unchecked")
    public List<Biz02Vo> selectBiz02List(HashMap<String, Object> paramMap) throws SQLException {      
    	//데이터베이스 연결 테스트
    	return SqlReaderXml.getInstance().queryForList("front.selectBiz02List", paramMap);
    }
	
}
