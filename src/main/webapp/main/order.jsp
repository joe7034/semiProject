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
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");  
		/* 로그인되면 세션에넣은 vo값보여주기 아니면 로그인창다시보여주기 */
/* 		Object obj1 = session.getAttribute("vo"); // obj로 쓰면 중복변수로 나타나서 obj1으로 바꿈 
		String id ="";  
		if(obj1!=null){            
			UsersVO uo = (UsersVO)obj;
			out.println( uo.getId());
			id = uo.getId();
		} else {
			response.sendRedirect( "login.jsp");
		} */
		String id = "aaaa9999"; 
		String no = request.getParameter("pno");  
		String count = request.getParameter("cnt"); 		
		String[] cnoList = request.getParameterValues("chk");
		out.println(cnoList[0]); 	
		out.println(cnoList[1]); 	
		/* out.println(no); 
		out.println(count);  */	
	
		
	%>
<div class="order-box">
<div class="order-bgcolor">
<div class="order-boxwrp">
	<!-- 타이틀 -->
	<div class="order-title">
		<h1 class="order-title-text">주문 / 결제</h1>
	</div>
	<div class="order-info-wrp">
		<div class="order-wrp-left">
			<!-- 배송 정보 -->
			<div class="left-section-info left-section-box">
				<h3 class="title-delivery">배송 정보</h3>
				<div class="delivery-condition">
					<div class="delivery-name">
						<input type="text" name="name1" id="name1" placeholder="받으시는 분">
					</div>
					<div class="delivery-tel">
						<input type="text" name="tel" id="tel" placeholder="연락처">
					</div>
					<div class="delivery-addrs">
						<input type="text" name="post" id="post" size="7" placeholder="우편번호">
						<input type="button" value="주소찾기" id="btn" style="margin-bottom:5px;"><br>
						<input type="text" name="addrs" id="addrs" size="30" placeholder="주소" style="margin-bottom:5px;"><br>
						<input type="text" name="addrs2" size="30" placeholder="상세주소">
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
						<input type="text" name="name2" id="name2" placeholder="이름">
					</div>
					<div class="delivery-user-tel">
						<input type="text" name="tel" id="tel" placeholder="연락처">
					</div>
					<div class="delivery-user-email">
						<input type="text" name="email1" id="email1" placeholder="이메일"> @
						<input type="text" name="email2" id="email2" placeholder="직접입력" disabled="disabled"><select name="selectEmail" id="selectEmail">
							<option value="" selected>직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
					</div>
				</div>
				<!-- 주문자 정보 끝 -->
			</div>
			<!-- 배송,주문자 정보 끝 -->
			<!-- 배송하는 상품 -->
			<div class="section-order-info left-section-box">
				<h3 class="shipping-product">배송 상품</h3>
				<div class="shipping-product-img">
					<img src="../images/rabbit1.png" alt="" style="border: 1px solid black;" class="imgs">
					<ul class="shipping-product-item">
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
					</ul>
				</div>
			</div> 
			<!-- 배송하는 상품 끝 -->
<%-- 			 <%

		 			
			 %> --%>
			<!-- 포인트 -->
			<div class="order-user-point">
				<h3 class="title-user-point">포인트</h3>
				<div class="user-point">
					<input title="보유" class="" type="text" name="user_point" data-group="point" autocomplete="off" disabled="" value="0" data-apply_point="0">
					<!-- 비활성화시 disabled 추가 -->
					<a class="" href="javascript:">
						<i class="btl"></i>
					</a>
					<a href="javascript:" class="btn btn-primary btn-sm">전액사용</a>
				</div>
					<!-- 비활성화시 disabled 추가 -->
				<p class="hold_point">
					보유 포인트
					<strong>2,000</strong>
				</p>
				<p class="no-magin text-gray text-13">
					1,000 포인트 이상 보유 및 20,000원 이상 구매시 사용가능
				</p>
			</div>
			<!-- 포인트 끝 -->
			<!-- 결제 수단 -->
			<div class="section-payment-info right-section-box">
				<h3 class="section-payment-info-title">결제수단</h3>
				<ul class="payment-type-list">
					<li class="payment-type-item">
						<input type="radio" name="pay-type-item" value="mutong">
						<span class="mg15">무통장 입금</span>
					</li>
					<li class="payment-type-item">
						<input type="radio" name="pay-type-item" value="card">
						<span class="mg15">카드결제</span>
					</li>
				</ul>
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
						<strong class="expectde-price-value">0원</strong>
					</li>
					<li class="expected-price-item">
						<span class="expected-price-title">할인된 금액</span>
						<strong class="expectde-price-value">0원</strong>
					</li>
					<li class="expected-price-item">
						<span class="expected-price-title">사용 포인트</span>
						<strong class="expectde-price-value">0Point</strong>
					</li>
					<li class="expected-price-item">
						<span class="expected-price-title">배송비</span>
						<strong class="expectde-price-value">0원</strong>
					</li>
				</ul>
				<p class="total-expected-price">
					<span class="total-expected-price-title">총 결제 예상금액</span>
					<strong class="total-expected-price-value">0원</strong>
				</p>
				<div class="personal-information">
					<input type="checkbox" name="check_1" id="check_1">
					 <span>
						개인정보 수집 이용 및 제 3자 제공 동의 (필수)
					 </span>
				</div>
				<button class="btn-order" onclick="request_to_check();">주문완료</button>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<%-- <%

			 %> --%>
<%@ include file="footer.jsp"%>
<script type="text/javascript">
function request_to_check(){
	if(name1.value ==""){
		name1.focus();
		alert('받으시는 분의 이름을 입력해주세요');
		return false
	}
	if(tel.value ==""){
		tel.focus();
		alert('연락처를 입력해주세요');
		return false
	}
	if(post.value =="" || addrs.value ==""){
		addrs.focus();
		alert('주소를 찾아주세요');
		return false
	} 
	if(addrs2.value == ""){
		addrs2.focus();
		alert('상세주소를 입력해주세요');
		return false
	}
	if(name2.value ==""){
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
	} 
	// 체크박스 선택확인
	if(check_1.checked != true){
		check_1.focus();
		alert('개인정보 수집 및 제3자 제공 동의해주세요');
		return false
	} 
}
</script>
</body>
</html>