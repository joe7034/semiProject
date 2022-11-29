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
		if(cnoList == null) {
			System.out.println("aaaaa");
			response.sendRedirect("cart1.jsp");
		} else {
			for(String a : cnoList){
				if ( a != null){
					int cno = Integer.parseInt(a); 
					cao.deleteOne(cno); 
				} 
			}
			response.sendRedirect("cart1.jsp");
		}
		
		
	%>

</body>
</html>