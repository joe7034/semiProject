<%@page import="vo.ProductsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductsDAO"%>
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
			
		
      	<%
		  String search1 = request.getParameter("search");
		  String search = "%"+search1+"%";
		  ProductsDAO dao = new ProductsDAO();
		  ArrayList<ProductsVO> list = dao.selectSearch(search);
			for (ProductsVO vo : list) {
					
		%>
      <script>
const snackProducts = [
	  {
	    img: '../images/ctgImg/<%=vo.getImg() %>',
	    pname: '<%=vo.getPname() %>',
	    pno: <%=vo.getPno() %>,
	    price: <%=vo.getPrice() %>,
	    discount: <%=vo.getDiscount() %>,
	    ctgno: <%=vo.getCtgno() %>,
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
				 
	
		return "<div class='product_item'><a href ='productDetail.jsp?pno="+item.pno+"'><div class='product_item_img'> <img src='"+item.img + "'/></div></a> <span class='product_item_name'>" + item.pname + "</span> <div class='product_item_price'>" + priceValue + "</div><div class='product_item_info'>"+saleValue + hotValue + "</div></div>"}).join('');
            
  	    return titleValue+ "<div class='product_items'>"+ test + "</div>";
  	      	  	  };
  		
  		
 		const render = () => {
 			snackList.innerHTML = updateProductFnc(snackProducts, '\u00a0');
 		}
 	 render();
 	
}
 	
</script>

		<% 				
			}
		%>
		
</body>
</html>