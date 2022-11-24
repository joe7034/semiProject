package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	int rno;
	String rid;
	String title;
	String content;
	String photo;
	String regdate;
}
