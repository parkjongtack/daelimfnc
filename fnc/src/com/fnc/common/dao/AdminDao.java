package com.fnc.common.dao;

import java.sql.SQLException;

import com.fnc.common.vo.AdminVo;
import com.fnc.util.SqlReaderXml;

public class AdminDao {
	
	public AdminVo selectAdminInfo(AdminVo adminVo) throws SQLException {      
		return (AdminVo) SqlReaderXml.getInstance().queryForObject("selectAdminInfo", adminVo);
	}
    
	public AdminVo selectAdminInfoChk(String userId) throws SQLException {      
    	return (AdminVo) SqlReaderXml.getInstance().queryForObject("selectAdminInfoChk", userId);
    }
	
	public int updateLoginFailCnt(String userId) throws SQLException {      
		return SqlReaderXml.getInstance().update("updateLoginFailCnt", userId);
	}
	
	public int updateLoginLock(String userId) throws SQLException {      
		return SqlReaderXml.getInstance().update("updateLoginLock", userId);
	}
	
	public int updatePwdChange(AdminVo adminVo) throws SQLException {      
		return SqlReaderXml.getInstance().update("updatePwdChange", adminVo);
	}
	
	public int updateAccountInfoAjax(AdminVo adminVo) throws SQLException {      
		return SqlReaderXml.getInstance().update("updateAccountInfoAjax", adminVo);
	}
	
}
