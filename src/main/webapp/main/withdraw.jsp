<%@page import="dao.UsersDAO"%>
<%@page import="vo.UsersVO"%>

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
	
		Object obj = session.getAttribute("vo");     
		if(obj!=null){            /* 로그인되면 세션에넣은 vo값보여주기 아니면 로그인창다시보여주기 */
			UsersVO vo = (UsersVO)obj;
			String.valueOf(vo.getId());
			
			
				UsersDAO dao = new UsersDAO();
				UsersVO vo2 = new UsersVO();
				vo2.setId(vo.getId());
				dao.deleteOne(vo2);
				response.sendRedirect("main.jsp");
				%>
	alert("회원탈퇴가 완료되었습니다.");
	<%	
			
				
				
			
		}
		
	%>
</body>
</html>