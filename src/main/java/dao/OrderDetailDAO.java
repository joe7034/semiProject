package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.OrderDetailVO;

public class OrderDetailDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public OrderDetailDAO() {
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
	public void insertOne(OrderDetailVO vo) {
		System.out.println("주문상세 추가");
		sb.setLength(0);
		sb.append("insert into orderdetail "); 
		sb.append("values( orderdetail_mno_seq.nextval, ? , ?,  ? )");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getOno());
			pstmt.setInt(2, vo.getPno());
			pstmt.setInt(3, vo.getQty());
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
