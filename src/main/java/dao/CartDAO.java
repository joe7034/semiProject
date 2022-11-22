package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.CartVO;
import vo.ProductsVO;
import vo.UsersVO;

public class CartDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public CartDAO() {
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
	
	public ArrayList<CartVO> selectAll(String id){ // 전부 불러오기 
		ArrayList<CartVO> list = new ArrayList<CartVO>(); 
		sb.setLength(0);
		sb.append("select * from cart ");
		sb.append("where id=? "); 
		sb.append("order by cno desc"); 
		System.out.println("전부");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				int cno = rs.getInt("cno");
				int pno = rs.getInt("pno");
				int qty = rs.getInt("qty");
				int price = rs.getInt("price"); 
				CartVO vo = new CartVO(cno, id, pno, price, qty);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list; 
	}	
	public CartVO selectOne(String id, int pno) {
		sb.setLength(0);
		sb.append("select cno, id, pno, qty, price from cart ");
		sb.append("where id=? and pno=? ");
		CartVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("값 있음");
				int cno = rs.getInt("cno");
				int qty = rs.getInt("qty");
				int price = rs.getInt("price"); 
				System.out.println(" dao inner cno : " + cno);
				System.out.println(" dao inner qty : " + qty);
				vo = new CartVO(cno, id, pno, price, qty);
				// vo 생성자의 순서 
				System.out.println(" dao inner vo.getQty() : " + vo.getQty());
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}
	public int cartQty(String id, int pno) {
		sb.setLength(0);
		sb.append("select qty from cart ");
		sb.append("where id=? and pno=?");
		System.out.println("수량");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pno);
			rs = pstmt.executeQuery(); 
			if (rs.next()){
				int cqty = rs.getInt("qty");
				if ( cqty > 0 ) {
					return cqty;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0; 
	}
	
	public boolean isExists(String id, int pno){ // cart 중복확인
		sb.setLength(0);
		sb.append("select id,pno ");
		sb.append("from cart ");
		sb.append("where id=? and pno=?");
		boolean isOk = false; 
		System.out.println("있는지");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);			
			pstmt.setInt(2,pno);			
			rs = pstmt.executeQuery(); 
			isOk = rs.next(); // 기존 상품이 존재함 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isOk; // 없음 false
	}
	public void insertOne(String id, int pno, int qty) { // 추가
		System.out.println("추가");
		sb.setLength(0);
		sb.append("insert into cart "); 
		sb.append("values( cart_cno_seq.nextval, ? , ?,  ?, 0 )");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setInt(2, pno);
			pstmt.setInt(3, qty);
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	public void cartUpdate( String id ,int pno, int qty) { // 수정
		System.out.println("수정");
		sb.setLength(0);
		sb.append("update cart ");
		sb.append("set qty=? ");
		sb.append("where pno=? and id=?");
		System.out.println("여까진 오케이");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, qty);
			pstmt.setInt(2, pno);
			pstmt.setString(3, id);
			System.out.println("여까지도 오케이");
			pstmt.executeUpdate();  
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("수정불가");
	}
	
	public void deleteOne(int cno) {
		sb.setLength(0);
		sb.append("delete from cart ");
		sb.append("where cno=? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, cno);
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if (rs != null )rs.close();
			if (pstmt != null )pstmt.close();
			if (conn != null )conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
