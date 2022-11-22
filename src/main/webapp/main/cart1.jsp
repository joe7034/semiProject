<%@page import="vo.UsersVO"%>
<%@page import="vo.CartVO"%>
<%@page import="dao.CartDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProductsVO"%>
<%@page import="dao.ProductsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css" />
<style type="text/css">
	/* body.sijunBody {
		background-color: #f5f5f0;
		font-size: 13pt;
		min-width: 1480px;
		width: 100%;
		padding: 50px 0;
	} */
	a{
		text-decoration: none;
	}
	#frame{
		width: 80%;
		margin: 0 auto;
		padding: 50px 50px;
		background-color: #fff;
	}
	#frame2{
		border-bottom: solid 1px #e0e0eb;
		padding-bottom: 10px;
	}
	.home{
		float: right;
	}
	table.calculation1{
		clear: both;
		border: solid 1px #e0e0eb;
		border-collapse: collapse;
		background-color: #f5f5f0;
		width: 100%;
		font-size: 10pt;
	}
	table.calculation1 th{
		border: solid 1px #e0e0eb;
		padding: 10px 0;
	}
	table.calculation1 td{
		border: solid 1px #e0e0eb;
		text-align: center;
	}
	table.calculation2{
		border: solid 1px #e0e0eb;
		border-collapse: collapse;
		background-color: #f5f5f0;
		width: 100%;
		font-size: 10pt;
	}
	table.calculation2 th{
		border: solid 1px #e0e0eb;
	}
	table.calculation2 td{
		border: solid 1px #e0e0eb;
		text-align: center;
	}
	.price{
		font-size: 20pt;
		font-weight: bold;
	}
	.lifont{
		font-size: 10pt;
		color: gray;
	}
	.btn{
		border: none;
		color: white;
		padding: 5px 10px;
		font-size: 13px;
		cursor: pointer;
		border-radius: 5px;
	}
	.default{background-color: #fff; border: solid 1px gray; color: black;}
	.default:hover{background: #ddd;}
	.backBtn{background: #fff; border: solid 1px gray;}
	
	
	.btnfloat{ float: left;}
	.btnfloat2{ float: right;}
	.clearboth{ clear: both;}
	.footerbtn{ float: right; font-weight: bolder; font-size: 12pt; border-radius: 3px;}
	
	#orderBtn, #productClear, #footerbtn { padding: 11px 25px;}
	#orderBtn{margin-left: 140px; background-color: #77af9c;; color: #d7fff1; font-weight: bold; font-size: 18pt; width: 350px; height: 70px;}
	#productClear{background-color: gray; color: #fff; font-weight:  bold; font-size: 12pt;}
	.aa:hober{ cursor: pointer;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		checkPrice(); 
		$("#checkAll").on("click",checkAll);// 체크박스 전체선택	
		$("input[name=chk]").on("click", checkOne); // 체크박스 부분선택
		$("#removeBtn").on("click", removeProduct); // 장바구니 비우기버튼
		$("#orderBtn").on("click", orderAll); // 주문하기 버튼 */
		
	
	})
 
	function checkAll(){ 
		if($("#checkAll").is(":checked")) {
			$("input[name=chk]").prop("checked", true);
			checkPrice(); 
		}else {
			$("input[name=chk]").prop("checked", false);
			$("#totalPrice1").text(0); 
			$("#totalPrice2").text(0); 
		}
	}
	function checkPrice(){
		var result=0; 
		$("input[name=chk]:checked").each(function(){
			var chk = $(this).val();
			var totalPrice =$("#"+chk).val(); 
			//console.log("total" + totalPrice); 
			ck = parseInt(chk);
			totalPrice = parseInt(totalPrice); 
			//console.log("chk : " + chk); 
			result+=totalPrice; 
		})
			//console.log(result); 
			$("#totalPrice1").text(result); 
			$("#totalPrice2").text(result); 
	}
	function checkOne(){
		var allCk = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;	
		if(allCk != checked)$("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true); 
		checkPrice(); 
		
	}
	function removeProduct(){ 
		document.frm.action="deleteCart.jsp";
		document.frm.submit();
	}
	function orderAll(){
		document.frm.action="order.jsp";
		document.frm.submit();
	}
</script>
</head>
<body class="sijunBody">
	<%
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  
		
		// 세션 아이디 가져오기 
		// 일단 임시로 aaaa9999 씀
		
		/* 로그인되면 세션에넣은 vo값보여주기 아니면 로그인창다시보여주기 */
/*  		Object obj = session.getAttribute("vo"); 
 		String id ="";  
		if(obj!=null){            
			UsersVO uo = (UsersVO)obj;
			out.println( uo.getId());
			id = uo.getId();
		} else {
			response.sendRedirect( "login.jsp");
		} */
		
		String id = "aaaa9999"; // 임시 아이디 위 세션 할 경우 뺌 
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
		// cart 테이블 : 장바구니번호 회원id 상품번호 수량 가격 
		// cart 테이블에 이 사람이 있는지 확인, 있으면 정보를 다 불러온다 
	%>
	<div id="container">
		<jsp:include page="header.jsp"></jsp:include>
	</div> 
	<div id="frame">
		<form action="" name="frm" method="post">
			<div id="frame2">
				<span style="font-size: 16pt; font-weight: bold;">장바구니</span> <span
					class="home">홈>장바구니</span> <span> </span>
			</div>
			<br />
			<div>
				<table class="calculation1">
					<tr>
						<th class="aa">구매상품</th>
					</tr>
				</table>
			</div>
			<br />
			<%-- 상품정보 테이블 --%>
			<div>
				<table class="calculation1">
					<thead>
						<tr>
							<th colspan="10" style="text-align: left; padding-left: 10px;">장바구니 상품</th>
						</tr>
						<tr>
							<th><input type="checkbox" name="checkbox" id="checkAll" checked="checked"/></th>
							<th><span>이미지</span></th>
							<th style="width: 200px;"><span>상품정보</span></th>
							<th style="width: 100px;">판매가</th>
							<th>수량</th>
							<th style="width: 100px;">적립 포인트</th>
							<th style="width: 100px;">배송구분</th>
							<th style="width: 100px;">배송비</th>
							<th style="width: 100px;">합계</th>
						</tr>
					</thead>
					<tbody>
			 <%
			 	ArrayList<CartVO> list = cao.selectAll(id); 
			 	
			 	for( CartVO co2 : list){	
			 		int p = co2.getPno();
		 			vo = dao.selectOne(p); 
		 			
			 %>
				<tr style="height: 100px; background-color: #fff;">
					<td style="text-align: left; text-align: center; border-right: none; width: 80px;">
						<input type="checkbox" id="chk" name="chk" value="<%=co2.getCno()%>"  checked />
					</td>
					<td style="border-left: none; border-right: none;"><img
						style="width: 100px; height: 100px;" src="../images/ctgImg/<%=vo.getImg()%>" alt="<%=vo.getPname()%>"></td>
					<td
						style="text-align: left; padding-left: 30px; border-left: none; font-weight: bold;"><%=vo.getPname()%></td>
					<td><span style="padding-left: 5px;"><%=Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01))%></span>원</td>
					<td style="width: 100px;"><%=co2.getQty()%></td> 
					<td><%=(Math.round(vo.getPrice()*0.01))*co2.getQty()%>p</td>
					<td>기본배송</td>
					<td>무료</td>
					<td><span><input type="hidden" id="<%=co2.getCno()%>" value="<%=Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01))*co2.getQty()%>"/>
					<%=Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01))*co2.getQty()%></span>원</td>
				</tr>
			 <%
			 	}		
			 	dao.close(); 
			 	cao.close();
			 %>
					</tbody>
				</table>

				<div style="border: solid 1px #e0e0eb; padding: 15px 0;">
					<img src="#" alt=""
						style="margin-left: 5px; position: relative; top: 4.5px;" /><span
						style="font-size: 10pt; color: gray;">포인트 할인 적용 금액은 주문서작성의
						결제금액에서 확인 가능합니다.</span>
				</div>
			</div>

			<div style="margin: 10px 0;">
				<button id="removeBtn" class="btn default backBtn btnfLoat2" style="background-color: gray; color: #fff;">장바구니 비우기</button>
				<span class="clearboth"></span>
			</div>
			<table class="calculation2">
				<tr>
					<th>총 상품금액</th>
					<th>배송비</th>
					<th style="width: 610px; padding: 22px 0;"><span>결제예정금액</span></th>
				</tr>
				
				<tr style="background: #fff;">
					<td style="padding: 22px 0"><span class="price" id="totalPrice1">0</span>원</td>
					<td><span class="price">무료</span></td>
					<td><span class="price" id="totalPrice2">0</span>원</td>
				</tr>			
			</table>
			<br />
			<br />

			<div align="center">
				<button class="btn default" id="orderBtn">주문하기</button>
				<a href="main.jsp" class="btn default footerbtn" id="footerbtn">쇼핑계속하기</a>
				<span class="clearboth"></span>
			</div>
			<br />
			<br />
			<br />
			<br />
			<br />

			<div
				style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
				이용안내</div>
			<div
				style="border: solid 1px #e0e0eb; height: 150px; font-size: 12pt; padding-left: 10px;">
				<br />장바구니 이용안내

				<ol>
					<li class="lifont">주문하실 상품은 왼쪽 체크박스에 체크표시를 해주십시오</li>
					<li class="lifont">주문하실 상품을 모두 체크하셨다면 주문 버튼을 눌러주십시오</li>
					<li class="lifont">장바구니에서 상품삭제를 원하신다면 체크박스 표시 후 장바구니비우기버튼을 눌러주십시오</li>
				</ol>
			</div>
		</form>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>