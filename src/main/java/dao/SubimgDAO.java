package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.SubimgVO;

public class SubimgDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	public SubimgDAO() {
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
	
	public SubimgVO selectOne(int pno) {
		SubimgVO vo = null; 
		sb.setLength(0);
		sb.append("select * from subimg ");
		sb.append("where pno=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int ino = rs.getInt("ino");
				String img1 = rs.getString("img1");
				String img2 = rs.getString("img2");
				String img3 = rs.getString("img3");
				String img4 = rs.getString("img4");
				vo = new SubimgVO(ino, pno, img1, img2, img3, img4);		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo; 
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
