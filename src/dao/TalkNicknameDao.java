package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TalkNicknameDao {
	public void nickname(long talk_num, String nickname) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE talktalk_list SET nickname=?"
					+ " WHERE talk_num= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,nickname);
			pstmt.setLong(2, talk_num);
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
