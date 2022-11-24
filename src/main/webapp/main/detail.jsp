<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		String no = request.getParameter("bno");
		
		if(no != null) {
			
			int rno = Integer.parseInt(no);
			
			out.println(rno);
			
			BoardDAO dao = new BoardDAO();
			BoardVO vo = dao.selectOne(rno); // 게시물을 가져온다.
			
			//out.println("vo : " + vo);
	%>
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th>작성자</th>
				<td><%= vo.getRid() %></td>
				<th>등록일시</th>
				<td><%= vo.getRegdate() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan = "5"><%= vo.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5"><%= vo.getContent() %></td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="review.jsp"><input type="button" value="목록" class="btn btn-success"/></a>
					<a href="modify.jsp?rno=<%=vo.getRno()%>"><input type="button" value="수정" class="btn btn-primary"/></a>
					<a href="deleteOk.jsp?rno=<%= vo.getRno() %>"><input type="button" value="삭제" class="btn btn-danger"/></a>
				</td>
			</tr>
		</table>
	</div>
	<%
	}
	%>
</body>
</html>