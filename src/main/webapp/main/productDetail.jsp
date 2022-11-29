<%@page import="vo.UsersVO"%>
<%@page import="vo.SubimgVO"%>
<%@page import="dao.SubimgDAO"%>
<%@page import="vo.ProductsVO"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/main.css" />
<meta charset="UTF-8">
<title>productDetail.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
th, td {
	padding: 4px;
	font-size: 13px;
}

.rightInfo {
	margin: 2%;
	left: 50%;
	width: 40%;
	position: absolute;
}

.navLink {
	text-decoration: none;
	color: #717171;
	margin: 5%;
	font-size: 20px;
}

.btnBuy {
	width: 202px;
	height: 50px;
	border: 0px;
	outline: 0px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	border: 1px solid rgb(73, 73, 73);
	color: rgb(73, 73, 73);
}

.subpic {
	margin: auto;
	width: 1000px;
}

.cntBtn {
	width: 23px;
	background: #00968845;
	border-radius: 3px;
	border: none;
	cursor: pointer;
}

#constructor {
	position: relative;
	/* background: fuchsia; */
	height: 550px;
}

#itemHeader {
	/* background: yellow; */
	width: 90%;
	height: 500px;
	margin: auto;
	position: relative;
}

#pic>img {
	/* background: orange; */
	position: absolute;
	margin: 2%;
	width: 45%;
	height: 90%;
	float: left;
}

#itemTitle {
	/* background: red; */
	top: 20px;
}

#itemPrice {
	/* background: green; */
	top: 80px;
	height: 40px;
}

#itemInfo {
	/* background: #f7f7f7;  */
	top: 250px;
	height: 100px;
}

#detailInfo {
	background: #00968803;
	top: 135px;
	height: 100px;
	padding: 3px;
}

#itembtn {
	float: left;
	/* background: lime; */
	top: 350px;
	margin-right: 8%;
}

#nav {
	text-align: center;
	margin: 10px;
}

#detail {
	text-align: center;
}

#cartImage {
	width: 50px;
	height: 50px;
	margin-left: 15px;
	position: absolute;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#plus").on("click",plusItem);
		$("#minus").on("click",minusItem);
		$("#btn1").on("click",buyItem);	
		$("#btn2").on("click",getItem);	
		$("#cartImage").on("click",addItem);	
	})
	

	var fincnt = 0; 
	function plusItem(){ // 나중에 재고량 까지 파악해서 if 문 활용할것 추가 		
		//console.log("플러스버튼"); 
		var cnt = parseInt($("#cnt").val().trim());
		var kcal = parseInt($("#kcal").text().trim());
		var point = parseInt($("#drapoint").text().trim());
		var stock = parseInt($("#stock").val()); 
		var temp = kcal/cnt; 
		var temp2 = point/cnt; 
		if ( 0 < cnt  && cnt < stock){
			cnt++; 
			kcal+=temp; 
			point+=temp2; 
			fincnt = parseInt($("#firstPrice").text().trim())*cnt; 
			$("#cnt").val(cnt);
			$("#finPrice").html(fincnt); 
			$("#kcal").html(kcal); 
			$("#drapoint").html(point); 
		}else if ( stock == cnt ) { // 20개를 살 수 있는 최대 수량으로 침 
			alert("재고량을 초과하였습니다"); 
		}else {
			alert("수량을 입력하십시오"); 
		}
		
	}
	function minusItem(){ 
		var cnt = parseInt($("#cnt").val().trim()); 
		var kcal = parseInt($("#kcal").text().trim());
		var point = parseInt($("#drapoint").text().trim());
		if ( cnt > 1 ){ 
			var temp = kcal/cnt; 
			var temp2 = point/cnt; 
			cnt--; 
			$("#cnt").val(cnt); 
			finPrice = parseInt($("#finPrice").text().trim())-parseInt($("#firstPrice").text().trim()); 
			$("#finPrice").html(finPrice);
			kcal -= temp; 
			point -= temp2; 
			$("#kcal").html(kcal);
			$("#drapoint").html(point);
		} else {
			$("#cnt").val(1); 
			//console.log(kcal); 
			alert("1개이상만 수량 지정가능합니다"); 
		}
	}
	function buyItem(){ // 구매버튼 누를시 
		document.frm.action="order.jsp";
		document.frm.submit(); 
	}
	function getItem(){ //장바구니버튼 누를시
		//console.log("버튼 눌림"); 
		document.frm.action="cart1.jsp";
		document.frm.submit();
	} 
	function addItem(){ // 장바구니이미지 누를시  
		alert("장바구니에 추가되었습니다");
		document.frm.action="addCart.jsp";
		document.frm.submit();
	}

