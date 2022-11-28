<%@page import="vo.CartVO"%>
<%@page import="dao.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProductsVO"%>
<%@page import="dao.ProductsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/order.css">
<link rel="icon" type="image/x-icon" href="../images/dragon.ico">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>결제페이지</title>
<script>
	// 주소
	window.onload=function(){
		var btn = document.getElementById("btn");
		btn.onclick=openKakaoPostcode;
	}
	function openKakaoPostcode(){
		
		new daum.Postcode({
			oncomplete: function(data){
				console.dir(data);
				document.getElementById("post").value=data.zonecode;
				document.getElementById("addrs").value=data.roadAddress;
			}
		}).open();
	}
</script>
<script>
	// 이메일 도메인 선택
	$(function(){		
		$("select").on("change", selectEmail);
		$("#allPointBtn").on("click", selectAllPoint);
		$("#usePointBtn").on("click", usePoint);
		
	})
	function selectEmail(){
		$("#selectEmail option:selected").each(function () {			
			if($(this).val()== '1'){ 
				$("#email2").val('');
				$("#email2").attr("disabled",false);
			}else{
				$("#email2").val($(this).text());
				$("#email2").attr("disabled",true);
			}
		})
	}
	function selectAllPoint(){ // 전액사용버튼 누르면 포인트 전액값 이동 
		//console.log("버튼눌림"); 
		var myAllPoint = $("#myAllPoint").text(); 
		console.log(myAllPoint); 
		$('input[name=user_point]').val(myAllPoint); 
	}
	function usePoint(){ // 포인트 사용 눌렀을시 
		//console.log("usePointBtn"); 
		var usePoint = $('input[name=user_point]').val(); // 사용포인트
		var myAllPoint = $("#myAllPoint").text(); //내 보유 포인트
		var totalPrice = $("#totalPrice").text(); // 총금액
		var finUsePoint=0; 
		usePoint = parseInt(usePoint);
		myAllPoint = parseInt(myAllPoint);
		totalPrice =  parseInt(totalPrice);
		//console.log(usePoint); 
		if (usePoint > myAllPoint){  // 사용포인트가 보유포인트보다 값이 클때 최대보유포인트로 해둠
			$('input[name=user_point]').val(myAllPoint);
			finUsePoint = myAllPoint;
		}else if ( usePoint > totalPrice) { // 사용포인트가 물건값보다 클때 물건값으로 해둠
			$('input[name=user_point]').val(totalPrice);
			finUsePoint = totalPrice;
		}else{
			$('input[name=user_point]').val(usePoint);
			finUsePoint = usePoint;
		}
		$("#finUsePoint").text(finUsePoint+"p");		
		$("#payment").text(totalPrice-finUsePoint);
		$("#payment").text(totalPrice-finUsePoint+"원");
	}
</script>
<script>
	// 배송메모 직접입력 텍스트
	$(function(){
		// 직접입력 텍스트 기존에는 숨김
		$("#selboxDirect").hide();
		
		$("#selbox").change(function(){
				// 직접입력을 누르면 텍스트 생성
				if($("#selbox").val() == "direct"){
					$("#selboxDirect").show();
				}else{
					$("#selboxDirect").hide();
				}
			})
		})
</script>
</head>
<%@ include file="header.jsp"%>
<body>
	<%
			Object obj1 = session.getAttribute("vo"); 
	 		String id ="";
	 		String name =""; 
	 		String phone =""; 
	 		String email =""; 
	 		int point = 0; 
			if(obj1!=null){            
				UsersVO uo = (UsersVO)obj1;
				//out.println( uo.getId());
				id = uo.getId();
				point = uo.getPoint();
				name = uo.getName();
				phone = uo.getPhone();
				email = uo.getEmail();
			} else {
				response.sendRedirect("login.jsp");
			}
	%>
