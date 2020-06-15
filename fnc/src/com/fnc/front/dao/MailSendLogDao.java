package com.fnc.front.dao;

import java.sql.SQLException;

import com.fnc.front.vo.MailSendLogVo;
import com.fnc.util.SqlReaderXml;

public class MailSendLogDao {
	
	// 등록
	public int insertMailSendLog(MailSendLogVo vo) throws SQLException {
		try {
			SqlReaderXml.getInstance().insert("insertMailSendLog", vo);
			return 1;
		} catch(SQLException e) {
			return 0;
		}
	}
}
