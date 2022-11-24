<%@page import="dao.UsersDAO"%>
<%@page import="vo.UsersVO"%>
<%@page import="vo.OrdersVO"%>
<%@page import="dao.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css" />
<title>Insert title here</title>
<style>
	#rgok{
		margin: 100px auto;
		width: 800px; 
		height: 150px;
		text-align: center;
		padding-top: 50px;
		border: 1px solid lightgrey;
		border-radius: 3px;
		background: #9e9e9e05;
		color: #697276;
	}
	.rga {
		text-decoration: none;
		color: #717171;
		margin: 5%;
		font-size: 14px;
	}
</style>

</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  
		
		Object obj1 = session.getAttribute("vo");
		String id = ""; 
		if(obj1!=null){            
			UsersVO uo = (UsersVO)obj1;
			id = uo.getId();
		} else {
			response.sendRedirect("login.jsp");
		}
		int ono = 0, tAmt = 0, opoint = 0, fAmt=0;
		String totalAmt = request.getParameter("totalPrice"); 
		String user_point = request.getParameter("user_point").trim(); 
		System.out.println("user_point"+user_point); 
		if (totalAmt != null && user_point != null) {
			tAmt = Integer.parseInt(totalAmt);
			opoint = Integer.parseInt(user_point);
		}
		fAmt=tAmt-opoint;
		String oname = request.getParameter("name1"); 
		String ophone = request.getParameter("tel"); 
		String opost = request.getParameter("post");
		String oaddrs1 = request.getParameter("addrs"); 
		String oaddrs2 = request.getParameter("addrs2"); 
		String odate="";  
		int status = 0; // 배송전이면 0
/* 		System.out.println("oname " + oname); 
		System.out.println("tAmt : " +tAmt); 
		System.out.println("opoint : " +opoint); 
		System.out.println("fAmt : " +fAmt); 
		System.out.println("opost : " + opost); 
		System.out.println("oaddrs1  : " + oaddrs1); 
		System.out.println("oaddrs2 : " + oaddrs2);  */ 
		OrdersDAO dao = new OrdersDAO(); 
		OrdersVO vo = new OrdersVO(ono, id, tAmt, opoint, fAmt, oname, ophone, opost, oaddrs1, oaddrs2 , odate, status); 
		dao.insertOne(vo);		 
		System.out.println("ono : " + ono);
		dao.close(); 	
		System.out.println("완료"); 
		
		// 유저의 포인트 차감 - 포인트 보내면 차감함 
		// 유저의 포인트를 리턴 , 쓴 포인트를 빼줌 
		if ( opoint > 0 ){
			UsersDAO uao = new UsersDAO(); 
			int previousPoint = uao.getPoint(id); 	
			int currentPoint = previousPoint - opoint;
			uao.updatePoint(id, currentPoint);
			System.out.println("포인트업뎃");
		}		
	%>
	<div id="rgok"> 
		<div id="divrg1">
			<span style="font-size: 30px; font-weight: bold;">주문이 완료되셨습니다</span>
			<span></span>
		</div>
		<div id="divrg2">
			<!-- <span style="font-size: 20px;">드래곤페이 1000포인트가 지급되었습니다</span> -->
		</div>
		<div id="divrg3" style="margin-top: 30px;">
		<a href="Mypage.jsp" class="rga" >마이페이지</a>&nbsp;/&nbsp;
		<a href="main.jsp" class="rga">메인페이지</a>
		</div>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
