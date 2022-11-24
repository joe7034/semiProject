<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>비밀번호 찾기결과</title>
<style>
    @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
	    cellpadding= 0; 
	    cellspacing= 0; 
	    marginleft= 0; 
	    margintop= 0;
	    align= center;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto;
        float: none;
        margin-bottom: 10px;
	}

    #btn-Yes{
        background-color: green;
        border: none;
    }
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .checkbox{
        margin-right: 20px;
        text-align: right;
    }
    .title{
		text-align : center;
		margin : 30px auto;
		margin-top : 30px;
		width : 300px;
    }


    a{ 
    	color: #f58b34; text-decoration: none; 
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
</style>
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
 	
 	<div class="card align-middle" style="width:25rem;">
		<div class="title">
            
			<a href="main.jsp"><img alt="" src="../images/logo.jpg" class="title"></a>
			<br />
		</div>
        
 		<%
 			if(id != null) {
 		%>
				<div class = "container">
					<div class = "found-success">
						<div class="found-pwd">회원님의 아이디는 : <%= id %> 입니다.</div>
					</div>
					<br />
					<br />
					<br />
					<br />
					<br />
				</div> 				
 		<%
 			}else{
 		%>
 			<div class= "container">
 				<div class= "found-fail">
 					<h4>회원정보가 잘못되었습니다.</h4>
 				</div>
 				<div class = "found-login">
 					<input type="submit" id="btnback" value="다시찾기"/>
 					<a href="register.jsp"><input type="button" id="regist" value="회원가입"/></a>
				</div>
 			</div>
 		<%
 			}
 		%>
 	</form>
		
        <div class="links">
            <a href="findPw.jsp">비밀번호 찾기</a> | <a href="login.jsp">로그인</a> | <a href="register.jsp">회원가입</a>
        </div>
	</div>
</body>
</html>