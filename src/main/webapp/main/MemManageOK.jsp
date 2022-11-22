<%@page import="vo.UsersVO"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String grade1 = request.getParameter("grade");
		int grade = Integer.parseInt(grade1);
		
		UsersDAO dao = new UsersDAO();
		UsersVO vo = new UsersVO();
		
		vo.setGrade(grade);
		vo.setId(id);
		
	/* 	out.println(vo.getId());
		out.println(vo.getGrade()); */
		
		dao.updateOne(vo);
		
		response.sendRedirect("MemManage.jsp");
	
	%>
</body>
</html>