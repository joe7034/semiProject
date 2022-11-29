<%@page import="dao.BoardDAO"%>
<%@page import="vo.UsersVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<%@ include file="header.jsp"%>
<body>
	<%
		Object objj = session.getAttribute("vo");
		if(objj == null) {
			response.sendRedirect("login.jsp");
		}else{
			UsersVO vo2 = (UsersVO)objj;
		
		/* out.println("<h5>"+vo2.getName() + "</h5>"); */
		}
	%>
	<%
		// 현재 페이지
		String cp = request.getParameter("cp");
		int currentPage = 0;
		
		if(cp != null) {
			currentPage = Integer.parseInt(cp);
		}else{
			currentPage = 1;
		}
		// 1페이지당 게시물 수
		
		int recoredPerpage = 10; 
		
		// 시작번호와 끝번호를 계산
		// 현재 페이지가 1이면
		// 시작 번호 : 1 부터 끝번호 : 10
		
		// 현재페이지가 2이면
		// 시작번호 : 11 부터 끝번호 : 20
		
		int startNo = (currentPage-1)*recoredPerpage +1;
		int endNo = currentPage*recoredPerpage;
		
		// 총 게시물 수
		BoardDAO dao = new BoardDAO();
	
		int totalCount = dao.getTotal(); 
		
		// 총페이지 수
		// 21개
		int totalPage = (totalCount/recoredPerpage == 0)? totalCount/recoredPerpage : totalCount/recoredPerpage +1;
		
		// 시작페이지번호
		int startPage = 1;
		// 끝페이지번호
		int endPage = totalPage;
		
		// 시작 페이지 미세조정
		if(currentPage <= 5) {
			startPage = 1;
		}else if (currentPage >=6) {
			startPage = currentPage -4;
		}
		
		// 끝 페이지 미세조정
		if(totalPage - currentPage <= 5) {
			endPage = totalPage;
		}else if(totalPage - currentPage > 5) {
			if(currentPage <= 5 ) {
				if(totalPage > 10) {
					endPage = 10;
				}else{
					endPage = totalPage;
				}
			}else{
				endPage = currentPage+4;
			}
		}
		
		boolean isPre = false;
		boolean isNext = false;
		
		// 이전값이 존재하면 true;
		// 다음값이 존재하면 true;
		
		// 현재페이지번호에서 5을 뺀값이 0이상이면 이전값이 존재
		if(currentPage-5 > 0) {
			isPre = true;
		}
		
		// 현재페이지번호에서 5을 더한값이 끝페이지번호보다 작으면 다음값이 존재
		if(currentPage+5 <= totalPage) {
			isNext = true;
		}
		
		
/* 		out.println("<h3> 현재페이지 번호 : "  + currentPage + "</h3>");
		out.println("<h3> 총게시물 : "  + totalCount + "</h3>");
		out.println("<h3> 페이지당 게시물수 : " + recoredPerpage + "</h3>");
		out.println("<h3> 총페이지 수 : "  + totalPage + "</h3>");
		out.println("<h3> 시작번호 : "  + startNo + "</h3>");
		out.println("<h3> 끝번호 : "  + endNo + "</h3>");
		out.println("<h3> 시작 페이지번호 : "  + startPage + "</h3>");
		out.println("<h3> 끝 페이지번호 : "  + endPage + "</h3>");
		out.println("<h3> 이전 : "  + isPre + "</h3>");
		out.println("<h3> 다은 : "  + isNext + "</h3>"); */
	%>

	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th>게시물번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일시</th>
			</tr>
			<!-- db연결해서 데이터를 가져온후 완성 -->
			<%
				
			// 최근 작성한 게시물 20개만 가져오기
				ArrayList<BoardVO> list = dao.selectAll(startNo,endNo);
				for(BoardVO vo : list) {
					
			%>
			<tr>
				<td><%= vo.getRno() %></td>
				<td><%= vo.getRid() %></td>
				<td><a href="detail.jsp?bno=<%=vo.getRno()%>"><%= vo.getTitle() %></a></td>
				<td><%= vo.getRegdate() %></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%
  						if(isPre) {
  					%>
							<li class="page-item"><a class="page-link">Previous</a></li>
							<%
  						}
					%>
							<%
						for(int i=startPage; i<=endPage; i++) {
					%>
							<li class="page-item"><a class="page-link"
								href="list.jsp?cp=<%= i %>"><%= i %></a></li>
							<%
						}
					%>
							<%
						if(isNext) {
					%>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
							<%
						}
					%>
						</ul>
					</nav>
				</td>
			</tr>
			<tr>
				<td colspan="4"><a href="write.jsp"> <input type="button"
						value="글쓰기" class="btn btn-dark" />
				</a></td>
			</tr>
		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>