<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#summernote').summernote();
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		Object obj = session.getAttribute("vo");
		if(obj != null) {
			UsersVO vo = (UsersVO)obj;
	%>
	<div class="container">
		<form action="witeOk.jsp" method="post">
			<table class="table table-striped">
				<tr>
					<th>작성자</th>
					<td><input type="text" disabled="disabled" name="rid" id=""
						value="<%= vo.getName() %>" /> <input type="hidden" name="rid"
						id="rid" value="<%= vo.getName() %>" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="" /></td>
				</tr>
				<tr>
					<th>별점</th>
					<th>★★★★★</th>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="summernote" name="content" id="" cols="30"
							rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><a href="review.jsp"><input
							class="btn-primary" type="button" value="목록" /></a> <input
						class="btn btn-primary" type="submit" value="작성" /></td>
				</tr>
			</table>
		</form>
		<%
	}
	%>
	</div>
</body>
</html>