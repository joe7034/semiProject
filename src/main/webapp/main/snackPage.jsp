<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>snackPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_snack"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>
const snackProducts = [
	  {
	    img: '../images/ctgImg/snack1.jpg',
	    pname: '맛있닭 닭가슴살 고백칩 오리지널 30g',
	    price: 12400,
	    discount: 10,
	    ctgno: 7,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/snack2.jpg',
	    pname: '맛있닭 닭가슴살 고백칩 바베큐 30g',
	    price: 12400,
	    discount: 10,
	    ctgno: 7,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/snack3.jpg',
	    pname: '잇메이트 오븐에 구운 닭가슴살 칩 오리지널 25g',
	    price: 5900,
	    discount: 10,
	    ctgno: 7,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/snack4.jpg',
	    pname: '프로틴어스 곡물 프로틴칩',
	    price: 7900,
	    discount: 10,
	    ctgno: 7,
	    sale: true,
	    hot: false,
	  },
	  {
	    img: '../images/ctgImg/snack5.jpg',
	    pname: '프로틴어스 곡물 크리스피롤 50g',
	    price: 9800,
	    discount: 10,
	    ctgno: 7,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/snack6.jpg',
	    pname: '테이스틴 단백질구이칩 25g',
	    price: 2900,
	    discount: 10,
	    ctgno: 7,
	    sale: true,
	    hot: true,
	  },
	  {
		    img: '../images/ctgImg/snack7.jpg',
		    pname: '올헬씨 프로틴바 초코맛 57g',
		    price: 22800,
		    discount: 10,
		    ctgno: 7,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/snack8.jpg',
		    pname: '프로엠 비건 단백질 오란다 스낵 & 비건 오트밀 소라형 과자 100g',
		    price: 15900,
		    discount: 10,
		    ctgno: 7,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/snack9.jpg',
		    pname: '레지나 무설탕 프로틴 다크 초콜릿 시리얼&아몬드 27g',
		    price: 11000,
		    discount: 10,
		    ctgno: 7,
		    sale: true,
		    hot: true,
		  },
		  {
			    img: '../images/ctgImg/snack10.jpg',
			    pname: '헬푸 단백이 카카오 쿠키 45g',
			    price: 22100,
			    discount: 10,
			    ctgno: 7,
			    sale: true,
			    hot: true,
			  }
	];

	
 	 const pListSection = document.getElementById('productList');
 	 const productItem = new ProductItem(pListSection);
 	
 	function getDiscountPrice(price,discount) {
 		 const discountPrice =  price - (price * (discount/100));
 		 
 		 return parseInt(discountPrice);
 	 }
 	 
 	function ProductItem(pListSection) {
  		const snackList = pListSection.querySelector('.product_snack');

  		const updateProductFnc = (productItems, title) => {
  			const titleValue = title ? "<h2>"+title+"</h2>" : '';
  			let saleValue='';
  	  		let hotValue='';
  	  		let discountPrice = '';
  	  		let priceValue = '';
  	  		
  			const test = productItems.map((item) => {
				saleValue = item.sale ? "<span class='info_sale'>SALE</span>" : '' ;
				hotValue = item.hot ? "<span class='info_hot'>HOT</span>" : '' ;
				
				discountPrice = getDiscountPrice(item.price, item.discount);
				priceValue = item.discount ? "<span class='price_current'>" + discountPrice +"원</span><span class='price_default'>"+ item.price + "원</span>"
						: "<span class='price_current'>" + item.price +"원</span>"
				 
	
 			return "<div class='product_item'><div class='product_item_img'><img src='"+
 			item.img + "'/></div><span class='product_item_name'>" + 
 			item.pname + "</span> <div class='product_item_price'>" + priceValue + "</div><div class='product_item_info'>"+
 			saleValue + hotValue + "</div></div>"}).join('');
 				
  			return titleValue+ "<div class='product_items'>"+ test + "</div>";
  		};
  		
  		
 		const render = () => {
 			snackList.innerHTML = updateProductFnc(snackProducts, '\u00a0');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>