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
<script type="text/javascript">
alert("로그인이필요한페이지입니다.");
</script>
</head>
<%@ include file="header.jsp"%>
<body>
	<main>
		<div class="banner_container">
			<div class="banner_slide fade">
				<img
					src="https://images.unsplash.com/photo-1614850715649-1d0106293bd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80">
			</div>
			<div class="banner_slide fade">
				<img
					src="https://images.unsplash.com/photo-1614851099175-e5b30eb6f696?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80">
			</div>
			<div class="banner_slide fade">
				<img
					src="https://images.unsplash.com/photo-1614850715661-902fd7e93c78?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80">
			</div>
			<div class="banner_slide fade">
				<img
					src="https://images.unsplash.com/photo-1614850715649-1d0106293bd1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80">
			</div>
			<div class="banner_slide fade">
				<img
					src="https://images.unsplash.com/photo-1614851099175-e5b30eb6f696?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80">
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