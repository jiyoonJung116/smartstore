package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MainOrderDeliveryDto;


public class MainOrderDeliveryDao {
	public int mainod(String seller_id) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*) FROM product_order WHERE order_status='결제완료' AND seller_id =?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int paymentcnt=0;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			paymentcnt= rs.getInt("count(*)");
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
		return paymentcnt;
	}
	public int mainod2(String seller_id) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*) FROM product_order WHERE order_status='배송중' AND seller_id =?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int deliverycnt=0;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			deliverycnt= rs.getInt("count(*)");
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
		return deliverycnt;
	}
	public int mainod3(String seller_id) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*) FROM product_order WHERE order_status='배송완료' AND seller_id =?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int fdeliverycnt=0;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			fdeliverycnt= rs.getInt("count(*)");
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
		return fdeliverycnt;
	}
	//메인페이지 새로운 주문 확인 메소드
	public int mainod4(String seller_id) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*)"
				+ " FROM product_order"
				+ " WHERE pay_date >= SYSDATE - 7 AND seller_id =?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int neworder=0;
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			neworder= rs.getInt("count(*)");
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
		return neworder;
	}
}

