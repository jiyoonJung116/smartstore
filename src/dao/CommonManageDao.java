package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class CommonManageDao {
	public void orderCon(String seller_id, String color, String location) {  //공통관리(색깔, PC GNB 위치 변경)
		Connection conn = Jdbc.connect();
		String sql = "UPDATE ss_com_manage SET color_theme = ?, pc_gnb_location = ? WHERE seller_id = ?";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, color);
			pstmt.setString(2, location);
			pstmt.setString(3, seller_id);
			
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
