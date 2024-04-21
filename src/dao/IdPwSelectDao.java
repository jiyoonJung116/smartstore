package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class IdPwSelectDao {
	public boolean id_pw_select(String id, String phone) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String test = "SELECT count(*) FROM member WHERE id= ? AND phone = ?";
		int cnt = 0;
		boolean b = false;
		try {
			pstmt = conn.prepareStatement(test);
			pstmt.setString(1,id);
			pstmt.setString(2,phone);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(test);
			cnt = 0;
			while(rs.next()) {
				cnt= rs.getInt("count(*)");
				if(cnt==1) {
					b=true;
				}
			} 
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			try {
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return b;
	}
	// 비밀번호 변경 메소드
	public void pwUpdate(String pw,String id,String phone) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET pw=? WHERE id=?";
		try {
			if(id_pw_select(id,phone)) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pw);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
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
