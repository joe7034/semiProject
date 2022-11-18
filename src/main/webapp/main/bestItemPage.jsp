<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>bestItemPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_best"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>		
const bestProducts = [
		{
		img: '../images/ctgImg/chickensalad.jpg',
	    pname: '닭가슴살 샐러드',
	    pno: 1,
	    price: 7000,
	    discount: 10,
	    ctgno: 1,
	    sale: true,
	    hot: true,
	   
	  }
		,
	  
	  {
	    img: '../images/ctgImg/hamsalad.jpg',
	    pname: '이탈리안햄샐러드',
	    pno: 11,
	    price: 8000,
	    discount: 10,
	    ctgno: 1,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/greensalad.jpg',
	    pname: '그린샐러드',
	    pno: 14,
	    price: 4000,
	    discount: 10,
	    ctgno: 1,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken07.jpg',
	    pname: '닭가슴살 볼 치즈맛 100g',
	    pno: 27,
	    price: 1890,
	    discount: 0,
	    ctgno: 3,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken11.jpg',
	    pname: '닭가슴살 소시지 오리지널',
	    pno: 31,
	    price: 2600,
	    discount: 10,
	    ctgno: 3,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken14.jpg',
	    pname: '그릴 닭가슴살볼 숯불갈비맛',
	    pno: 34,
	    price: 2700,
	    discount: 10,
	    ctgno: 3,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/dosirak12.jpg',
	    pname: '곤드레 나물밥&미니 떡갈비',
	    pno: 47,
	    price: 5000,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/dosirak15.jpg',
	    pname: '나시고랭&닭가슴살 소시지',
	    pno: 50,
	    price: 5000,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: true,
	  },
	  {
		    img: '../images/ctgImg/gonceral1.jpg',
		    pname: '배부른 볶은곤약 시리얼',
		    pno: 58,
		    pno: 1,
		    price: 7500,
		    discount: 10,
		    ctgno: 5,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/ptshake41.jpg',
		    pname: '하루단백 다이어트 쉐이크 4가지맛',
		    pno: 65,
		    price: 18500,
		    discount: 10,
		    ctgno: 6,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/ptshake61.jpg',
		    pname: '디에트데이 단백질 쉐이크 고구마맛',
		    pno: 67,
		    price: 60000,
		    discount: 10,
		    ctgno: 6,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/snack2.jpg',
		    pname: '맛있닭 닭가슴살 고백칩 바베큐 30g',
		    pno: 72,
		    price: 12400,
		    discount: 10,
		    ctgno: 7,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/snack7.jpg',
		    pname: '올헬씨 프로틴바 초코맛 57g',
		    pno: 77,
		    price: 22800,
		    discount: 10,
		    ctgno: 7,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/dairy1.jpg',
		    pname: '1am 그릭요거트 플레인 100g',
		    pno: 81,
		    price: 11400,
		    discount: 10,
		    ctgno: 8,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/dairy3.jpg',
		    pname: '알뜰두유 고칼슘 (1BOX) 190ml',
		    pno: 83,
		    price: 10500,
		    discount: 10,
		    ctgno: 8,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/dairy4.jpg',
		    pname: '연세우유 가볍다 우유 190ml',
		    pno: 84,
		    price: 14400,
		    discount: 10,
		    ctgno: 8,
		    sale: true,
		    hot: true,
		  },
		  {
			    img: '../images/ctgImg/dairy9.jpg',
			    pname: '[케미킹] 리코타치즈 수제치즈 3종',
			    pno: 89,
			    price: 8900,
			    discount: 10,
			    ctgno: 8,
			    sale: true,
			    hot: true,
			  },
			  {
			    img: '../images/ctgImg/gonramen1.jpg',
			    pname: '칼칼하다 곤약라면',
			    pno: 56,
			    price: 2500,
			    discount: 10,
			    ctgno: 5,
			    sale: true,
			    hot: true,
			  },
			  {
			    img: '../images/ctgImg/balsamic.jpg',
			    pname: '저칼로리발사믹드레싱',
			    pno: 15,
			    price: 3200,
			    discount: 10,
			    ctgno: 2,
			    sale: true,
			    hot: true,
			  },
			  {
			    img: '../images/ctgImg/oriental.jpg',
			    pname: '저칼로리오리엔탈드레싱',
			    pno: 16,
			    price: 3200,
			    discount: 10,
			    ctgno: 2,
			    sale: true,
			    hot: true,
			  },
	];


	
 	 const pListSection = document.getElementById('productList');
 	 const productItem = new ProductItem(pListSection);
 	
 	function getDiscountPrice(price,discount) {
 		 const discountPrice =  price - (price * (discount/100));
 		 
 		 return parseInt(discountPrice);
 	 }
 	 
 	function ProductItem(pListSection) {
  		const bestList = pListSection.querySelector('.product_best');
  		const premiumList = pListSection.querySelector('.product_premium');

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
				 
	
		return "<div class='product_item'><a href ='productDetail.jsp?pno="+item.pno+"'><div class='product_item_img'> <img src='"+item.img + "'/></div></a> <span class='product_item_name'>" + item.pname + "</span> <div class='product_item_price'>" + priceValue + "</div><div class='product_item_info'>"+saleValue + hotValue + "</div></div>"}).join('');
		             
		return titleValue+ "<div class='product_items'>"+ test + "</div>";
		     };
  		
  		
 		const render = () => {
 			bestList.innerHTML = updateProductFnc(bestProducts, '샐러드래곤 베스트 인기상품');
 			premiumList.innerHTML = updateProductFnc(premiumProducts, '샐러드래곤 프리미엄 샐러드');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>