<div class="order-box">
<div class="order-bgcolor">
<div class="order-boxwrp">
	<!-- 타이틀 -->
	<div class="order-title">
		<h1 class="order-title-text">주문 / 결제</h1>
	</div>
	<form action="" name="frm" method="post">
	<div class="order-info-wrp">
		<div class="order-wrp-left">
			<!-- 배송 정보 -->
			<div class="left-section-info left-section-box">
				<h3 class="title-delivery">배송 정보</h3>
				<div class="delivery-condition">
					<div class="delivery-name">
						<input type="text" name="name1" id="name1" style="width: 341px;" placeholder="받으시는 분">
					</div>
					<div class="delivery-tel">
						<input type="text" name="tel" id="tel" style="width: 341px;" placeholder="연락처">
					</div>
					<div class="delivery-addrs">
						<input type="text" name="post" id="post" size="7" placeholder="우편번호">
						<input type="button" value="주소찾기" id="btn"  style="margin-bottom:5px;"><br>
						<input type="text" name="addrs" id="addrs" size="30"  placeholder="주소" style="width: 341px; margin-bottom:5px;"><br>
						<input type="text" name="addrs2" id="addrs2" size="30" placeholder="상세주소" style="width: 341px;">
					</div>
					<div class="delivery-Requested">
						<h4 class="title-delivery-Request">배송 요청사항</h4>
						<select class="select-box" name="selbox" id="selbox">
							<option value="">배송메모를 선택해주세요.</option>
							<option value="1">배송 전에 미리 연락 바랍니다.</option>
							<option value="2">배부재시 경비실에 맡겨주세요.</option>
							<option value="3">부재시 전화나 문자 남겨를 남겨주세요.</option>
							<option value="direct">직접입력</option>
						</select>
						<div class="delivery-text-Requested">
							<input type="text" id="selboxDirect" name="selboxDirect" style="width: 120px; display: none;"><br>
						</div>
					</div>
				</div>
				<!-- 배송 정보 끝 -->
				<!-- 주문자 정보 -->
				<div class="delivery-user">
					<h3 class="title-delivery-user">주문자 정보</h3>
					<div class="delivery-user-name">
						<span>주문자 이름 : <%=name%>님</span>
					</div>
					<br />
					<div class="delivery-user-tel"  style="margin-top: 5px;">
						<span>주문자 연락처 : <%=phone %></span>
					</div>
					<br />
					<div class="delivery-user-email">
						<span>주문자 이메일 : <%=email %></span>
					</div>
				</div>
				<!-- 주문자 정보 끝 -->
			</div>
			<!-- 배송,주문자 정보 끝 -->
			<!-- 배송하는 상품 -->
			<div class="section-order-info left-section-box" >
				<h3>배송 상품</h3>
		<% 
			//out.println(point); 
			String no = request.getParameter("pno");  
			String count = request.getParameter("cnt"); 
			String[] cnoList = request.getParameterValues("chk");
			// 상품이미지 회원포인트 총상품금액 사용포인트  결제예상금액
			int pno = 0, cnt = 0;
			int price=0, totalPrice=0; 
			ArrayList<ProductsVO> list = new ArrayList<ProductsVO>(); 
			ArrayList<Integer> cntList = new ArrayList<Integer>(); 
			ArrayList<Integer> priceList = new ArrayList<Integer>(); 
			// 해당카트번호로 
			// vo부르기 => select * from products where pno = (select pno from cart where cno=11); 
			// 총 상품금액은 수량과 금액 
			ProductsDAO dao = new ProductsDAO();
			ProductsVO vo = new ProductsVO();
			if (no != null && count != null ){ // 구매하기 버튼눌렀을시 
				pno = Integer.parseInt(no); // 번호
				cnt = Integer.parseInt(count); // 개수
				System.out.println(pno); 
				System.out.println(cnt); 
				vo = dao.selectOne(pno); // 해당상품번호의vo
				list.add(vo); 
				 // 가격
				price = (int)(Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01)));
				totalPrice = price*cnt;
				cntList.add(cnt); 
				priceList.add(price); 
				//out.println(totalPrice); 
			}else { // 장바구니에서 주문하기를 눌렀을시
				CartDAO cao = new CartDAO(); 
				CartVO co = new CartVO(); 
				System.out.println("여기");
				for(String a : cnoList){ // 체크박스로 cno 담아온값을 하나씩 품 
					if ( a != null){
						int cno = Integer.parseInt(a);
						cnt = cao.cartQty(cno); // 해당 cno의 수량
						//System.out.println("cnt:"+cnt); 
						vo = dao.selectProduct(cno); 
						//price = vo.getPrice();
						System.out.println("cno : " + cno); 
						price = (int)(Math.round(vo.getPrice()*(1-vo.getDiscount()*0.01)));
						//System.out.println("price" + price);
						totalPrice += price*cnt; // 총 상품금액 
						//System.out.println("totalPrice : " + totalPrice); 
						list.add(vo); 
						cntList.add(cnt); 
						priceList.add(price); 
						cao.deleteOne(cno); 
					}	
				} 
			}
				
				// totalprice는 빼옴 
				int t =0; 
				for( ProductsVO vo2 : list){
			%>	
				<div style="border: 1px solid lightgrey;" >
					<div>
					<img src="../images/ctgImg/<%=vo2.getImg()%>" alt="" style="float: left; width: 100px; height: 100px;" class="imgs">
<!-- 					<ul class="shipping-product-item">
						<li class="shipping-product-title">
							<span class="mg15">상품명</span>
							<strong class="shipping-product-value">이름</strong>
						</li>
						<li class="shipping-product-title">
							<span class="mg15">수량</span>
							<strong class="shipping-product-value">0개</strong>
						</li>
						<li class="shipping-product-title">
							<span class="mg15">총 상품금액</span>
							<strong class="shipping-product-value">0원</strong>
						</li>
					</ul> -->
					</div>
					<div id="product_info1" style="float: left; margin-left: 10px; margin-top: 15px;">
						<span><%=vo2.getPname()%></span><br />
						<span><%=cntList.get(t)+"개"%></span><br />
						<span><%=priceList.get(t)*cntList.get(t)+"원"%></span>
						<input type="hidden" name="orderPno" value="<%=vo2.getPno()%>"/>
						<input type="hidden" name="orderProductQty" value="<%=cntList.get(t)%>"/>
					</div>
					<div id="product_info2" style="clear: both;"></div>
				</div>
			<%
				t++; 		
					}	
			%>
			</div> 
			<!-- 배송하는 상품 끝 -->
			<!-- 포인트 -->
			<div class="order-user-point" style="padding: 120px;">
				<h3 class="title-user-point">포인트</h3>
				<div class="user-point">
					<input title="보유" class="" type="text" id="user_point" name="user_point" data-group="point" autocomplete="off" value="0" data-apply_point="0">
					<!-- 비활성화시 disabled 추가 -->
					<a class="" href="javascript:">
						<i class="btl"></i>
					</a>
					<a href="javascript:" id="usePointBtn" class="btn btn-primary btn-sm">포인트 차감</a>
				</div>
				<br />	<!-- 비활성화시 disabled 추가 -->
				<p class="hold_point">
					보유 포인트
					<strong id="myAllPoint"><%=point%></strong>
					<a href="javascript:" id="allPointBtn" class="btn btn-primary btn-sm">전액사용</a>
				</p>
			</div>
			<!-- 포인트 끝 -->
			<!-- 결제 수단 -->
			<div class="section-payment-info right-section-box" style="padding: 120px;">
				<h3 class="section-payment-info-title">결제수단</h3>
				<ul class="payment-type-list">
