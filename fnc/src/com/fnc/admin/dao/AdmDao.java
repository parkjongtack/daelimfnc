package com.fnc.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.fnc.admin.vo.AdmVo;
import com.fnc.util.SqlReaderXml;

public class AdmDao {
	
	// private static Logger logger = Logger.getLogger(AdmDao.class);
	
	// 목록 개수
	public int selectAdmListCnt(HashMap<String, Object> paramMap) throws SQLException {      
		return (Integer)SqlReaderXml.getInstance().queryForObject("selectAdmListCnt", paramMap);
	}
		
	// 목록
	@SuppressWarnings("unchecked")
	public List<AdmVo> selectAdmList(HashMap<String, Object> paramMap) throws SQLException {      
		return SqlReaderXml.getInstance().queryForList("selectAdmList", paramMap);
	}
	
	// 정보
	public AdmVo selectAdmInfo(HashMap<String, Object> paramMap) throws SQLException {      
		return (AdmVo)SqlReaderXml.getInstance().queryForObject("selectAdmInfo", paramMap);
	}
	
	// ID 존재 확인
	public int selectAdmIdExist(HashMap<String, Object> paramMap) throws SQLException {      
		return (Integer)SqlReaderXml.getInstance().queryForObject("selectAdmIdExist", paramMap);
	}
	
	// 등록
	public int insertAdm(HashMap<String, Object> paramMap) throws SQLException {
		try {
			SqlReaderXml.getInstance().insert("insertAdm", paramMap);
			return 1;
		} catch(SQLException e) {
			return 0;
		}
	}
	
	// 수정
	public int updateAdm(HashMap<String, Object> paramMap) throws SQLException {
		return SqlReaderXml.getInstance().update("updateAdm", paramMap);
	}
	
	// 사용제한 복구
	public int updateAdmBynoteEror(HashMap<String, Object> paramMap) throws SQLException {
		return SqlReaderXml.getInstance().update("updateAdmBynoteEror", paramMap);
	}
		
	// 삭제
	public int deleteAdm(HashMap<String, Object> paramMap) throws SQLException {      
		return SqlReaderXml.getInstance().delete("deleteAdm", paramMap);
   }
}
