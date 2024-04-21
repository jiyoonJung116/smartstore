package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.MainProductDto;

public class MainProductDao {
	public int mainproduct(String seller_id) {
		Connection conn = Jdbc.connect();
//		ArrayList<MainProductDto> mainp = new ArrayList<MainProductDto>();
		String sql = "SELECT count(*) FROM product WHERE sales_status = '판매중' AND seller_id=?";
				  
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int salescnt = 0;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			salescnt = rs.getInt("count(*)");
//			MainProductDto dto = new MainProductDto(salescnt);
//			mainp.add(dto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
				rs.close();
				if(pstmt!=null)
				pstmt.close();
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return salescnt;
	}
	public int mainproduct2(String seller_id) {
		Connection conn = Jdbc.connect();
//		ArrayList<MainProductDto> mainp = new ArrayList<MainProductDto>();
		String sql = "SELECT COUNT(*) FROM product WHERE amount=0 AND seller_id =?";
				  
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int amount = 0;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			amount = rs.getInt("count(*)");
//			MainProductDto dto = new MainProductDto(salescnt);
//			mainp.add(dto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
				rs.close();
				if(pstmt!=null)
				pstmt.close();
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return amount;
	}
}
