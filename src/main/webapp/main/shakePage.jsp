<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>shakePage</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section class="product_container" id="productList">
		<section class="product_shake"></section>
	</section>
	<%@ include file="footer.jsp"%>
	<script>
const shakeProducts = [
	  {
	    img: '../images/ctgImg/ptshake11.jpg',
	    pname: '유청단백질 퓨어WPI프로틴 카카오',
	    pno: 62,
	    price: 45000,
	    discount: 0,
	    ctgno: 6,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/ptshake21.jpg',
	    pname: '단백질 머슬킹80 프로틴 유청단백질가루',
	    pno: 63,
	    price: 50000,
	    discount: 0,
	    ctgno: 6,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/ptshake31.jpg',
	    pname: '마이바디 다이어트 프로틴 쉐이크 3종',
	    pno: 64,
	    price: 37000,
	    discount: 0,
	    ctgno: 6,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/ptshake41.jpg',
	    pname: '하루단백 다이어트 쉐이크 4가지맛',
	    pno: 65,
	    price: 18500,
	    discount: 0,
	    ctgno: 6,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/ptshake51.jpg',
	    pname: '이지프로틴 초코 단백질쉐이크 250ml x 18',
	    pno: 66,
	    price: 37500,
	    discount: 0,
	    ctgno: 6,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/ptshake61.jpg',
	    pname: '디에트데이 단백질 쉐이크 고구마맛',
	    pno: 67,
	    price: 60000,
	    discount: 0,
	    ctgno: 6,
	    sale: false,
	    hot: true,
	  },
	  {
		    img: '../images/ctgImg/ptshake71.jpg',
		    pname: '간편하게 한끼 뚝닭! 닭가슴살 쉐이크',
		    pno: 68,
		    price: 70000,
		    discount: 0,
		    ctgno: 6,
		    sale: false,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/ptshake81.jpg',
		    pname: '프로틴어스 4242 쉐이크 1BOX (5개입)',
		    pno: 69,
		    price: 15000,
		    discount: 0,
		    ctgno: 6,
		    sale: false,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/ptshake91.jpg',
		    pname: '한장의 식단 단백질쉐이크 식사대용 40g',
		    pno: 70,
		    price: 3500,
		    discount: 0,
		    ctgno: 6,
		    sale: false,
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
  		const shakeList = pListSection.querySelector('.product_shake');

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
 			shakeList.innerHTML = updateProductFnc(shakeProducts, '\u00a0');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>