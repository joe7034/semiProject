<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<body>
	<%
	Object obj = session.getAttribute("vo");
	if (obj != null) { /* 로그인되면 세션에넣은 vo값보여주기 아니면 로그인창다시보여주기 */
		UsersVO vo = (UsersVO)obj;
		if (vo.getGrade() == 2) {
	%>
	<header class="menu">
		<form name="search" method="get" action="search.jsp">
			<div class="menu_search">
				<span class="menu_search_icon"><i class="fas fa-search"></i></span>
				<input type="text" name="search" />
				<button type="submit" value="보내기" onclick="search_name()">검색</button>
			</div>
		</form>

		<ul class="menu_group">
			<li><a href="Logout.jsp">로그아웃</a></li>
			<li><a href="cart1.jsp">장바구니</a></li>
			<li><a href="Mypage.jsp">마이페이지</a></li>
			<li><a href="../admin/index.jsp">관리자페이지</a></li>
		</ul>
	</header>

	<section class="title">
		<a href="main.jsp"><img src="../images/logo.jpg" /></a>
		<nav class="title_menu">
			<div>
				<ul class="title_menu_group">
					<li><a href="bestItemPage.jsp">인기상품</a></li>
					<li><a href="saladPage.jsp">샐러드</a></li>
					<li><a href="chickenPage.jsp">건강식단</a></li>
					<li><a href="snackPage.jsp">건강간식</a></li>
					<li><a href="review.jsp">리뷰</a></li>
				</ul>
			</div>
			<div class="title_menu_dropdown">
				<ul class="title_menu_dropdown_ul">
					<li><a href="bestItemPage.jsp">인기상품</a></li>
					<li><a href="saladPage.jsp">샐러드</a>
						<ul class="dropdown_ul_list">
							<li><a href="saladPage.jsp">프리미엄 샐러드</a></li>
							<li><a href="dressingPage.jsp">샐러드드레싱</a></li>
						</ul></li>
					<li><a href="chickenPage.jsp">건강식단</a>
						<ul class="dropdown_ul_list">
							<li><a href="chickenPage.jsp">닭가슴살</a></li>
							<li><a href="dosirakPage.jsp">다이어트 도시락</a></li>
							<li><a href="gonFoodPage.jsp">곤약 식품</a></li>
							<li><a href="shakePage.jsp">단백질쉐이크</a></li>
						</ul></li>
					<li><a href="">건강간식</a>
						<ul class="dropdown_ul_list">
							<li><a href="snackPage.jsp">스낵</a></li>
							<li><a href="dairyPage.jsp">유제품</a></li>
						</ul></li>
			</div>
		</nav>
	</section>

	<%
	} else if (vo.getGrade() == 1) {
	%>
	<header class="menu">
		<form name="search" method="get" action="search.jsp">
			<div class="menu_search">
				<span class="menu_search_icon"><i class="fas fa-search"></i></span>
				<input type="text" name="search" />
				<button type="submit" value="보내기" onclick="search_name()">검색</button>
			</div>
		</form>

		<script>
			
		</script>
		<ul class="menu_group">
			<li><a href="Logout.jsp">로그아웃</a></li>
			<li><a href="cart1.jsp">장바구니</a></li>
			<li><a href="Mypage.jsp">마이페이지</a></li>
		</ul>
	</header>

	<section class="title">
		<a href="main.jsp"><img src="../images/logo.jpg" /></a>
		<nav class="title_menu">
			<div>
				<ul class="title_menu_group">
					<li><a href="bestItemPage.jsp">인기상품</a></li>
					<li><a href="saladPage.jsp">샐러드</a></li>
					<li><a href="chickenPage.jsp">건강식단</a></li>
					<li><a href="snackPage.jsp">건강간식</a></li>
					<li><a href="review.jsp">리뷰</a></li>
				</ul>
			</div>
			<div class="title_menu_dropdown">
				<ul class="title_menu_dropdown_ul">
					<li><a href="bestItemPage.jsp">인기상품</a></li>
					<li><a href="saladPage.jsp">샐러드</a>
						<ul class="dropdown_ul_list">
							<li><a href="saladPage.jsp">프리미엄 샐러드</a></li>
							<li><a href="dressingPage.jsp">샐러드드레싱</a></li>
						</ul></li>
					<li><a href="chickenPage.jsp">건강식단</a>
						<ul class="dropdown_ul_list">
							<li><a href="chickenPage.jsp">닭가슴살</a></li>
							<li><a href="dosirakPage.jsp">다이어트 도시락</a></li>
							<li><a href="gonFoodPage.jsp">곤약 식품</a></li>
							<li><a href="shakePage.jsp">단백질쉐이크</a></li>
						</ul></li>
					<li><a href="">건강간식</a>
						<ul class="dropdown_ul_list">
							<li><a href="snackPage.jsp">스낵</a></li>
							<li><a href="dairyPage.jsp">유제품</a></li>
						</ul></li>
			</div>
		</nav>
	</section>
	<%
	}
	}
	%>
	<% 
	if (obj == null) { 
	%>
	<header class="menu">
		<form name="search" method="get" action="search.jsp">
			<div class="menu_search">
				<span class="menu_search_icon"><i class="fas fa-search"></i></span>
				<input type="text" name="search" />
				<button type="submit" value="보내기" onclick="search_name()">검색</button>
			</div>
		</form>

		<ul class="menu_group">
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="register.jsp">회원가입</a></li>
			<li><a href="cart1.jsp">장바구니</a></li>
			<li><a href="Mypagenull.jsp">마이페이지</a></li>
		</ul>
	</header>

	<section class="title">
		<a href="main.jsp"><img src="../images/logo.jpg" /></a>
		<nav class="title_menu">
			<div>
				<ul class="title_menu_group">
					<li><a href="bestItemPage.jsp">인기상품</a></li>
					<li><a href="saladPage.jsp">샐러드</a></li>
					<li><a href="chickenPage.jsp">건강식단</a></li>
					<li><a href="snackPage.jsp">건강간식</a></li>
					<li><a href="review.jsp">리뷰</a></li>
				</ul>
			</div>
			<div class="title_menu_dropdown">
				<ul class="title_menu_dropdown_ul">
					<li><a href="bestItemPage.jsp">인기상품</a></li>
					<li><a href="saladPage.jsp">샐러드</a>
						<ul class="dropdown_ul_list">
							<li><a href="saladPage.jsp">프리미엄 샐러드</a></li>
							<li><a href="dressingPage.jsp">샐러드드레싱</a></li>
						</ul></li>
					<li><a href="chickenPage.jsp">건강식단</a>
						<ul class="dropdown_ul_list">
							<li><a href="chickenPage.jsp">닭가슴살</a></li>
							<li><a href="dosirakPage.jsp">다이어트 도시락</a></li>
							<li><a href="gonFoodPage.jsp">곤약 식품</a></li>
							<li><a href="shakePage.jsp">단백질쉐이크</a></li>
						</ul></li>
					<li><a href="">건강간식</a>
						<ul class="dropdown_ul_list">
							<li><a href="snackPage.jsp">스낵</a></li>
							<li><a href="dairyPage.jsp">유제품</a></li>
						</ul></li>
			</div>
		</nav>
	</section>

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