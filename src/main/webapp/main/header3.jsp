<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<header class="menu">
	<div class="menu_search">
		<span class="menu_search_icon"><i class="fas fa-search"></i></span><input
			type="text" />
		<button type="button">검색</button>
	</div>
	<ul class="menu_group">
		<li><a href="#">로그인</a></li>
		<li><a href="register.jsp">회원가입</a></li>
		<li><a href="productDetail.jsp">장바구니</a></li>
		<li><a href="#">마이페이지</a></li>
	</ul>
</header>
<section class="title">
	<img src="../images/logo.jpg" />
	<nav class="title_menu">
		<div>
			<ul class="title_menu_group">
				<li><a href="#">인기상품</a></li>
				<li><a href="#">샐러드</a></li>
				<li><a href="#">건강식단</a></li>
				<li><a href="#">건강간식</a></li>
				<li><a href="#">리뷰</a></li>
			</ul>
		</div>
		<div class="title_menu_dropdown">
			<ul class="title_menu_dropdown_ul">
				<li><a href="#">인기상품</a></li>
				<li><a href="#">건강식단</a>
					<ul class="dropdown_ul_list">
						<li><a href="#">프리미엄 샐러드</a></li>
						<li><a href="#">샐러드드레싱</a></li>
						<li><a href="#">닭가슴살</a></li>
						<li><a href="#">다이어트 도시락</a></li>
						<li><a href="#">곤약 식품</a></li>
						<li><a href="#">단백질쉐이크</a></li>
					</ul></li>
				<li><a href="#">건강간식</a>
					<ul class="dropdown_ul_list">
						<li><a href="#">스낵</a></li>
						<li><a href="#">유제품</a></li>
					</ul></li>
				<li><a href="#">리뷰</a></li>
			</ul>
		</div>
	</nav>
</section>
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
