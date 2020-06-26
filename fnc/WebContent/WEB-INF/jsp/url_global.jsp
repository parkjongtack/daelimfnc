
<%@page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf8"%>
<%
                	//out.println(request.getParameter("request_locale"));
	    			String request_locale = request.getParameter("request_locale");
	    			String name = request.getParameter("request_locale")==null?"":request.getParameter("request_locale");  
                	if(request_locale == null){
                		request_locale = "ko";
                	}
                	
                	//session.setAttribute("request_locale", request_locale);
                	out.println(request_locale);
                %>