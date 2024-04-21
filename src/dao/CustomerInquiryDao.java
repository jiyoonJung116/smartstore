package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.CustomerInquiryDto;


public class CustomerInquiryDao {
	public ArrayList<CustomerInquiryDto> select(String seller_id, String inquiry_date, Long pnumber, int startNum, int endNum)	{
		
		Connection conn = Jdbc.connect();
		ArrayList<CustomerInquiryDto> inquiry = new ArrayList<CustomerInquiryDto>();
		String sql = "SELECT b2.*"
				+ " FROM (SELECT rownum rnum, b1.*"
				+ " FROM (SELECT DISTINCT i.*, p.pname"
				+ " FROM customer_inquiry i, product p"
				+ " WHERE i.pnumber = p.pnumber"
	            + " AND i.seller_id = ?"
	            + " AND i.pnumber = ?"
	            + " AND i.inquiry_date <= TO_DATE(?,'yy-mm-dd')"
	            + " ORDER BY serial_number) b1) b2"
				+ " WHERE b2.rnum>=? AND b2.rnum<=?";
	           
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			pstmt.setLong(2,pnumber);
			pstmt.setString(3,inquiry_date);
			pstmt.setInt(4,startNum);
			pstmt.setInt(5,endNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int serial_number = rs.getInt("serial_number");
				Date inquiry_date2 = rs.getDate("inquiry_date");
				String status2 = rs.getString("status");
				String inquiry_type2 = rs.getString("inquiry_type");
				Long product_order_num = rs.getLong("product_order_num");
				Long pnumber1= rs.getLong("pnumber");
				String inquiry_title = rs.getString("inquiry_title");
				String inquiry_content = rs.getString("inquiry_content");
				String answer_content = rs.getString("answer_content");
				String customer_id = rs.getString("customer_id");
				String pname = rs.getString("pname");
				Date processing_date = rs.getDate("processing_date");
				String satisfaction2 = rs.getString("satisfaction");
				CustomerInquiryDto dto = new CustomerInquiryDto(serial_number,inquiry_date2,status2,inquiry_type2,product_order_num,pnumber1,inquiry_title
						,inquiry_content,answer_content,customer_id,pname,processing_date,satisfaction2);
				inquiry.add(dto);
			}
		} catch (SQLException e) {
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
		return inquiry;
	}
	
	public int count(String id, long pnumber) throws Exception {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*) FROM customer_inquiry WHERE seller_id=? AND pnumber = ?" ;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setLong(2, pnumber);
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0;
		if(rs.next()) {
			cnt = rs.getInt("count(*)");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return cnt;
		
	}

	public ArrayList<CustomerInquiryDto> select2(String seller_id, String inquiry_date,int startNum, int endNum)	{
		
		Connection conn = Jdbc.connect();
		ArrayList<CustomerInquiryDto> inquiry = new ArrayList<CustomerInquiryDto>();
		String sql = "SELECT b2.*"
				+ " FROM (SELECT rownum rnum, b1.*"
				+ " FROM (SELECT DISTINCT i.*, p.pname"
				+ " FROM customer_inquiry i, product p"
				+ " WHERE i.pnumber = p.pnumber"
	            + " AND i.seller_id = ?"
	            + " AND i.inquiry_date <= TO_DATE(?,'yy-mm-dd')"
	            + " ORDER BY serial_number) b1) b2"
				+ " WHERE b2.rnum>=?  AND b2.rnum<=?";
	           
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,seller_id);
			pstmt.setString(2,inquiry_date);
			pstmt.setInt(3,startNum);
			pstmt.setInt(4,endNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int serial_number = rs.getInt("serial_number");
				Date inquiry_date2 = rs.getDate("inquiry_date");
				String status2 = rs.getString("status");
				String inquiry_type2 = rs.getString("inquiry_type");
				Long product_order_num = rs.getLong("product_order_num");
				Long pnumber1= rs.getLong("pnumber");
				String inquiry_title = rs.getString("inquiry_title");
				String inquiry_content = rs.getString("inquiry_content");
				String answer_content = rs.getString("answer_content");
				String customer_id = rs.getString("customer_id");
				String pname = rs.getString("pname");
				Date processing_date = rs.getDate("processing_date");
				String satisfaction2 = rs.getString("satisfaction");
				CustomerInquiryDto dto = new CustomerInquiryDto(serial_number,inquiry_date2,status2,inquiry_type2,product_order_num,pnumber1,inquiry_title
						,inquiry_content,answer_content,customer_id,pname,processing_date,satisfaction2);
				inquiry.add(dto);
			}
		} catch (SQLException e) {
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
		return inquiry;
	}
	public int count2(String id) throws Exception {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*) FROM customer_inquiry WHERE seller_id=?" ;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		int cnt = 0;
		if(rs.next()) {
			cnt = rs.getInt("count(*)");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return cnt;
		
	}
}
	
