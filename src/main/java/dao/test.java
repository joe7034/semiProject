package dao;

import vo.ProductsVO;

public class test {

	public static void main(String[] args) {
		
		ProductsDAO dao = new ProductsDAO();
		ProductsVO vo = dao.selectOne(3);
		
		System.out.println(vo.getSell());
		
		
		
	}

}
