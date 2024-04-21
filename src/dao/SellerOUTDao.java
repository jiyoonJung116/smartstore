package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class SellerOUTDao {
	public boolean check(String id, String pw) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String test = "SELECT count(*) FROM member WHERE id = ? AND pw = ?";
		
		boolean b= false;
		try {
			pstmt = conn.prepareStatement(test);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(test);
			int cnt = 0;
			while(rs.next()) {
				cnt = rs.getInt("count(*)");
			}
			if(cnt == 1) {
				b = true;
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
		return b;
	}
	// 아이디와 패스워드 카운트하는 메서드를 이용해 탈퇴여부를 업데이트하는 메서드
	// 파라미터 (String, String) : 아이디, 패스워드
	public void selUpdate(String id, String pw) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		try {
			if(check(id,pw)) {
				String sql = "UPDATE member SET leave = '탈퇴' WHERE id = ? AND pw = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setString(2,pw);
				pstmt.executeUpdate();
			}else {
			
			}
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
