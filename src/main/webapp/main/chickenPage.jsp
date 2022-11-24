<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>chickenPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_chicken"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>
const chickenProducts = [
	  {
	    img: '../images/ctgImg/chicken01.jpg',
	    pname: '저염 스팀 닭가슴살 오리지널 100g',
	    pno: 21,
	    price: 1990,
	    discount: 0,
	    ctgno: 3,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken02.jpg',
	    pname: '소프트 닭가슴살 마늘맛 100g',
	    pno: 22,
	    price: 1990,
	    discount: 0,
	    ctgno: 3,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken03.jpg',
	    pname: '소프트 닭가슴살 고추맛 100g',
	    pno: 23,
	    price: 1990,
	    discount: 0,
	    ctgno: 3,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken04.jpg',
	    pname: '한입소스 닭가슴살 블랙소이 100g',
	    pno: 24,
	    price: 1990,
	    discount: 0,
	    ctgno: 3,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken05.jpg',
	    pname: '소스 통 닭가슴살 매콤칠리 100g',
	    pno: 25,
	    price: 1990,
	    discount: 0,
	    ctgno: 3,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/chicken06.jpg',
	    pname: '닭가슴살 볼 오리지널 100g',
	    pno: 26,
	    price: 1890,
	    discount: 0,
	    ctgno: 3,
	    sale: false,
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
		    img: '../images/ctgImg/chicken08.jpg',
		    pname: '닭가슴살 스테이크 오리지널 100g',
		    pno: 28,
		    price: 1590,
		    discount: 0,
		    ctgno: 3,
		    sale: false,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/chicken09.jpg',
		    pname: '닭가슴살 스테이크 야채맛 100g',
		    pno: 29,
		    price: 1650,
		    discount: 0,
		    ctgno: 3,
		    sale: false,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/chicken10.jpg',
		    pname: '닭가슴살 한끼 스테이크 치즈 100g',
		    pno: 30,
		    price: 1990,
		    discount: 0,
		    ctgno: 3,
		    sale: false,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/chicken11.jpg',
		    pname: '닭가슴살 소시지 오리지널',
		    pno: 31,
		    price: 2889,
		    discount: 10,
		    ctgno: 3,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/chicken12.jpg',
		    pname: '닭가슴살 소시지 구운마늘',
		    pno: 32,
		    price: 2889,
		    discount: 10,
		    ctgno: 3,
		    sale: true,
		    hot: true,
		  },
		  {
			    img: '../images/ctgImg/chicken13.jpg',
			    pname: '닭가슴살 소시지 매콤치즈',
			    pno: 33,
			    price: 2889,
			    discount: 10,
			    ctgno: 3,
			    sale: true,
			    hot: true,
			  },
			  {
			    img: '../images/ctgImg/chicken14.jpg',
			    pname: '그릴 닭가슴살볼 숯불갈비맛',
			    pno: 34,
			    price: 3000,
			    discount: 10,
			    ctgno: 3,
			    sale: true,
			    hot: true,
			  },
			  {
			    img: '../images/ctgImg/chicken15.jpg',
			    pname: '그릴 닭가슴살볼 깻잎가득',
			    pno: 35,
			    price: 3000,
			    discount: 10,
			    ctgno: 3,
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
  		const chickenList = pListSection.querySelector('.product_chicken');

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
 			chickenList.innerHTML = updateProductFnc(chickenProducts, '\u00a0');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>