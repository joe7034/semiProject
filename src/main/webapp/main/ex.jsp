<%@page import="vo.CartVO"%>
<%@page import="dao.CartDAO"%>
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
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  
		
		// 세션 아이디 가져오기 
		// 일단 임시로 aaaa9999 씀
		
		String id = "aaaa9999"; 
		int pno = 8; 
		CartDAO dao = new CartDAO();
		CartVO vo = dao.selectOne(id, pno);
		System.out.println(vo.getQty());

	
	%>

</body>
</html>