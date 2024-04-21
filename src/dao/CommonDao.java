package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.CommonDto;

public class CommonDao {
	public CommonDto colorselect(String seller_id) {
		Connection conn = Jdbc.connect();
		CommonDto dto = null;
		String sql = "SELECT * FROM ss_com_manage WHERE seller_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seller_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String color_theme = rs.getString("color_theme");
				String pc_gnb_location = rs.getString("pc_gnb_location");
				dto = new CommonDto(seller_id,color_theme,pc_gnb_location);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
}
