<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/main.css" />
<title>dosirakPage</title>
</head>
<body>
	 <%@ include file="header.jsp"%>
	  <section class="product_container" id="productList">
        <section class="product_dosirak"></section>
      </section>
      <%@ include file="footer.jsp"%>
      <script>
const dosirakProducts = [
	  {
	    img: '../images/ctgImg/dosirak01.jpg',
	    pname: '퀴노아영양밥&닭가슴살 스테이크 230g',
	    pno: 36,
	    price: 5400,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/dosirak02.jpg',
	    pname: '현미곤약밥&미니함박 두부 스테이크 230g',
	    pno: 37,
	    price: 5400,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/dosirak03.jpg',
	    pname: '연근영양밥&두부미트볼 230g',
	    pno: 38,
	    price: 5400,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: false,
	  },
	  {
	    img: '../images/ctgImg/dosirak04.jpg',
	    pname: '단호박영양밥&닭가슴살 청양 스테이크 230g',
	    pno: 39,
	    price: 5400,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/dosirak05.jpg',
	    pname: '제주톳보리밥&소시지볼훈제맛 210g',
	    pno: 40,
	    price: 4800,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: true,
	  },
	  {
	    img: '../images/ctgImg/dosirak06.jpg',
	    pname: '중화볶음밥&굴림만두 고기 210g',
	    pno: 41,
	    price: 4800,
	    discount: 10,
	    ctgno: 4,
	    sale: true,
	    hot: true,
	  },
	  {
		    img: '../images/ctgImg/dosirak07.jpg',
		    pname: '황금볶음밥&굴림만두 김치 210g',
		    pno: 42,
		    price: 4800,
		    discount: 10,
		    ctgno: 4,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/dosirak08.jpg',
		    pname: '러브잇 베지밥&닭가슴살 볼 오징어 250g',
		    pno: 43,
		    price: 4800,
		    discount: 10,
		    ctgno: 4,
		    sale: true,
		    hot: false,
		  },
		  {
		    img: '../images/ctgImg/dosirak09.jpg',
		    pname: '고추잡채볶음밥&소프트안심 마늘 250g',
		    pno: 44,
		    price: 4800,
		    discount: 0,
		    ctgno: 4,
		    sale: false,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/dosirak10.jpg',
		    pname: '제주톳비빔밥&닭가슴살 새우 큐브 250g',
		    pno: 45,
		    price: 4800,
		    discount: 10,
		    ctgno: 4,
		    sale: true,
		    hot: true,
		  },
		  {
		    img: '../images/ctgImg/dosirak11.jpg',
		    pname: '다섯가지 나물밥&불고기 오믈렛',
		    pno: 46,
		    price: 5000,
		    discount: 10,
		    ctgno: 4,
		    sale: true,
		    hot: false,
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
			    img: '../images/ctgImg/dosirak13.jpg',
			    pname: '계란 새우볶음밥&고구마 닭가슴살 스테이크',
			    pno: 48,
			    price: 4800,
			    discount: 10,
			    ctgno: 4,
			    sale: true,
			    hot: true,
			  },
			  {
			    img: '../images/ctgImg/dosirak14.jpg',
			    pname: '탄두리 닭가슴살 현미밥&미트볼 스크램블',
			    pno: 49,
			    price: 4800,
			    discount: 10,
			    ctgno: 4,
			    sale: true,
			    hot: false,
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
			  }
	];

	
 	 const pListSection = document.getElementById('productList');
 	 const productItem = new ProductItem(pListSection);
 	
 	function getDiscountPrice(price,discount) {
 		 const discountPrice =  price - (price * (discount/100));
 		 
 		 return parseInt(discountPrice);
 	 }
 	 
 	function ProductItem(pListSection) {
  		const dosirakList = pListSection.querySelector('.product_dosirak');

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
 			dosirakList.innerHTML = updateProductFnc(dosirakProducts, '\u00a0');
 		}
 	 render();
 	
}
 	
</script>
</body>
</html>