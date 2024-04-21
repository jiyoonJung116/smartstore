package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewUpdateDao {
	public void reviewupdate(String review_content,int reviewNum,Long product_order_num) {
		Connection conn =Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE review" + 
				" SET review_content = ?,final_modify= SYSDATE" + 
				" WHERE review_num = ? AND product_order_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,review_content);
			pstmt.setInt(2, reviewNum);
			pstmt.setLong(3,product_order_num);
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
