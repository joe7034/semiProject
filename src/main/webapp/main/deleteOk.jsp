<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");
		
	// 1. 파라미터 값 가져오기
	String no = request.getParameter("rno");	
	
	if(no != null) {
		int rno = Integer.parseInt(no);
	// 2. dao
		BoardDAO dao = new BoardDAO();
	
	// 3. dao.deleteOne(int rno)
		dao.deleteOne(rno);
	
	}
	// 4. list.jsp로 리다이렉트
		response.sendRedirect("review.jsp");
	
		
	
	%>