package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ProductReviewDto;
import dto.ReviewDto;

public class ProductReviewDao { //상품명, 상품주문번호 불러오는 dao
	public Connection getConnection() throws Exception{
	    String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project3";
		String dbPw = "3500";
		
		Class.forName(driver); 
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		return conn;
	}
	public ArrayList<ProductReviewDto> review_select(long pnumber,String buyer_id,int reviewNum) {
		Connection conn = Jdbc.connect();
		ArrayList<ProductReviewDto> review_select = new ArrayList<ProductReviewDto>();
		String sql = "SELECT p.pname, po.product_order_num, review_num" + 
				" FROM product p, product_order po, review r" + 
				" WHERE p.pnumber = po.pnumber AND r.product_order_num = po.product_order_num" + 
				" AND p.pnumber =? AND buyer_id=? AND r.review_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,pnumber);
			pstmt.setString(2, buyer_id);
			pstmt.setInt(3, reviewNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			String pname = rs.getString("pname");
			Long product_order_num = rs.getLong("product_order_num");
			int review_num = rs.getInt("review_num");
			ProductReviewDto dto = new ProductReviewDto(pname, product_order_num,review_num);
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
	public ArrayList<ProductReviewDto> review_select(long pnumber,String buyer_id) {
		Connection conn = Jdbc.connect();
		ArrayList<ProductReviewDto> review_select = new ArrayList<ProductReviewDto>();
		String sql = "SELECT p.pname, po.product_order_num" + 
				" FROM product p, product_order po" + 
				" WHERE p.pnumber = po.pnumber" + 
				" AND p.pnumber =? AND buyer_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,pnumber);
			pstmt.setString(2, buyer_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String pname = rs.getString("pname");
				Long product_order_num = rs.getLong("product_order_num");
				ProductReviewDto dto = new ProductReviewDto(pname, product_order_num);
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
}

