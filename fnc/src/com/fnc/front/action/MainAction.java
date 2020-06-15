package com.fnc.front.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Globals;
import org.apache.log4j.Logger;

import com.fnc.front.dao.MainDao;
import com.fnc.util.BaseAction;

public class MainAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(MainAction.class);

	private static MainDao mainDao = new MainDao();

	public String execute() throws Exception {
		
		logger.debug("### MainAction..!! ###");
		request.setAttribute("popList", mainDao.selectMainPopList());
		request.setAttribute("bnnInfo", mainDao.selectMainBnnInfo());
		return SUCCESS;
	}

}
