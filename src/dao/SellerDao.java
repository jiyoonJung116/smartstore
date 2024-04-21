package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.SellerDto;
import dto.StoreDto;


public class SellerDao {
	public SellerDto select(String id) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member m, money mn, category c"
				+ " WHERE m.p_main_cg = c.category_id AND m.id = mn.id AND m.id = ?";
		SellerDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				String name = rs.getString("name");
				String workplace = rs.getString("workplace_address");
				String bank = rs.getString("bank");
				String bankNum = rs.getString("bank_num");
				String large = rs.getString("large");
				String releaseAddress = rs.getString("release_address");
				String returnAddress = rs.getString("return_address");
				String phone = rs.getString("phone");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				dto = new SellerDto(name, workplace, bank, bankNum, large, releaseAddress, returnAddress, phone, birth, email);
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
		return dto;
	}
	
	public StoreDto selectName(String id) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM store_management WHERE seller_id = ?";
		StoreDto dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				String store_name = rs.getString("store_name");
				String store_main_image = rs.getString("store_main_image");
				String store_introduce = rs.getString("store_introduce");
				String logo = rs.getString("logo");
				
				dto = new StoreDto(store_name,store_main_image,store_introduce,logo);
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
		return dto;
	}
	public void nameupdate(String seller_id,String store_introduce, String newname) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE store_management SET store_name = ?, store_introduce = ? WHERE seller_id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newname);
			pstmt.setString(2, store_introduce);
			pstmt.setString(3, seller_id);
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
	public void selUpdate(String id, String name, String workPlace, String releaseAddress, String returnAddress, int categoryNum) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET name=?, workplace_address=?, release_address=?, return_address=?, p_main_cg=? WHERE id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, workPlace);
			pstmt.setString(3, releaseAddress);
			pstmt.setString(4, returnAddress);
			pstmt.setInt(5, categoryNum);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void memUpdate(String id, String bank, String bank_num) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE money SET bank=?, bank_num=? WHERE id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bank); 
			pstmt.setString(2, bank_num);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
