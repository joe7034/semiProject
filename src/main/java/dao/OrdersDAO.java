package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.OrdersVO;

public class OrdersDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public OrdersDAO() {
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
	
	public void insertOne(OrdersVO vo) {
		sb.setLength(0);
		sb.append("insert into orders ");
		sb.append("values( orders_ono_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate,?)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getTAmt()); 
			pstmt.setInt(3, vo.getOpoint());
			pstmt.setInt(4, vo.getFAmt());
			pstmt.setString(5, vo.getOname());
			pstmt.setString(6, vo.getOphone());
			pstmt.setString(7, vo.getOpost());
			pstmt.setString(8, vo.getOaddrs1());
			pstmt.setString(9, vo.getOaddrs2());
			pstmt.setInt(10, vo.getStatus());
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
