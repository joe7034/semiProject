<%@page import="vo.UsersVO"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/main.css" />
<title>로그인 결과</title>
<body>
<%
	// 파라미터 값 가져오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// dao
	UsersDAO dao = new UsersDAO();
	// vo
	UsersVO vo = dao.isExists(id, pwd);
	
	if(vo == null) {
		// 로그인실패
%>
<script>
	alert("아이디 및 패스워드가 올바르지 않습니다.");
	history.go(-1);
</script>
<%
	}else{
		// 로그인성공
		response.sendRedirect("main.jsp");
	}
	session.setAttribute("vo", vo);
	
%>
	

<%

%>		
</body>
</html>





   