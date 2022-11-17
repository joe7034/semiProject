<%@page import="vo.UsersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/main.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device=width, initial=scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<style>
.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	top: 4rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #eee;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 220px;
}

.bd-sidebar .nav {
	display: block;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: .25rem 1.5rem;
	font-size: 90%;
}
</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
</head>
<body>
	<header class="navbar navbar-expand navbar-dark bg-dark bd-navbar">
		<a class="navbar-brand" href="#">재고관리</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				 <li class="nav-item active"><a class="nav-link" href="main.jsp">Main</a></li> 
			</ul>
		</div>
	</header>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="ItemService.jsp"><h4>상품등록</h4></a></li>
					<li><a href="StockManage.jsp"><h4>재고관리</h4></a></li>
					<li><a href="MemManage.jsp"><h4>회원관리</h4></a></li>
					<li><a href="graph.jsp"><h4>판매현황</h4></a></li>
				</ul>
				<br>
			</div>
			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<div class="form_group">	 
				<label for="title">상품번호</label>
				<input type="text" class="form-control" name="pno">
			</div>
			<div class="form_group">	 
				<label for="title">상품명</label>
				<input type="text" class="form-control" name="pname">
			</div>
			<div class="form_group">	 
				<label for="title">카테고리번호</label>
				<input type="text" class="form-control" name="ctgno">
			</div>
			<div class="form_group">	 
				<label for="title">칼로리</label>
				<input type="text" class="form-control" name="kcal">
			</div>
			<div class="form_group">	 
				<label for="title">가격</label>
				<input type="text" class="form-control" name="price">
			</div>
			<div class="form_group">	 
				<label for="title">원가</label>
				<input type="text" class="form-control" name="cost">
			</div>
			<div class="form_group">	 
				<label for="title">할인율</label>
				<input type="text" class="form-control" name="discount">
			</div>
			<div class="form_group">	 
				<label for="title">재고</label>
				<input type="text" class="form-control" name="stock">
			</div>
			<div class="form_group">	 
				<label for="title">상품상세내용</label>
				<input type="text" class="form-control" name="pcontent">
			</div>
				<label for="title">상품이미지</label><br />
			<div class="input-group mb-3">
			  	<input type="file" class="form-control" id="inputGroupFile02" name="img">
			  	<label class="input-group-text" for="inputGroupFile02">Upload</label>
			</div>
			
			<div class="d-grid gap-2">
			  <button class="btn btn-primary" type="submit">상품추가</button>
			</div>
			</main>
		</div>
	</div>
</body>
</html>