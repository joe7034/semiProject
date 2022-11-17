<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	#allProduct, #productClear, #footerbtn { padding: 11px 25px;}
	#allProduct{margin-left: 140px; background-color: #264d73; color: #fff; font-weight: bold; font-size: 12pt;}
	#productClear{background-color: gray; color: #fff; font-weight:  bold; font-size: 12pt;}
	.aa:hober{ cursor: pointer;}
	
</style>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body class="sijunBody">
	<div id="container">
		<jsp:include page="header.jsp"></jsp:include>
		
	</div>
	<div id="frame">
		<form>
			<div id="frame2">
				<span style="font-size: 16pt; font-weight: bold;">장바구니</span> <span
					class="home">홈>장바구니</span> <span> </span>
			</div>
			<br />
			<div>
				<table class="calculation1">
					<tr>
						<th class="aa">구매상품</th>
						<th style="width: 700px;"></th>
					</tr>
				</table>
			</div>
			<br />
			<%-- 상품정보 테이블 --%>
			<div>
				<table class="calculation1">
					<thead>
						<tr>
							<th colspan="10" style="text-align: left; padding-left: 10px;">장바구니 상품(1)</th>

						</tr>
						<tr>
							<th><input type="checkbox" name="checkbox" id="check" /></th>
							<th><span>이미지</span></th>
							<th style="width: 400px;"><span>상품정보</span></th>
							<th style="width: 50px;">판매가</th>
							<th>수량</th>
							<th style="width: 100px;">적립금</th>
							<th style="width: 100px;">배송구분</th>
							<th style="width: 50px;" >배송비</th>
							<th style="width: 50px;">합계</th>
							<th>선택</th>
						</tr>
					</thead>

					<tbody>
						<tr style="height: 90px; background-color: #fff;">
							<td
								style="text-align: left; text-align: center; border-right: none;">
								<input type="checkbox" name="checkbox" />
							</td>
							<td style="border-left: none; border-right: none;"><img
								style="width: 80%;" src="../images/dairy1.jpg"></td>
							<td
								style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">상품이름</td>
							<td><span style="padding-left: 10px;">0</span>원</td>
							<td style="width: 80px;"><input type="number"
								style="text-align: right; width: 43px; margin-bottom: 5px;"
								min="1" max="99" step="1" value="1" />
								<button class="btn default"
									style="border-radius: 3px; size: 10px;">변경</button></td>
							<td>-</td>
							<td>기본배송</td>
							<td>2,500<br />고정
							</td>
							<td><span>0</span>원</td>

							<td>
								<button class="btn default"
									style="border-radius: 3px; width: 90px; margin-bottom: 3px; font-size: 11px" >주문하기</button>
								<button class="btn default"
									style="border-radius: 3px; width: 90px; margin-bottom: 3px; font-size: 11px">관심상품등록</button>
								<button class="btn default"
									style="border-radius: 3px; width: 90px; margin-bottom: 3px; font-size: 11px">x삭제</button>
							</td>
						</tr>
					</tbody>

					<tfoot>
						<tr style="height: 60px;">
							<td colspan="5"
								style="border-right: none; text-align: left; padding-left: 10px;">
								<span>[기본배송]</span>
							</td>
							<td colspan="5"
								style="border-left: none; text-align: right; padding-right: 10px;">
								상품금액 <span>0</span> + <span>배송비 2,500 = 합계</span> &nbsp;<span
								style="font-weight: bold; font-size: 15pt">0</span>
							</td>
						</tr>
					</tfoot>
				</table>

				<div style="border: solid 1px #e0e0eb; padding: 15px 0;">
					<img src="#" alt=""
						style="margin-left: 5px; position: relative; top: 4.5px;" /> <span
						style="font-size: 10pt; color: gray;">할인 적용 금액은 주문서작성의
						결제금액에서 확인 가능합니다.</span>
				</div>
			</div>

			<div style="margin: 10px 0;">
				<span style="margin: 0 10px;" class="btnfLoat">선택상품을</span>
				<button class="btn default btnfLoat"
					style="background-color: gray; color: #fff;">x 삭제하기</button>
				&nbsp;

				<button class="btn default backBtn btnfLoat2" style="background-color: gray; color: #fff;">장바구니 비우기</button>
				<span class="clearboth"></span>
			</div>
			<br />
			<br />

			<table class="calculation2">
				<tr>
					<th>총 상품금액</th>
					<th>총 배송비</th>
					<th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
				</tr>
				
				<tr style="background: #fff;">
					<td style="padding: 22px 0"><span class="price">0</span></td>
					<td>+<span  class="price">0</span>원</td>
					<td>=<span  class="price">0</span>원</td>
				</tr>
				
			</table>
			<br />
			<br />

			<div align="center">
				<button class="btn default" id="allProduct">전체상품주문</button>
				<button class="btn default backBtn" id="ProductClear">선택상품주문</button>
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
				style="border: solid 1px #e0e0eb; height: 200px; font-size: 12pt; padding-left: 10px;">
				<br />장바구니 이용안내

				<ol>
					<li class="lifont"></li>
					<li class="lifont"></li>
					<li class="lifont"></li>
					<li class="lifont"></li>
					<li class="lifont"></li>
					<li class="lifont"></li>
				</ol>
			</div>
		</form>
	</div>
			<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>