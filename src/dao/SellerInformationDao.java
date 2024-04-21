package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.*;

public class SellerInformationDao {
	public SellerInformationDto select(String id) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM member m, money mn, category c"
				+ " WHERE m.p_main_cg = c.category_id AND m.id = mn.id AND m.id = ?";
		SellerInformationDto dto = null;
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
				dto = new SellerInformationDto(name, workplace, bank, bankNum, large, releaseAddress, returnAddress);
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
}
