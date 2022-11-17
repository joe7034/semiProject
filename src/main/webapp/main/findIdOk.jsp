<%@page import="kr.co.saladrgon.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>아이디 찾기결과</title>
</head>
<body>
 <%		
 		//파라미터값 가져오기
 		String name = request.getParameter("name");
 		String email = request.getParameter("email");
 		// dao
  		UsersDAO dao = new UsersDAO();
 		
 		String id = dao.findId(name, email);
 		
 %>
 
 	<form action="findId.jsp" name="findIdOk">
 		<%
 			if(id != null) {
 		%>
				<div class = "container">
					<div class = "found-success">
						<div class="found-id">회원님의 아이디는 : <%= id %> 입니다.</div>
					</div>
					<div class="found-login">
						<input type="submit" id="btnLogin" value="로그인"/>
					</div>
				</div> 				
 		<%
 			}else{
 		%>
 			<div class= "container">
 				<div class= "found-fail">
 					<h4>등록된 정보가 없습니다.</h4>
 				</div>
 				<div class = "found-login">
 					<input type="submit" id="btnback" value="다시찾기"/>
 					<a href="regist.jsp"><input type="button" id="regist" value="회원가입"/></a>
				</div>
 			</div>
 		<%
 			}
 			session.setAttribute("id", id);
 		%>
 	</form>
</body>
</html>