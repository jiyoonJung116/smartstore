package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ReviewDto;

public class ReviewDao {
	public Connection getConnection() throws Exception{
	    String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project3";
		String dbPw = "3500";
		
		Class.forName(driver); 
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		return conn;
	}
	public ArrayList<ReviewDto> review_select(String seller_id, String date, String date2) {
		Connection conn = Jdbc.connect();
		ArrayList<ReviewDto> review_select = new ArrayList<ReviewDto>();
		String sql = "SELECT *" + 
				" FROM review" + 
				" WHERE seller_id = ? AND TO_CHAR(review_registration_date, 'YYYY-MM-DD') BETWEEN ? AND ?" + 
				" ORDER BY review_num";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			pstmt.setString(2,date);
			pstmt.setString(3,date2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			Long product_order_num = rs.getLong("product_order_num");
			String review_division = rs.getString("review_division");
			int buyer_grade = rs.getInt("buyer_grade");
			String photo_video = rs.getString("photo_video");
			String review_content = rs.getString("review_content");
			Date review_registration_date2 = rs.getDate("review_registration_date");
			Date fi_modify = rs.getDate("final_modify");
			Long review_num = rs.getLong("review_num");
			String review_display_status = rs.getString("review_display_status");
			ReviewDto dto = new ReviewDto(product_order_num, review_division,buyer_grade, photo_video,
					review_content,review_registration_date2, fi_modify, review_num,review_display_status);
			review_select.add(dto);
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
		return review_select;
    }
	public ArrayList<ReviewDto> review_select2(long pnumber, int pageNum) {
		Connection conn = Jdbc.connect();
		ArrayList<ReviewDto> review_select = new ArrayList<ReviewDto>();
		String sql = "SELECT r2.*" + 
				" FROM (" + 
				"    SELECT rownum rnum, r1.*" + 
				"    FROM (" + 
				"        SELECT *" + 
				"        FROM review" + 
				"        ORDER BY review_num DESC" + 
				"    ) r1" + 
				") r2" + 
				" WHERE r2.rnum >= ? AND r2.rnum <= ?" + 
				" AND r2.product_order_num IN (" + 
				"    SELECT po.product_order_num" + 
				"    FROM product_order po" + 
				"    WHERE po.pnumber = ?" + 
				")" + 
				" ORDER BY r2.review_registration_date";
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
		    pstmt.setInt(2, endNum);
		    pstmt.setLong(3, pnumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int buyer_grade = rs.getInt("buyer_grade");
				String photo_video = rs.getString("photo_video");
				String review_content = rs.getString("review_content");
				Date review_registration_date2 = rs.getDate("review_registration_date");
				int reviewNum = rs.getInt("review_num");
				ReviewDto dto = new ReviewDto(buyer_grade, photo_video, review_content, review_registration_date2,reviewNum);
				review_select.add(dto);
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
		return review_select;
	}
	public ArrayList<ReviewDto> review_select3(long pnumber, int reviewNumber) {
		Connection conn = Jdbc.connect();
		ArrayList<ReviewDto> review_select = new ArrayList<ReviewDto>();
		String sql = "SELECT * " + 
				" FROM review r, product_order po" + 
				" WHERE r.product_order_num = po.product_order_num" + 
				" AND po.pnumber=? AND review_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			pstmt.setInt(2, reviewNumber);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int buyer_grade = rs.getInt("buyer_grade");
				String photo_video = rs.getString("photo_video");
				String review_content = rs.getString("review_content");
				Date review_registration_date2 = rs.getDate("review_registration_date");
				int reviewNum = rs.getInt("review_num");
				Long product_order_num = rs.getLong("product_order_num");
				ReviewDto dto = new ReviewDto(buyer_grade, photo_video, review_content, review_registration_date2,reviewNum,product_order_num);
				review_select.add(dto);
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
		return review_select;
	}
	public int countByReview(long pnumber){   //리뷰수
		Connection conn = Jdbc.connect();
		
		String sql = "SELECT count(*)" + 
				" FROM review r, product_order po" + 
				" WHERE po.product_order_num = r.product_order_num" + 
				" AND pnumber = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int reviewCount = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				reviewCount = rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try{
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return reviewCount;
	}
}

