<%@page import="vo.UsersVO"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글처리
		request.setCharacterEncoding("UTF-8");
		Object obj = session.getAttribute("vo");
		
		if(obj != null) {
			UsersVO vo = (UsersVO)obj;
			
		}
	// 1. 파라미터 값 가져오기
		String rid = request.getParameter("rid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
	if(rid != null && title != null && content != null) {
		
	// 2. dao
		BoardDAO dao = new BoardDAO();
	
	// 3. vo
		BoardVO vo = new BoardVO();
		vo.setRid(rid);
		vo.setTitle(title);
		vo.setContent(content);
		
		out.println(vo);
		
	// 4. db에 추가
		dao.insertOne(vo);
	}
	
	// 5. review.jsp로 리다이렉트
		response.sendRedirect("review.jsp");
	
		
	
	%>
