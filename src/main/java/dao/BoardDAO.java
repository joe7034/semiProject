package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardVO;

public class BoardDAO {
	// 멤버 변수
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "mj";
	String password = "7034";
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	
	// 기본생성자
	public BoardDAO() {
		
		try {
			// 2. 드라이버 로딩
			Class.forName(driver);
			// 3. Connection 객체생성
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("conn : "+conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결실패");
		}
	}	// constructor end
	
	public int getTotal() {
		
		sb.setLength(0);
		sb.append("SELECT COUNT(*) cnt FROM review ");
		int count = -1; // 기본값
		
		try {
			// 문장 객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			// 실행(select ==> ResultSet)
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return count;
	}

	// 전체 조회 ----------------------------------------------------
	public ArrayList<BoardVO> selectAll() {
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM review order by rno desc " );
		
		try {
			// 문장 객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			// 실행(select ==> ResultSet)
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			// 레코드별로 로직처리
				int rno = rs.getInt("rno");
				String rid = rs.getString("rid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String photo = rs.getString("photo");
				String regdate = rs.getString("regdate");
				
				BoardVO vo = new BoardVO(rno, rid, title, content, photo, regdate);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 게시물번호가 큰순으로 몇개 출력 ?
	public ArrayList<BoardVO> selectAll(int startNo, int endNo) {
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("select rn, rno, rid, title, content, photo, regdate ");
	      sb.append("from ( select rownum rn,rno, rid, title, content, photo, regdate ");
	      sb.append("      from (select rno, rid, title, content, photo, regdate ");
	      sb.append("      from review ");
	      sb.append("      order by rno desc) ");
	      sb.append("   where rownum <?) ");
	      sb.append("where rn >=? ");
		
		try {
			// 문장 객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			// 실행(select ==> ResultSet)
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			// 레코드별로 로직처리
				int rno = rs.getInt("rno");
				String rid = rs.getString("rid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String photo = rs.getString("photo");
				String regdate = rs.getString("regdate");
				
				BoardVO vo = new BoardVO(rno, rid, title, content, photo, regdate);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 1건 추가------------------------------------------
	public BoardVO selectOne(int rno) {
		
		// SQL문 작성
		sb.setLength(0);
		sb.append("SELECT * FROM review WHERE RNO = ? " );
		BoardVO vo = null;
		
		try {
			// 문장 객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, rno);
			// 실행(select ==> ResultSet)
			rs = pstmt.executeQuery();
			// 레코드별로 로직처리
			if(rs.next()) {
				String rid = rs.getString("rid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String photo = rs.getString("photo");
				String regdate = rs.getString("regdate");
				
				 vo = new BoardVO(rno, rid, title, content, photo, regdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	} // selectOne END --------------------------
	
	// 1건 조회 ------------------------------------------
	public void insertOne(BoardVO vo) {
		
		sb.setLength(0);
		sb.append("INSERT INTO review ");
		sb.append("VALUES (review_rno_seq.nextval,?,?,?,?,sysdate) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getRid());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPhoto());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 1건 추가 ------------------------------------------
	public void updateOne(BoardVO vo) {
		
		sb.setLength(0);
		sb.append("UPDATE review ");
		sb.append("SET rid = ?, title = ?, content = ? ");
		sb.append("WHERE rno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getRid());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getRno());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 1건 삭제 ------------------------------------------
	public void deleteOne(int rno) {
		// SQL문 작성
		sb.setLength(0);
		sb.append("DELETE FROM review WHERE RNO = ? ");
		
		try {
			// 문장 객체 생성
			pstmt = conn.prepareStatement(sb.toString());
			// ? 값 넣기
			pstmt.setInt(1, rno);
			// 실행(select ==> ResultSet 객채로 리턴)
			pstmt.executeUpdate();
			// 레코드별로 로직처리
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	} // deleteOne END --------------------------------
	// 자원반납 ----------------------------------------------
		public void close() {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
