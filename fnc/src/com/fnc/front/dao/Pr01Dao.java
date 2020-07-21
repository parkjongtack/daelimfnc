package com.fnc.front.dao;

import java.sql.SQLException;
import java.util.List;

import com.fnc.front.vo.Pr01Vo;
import com.fnc.util.SqlReaderXml;

public class Pr01Dao {
	// 단일 객체
	public Pr01Vo selectPr01(String noNtcPlteSral) throws SQLException {      
		//데이터베이스 연결 테스트
		return (Pr01Vo) SqlReaderXml.getInstance().queryForObject("selectPr01", noNtcPlteSral);
	}
	
	public Pr01Vo selectPr01_2(String noNtcPlteSral1) throws SQLException {      
		//데이터베이스 연결 테스트
		return (Pr01Vo) SqlReaderXml.getInstance().queryForObject("selectPr01_2", noNtcPlteSral1);
	}	

	
	// 리스트 객체
	public int selectPr01ListCnt(Pr01Vo pr01Vo) throws SQLException {      
		//데이터베이스 연결 테스트
		return (int)SqlReaderXml.getInstance().queryForObject("selectPr01ListCnt", pr01Vo);
	}
	
	// 리스트 객체
	@SuppressWarnings("unchecked")
	public List<Pr01Vo> selectPr01List(Pr01Vo pr01Vo) throws SQLException {      
		//데이터베이스 연결 테스트
		return SqlReaderXml.getInstance().queryForList("selectPr01List", pr01Vo);
	}
	   
	// 이전 게시글
	public Pr01Vo selectPrev(Pr01Vo Pr01Vo) throws SQLException {      
		//데이터베이스 연결 테스트
		return (Pr01Vo)SqlReaderXml.getInstance().queryForObject("selectPrev", Pr01Vo);
	}
	
	// 다음 게시글
	public Pr01Vo selectNext(Pr01Vo Pr01Vo) throws SQLException {      
		//데이터베이스 연결 테스트
		return (Pr01Vo)SqlReaderXml.getInstance().queryForObject("selectNext", Pr01Vo);
	}
}
