package com.fnc.common.dao;

import java.sql.SQLException;

import com.fnc.common.vo.AdminVo2;
import com.fnc.util.SqlReaderXml;

public class AdminDao2 {
	
	public AdminVo2 selectAdminInfo(AdminVo2 adminVo) throws SQLException {      
		return (AdminVo2) SqlReaderXml.getInstance().queryForObject("selectAdminInfo", adminVo);
	}
    
	public AdminVo2 selectAdminInfoChk(String userId) throws SQLException {      
    	return (AdminVo2) SqlReaderXml.getInstance().queryForObject("selectAdminInfoChk", userId);
    }
	
	public int updateLoginFailCnt(String userId) throws SQLException {      
		return SqlReaderXml.getInstance().update("updateLoginFailCnt", userId);
	}
	
	public int updateLoginLock(String userId) throws SQLException {      
		return SqlReaderXml.getInstance().update("updateLoginLock", userId);
	}
	
	public int updatePwdChange(AdminVo2 adminVo) throws SQLException {      
		return SqlReaderXml.getInstance().update("updatePwdChange", adminVo);
	}
	
	public int updateAccountInfoAjax(AdminVo2 adminVo) throws SQLException {      
		return SqlReaderXml.getInstance().update("updateAccountInfoAjax", adminVo);
	}
	
}
