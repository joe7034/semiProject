package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.UsersVO;

public class UsersDAO {

	//String driver = "com.mysql.cj.jdbc.Driver";
	String driver = "oracle.jdbc.driver.OracleDriver";
	//db1.cgesbq1ho1wr.ap-northeast-2.rds.amazonaws.com
	//String url = "jdbc:mysql://db1.cgesbq1ho1wr.ap-northeast-2.rds.amazonaws.com:3306/semidb";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null; 
	
	public UsersDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버연결실패");
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	
	public ArrayList<UsersVO> selectAll(){ // 전부 불러오기 
		ArrayList<UsersVO> list = new ArrayList<UsersVO>(); 
		sb.setLength(0);
		sb.append("select id, pwd, name, email, phone, gender, pfood, addrs, useyn, rgdate, buy, point, grade ");
		sb.append("from users"); 
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery(); 
			while(rs.next()) {
				String id = rs.getString("id"); 
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email =  rs.getString("email");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");
				String pfood = rs.getString("pfood");
				String addrs = rs.getString("addrs");
				int useyn = rs.getInt("useyn");
				String rgdate = rs.getString("rgdate");
				int buy = rs.getInt("buy"); 
				int point = rs.getInt("point");
				int grade = rs.getInt("grade"); 
				UsersVO vo = new UsersVO(id, pwd, name, email, phone, gender, pfood, addrs, useyn, rgdate, buy, point, grade);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list; 
	}
	
	public UsersVO selectOne(String id) { // 해당아이디 정보 불러오기
		UsersVO vo = null; 
		sb.setLength(0);
		sb.append("select id, pwd, name, email, phone, gender, pfood, addrs, useyn, rgdate, buy, point, grade ");
		sb.append("from users "); 
		sb.append("where id =?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email =  rs.getString("email");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");
				String pfood = rs.getString("pfood");
				String addrs = rs.getString("addrs");
				int useyn = rs.getInt("useyn");
				String rgdate = rs.getString("rgdate");
				int buy = rs.getInt("buy"); 
				int point = rs.getInt("point");
				int grade = rs.getInt("grade"); 
				vo = new UsersVO(id, pwd, name, email, phone, gender, pfood, addrs, useyn, rgdate, buy, point, grade);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return vo; 
	}
	
	public boolean isExists(String id){ // id중복확인
		sb.setLength(0);
		sb.append("select id, pwd ");
		sb.append("from users ");
		sb.append("where id=?");
		boolean isOk = false; 
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery(); 
			isOk = rs.next(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isOk; 
	}
	
	public void insertOne(UsersVO vo) { // 가입
		

		sb.setLength(0);
		sb.append("insert into users "); 
		sb.append("values( ?, ?, ?, ?, ?, ?, ?, ? , default, default, ?, ?, ?)");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getPfood());
			pstmt.setString(7, vo.getPfood());
			pstmt.setString(8, vo.getAddrs());
			pstmt.setInt(9, vo.getBuy());
			pstmt.setInt(10, vo.getPoint());
			pstmt.setInt(11, vo.getGrade());
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public void updateOne(UsersVO vo) {

		sb.setLength(0);
		sb.append("update users set grade=? where id = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			pstmt.setInt(1, vo.getGrade());
			pstmt.setString(2, vo.getId());

			pstmt.executeUpdate();
			System.out.println("update 완료");

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