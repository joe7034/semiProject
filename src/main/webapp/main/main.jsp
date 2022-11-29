<%@page import="vo.UsersVO"%>
<%@page import="vo.ProductsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>saladragon</title>
<link rel="icon" type="image/x-icon" href="../images/dragon.ico" />
</head>
<%@ include file="header.jsp"%>
<body>
	<main>
		<div class="banner_container">
			<div class="banner_slide fade">
				<a href="register.jsp"><img src="../images/banner/banner01.jpg"></a>
			</div>
			<div class="banner_slide fade">
				<a href="saladPage.jsp"><img src="../images/banner/banner02.jpg"></a>
			</div>
			<div class="banner_slide fade">
				<a href="chickenPage.jsp"><img
					src="../images/banner/banner03.jpg"></a>
			</div>
			<div class="banner_slide fade">
				<a href="snackPage.jsp"><img src="../images/banner/banner04.jpg"></a>
			</div>
			<div class="banner_slide fade">
				<a href="dosirakPage.jsp"><img
					src="../images/banner/banner05.jpg"></a>
			</div>

			<a class="banner_prev" onclick="plusSlides(-1)">&#10094;</a> <a
				class="banner_next" onclick="plusSlides(1)">&#10095;</a>
			<div class="banner_dot_group">
				<span class="banner_dot" onclick="currentSlide(1)"></span> <span
					class="banner_dot" onclick="currentSlide(2)"></span> <span
					class="banner_dot" onclick="currentSlide(3)"></span> <span
					class="banner_dot" onclick="currentSlide(4)"></span> <span
					class="banner_dot" onclick="currentSlide(5)"></span>
			</div>
		</div>

		<%@ include file="productItems.jsp"%>
	</main>
	<%@ include file="footer.jsp"%>

</body>

<script>
let slideIndex = 1;

const plusSlides = (n) => {
  showSlides(slideIndex += n);
}

const currentSlide = (n) => {
  showSlides(slideIndex = n);
}

const showSlides = (n) => {
  let i;
  let slides = document.getElementsByClassName("banner_slide");
  let dots = document.getElementsByClassName("banner_dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
showSlides(slideIndex);
setInterval(()=> showSlides(slideIndex += 1), 3000);

</script>
</html>