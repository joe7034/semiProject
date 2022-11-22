<%@page import="java.lang.ProcessBuilder.Redirect"%>
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
	
		CartDAO cao = new CartDAO(); 
		String[] cnoList = request.getParameterValues("chk");
		System.out.println(cnoList[0]); 
		for(String a : cnoList){
			if ( a != null){
				int cno = Integer.parseInt(a); 
				cao.deleteOne(cno); 
			} else {
				response.sendRedirect("cart1.jsp");
			}
		}
		response.sendRedirect("cart1.jsp");
	%>

</body>
</html>