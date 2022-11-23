package dao;

import java.util.ArrayList;

import vo.ProductsVO;

public class test {

	public static void main(String[] args) {
		
		String search = "%닭가슴살%";
		ProductsDAO dao = new ProductsDAO();
		ArrayList<ProductsVO> list = dao.selectSearch(search);
			for (ProductsVO vo : list) {
		
		System.out.println(vo.getPname());
			}
		
		
		
	}

}