<!-- 					<li class="payment-type-item">
						<input type="radio" name="pay-type-item" value="mutong">
						<span class="mg15">무통장 입금</span>
					</li> -->
					<li class="payment-type-item">
						<input type="radio" name="pay-type-item" value="card" checked>
						<span class="mg15">카드결제</span>
					</li>
				</ul>
				<div>
					<span style="float: left; margin-right: 20px;">카드번호</span>
					<span style="float: left;"><input type="text" name="" id="" style="width: 60px; "/>&nbsp;-&nbsp;</span>
					<span style="float: left;"><input type="text" name="" id="" style="width: 60px;"/>&nbsp;-&nbsp;</span>
					<span style="float: left;"><input type="text" name="" id="" style="width: 60px;"/>&nbsp;-&nbsp;</span>
					<span style="clear: both;"><input type="text" name="" id="" style="width: 60px;"/></span>	
				</div>
				<div style="margin-top: 15px;">
					<span style="float: left;margin-right: 64px;">cvc</span>
					<span style="clear: both;"><input type="text" name="" id="" style="width: 60px;"/></span>
				</div>
				<div style="margin-top: 15px;">
					<span style="float: left; margin-right: 20px;">만기일자</span>
					<span style="float: left;"><input type="text" name="" id="" style="width: 60px;"/>&nbsp;/&nbsp;</span>
					<span style="clear: both;"><input type="text" name="" id="" style="width: 60px;"/></span>
				</div>
				<div style="margin-top: 15px;">
					<span style="float: left; margin-right: 10px;"><input type="radio" name="bank" id="" value="국민"/>국민</span>
					<span style="float: left; margin-right: 10px;"><input type="radio" name="bank" id="" value="신한"/>신한</span>
					<span style="float: left; margin-right: 10px;"><input type="radio" name="bank" id="" value="우리"/>우리</span>
					<span style="clear: both; margin-right: 10px;"><input type="radio" name="bank" id="" value="하나"/>하나</span>
				</div>
			</div>
			<!-- 결제 수단 끝 -->
		</div>
		<!-- 결제 금액 -->
		<div class="order-wrp-right">
			<div class="right-section-info">
				<h3 class="right-section-info-title">결제 금액</h3>
				<ul>
					<li class="expected-price-item">
						<span class="expected-price-title">총 상품 금액</span>
						<strong id="totalPrice" class="expectde-price-value"><%=totalPrice%>원</strong>
						<input type="hidden" name="totalPrice" value="<%=totalPrice%>" />
					</li>
					<li class="expected-price-item">
						<span class="expected-price-title">사용 포인트</span>
						<strong id="finUsePoint" class="expectde-price-value">0p</strong>						
					</li>
					<li class="expected-price-item">
						<span class="expected-price-title">배송비</span>
						<strong class="expectde-price-value">무료</strong>
					</li>
				</ul>
				<p class="total-expected-price">
					<span class="total-expected-price-title">총 결제 예상금액</span>
					<strong id="payment" class="total-expected-price-value"><%=totalPrice%>원</strong>
				</p>
				<div class="personal-information">
					<input type="checkbox" name="check_1" id="check_1">
					 <span>
						개인정보 수집 이용 및 제 3자 제공 동의 (필수)
					 </span>
				</div>
				<!-- class="btn-order" -->
				<!-- <button  onclick="request_to_check();">주문완료1111</button> -->
				<input type="button" style="width: 300px; height: 60px; margin-left: 100px; margin-top: 20px;" onclick="request_to_check();" value="주문완료" />
			</div>
		</div>
	</div>
	</form>
