package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.FreeProductDto;
import dto.자유상품상세검색Dto;

public class SsFreeProductDisplayhHompage {
	public ArrayList<FreeProductDto> get자유상품List() {
		Connection conn = Jdbc.connect();

		ArrayList<FreeProductDto> listFreeProduct = new ArrayList<FreeProductDto>();
		String sql = "SELECT p.pname, p.price, p.image" + 
				" FROM freeproduct_add_delete fad, product p" + 
				" WHERE p.pnumber=fad.dp";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = null;
		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				String image = rs.getString("image");
				
				FreeProductDto free = new FreeProductDto(image, pname, price);
				listFreeProduct.add(free);
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
		return listFreeProduct;
	}

}
