<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>saladPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_premium"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>
      const premiumProducts = [
    	  {
    	    img: '../images/ctgImg/chickensalad.jpg',
    	    pname: '닭가슴살 샐러드',  
    	    pno: 1,
    	    price: 7000,
    	    discount: 10,
    	    ctgno: 1,
    	    sale: true,
    	    hot: true ,
    	  },   
    	  {
    	    img: '../images/ctgImg/crammysalad.jpg',
    	    pname: '크래미샐러드',
    	    pno: 2,
    	    price: 7000,
    	    discount: 10,
    	    ctgno: 1,
    	    sale: true,
    	    hot: true,
    	  },
    	  {
    	    img: '../images/ctgImg/cheesesalad.jpg',
    	    pname: '치즈샐러드',
    	    pno: 3,
    	    price: 6000,
    	    discount: 10,
    	    ctgno: 1,
    	    sale: true,
    	    hot: true,
    	  },
    	  {
    	    img: '../images/ctgImg/bulgogisalad.jpg',
    	    pname: '불고기샐러드',
    	    pno: 4,
    	    price: 7500,
    	    discount: 10,
    	    ctgno: 1,
    	    sale: true,
    	    hot: true,
    	  },
    	  {
    		    img: '../images/ctgImg/viennasalad.jpg',
    		    pname: '닭가슴살비엔나샐러드',
    		    pno: 5,
    		    kcal: 100,
    		    price: 7500,
    		    discount: 10,
    		    ctgno: 1,
    		    sale: true,
    		    hot: true,
    		  },
    		  {
    		    img: '../images/ctgImg/pastasalad.jpg',
    		    pname: '파스타샐러드',
    		    pno: 6,
    		    price: 7000,
    		    discount: 10,
    		    ctgno: 1,
    		    sale: true,
    		    hot: true,
    		  },
    		  {
    		    img: '../images/ctgImg/orisalad.jpg',
    		    pname: '훈제오리샐러드',
    		    pno: 7,
    		    price: 8500,
    		    discount: 10,
    		    ctgno: 1,
    		    sale: true,
    		    hot: true,
    		  },
    		  {
    		    img: '../images/ctgImg/tacosalad.jpg',
    		    pname: '멕시칸타코샐러드',
    		    pno: 8,
    		    price: 9000,
    		    discount: 10,
    		    ctgno: 1,
    		    sale: true,
    		    hot: true,
    		  },
    		  {
    	    	    img: '../images/ctgImg/peppersalad.jpg',
    	    	    pname: '갈릭페퍼로스트닭가슴살샐러드',
    	    	    pno: 9,
    	    	    kcal: 100,
    	    	    price: 9000,
    	    	    discount: 10,
    	    	    ctgno: 1,
    	    	    sale: true,
    	    	    hot: true,
    	    	  },
    	    	  {
    	    	    img: '../images/ctgImg/chilisalad.jpg',
    	    	    pname: '레드칠리로스트닭가슴살샐러드',
    	    	    pno: 10,
    	    	    price: 8000,
    	    	    discount: 10,
    	    	    ctgno: 1,
    	    	    sale: true,
    	    	    hot: true,
    	    	  },
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
    	    	    img: '../images/ctgImg/cornsalad.jpg',
    	    	    pname: '페퍼콘닭가슴살샐러드',
    	    	    pno: 12,
    	    	    price: 9000,
    	    	    discount: 10,
    	    	    ctgno: 1,
    	    	    sale: true,
    	    	    hot: true,
    	    	  },
    	    	  {
    	    		    img: '../images/ctgImg/ggatip.jpg',
    	    		    pname: '닭가슴살볼깻잎샐러드',
    	    		    pno: 13,
    	    		    kcal: 100,
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
    	    		  } 	 
    	];
    	
     	 const pListSection = document.getElementById('productList');
     	 const productItem = new ProductItem(pListSection);
     	
     	function getDiscountPrice(price,discount) {
     		 const discountPrice =  price - (price * (discount/100));
     		 
     		 return parseInt(discountPrice);
     	 }
     	 
     	function ProductItem(pListSection) {
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
     			premiumList.innerHTML = updateProductFnc(premiumProducts, '샐러드래곤 프리미엄 샐러드');
     		}
     	 render();
    }
     	
    </script>
</body>
</html>