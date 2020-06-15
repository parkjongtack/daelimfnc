package com.fnc.front.action;

import org.apache.log4j.Logger;

import com.fnc.util.BaseAction;

public class Sus01Action extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Sus01Action.class);

	private String menu01;
	private String menu02;
	
	public String getMenu01() {
		return menu01;
	}
	public String getMenu02() {
		return menu02;
	}

	public String execute() throws Exception {

		return "success";
	}
}
