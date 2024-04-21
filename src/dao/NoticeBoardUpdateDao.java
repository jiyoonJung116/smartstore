package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NoticeBoardUpdateDao {
	public void reviewupdate(String title, String content, int bno) {
		Connection conn =JdbcConn.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE board_list" + 
					" SET title=?, content = ?,writedate= SYSDATE" + 
					" WHERE bno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2, content);
			pstmt.setInt(3,bno);
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
