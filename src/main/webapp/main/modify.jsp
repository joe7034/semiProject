<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="..lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
	$(function(){
		$("#summernote").summernote();
			lang : "ko-KR"
	});
</script>
<title>Insert title here</title>
</head>
<body>
	
	<%
		String no = request.getParameter("rno");
		if(no != null) {
			int rno = Integer.parseInt(no);
			BoardDAO dao = new BoardDAO();
			BoardVO vo = dao.selectOne(rno);
			//out.println(vo);
	%>
	<div class="container">
		<form action = "modifyOk.jsp" method = "get">
			<table class = "table table-bordered">
				<tr>
					<th>작성자</th>
					<td>
						<input type="hidden" name="rno" value="<%= vo.getRno() %>" />
						<input type="text" name="rid" id="" value="<%= vo.getRid() %>"/>
						<input type="hidden" name="rid" value="<%= vo.getRid() %>" />
					</td>
					<th>작성일시</th>
					<td><%= vo.getRegdate() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5"><input type="text" name="title" id="" value="<%= vo.getTitle() %>"/></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea id="summernote" name="content" id="" cols="30" rows="10"><%= vo.getContent() %></textarea></td>
				</tr>
				<tr>
					<td colspan="6">
						<a href="rivew.jsp"><input type="button" value="목록" class= "btn btn-success" /></a>
						<input type="submit" value="수정완료" class="btn btn-primary"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%
	}
	%>
</body>
</html>