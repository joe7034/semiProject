<%@page import="dao.ProductsDAO"%>
<%@page import="vo.ProductsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
	border-top: 1px solid rgb(185, 185, 185);
	border-bottom: 1px solid rgb(185, 185, 185);
	padding: 10px;
	margin: 10px 0px;
}

td {
	border-bottom: 1px solid rgb(185, 185, 185);
	padding: 10px;
	margin: 10px 0px;
}

#a {
	padding-right: 500px;
}

#b {
	padding-right: 240px;
}

input {
	text-align: center;
}

div {
	text-align: center;
}

input {
	display: inline-block;
}
</style>
</head>
<body>
	<h1>장바구니</h1>

	<table>
		<tr>
			<th id="a">상품정보</th>
			<th id="b">수량</th>
			<th id="b">주문금액</th>
			<th id="b">할인정보</th>
		</tr>

		<%
			ProductsDAO dao =new ProductsDAO();
			ArrayList<ProductsVO> list = dao.selectAll();
			for(ProductsVO vo:list){
			
		%>

		<tr>
			<td><%=vo.getPname() %></td>
			<td>1</td>
			<td><%=vo.getPrice()%></td>
			<td><%=vo.getDiscount()%></td>
		</tr>
		<%
			}
		%>
		<input type="button" value="선택상품삭제">
		<input type="button" value="전체상품삭제">


	</table>
	<div>
		<input type="button" value="주문하기"><br> <input
			type="button" value="계속쇼핑하기">
	</div>
</body>
</html>