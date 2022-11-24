<%@page import="dao.UsersDAO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	#rgok{
		margin: 100px auto;
		width: 800px; 
		height: 150px;
		text-align: center;
		padding-top: 50px;
		border: 1px solid lightgrey;
		border-radius: 3px;
		background: #9e9e9e05;
		color: #697276;
	}
	.rga {
		text-decoration: none;
		color: #717171;
		margin: 5%;
		font-size: 14px;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  	
		
		String id = request.getParameter("userid"); 
		String pwd = request.getParameter("userpw");
		String name = request.getParameter("username");
		String email = ""; 
		String email2 = request.getParameter("email2"); 
		if (email2 == null ){
			email = request.getParameter("email1")+'@'+request.getParameter("selectEmail"); 
		}else{
			email = request.getParameter("email1")+'@'+request.getParameter("email2");
		}
		String phone = request.getParameter("phone1")+'-'+request.getParameter("phone2")+'-'+request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String pfood = request.getParameter("pfood");
		String addrs = "";
		int useyn = 1; 
		String rgdate =""; 
		int buy = 0; 
		int point = 1000; 
		int grade = 1; 
		out.println(id); 
		UsersVO vo = new UsersVO(id, pwd, name, email, phone, gender, pfood, addrs, useyn, rgdate, buy, point, grade); 
 		UsersDAO dao = new UsersDAO(); 
		dao.insertOne(vo);		
		dao.close(); 

		// 로그인 페이지로 가서 로그인함. 
	%>
	<div id="rgok"> 
		<div id="divrg1">
			<span style="font-size: 30px; font-weight: bold;">가입을 축하드립니다! 회원가입이 완료되셨습니다</span>
			<span></span>
		</div>
		<div id="divrg2">
			<span style="font-size: 20px;">드래곤페이 1000포인트가 지급되었습니다</span>
		</div>
		<div id="divrg3" style="margin-top: 30px;">
		<a href="login.jsp" class="rga" >로그인</a>&nbsp;/&nbsp;
		<a href="main.jsp" class="rga">메인페이지</a>
		</div>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>