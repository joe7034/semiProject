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
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addrs = request.getParameter("addrs");
		String id = request.getParameter("id");
		
		UsersDAO dao = new UsersDAO();
		UsersVO vo = new UsersVO();
		
		vo.setEmail(email);
		vo.setPhone(phone);
		vo.setAddrs(addrs);
		vo.setId(id);
		
	/* 	out.println(vo.getId());
		out.println(vo.getGrade()); */
		
		dao.updateOne_mem(vo); 
		response.sendRedirect("Mypage_mem.jsp");
	
	%>
</body>
</html>