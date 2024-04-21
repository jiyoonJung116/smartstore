package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	public boolean overlab(String id) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String test = "SELECT count(*) FROM member WHERE id= ?";
		int cnt = 0;
		boolean b = false;
		try {
			pstmt = conn.prepareStatement(test);
			pstmt.setString(1,id);
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
	//중복확인 후 아이디 생성 메서드
	public void member(String id, String pw, String name, String birth, String gender,String email,
				String phone,String release_address,String return_address) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member(id,pw,name,birth,gender,email,phone,release_address,return_address,join_date)"
				+" VALUES(?,?,?,TO_DATE(?,'YYYY-MM-DD'),?,?,?,?,?,SYSDATE)";
			try {	
				if(overlab(id)) {
					System.out.println("중복된 아이디가 있습니다. 다시 입력하세요 ");
				} else {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,id);
					pstmt.setString(2,pw);
					pstmt.setString(3,name);
					pstmt.setString(4,birth);
					pstmt.setString(5,gender);
					pstmt.setString(6,email);
					pstmt.setString(7,phone);
					pstmt.setString(8,release_address);
					pstmt.setString(9,return_address);
					pstmt.executeUpdate();
					System.out.println("아이디가 생성되었습니다.");
				}
			}
		 catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)
				 pstmt.close();
				if(conn!=null)
				 conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void store_manage(String id, String store_name, String store_introduce, String phone) {
	Connection conn = Jdbc.connect();
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO store_management(seller_id,store_name,store_introduce, cs_telnumber) values(?,?,?,(select phone from member where id=?))";
		try {	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setString(2,store_name);
				pstmt.setString(3,store_introduce);
				pstmt.setString(4,phone);
				pstmt.executeUpdate();
		}
	 catch(SQLException e) {
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
