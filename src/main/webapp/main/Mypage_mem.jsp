<%@page import="vo.UsersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>my page</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/main.css" />
<meta name="viewport" content="width=device=width, initial=scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
			window.onload=function(){
				var btn = document.getElementById("btn");
				btn.onclick=openKakaoPostcode;
			}
			
			function openKakaoPostcode(){
				new daum.Postcode({
					oncomplete: function(data){
						console.dir(data);
						document.getElementById("post").value=data.zonecode;
						document.getElementById("addrs").value=data.roadAddress;
					}
				}).open();
			}
		</script>
</head>
<body>
	<div id="container">
		<jsp:include page="header.jsp"></jsp:include>

	</div>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">마이페이지</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Mypage_Point.jsp">포인트</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Mypage_mem.jsp">정보수정</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="Mypage_Withd.jsp">회원탈퇴</a>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<button class="btn btn-secondary" id="sidebarToggle">메뉴
						안보이기</button>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">

						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid">
				<%
						Object obj = session.getAttribute("vo");     
						if(obj!=null){            
							UsersVO vo = (UsersVO)obj;
						
					%>
				<h3>현재정보</h3>
				<form action="Mypage_mem_ok.jsp" method="get">
					<table class="table table-sm">
						<tr>
							<td>Id</td>
							<td><%=vo.getId() %></td>
							<input type="hidden" name="id" value="<%=vo.getId() %>" />
						</tr>
						<tr>
							<td>Name</td>
							<td><%=vo.getName() %></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" class="form-control" name="email"
								placeholder="Example@naver.com"></td>
						</tr>
						<tr>
							<td>Phone</td>
							<td><input type="text" class="form-control" name="phone"
								placeholder="000-0000-0000"></td>
						</tr>
						<tr>
							<td>Addrs</td>
							<td><input type="text" class="form-control" id="post"
								size="7" /> <input type="button" id="btn" value="우편번호찾기" /> <input
								type="text" class="form-control" id="addrs" size="30" /></td>
						</tr>
					</table>
					<div class="d-grid gap-2">
						<button class="btn btn-primary" type="submit">회원정보 수정</button>
					</div>
				</form>


				<%
						}
                    %>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../js/scripts.js"></script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>