</script>
</head>
<%@ include file="header.jsp"%>
<body>
	<%
		// 볶은 곤약 pno확인 
		// 도시락쪽이 제목이 길어요
		// 제목에 \표시가 되버려요. - 이건 나만 그런듯함
		// 인기페이지 가격이 달라요 
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  
		Object obj1 = session.getAttribute("vo"); 
 		String id ="";  
		if(obj1!=null){           
			UsersVO uo = (UsersVO)obj1;
			id = uo.getId();
		}
		
		String p = request.getParameter("pno"); 
		if ( p != null ){
			int pno = Integer.parseInt(p);
			//out.println(pno); 
			ProductsDAO dao = new ProductsDAO(); 
			System.out.println("dao :" + dao); 
			SubimgDAO dao2 = new SubimgDAO(); 
			ProductsVO vo = dao.selectOne(pno);
			SubimgVO vo2 = dao2.selectOne(pno);  
	%>
	<form action="" name="frm" method="post">
		<input type="hidden" name="pno" value="<%=vo.getPno()%>" /> <input
			type="hidden" id="stock" name="stock" value="<%=vo.getStock()%>" />
		<div id="constructor">
			<div id="itemHeader">
				<div id="pic">
					<img src="../images/ctgImg/<%=vo.getImg()%>"
						alt="<%=vo.getPname()%>" />
				</div>
			</div>
			<div id="itemTitle" class="rightInfo">
				<span style="font-size: 28px; font-weight: bold;"><%=vo.getPname()%></span>
				<%-- <h1><%=vo.getPname()%></h1> --%>
			</div>
			<div id="itemPrice" class="rightInfo">
				<span id="firstPrice" style="font-size: 22px; font-weight: bold;"><%=Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01))%>원</span>
			</div>
			<div id=detailInfo class="rightInfo">
				<div>
					<span>수량</span> <input type="text" name="cnt" id="cnt" value="1"
						style="width: 30px;" /> <input type="button" value="+" id="plus"
						class="cntBtn" /> <input type="button" value="-" id="minus"
						class="cntBtn" /> <span id="kcal"><%=vo.getKcal()%></span> <span>kcal</span>
				</div>
				<hr />
				<div>
					<span style="font-size: 25px;">총 금액</span>&nbsp; <span
						style="font-size: 25px;" id="finPrice" style="width: 70px;"><%=Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01))%></span>
					<span>원</span>
				</div>
			</div>
			<div id="itembtn" class="rightInfo">
				<input type="button" value="구매하기" id="btn1" class="btnBuy"
					style="background: #009562; color: white;" /> <input type="button"
					value="장바구니" id="btn2" class="btnBuy" /> <input type="image"
					id="cartImage" src="../images/viewcart.png" alt="cartImage" />
				<!-- <input type="button" value="찜" id="btn3" class="btnBuy" style="width: 90px;"/> -->
			</div>
			<div id="itemInfo" class="rightInfo">
				<table>
					<tr>
						<th>구매혜택</th>
						<td><span id="drapoint"><%=Math.round(vo.getPrice()*0.01)%></span>드래곤포인트
							적립예정</td>
					</tr>
					<tr>
						<th>배송방법</th>
						<td>택배</td>
					</tr>
					<tr>
						<th>배송비용</th>
						<td>무료</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<div id="nav">
		<a href="#subpic1" class="navLink">상세정보</a>&nbsp;/&nbsp; <a
			href="review.jsp" class="navLink">리뷰</a>
	</div>
	<div id="detail">
		<div id="subpic1">
			<img src="../images/detailImg/<%=vo2.getImg1()%>" alt="subimg1"
				class="subpic" />
		</div>
		<div id="subpic2">
			<img src="../images/detailImg/<%=vo2.getImg2()%>" alt="subimg2"
				class="subpic" />
		</div>
		<div id="subpic3">
			<img src="../images/detailImg/<%=vo2.getImg3()%>" alt="subimg3"
				class="subpic" />
		</div>
		<div id="subpic4">
			<img src="../images/Ingredient/<%=vo2.getImg4()%>" alt="subimg4"
				style="margin: auto; width: 600px;" />
		</div>
	</div>
	<%
	  	dao.close(); 
		dao2.close();
	}
	%>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>