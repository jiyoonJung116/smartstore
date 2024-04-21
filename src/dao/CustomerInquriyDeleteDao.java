package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerInquriyDeleteDao {
	
	public void delete(String seller_id,int serial_number) {
		Connection conn = Jdbc.connect();
		String sql = "DELETE FROM customer_inquiry WHERE seller_id = ? AND serial_number=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			pstmt.setInt(2,serial_number);
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
