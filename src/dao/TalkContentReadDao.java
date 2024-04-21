package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class TalkContentReadDao {
	public void talklist(long serial_num,int read_status) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE talktalk_content SET read_status=?"
					+ " WHERE serial_num= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, read_status);
			pstmt.setLong(2, serial_num);
			pstmt.executeUpdate();
		}catch (SQLException e) {
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
