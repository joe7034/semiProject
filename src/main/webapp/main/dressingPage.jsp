<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>dressingPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_dressing"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>
const dressingProducts = [
	  {
	    img: '../images/ctgImg/balsamic.jpg',
	    pname: '저칼로리 발사믹 드레싱',
	    price: 3200,
	    discount: 0,
	    ctgno: 2,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/oriental.jpg',
	    pname: '저칼로리 오리엔탈 드레싱',
	    price: 3200,
	    discount: 0,
	    ctgno: 2,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/american.jpg',
	    pname: '저칼로리 아메리칸시저 드레싱',
	    price: 3000,
	    discount: 0,
	    ctgno: 2,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/italian.jpg',
	    pname: '저칼로리 이탈리안 드레싱',
	    price: 3000,
	    discount: 0,
	    ctgno: 2,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/yogurtdressing.jpg',
	    pname: '저칼로리 요구르트 드레싱',
	    price: 2800,
	    discount: 0,
	    ctgno: 2,
	    sale: false,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/mustard.jpg',
	    pname: '저칼로리 머스타드 드레싱',
	    price: 3000,
	    discount: 0,
	    ctgno: 2,
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
  		const dressingList = pListSection.querySelector('.product_dressing');

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
 			dressingList.innerHTML = updateProductFnc(dressingProducts, '샐러드 드레싱');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>