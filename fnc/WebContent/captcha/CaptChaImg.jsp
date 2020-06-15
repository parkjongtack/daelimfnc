<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.fnc.util.CaptCha"%>
<%
    new CaptCha().getCaptCha(request, response); 
%>