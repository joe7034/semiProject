package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ProductsVO;
import vo.Sell_ItemVO;
import vo.UsersVO;

public class ProductsDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public ProductsDAO() {
		try {
			// 2.드라이버로딩
			Class.forName(driver);
			// 3.Connection 객체 생성
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<ProductsVO> selectAll() {
		ArrayList<ProductsVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("select * from products ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pno = rs.getInt("pno");
				int kcal = rs.getInt("kcal");
				int price = rs.getInt("price");
				int cost = rs.getInt("cost");
				int discount = rs.getInt("discount");
				int ctgno = rs.getInt("ctgno");
				int sell = rs.getInt("sell");
				int stock = rs.getInt("stock");
				String pname = rs.getString("pname");
				String pcontent = rs.getString("pcontent");
				String img = rs.getString("img");
				String pdate = rs.getString("pdate");
				ProductsVO vo = new ProductsVO(pno, kcal, price, cost, discount, ctgno, sell, stock, pname, pcontent,
						img, pdate);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	public ProductsVO selectOne(int pno) {
		sb.setLength(0);
		sb.append("select * from products WHERE pno = ? and ROWNUM <= 6 ORDER BY sell DESC ");
		ProductsVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				
				int kcal = rs.getInt("kcal");
				int price = rs.getInt("price");
				int cost = rs.getInt("cost");
				int discount = rs.getInt("discount");
				int ctgno = rs.getInt("ctgno");
				int sell = rs.getInt("sell");
				int stock = rs.getInt("stock");
				String pname = rs.getString("pname");
				String pcontent = rs.getString("pcontent");
				String img = rs.getString("img");
				String pdate = rs.getString("pdate");
				vo = new ProductsVO(pno, kcal, price, cost, discount, ctgno, sell, stock, pname, pcontent,
						img, pdate);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}
	
	public void insertOne(ProductsVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO products values(?,?,?,?,?,?,?,?,?,0,?,null) ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPno());
			pstmt.setInt(2, vo.getKcal());
			pstmt.setString(3, vo.getPname());
			pstmt.setInt(4, vo.getPrice());
			pstmt.setInt(5, vo.getCost());
			pstmt.setInt(6, vo.getDiscount());
			pstmt.setInt(7, vo.getCtgno());
			pstmt.setString(8, vo.getPcontent());
			pstmt.setString(9, vo.getImg());
			pstmt.setInt(10, vo.getStock());
			
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("insert완료");
	}
	
	public void updateOne(ProductsVO vo) {

		sb.setLength(0);
		sb.append("update products set stock=? where pno = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getStock());
			pstmt.setInt(2, vo.getPno());

			pstmt.executeUpdate();
			System.out.println("update 완료");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public void updateOne(int pno, int qty) {
		sb.setLength(0);
		sb.append("update products set stock=(select stock-? " );
		sb.append("from products where pno=?) ");
		sb.append("where pno=?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, qty);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, pno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ProductsVO selectProduct(int cno) { // 카트번호에 맞는 상품 불러오기 
		ProductsVO vo = null;
		sb.setLength(0);
		// vo부르기 => select * from products where pno = (select pno from cart where cno=11);
		sb.append("select * from products ");
		sb.append("where pno=(select pno from cart ");
		sb.append("where cno=?)");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int pno=rs.getInt("pno"); 
				int kcal = rs.getInt("kcal");
				int price = rs.getInt("price");
				int cost = rs.getInt("cost");
				int discount = rs.getInt("discount");
				int ctgno = rs.getInt("ctgno");
				int sell = rs.getInt("sell");
				int stock = rs.getInt("stock");
				String pname = rs.getString("pname");
				String pcontent = rs.getString("pcontent");
				String img = rs.getString("img");
				String pdate = rs.getString("pdate");
				vo = new ProductsVO(pno, kcal, price, cost, discount, ctgno, sell, stock, pname, pcontent,
						img, pdate);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	public ArrayList<ProductsVO> selectSearch(String search) {
		ArrayList<ProductsVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("select * from products where pname LIKE ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pno = rs.getInt("pno");
				int kcal = rs.getInt("kcal");
				int price = rs.getInt("price");
				int cost = rs.getInt("cost");
				int discount = rs.getInt("discount");
				int ctgno = rs.getInt("ctgno");
				int sell = rs.getInt("sell");
				int stock = rs.getInt("stock");
				String pname = rs.getString("pname");
				String pcontent = rs.getString("pcontent");
				String img = rs.getString("img");
				String pdate = rs.getString("pdate");
				ProductsVO vo = new ProductsVO(pno, kcal, price, cost, discount, ctgno, sell, stock, pname, pcontent,
						img, pdate);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}