package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class SsBestPUpdateDao {
	public void best_p(String seller_id,String s_con,String s_content) {
		Connection conn = Jdbc.connect();
		String a = "";
		if(s_con.equals("제목")) {
			a = "bestp_title=?";
		}
		if(s_con.equals("썸네일타입")) {
			a = "thumbnail_type = ?";
		}
		String sql = "UPDATE ss_best_p SET "+a+"WHERE seller_id= ?";
		PreparedStatement pstmt =null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_content);
			pstmt.setString(2, seller_id);
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
