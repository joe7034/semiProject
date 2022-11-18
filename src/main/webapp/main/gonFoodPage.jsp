<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>gonFoodPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_gonFood"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>
const gonFoodProducts = [
	  {
	    img: '../images/ctgImg/gontteok.jpg',
	    pname: '닭가슴살 통밀곤약 떡볶이 210g x 10팩',
	    pno: 51,
	    price: 36000,
	    discount: 10,
	    ctgno: 5,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/gonkim1.jpg',
	    pname: '곤약 김말이 400g',
	    pno: 52,
	    price: 25000,
	    discount: 10,
	    ctgno: 5,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/gongel1.jpg',
	    pname: '엘라스틴 콜라겐 곤약젤리 120ml 10팩+10',
	    pno: 53,
	    price: 10000,
	    discount: 10,
	    ctgno: 5,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/gonpap1.jpg',
	    pname: '가벼운 곤약팝콘3종',
	    pno: 54,
	    price: 1500,
	    discount: 10,
	    ctgno: 5,
	    sale: true,
	    hot: false,
	  },
	  {
	    img: '../images/ctgImg/gonrice1.jpg',
	    pname: '곤약 즉석밥',
	    pno: 55,
	    price: 1000,
	    discount: 0,
	    ctgno: 5,
	    sale: false,
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
		    img: '../images/ctgImg/gonchalba1.jpg',
		    pname: '쫀득쫀득 곤약찰바 4종',
		    pno: 57,
		    price: 5000,
		    discount: 10,
		    ctgno: 5,
		    sale: true,
		    hot: false,
		  },
		  {
		    img: '../images/ctgImg/gonceral1.jpg',
		    pname: '배부른 볶은곤약 시리얼',
		    pno: 58,
		    price: 7500,
		    discount: 10,
		    ctgno: 5,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/gonjeolpyeon1.jpg',
		    pname: '곤약 절편 2종',
		    pno: 59,
		    price: 6800,
		    discount: 10,
		    ctgno: 5,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/gondumpling1.jpg',
		    pname: '닭가슴살 곤약잡채만두',
		    pno: 60,
		    price: 7600,
		    discount: 10,
		    ctgno: 5,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/gongimbap1.jpg',
		    pname: '샐러드만큼 가벼운 저염 곤약김밥 3종 ',
		    pno: 61,
		    price: 3500,
		    discount: 10,
		    ctgno: 4,
		    sale: true,
		    hot: false,
		  }
	];

	
 	 const pListSection = document.getElementById('productList');
 	 const productItem = new ProductItem(pListSection);
 	
 	function getDiscountPrice(price,discount) {
 		 const discountPrice =  price - (price * (discount/100));
 		 
 		 return parseInt(discountPrice);
 	 }
 	 
 	function ProductItem(pListSection) {
  		const gonFoodList = pListSection.querySelector('.product_gonFood');

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
 			gonFoodList.innerHTML = updateProductFnc(gonFoodProducts, '\u00a0');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>