package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TalkDao {
	public Connection getConnection() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project3";
		String dbPw = "3500";

		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void chat(String sellerId, String customerId, String senderId, String chat) {
		Connection conn = getConnection();

		String sql = "INSERT INTO talktalk_content(serial_num,seller_id,talk_num,sender_id, talk_time, read_status,talk_content)"
				+ " VALUES (seq_talktalk_content.nextval, ?,"
				+ " (SELECT talk_num FROM talktalk_list WHERE customer_id = ? AND seller_id=?),"
				+ "?,sysdate,0,?)";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerId);
			pstmt.setString(2, customerId);
			pstmt.setString(3, sellerId);
			pstmt.setString(4, senderId);
			pstmt.setString(5, chat);
			pstmt.executeUpdate();
		} catch (SQLException e) {
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
