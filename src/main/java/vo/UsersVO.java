package vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UsersVO {
	String id;
	String pwd;
	String name;
	String email;
	String phone;
	String gender;
	String pfood;
	String addrs;
	int useyn;
	String rgdate;
	int buy;
	int point;
	int grade;
	public UsersVO(String id, String pwd, String name, String email, String phone, String gender, String pfood,
			String addrs, int useyn, String rgdate, int buy, int point, int grade) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.pfood = pfood;
		this.addrs = addrs;
		this.useyn = useyn;
		this.rgdate = rgdate;
		this.buy = buy;
		this.point = point;
		this.grade = grade;
	}
	
	
}
