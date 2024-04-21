package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class ExchangeInsertUpDao {	//교환데이터 삽입
	public void insert(String sellerId, long pon, String reason, int optionCode, int exchangeAmount, String address) {
		Connection conn = Jdbc.connect();

		PreparedStatement pstmt = null;

		try {
			String sql = "INSERT INTO exchange(seller_id, product_order_num, exchange_processing_status,exchange_collection_method,"
					+ " exchange_request_date, exchange_reason, redelivery_status, exchange_payment,"
					+ " exchange_option_code,exchange_amount, buyer_exchange)"
					+ " VALUES (?, ?,'교환요청', '수거정보없음(구매자 미입력)', sysdate, ?,'배송준비', '신용카드', ?, ?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerId);
			pstmt.setLong(2, pon);
			pstmt.setString(3, reason);
			pstmt.setInt(4, optionCode);
			pstmt.setInt(5, exchangeAmount);
			pstmt.setString(6, address);
			pstmt.executeUpdate();
			pstmt.close();
			
			String sql2 = "UPDATE product_order SET claim_status = '교환' WHERE product_order_num = ?"
					+ " AND EXISTS ( SELECT * FROM exchange WHERE product_order_num = ? )";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setLong(1, pon);
			pstmt.setLong(2, pon);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void inColleciton(String cd, long invoice, long pon) {	//수거중
		Connection conn = Jdbc.connect();
		String sql = "UPDATE exchange"
				+ " SET collection_delivery=?,collection_invoice_date=?, collection_status='수거중',exchange_approval_date=sysdate "
				+ "	WHERE product_order_num=?";

		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cd);
			pstmt.setLong(2, invoice);
			pstmt.setLong(3, pon);
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

	public void completeColleciton(String rm, String rd, long rid, long pon) {	//수집완료
		Connection conn = Jdbc.connect();
		String sql = "UPDATE exchange"
				+ " SET redistribution_method=?, redistribution_delivery=?,redistribution_invoice_date=?,collection_completion_date=sysdate"
				+ " WHERE product_order_num=?";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rm);
			pstmt.setString(2, rd);
			pstmt.setLong(3, rid);
			pstmt.setLong(4, pon);
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

	public void completeExchange(long pon) {		//교환완료
		Connection conn = Jdbc.connect();
		String sql = "UPDATE exchange" + " SET exchange_completed_date = sysdate, redistribution_date=sysdate"
				+ " WHERE product_order_num=?";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pon);
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

}