</div>
</div>
</div>
<%@ include file="footer.jsp"%>
<script type="text/javascript">
function request_to_check(){
	console.log("button 클릭");
	/* var $name1 = $("name1"); */ 
	if(name1.value==""){
		name1.focus();
		alert('받으시는 분의 이름을 입력해주세요');
		console.log("콘솔로 출력 ");
		return false;
	}
	if(tel.value ==""){
		tel.focus();
		alert('연락처를 입력해주세요');
		return false;
	}
	console.log("여기까지함"); 
	if(post.value =="" || addrs.value ==""){
		addrs.focus();
		alert('주소를 찾아주세요');
		return false;
	} 
	console.log("도달"); 
	if(addrs2.value == ""){
		addrs2.focus();
		alert('상세주소를 입력해주세요');
		return false;
	}
/* 	if(name2.value ==""){
		name2.focus();
		alert('이름을 입력해주세요');
		return false
	}
	if(email1.value ==""){
		email1.focus();
		alert('이메일을 입력해주세요');
		return false
	}
	
	if(email2.value =='0'){
		email2.focus();
		alert('이메일을 선택해주세요');
		return false
	}  */
	// 체크박스 선택확인
	if(check_1.checked != true){
		check_1.focus();
		alert('개인정보 수집 및 제3자 제공 동의해주세요');
		return false;
	} 
	document.frm.action="orderOk.jsp";
	document.frm.submit();
}
</script>
</body>
</html>