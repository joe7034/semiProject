<%@page import="vo.ProductsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>검색결과</title>
<meta name="viewport" content="width=device=width, initial=scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style type="text/css">
#pimg {
	width: 130px;
	height: 130px;
}

a {
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
	<%@ include file="header.jsp"%>

	<div style="padding: 180px;">
		<h2>검색결과</h2>
		<%
		  String search1 = request.getParameter("search");
		  String search = "%"+search1+"%";
		  ProductsDAO dao = new ProductsDAO();
		  ArrayList<ProductsVO> list = dao.selectSearch(search);
		  if(list.isEmpty()){
			  
		  
					
		%>
		<h3>검색결과가 없습니다.</h3>
		<% 				
		  }else{
		%>
		<% 
		for (ProductsVO vo : list) {
			  
		  
					
		%>
		<table class="table table-sm">
			<td><a href="productDetail.jsp?pno=<%=vo.getPno()%>"> <img
					id="pimg" style="float: left;"
					src="../images/ctgImg/<%=vo.getImg()%> " alt="" />
					<div style="font-size: 16pt; , font-weight: bold; , float: left;"><%=vo.getPname() %>
					</div>
			</a>
				<div style="font-size: 13pt; , float: left;">
					가격:<%=vo.getPrice() %>
				</div></td>
			</tr>
		</table>
		<%
		  }
		  }
		%>
	</div>
	<%@ include file="footer.jsp"%>








</body>
</html>