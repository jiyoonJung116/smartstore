package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewDeleteDao {
	public void reviewdelete(int reviewNum) {
		Connection conn =Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM review" + 
				" WHERE review_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,reviewNum);
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
