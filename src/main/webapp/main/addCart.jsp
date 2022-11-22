<%@page import="vo.ProductsVO"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="vo.CartVO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  
		
		// 세션 아이디 가져오기 
		// 일단 임시로 aaaa9999 씀
 //		Object obj = session.getAttribute("vo"); 
/* 		String id ="";  
		if(obj!=null){            /* 로그인되면 세션에넣은 vo값보여주기 아니면 로그인창다시보여주기 */
			//UsersVO uo = (UsersVO)obj;
			//out.println( uo.getId());
			//id = uo.getId();
		//} else {
			//response.sendRedirect( "login.jsp"); // 로그인이 안된상태라면 로그인페이지로 가게함 
		//}
		String id = "aaaa9999"; 
		System.out.println(id);
		String no = request.getParameter("pno");  
		String count = request.getParameter("cnt"); 
		
		out.println(no); 
		out.println(count); 
		CartDAO cao = new CartDAO();
		CartVO co = new CartVO(); 
		ProductsDAO dao = new ProductsDAO(); 
		ProductsVO vo = new ProductsVO(); 

		int pno = 0, cnt = 0; 
		if (no != null && count != null ){ // 상품상세페이지에서 장바구니로 들어갔을 때만 해당, 메인페이지에선 이부분 건너뜀
			pno = Integer.parseInt(no); 
			cnt = Integer.parseInt(count);  
			
			//out.println(cnt); 
			vo = dao.selectOne(pno);
			
			// 장바구니에 해당 아이템이 없으면 더해주고 아님 cno추가 
			boolean isOk = cao.isExists(id, pno); 
			System.out.println(isOk); 
			if (isOk == true){ // 있다면 수정
				int cqty = cao.cartQty( id, pno);  // 그 사람이 장바구니에 이물건을 이제껏 총 얼마나 담았는가.
				System.out.println("cqty : " + cqty);
				int qty = cnt+cqty; // 원래있던 개수에 지금 추가한거 더해줌 
				System.out.println("qty :" + qty); 
				cao.cartUpdate(id, pno, qty); // 그 사람의 장바구니 정보 업데이트 -> 업데이트된 목록들 차례대로 보여주기위해 	 
			} else { // 없다면 추가
				cao.insertOne(id,pno,cnt); 
			}	
		}
		
		dao.close(); 
		cao.close();
		
		response.sendRedirect("productDetail.jsp?pno="+pno);
		// cart 테이블 : 장바구니번호 회원id 상품번호 수량 가격 
		// cart 테이블에 이 사람이 있는지 확인, 있으면 정보를 다 불러온다 
	%>

</body>
</html>