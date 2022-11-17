<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	/*  LocalDate now = LocalDate.now();
	 
     // 포맷 정의
     DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");

     // 포맷 적용
     String formatedNow = now.format(formatter);

     // 결과 출력
     System.out.println(formatedNow);  // 21/06/17 */
	
	int sell=0;
	String pdate = null;
	String pno1 = request.getParameter("pno");
	String pname = request.getParameter("pname");
	String ctgno1 = request.getParameter("ctgno");
	String kcal1 = request.getParameter("kcal");
	String price1 = request.getParameter("price");
	String cost1 = request.getParameter("cost");
	String discount1 = request.getParameter("discount");
	String stock1 = request.getParameter("stock");
	String pcontent = request.getParameter("pcontent");
	String img = request.getParameter("img");
	
	int pno = Integer.parseInt(pno1);
	int ctgno = Integer.parseInt(ctgno1);
	int kcal = Integer.parseInt(kcal1);
	int price = Integer.parseInt(price1);
	int cost = Integer.parseInt(cost1);
	int discount = Integer.parseInt(discount1);
	int stock = Integer.parseInt(stock1);
	
	
	ProductsDAO dao = new ProductsDAO();
	
	ProductsVO vo = new ProductsVO(pno, kcal, price, cost, discount, ctgno, sell, stock, pname, pcontent,
			img, pdate);
	dao.insertOne(vo);
	
	response.sendRedirect("ItemService.jsp");
	%>
</body>
</html>