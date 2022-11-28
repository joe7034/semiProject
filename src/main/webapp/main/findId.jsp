<%@page import="vo.UsersVO"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript"></script>
<title>아이디 찾기</title>
<style>
     @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
	    cellpadding : 0; 
	    cellspacing : 0; 
	    marginleft : 0; 
	    margintop : 0;
	    align : center;
  		padding-top: 40px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
    	width : 25px;
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
    .title{
		text-align : center;
		margin : 30px auto;
		margin-top : 30px;
		width : 300px;
    }
	 .links{
        text-align: center;
        margin-bottom: 10px;
    }

    a{ 
    	color: #f58b34; text-decoration: none; 
    }
    .text2{
    	color : blue;
    }
</style>
</head>
<body>
	<div class="card align-middle" style="width:25rem;">
		<div class="title">
			<a href="main.jsp"><img alt="" src="../images/logo.jpg" class="title"></a>
		</div>
        
	<div class="card-body">
     	<form action="findIdOk.jsp" class="form-signin" name="frm">
	        	<input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><br>
	        	<input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>
	        <p class="check" id="check">${check}</p><br/>
	       		<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아 이 디 찾 기</button>
     	</form>
	</div>
       <div class="links">
           <a href="findPw.jsp">비밀번호 찾기</a> | <a href="login.jsp">로그인</a> | <a href="usersRegist">회원가입</a>
       </div>
	</div>
</body>

<!-- 체크알림  -->
<script type="text/javascript">
 	 $("#btn-Yes").on("click",function(){
		if($('#email').val() == ""){
			$('#email').focus();
			$('#check').text('이메일을 입력해주세요.');
	  		$('#check').css('color', 'red');
		}
		if($('#name').val() == ""){
			$('#name').focus();
			$('#check').text('이름을 입력해주세요.');
	  		$('#check').css('color', 'red');
		}
	 }) 
</script>
</html>