<%@page import="vo.ProductsVO"%>
<%@page import="dao.ProductsDAO"%>
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
	String pno1 = request.getParameter("pno");
	String nowstock1 = request.getParameter("nowstock");
	String addstock1 = request.getParameter("addstock");
	int pno = Integer.parseInt(pno1);
	int nowstock = Integer.parseInt(nowstock1);
	int addstock = Integer.parseInt(addstock1);
	int stock = nowstock+addstock;
	
	ProductsDAO dao = new ProductsDAO();
	ProductsVO vo = new ProductsVO();
	
	vo.setPno(pno);
	vo.setStock(stock);
	
	dao.updateOne(vo);
	response.sendRedirect("StockManage.jsp");
	
	%>
</body>
</html>