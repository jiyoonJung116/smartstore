package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NoticeBoardDeleteDao {
	public void reviewdelete(int bno) {
		Connection conn =JdbcConn.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM board_list" + 
				" WHERE bno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bno);
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
