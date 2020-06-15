package com.fnc.front.action;

public class Com01Action {
	private String menu01;
	private String menu02;
	
	public String getMenu01() {
		return menu01;
	}
	public String getMenu02() {
		return menu02;
	}
	public String execute() throws Exception {
		this.menu01 = "1";
		this.menu02 = "1";
		return "success";
	}
}
