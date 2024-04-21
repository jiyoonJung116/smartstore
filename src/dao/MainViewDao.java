package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MainViewDto;

public class MainViewDao {
		public int mainReview(String seller_id) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT COUNT(*) FROM review WHERE buyer_grade <= 2 AND seller_id = ?";
			
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int buyer_count=0;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			buyer_count = rs.getInt("count(*)");
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return buyer_count;
	}
		public int mainReview2(String seller_id) {
			Connection conn = Jdbc.connect();
			String sql = "SELECT COUNT(*) FROM review WHERE REVIEW_REGISTRATION_DATE >= SYSDATE - 7 AND seller_id=?";
				
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int reviewcnt=0;
			try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reviewcnt = rs.getInt("count(*)");
			}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return reviewcnt;
		}
}
