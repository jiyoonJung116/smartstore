package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NoticeBoardInsertDao {
	public void boardWriteInsert(String title, String content, String loginId) {
		Connection conn =JdbcConn.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO board_list (bno, title, content, writer_id, hitcount, writedate, nickname) " + 
				" VALUES (SEQ_BNO.nextval, ?, ?, ?, 0, sysdate, " + 
				" (SELECT nickname FROM member WHERE member_id=?))";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2, content);
			pstmt.setString(3, loginId);
			pstmt.setString(4, loginId);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			 e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void boardInsert(String title, String content, String photo) {
		Connection conn =JdbcConn.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO board_list (bno, title, content, writer_id, hitcount, writedate, nickname,photo) " + 
				" VALUES (SEQ_BNO.nextval, ?, ?, 'jjyjyd', 0, sysdate, " + 
				" (SELECT nickname FROM member WHERE member_id='jjyjyd'),?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2, content);
			pstmt.setString(3, photo);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void boardJoin(String memberId, String password, String username, String email, String nickname, String birth, String gender,String phone) {
		Connection conn =JdbcConn.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member(member_id, password, username, email, nickname, birth, gender, phone, join_date)" 
					+ " VALUES (?,?,?,?,?,?,?,?,SYSDATE)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,memberId);
			pstmt.setString(2, password);
			pstmt.setString(3, username);
			pstmt.setString(4, email);
			pstmt.setString(5, nickname);
			pstmt.setString(6, birth);
			pstmt.setString(7, gender);
			pstmt.setString(8, phone);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void writeComment(int bno, String writerId, String content) {
		Connection conn =JdbcConn.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO comments(rno, bno, writer_id, content, writedate)" + 
				" VALUES(SEQ_rno.nextval, ?, ?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bno);
			pstmt.setString(2, writerId);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
