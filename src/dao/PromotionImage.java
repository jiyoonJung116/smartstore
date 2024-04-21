package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import dto.PromotionImageDto;
import dto.ReviewDto;

public class PromotionImage {

	public ArrayList<PromotionImageDto> select() {
		Connection conn = Jdbc.connect();
		ArrayList<PromotionImageDto> pimg_select = new ArrayList<PromotionImageDto>();
		String sql2 = "SELECT * FROM ss_promotion_image";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String sellerId = rs.getString("seller_id");
				String imageF = rs.getString("image_file_name");
				String subject = rs.getString("promotion_subject");
				int onOff = rs.getInt("on_off");
				PromotionImageDto dto = new PromotionImageDto(idx, sellerId,imageF, subject, onOff);
				pimg_select.add(dto);
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
		return pimg_select;
	}

	public void proImageInsert(String id,String image, String title) {
		Connection conn = Jdbc.connect();
		String sql = "INSERT INTO SS_PROMOTION_image(IDX, seller_id, image_file_name, promotion_subject, on_off)"
				+ " VALUES (seq_promotion_image.nextval, ?, ?, ?, 1)";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, image);
			pstmt.setString(3, title);
			pstmt.executeUpdate();
		} catch (SQLException e) {
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

	void proImageUpdate(int idx, int order, String image, String title, int num, String color) {
		Connection conn = Jdbc.connect();
		String sql = "UPDATE ss_promotion_image " 
				   + "SET sequence = ?, image_file_name = ?, promotion_subject = ?, on_off = ?, sub_color = ? "
				   + "WHERE idx = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order);
			pstmt.setString(2, image);
			pstmt.setString(3, title);
			pstmt.setInt(4, num);
			pstmt.setString(5, color);
			pstmt.setInt(6, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

}


