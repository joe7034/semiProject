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
	
	//로그인
	public UsersVO isExists(String id, String pwd) {
		
		// id와 pwd를 가지고 있는 사람의 데이터를 vo로 리턴.
		sb.setLength(0);
		sb.append("select id, pwd, name, email, phone, gender, pfood, addrs, useyn, rgdate, buy, point, grade FROM USERS ");
		sb.append("WHERE id = ? and pwd = ? ");
		UsersVO vo = null;
		
		try {
		// 문장 객체
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			//로그인 성공
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
		} catch (SQLException e){
			e.printStackTrace();
		}
		return vo; // vo null 이라면 존재하지 않은 회원
		// vo 에 참조값이 있으면 존재하는 회원
		
	}
	// 아이디찾기
	public String findId(String name, String email) {
		String id = null;
		sb.setLength(0);
		sb.append("select id from users ");
		sb.append("where name = ? and email = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}
	
	// 비밀번호 찾기
	public String findPw(String id, String name, String email) {
		String pwd = null;
		sb.setLength(0);
		sb.append("select pwd from users ");
		sb.append("where id = ? and name = ? and email = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pwd = rs.getString("pwd");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pwd;
	}
	
	public void insertOne(UsersVO vo) { // 가입
		
//		<회원가입 (닉네임, 생년월일 제외)> 
//		+회원테이블 만들때는 컬럼 no추가해서 시퀀스랑 연결짓기 + 드래곤페이 포인트 컬럼도 이 테이블에 추가할지도?
//		1-6까지는 필수로 선택하게 하기(not null) 
//		1. 아이디(8-15) + 중복확인버튼 primary key
//		2. 비밀번호 (type=password) + ( 6-16 영문, 숫자, 특수문자 1개이상씩 필수 )
//		   비밀번호확인 (type=password)
//		3. 이름(2자이상- 한글가능 )
//		4. 전화번호 
//		5. 이메일 select문 써서 daum.net, naver.com 이런거 고를수있도록,
//		6. 성별 (radio) 
//		7. 선호하는음식(checkbox)-> 1개이상은 꼭 체크하도록
//		---------------------------------------------------------------
		sb.setLength(0);
		sb.append("insert into users "); 
		// 아이디 비밀번호 이름 이메일 전화번호 성별 선호음식 주소 탈퇴여부 가입일 누적구매수 포인트 권한등급
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
	
	public void deleteOne(UsersVO vo) {
		sb.setLength(0);
		sb.append("delete from users ");
		sb.append("where id = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());

			rs = pstmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public int getPoint(String id) {
		int point=0; 
		sb.setLength(0);
		sb.append("select point from users ");
		sb.append("where id=?");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				point = rs.getInt("point");
				System.out.println("point : " +point); 
				return point;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return point; 
	}
	
	public void updatePoint(String id, int currentPoint) {
		sb.setLength(0);
		sb.append("update users ");
		sb.append("set point=? ");
		sb.append("where id=?");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setInt(1, currentPoint);
			pstmt.setString(2, id);
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
