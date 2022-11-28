<%@page import="vo.UsersVO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>

</head>
 <body style="padding-top: 40px;">
	<div class="card align-middle" style="width:25rem;">
		<div class="title">
			<a href="main.jsp"><img alt="" src="../images/logo.jpg" class="title"></a> 
			<br />
		</div>
		
      <form action="loginOk.jsp" class="login" name="frm" method="post">
        <div class="checkbox">
            <label>
            <input type="radio" name="mode" value="admin"> 관리자
			&nbsp;&nbsp;
			<input type="radio" name="mode" value="user" checked> 일반회원
            </label>
         </div>
          
		<div class="card-body" style="text-align: center">
	        <input type="text" name="id" id="id" class="form-control" placeholder="아이디" required><br>
	        <input type="password" name="pwd" id="pwd" class="form-control" placeholder="비밀번호" required><br>
	       	<p class="check" id="check" style="text-aling:left">${check}</p>
	        <input type="checkbox" name="autoid" id="autoid" /> 자동로그인
	        <input type="checkbox" name="saveid" id="saveid" /> 아이디저장
	        <br /><br />
        	<input id="btn-login" class="btn btn-lg btn-primary btn-block" type="submit" value="로 그 인">
		</div>
      </form>
        <div class="links">
            <a href="findId.jsp">아이디 찾기</a> | <a href="findPw.jsp">비밀번호 찾기</a> | <a href="register.jsp">회원가입</a>
        </div>
	</div>
 </body>
<script type="text/javascript">

	$("#btn-login").on("click",function(){
		if($('#pwd').val() == ""){
			$('#pwd').focus();
			$('#check').text('비밀번호를 입력해주세요.');
	  		$('#check').css('color', 'red');
		}
		if($('#id').val() == ""){
			$('#id').focus();
			$('#check').text('아이디를 입력해주세요.');
	  		$('#check').css('color', 'red');
		}
	 }) 
</script>
</html>