package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductsVO {
	int pno,kcal,price,cost,discount,ctgno,sell,stock;
	String pname,pcontent,img,pdate;
	
	public ProductsVO(int pno, int kcal, int price, int cost, int discount, int ctgno, int sell, int stock,
			String pname, String pcontent, String img, String pdate) {
		super();
		this.pno = pno;
		this.kcal = kcal;
		this.price = price;
		this.cost = cost;
		this.discount = discount;
		this.ctgno = ctgno;
		this.sell = sell;
		this.stock = stock;
		this.pname = pname;
		this.pcontent = pcontent;
		this.img = img;
		this.pdate = pdate;
		
		
	}

	public ProductsVO(int sell) {
		super();
		this.sell = sell;
	}
	
	
}
