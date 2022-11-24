<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>dairyPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_dairy"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>
const dairyProducts = [
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
	    img: '../images/ctgImg/dairy2.jpg',
	    pname: '1am 그릭요거트 블루베리 130g',
	    pno: 82,
	    price: 14550,
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
	    hot: false,
	  },
	  {
	    img: '../images/ctgImg/dairy5.jpg',
	    pname: 'hy 오리지널 야쿠르트 65ml',
	    pno: 85,
	    price: 4400,
	    discount: 10,
	    ctgno: 8,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/dairy6.jpg',
	    pname: '그릭데이 그릭요거트 시그니처 100g',
	    pno: 86,
	    price: 3300,
	    discount: 10,
	    ctgno: 8,
	    sale: true,
	    hot: true,
	  },
	  {
		    img: '../images/ctgImg/dairy7.jpg',
		    pname: '바디랩 국산콩 순수 서리태 맥주효모 두유 190ml',
		    pno: 87,
		    price: 17900,
		    discount: 10,
		    ctgno: 8,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/dairy8.jpg',
		    pname: '바디랩 순수두유 1박스 24팩 구성',
		    pno: 88,
		    price: 16900,
		    discount: 10,
		    ctgno: 8,
		    sale: true,
		    hot: false,
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
			    img: '../images/ctgImg/dairy10.jpg',
			    pname: '[자연원] 블루베리 요거트 1000g',
			    pno: 90,
			    price: 9900,
			    discount: 10,
			    ctgno: 8,
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
  		const dairyList = pListSection.querySelector('.product_dairy');

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
 			dairyList.innerHTML = updateProductFnc(dairyProducts, '\u00a0');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>