<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// 1. 파라미터값가져오기
		String no = request.getParameter("rno");
	if(no != null) {
		int rno = Integer.parseInt(no);
		String rid = request.getParameter("rid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		out.println(rno + " : " + rid + " : " + title + " : " + content);
		
		// 2. dao
		BoardDAO dao = new BoardDAO();
		
		BoardVO vo = new BoardVO();
		vo.setRno(rno);
		vo.setRid(rid);
		vo.setTitle(title);
		vo.setContent(content);
		// 3. dao.updateOne(BoardVO vo);
		dao.updateOne(vo);
	}
		// 4. list.jsp 리다이렉트
		response.sendRedirect("review.jsp");

%>