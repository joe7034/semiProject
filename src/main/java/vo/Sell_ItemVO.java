package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Sell_ItemVO {
	int pno;
	String sell_date;
	int qty;
	int price;

}
