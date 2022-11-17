<%@page import="dao.UsersDAO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  	
		
		String id = request.getParameter("userid"); 
		String pwd = request.getParameter("userpw");
		String name = request.getParameter("username");
		String email = ""; 
		String email2 = request.getParameter("email2"); 
		if (email2 == null ){
			email = request.getParameter("email1")+'@'+request.getParameter("selectEmail"); 
		}else{
			email = request.getParameter("email1")+'@'+request.getParameter("email2");
		}
		String phone = request.getParameter("phone1")+'-'+request.getParameter("phone2")+'-'+request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String pfood = request.getParameter("pfood");
		String addrs = "";
		int useyn = 1; 
		String rgdate =""; 
		int buy = 0; 
		int point = 1000; 
		int grade = 1; 
		UsersVO vo = new UsersVO(id, pwd, name, email, phone, gender, pfood, addrs, useyn, rgdate, buy, point, grade); 
 		UsersDAO dao = new UsersDAO(); 
		dao.insertOne(vo);		
		dao.close(); 
		
		out.println("<h2>회원가입이 완료되었습니다</h2>"); 
		// 로그인 페이지로 가서 로그인함. 
	
	%>
</body>
</html>