package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
	
public class SsFreeProductAddRemoveDao {
	public void freeDisplayU(String id, long prNumber) {	//자유상품 추가
		Connection conn = Jdbc.connect();
		String sql = "INSERT INTO freeproduct_add_delete(display_order, seller_id, dp)"
				  + " VALUES (SEQ_FREE.nextval,?,?)";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setLong(2, prNumber);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}	
		}
	}

	public void freeDisplayD(int displayOrder) {	//자유상품 삭제
		Connection conn = Jdbc.connect();
		String sql = "DELETE FROM freeproduct_add_delete WHERE display_order =?";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, displayOrder);
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
