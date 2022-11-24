package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ProductsVO;
import vo.Sell_ItemVO;

public class Sell_ItemDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;

	public Sell_ItemDAO() {
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

	public ArrayList<Sell_ItemVO> selectAll() {
		ArrayList<Sell_ItemVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("select * from Sell_Item ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pno = rs.getInt("pno");
				String sell_date = rs.getString("sell_date");
				int qty = rs.getInt("qty");
				int price = rs.getInt("price");
				Sell_ItemVO vo = new Sell_ItemVO(pno, sell_date, qty, price);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	
	
	public void insertOne(Sell_ItemVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO Sell_Item values(?,?,?,?) ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getPno());
			pstmt.setString(2, vo.getSell_date());
			pstmt.setInt(3, vo.getQty());
			pstmt.setInt(3, vo.getPrice());
			
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("insert완료");
	}
	
	public ArrayList<Sell_ItemVO> selectMonth(String month) {
		ArrayList<Sell_ItemVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("select * from Sell_Item where sell_date LIKE ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, month);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pno = rs.getInt("pno");
				String sell_date = rs.getString("sell_date");
				int qty = rs.getInt("qty");
				int price = rs.getInt("price");
				Sell_ItemVO vo = new Sell_ItemVO(pno, sell_date, qty, price);
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