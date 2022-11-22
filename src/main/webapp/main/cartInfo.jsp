<%@page import="java.util.ArrayList"%>
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
		Object obj = session.getAttribute("wish"); // wish는 장바구니(담기)용 session
		if ( obj ==  null ){
			ArrayList<Integer> wish = new ArrayList<Integer>(); 
			session.setAttribute("wish", wish); 
			obj = session.getAttribute("wish");// 지금 담았으니 바로 get함
		}
		ArrayList<Integer> wish = (ArrayList<Integer>)obj; 
		out.println(wish); 
		String no = request.getParameter("pno");
		int pno = Integer.parseInt(no); 
		wish.add(pno);
		
		
		//response.sendRedirect("productDetail.jsp?pno="+pno); 
	%>

</body>
</html>