package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrdersVO {
	int ono; 
	String id; 
	int tAmt; 
	int opoint; 
	int fAmt; 
	String oname; 
	String ophone; 
	String opost;
	String oaddrs1; 
	String oaddrs2; 
	String odate;
	int status;
}
