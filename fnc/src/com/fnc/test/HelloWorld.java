package com.fnc.test;

public class HelloWorld {
	
	private String msg;
	
	public String getMsg() {
		return msg;
	}
	
	public String execute() throws Exception {
		this.msg = "welcom to Struts2 World";
		
		return "success";
	}
}