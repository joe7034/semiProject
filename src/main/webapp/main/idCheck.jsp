<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
	boolean result = true; 	
	if ( id != null ){
		UsersDAO dao = new UsersDAO(); 
		result = dao.isExists(id); 
		dao.close(); 
	}else {
		result = false; 
	} 
	out.println(result);
%>
