package com.fnc.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.admin.vo.BizVo;
import com.fnc.util.SqlReaderXml;

public class BizDao {
	
	private static Logger logger = Logger.getLogger(CarDao.class);
	
	// 목록 개수
	public int selectBizListCnt(HashMap<String, Object> paramMap) throws SQLException {      
		return (Integer)SqlReaderXml.getInstance().queryForObject("admin.selectBizListCnt", paramMap);
	}
		
	// 목록
    @SuppressWarnings("unchecked")
    public List<BizVo> selectBizList(HashMap<String, Object> paramMap) throws SQLException {      
    	return SqlReaderXml.getInstance().queryForList("admin.selectBizList", paramMap);
    }
    
    // 파일 시퀀스 조회
 	public int insertBizFileSeq(HashMap<String, Object> parmaMap) throws SQLException {      
 		logger.info("######################################################");
 		int fileSeq = (int)SqlReaderXml.getInstance().update("admin.insertBizFileSeq", parmaMap);
 		logger.info("Dao fileSeq : " + fileSeq);
 		return fileSeq;
    }
 	
 	// 등록
 	public int insertBiz(HashMap<String, Object> parmaMap) throws SQLException { 
		return (int) SqlReaderXml.getInstance().update("admin.insertBiz", parmaMap);
 	}
 	
 	// 정보
 	public BizVo selectBizInfo(int noPrdtSral) throws SQLException {
 		return (BizVo)SqlReaderXml.getInstance().queryForObject("admin.selectBizInfo", noPrdtSral);
 	}
 	
  	
 	// 수정
 	public int updateBiz(HashMap<String, Object> paramMap) throws SQLException {
 		return SqlReaderXml.getInstance().update("admin.updateBiz", paramMap);
 	}
 		
 	// 삭제
 	public int deleteBiz(HashMap<String, Object> paramMap) throws SQLException {      
 		return SqlReaderXml.getInstance().update("admin.deleteBiz", paramMap);
    }

}
