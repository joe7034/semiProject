<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
    />
</head>
<body>
<%
	Object obj = session.getAttribute("vo");
	if (obj != null) { /* 로그인되면 세션에넣은 vo값보여주기 아니면 로그인창다시보여주기 */
		UsersVO vo = (UsersVO) obj;
		if (vo.getGrade() == 0) {
	%>
	<header class="menu">
		<div class="menu_search">
			<span class="menu_search_icon"><i class="fas fa-search"></i></span><input
				type="text" />
			<button type="button">검색</button>
		</div>
		<ul class="menu_group">
			<li><a href="Logout.jsp">로그아웃</a></li>
			<li><a href="#">장바구니</a></li>
			<li><a href="Mypage.jsp">마이페이지</a></li>
			<li><a href="ItemService.jsp">관리자페이지</a></li>
		</ul>
	</header>

	<%
	} else if (vo.getGrade() == 1) {
	%>
	<header class="menu">
		<div class="menu_search">
			<span class="menu_search_icon"><i class="fas fa-search"></i></span><input
				type="text" />
			<button type="button">검색</button>
		</div>
		<ul class="menu_group">
			<li><a href="Logout.jsp">로그아웃</a></li>
			<li><a href="#">장바구니</a></li>
			<li><a href="Mypage.jsp">마이페이지</a></li>
		</ul>
	</header>
	<%
	}
	}
	%>
	<% 
	if (obj == null) { 
	%>
	<header class="menu">
		<div class="menu_search">
			<span class="menu_search_icon"><i class="fas fa-search"></i></span><input
				type="text" />
			<button type="button">검색</button>
		</div>
		<ul class="menu_group">
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">장바구니</a></li>
			<li><a href="Mypagenull.jsp">마이페이지</a></li>
			<li><a href="ItemService.jsp">관리자페이지</a></li>
		</ul>
	</header>

	<%
	}
	%>
<script>
    $(window).on("scroll", function(){
      let scrollHeight=$(this).scrollTop();
      if(scrollHeight >= 180) {
      	$('.title_menu').css("position","fixed");
      	$('.title_menu').css("top","0");
      } else {
      	$('.title_menu').css("position","relative");
      }
    });
    
	$('.title_menu').on('mouseover', function(event) {
	 if ($(event.target).hasClass('title_menu_group')) {
		$('.title_menu_dropdown').addClass('show');
		$('.title_menu_dropdown_ul').css("display","block");
		}
	});
	
	$('.title_menu').on('mouseleave',function(){
		$('.title_menu_dropdown').removeClass('show');
		$('.title_menu_dropdown_ul').css("display","none");
	});

</script>
</body>
</html>