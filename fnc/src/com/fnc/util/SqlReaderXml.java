package com.fnc.util;

import java.io.IOException;
import java.io.Reader;

import org.apache.log4j.Logger;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlReaderXml {

    private static Logger logger = Logger.getLogger(SqlReaderXml.class);

    private static final SqlMapClient sqlMap;

    static {
    	String configUrl = "sqlMapConfig.xml";

		try {
			Reader reader = Resources.getResourceAsReader(configUrl);
			sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		}
		catch (IOException e) {
			logger.error(e.getClass().getName() + " : " +  e.getMessage());
			throw new RuntimeException("Error initializing SqlMapObject : " + e.getMessage());
		}
		catch (Exception e) {
			logger.error(e.getClass().getName() + " : " +  e.getMessage());
			throw new RuntimeException("Error initializing SqlMapObject : " + e.getMessage());
		}
    }

    public static SqlMapClient getInstance() {
    	return sqlMap;
    }

}
