package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.OptionDto;
import dto.OptionNameDto;

public class OptionlistDao {
	public ArrayList<OptionDto> optionselect(String seller_id) {
		Connection conn = Jdbc.connect();
		ArrayList<OptionDto> optionList = new ArrayList<OptionDto>();
		String sql = "SELECT * FROM product_option WHERE pnumber IS NULL AND seller_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seller_id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String value = rs.getString("value");
				String name2 = rs.getString("name2");
				String value2 = rs.getString("value2");
				String name3 = rs.getString("name3");
				String value3 = rs.getString("value3");
				int price = rs.getInt("price");
				int amount = rs.getInt("amount");
				String sales_status = rs.getString("sales_status");
				
				OptionDto dto = new OptionDto(name,value,name2,value2,name3,value3,price,amount,sales_status);
				optionList.add(dto);
			}
		} catch (SQLException e) {
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
		return optionList;
	}
	public OptionNameDto optionnameselect(String seller_id) {
		Connection conn = Jdbc.connect();
		OptionNameDto dto = null;
		String sql = "SELECT DISTINCT name, name2, name3 FROM product_option WHERE pnumber IS NULL AND seller_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seller_id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String name2 = rs.getString("name2");
				String name3 = rs.getString("name3");
				dto = new OptionNameDto(name,name2,name3);
			}
		} catch (SQLException e) {
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
