package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.AnnouncementDto;




public class AnnouncementDao {
	public ArrayList<AnnouncementDto> select(String seller_id) {
		Connection conn = Jdbc.connect();
		ArrayList<AnnouncementDto> announce = new ArrayList<AnnouncementDto>();
		String sql = "SELECT a.* FROM ANNOUNCEMENT a, product p WHERE a.pnumber=p.pnumber AND p.seller_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seller_id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				long pnumber = rs.getLong("pnumber");
				long serialNum = rs.getLong("serial_number");
				String displayStatus = rs.getString("display_status");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date startDate = rs.getDate("display_start_date");
				Date endDate = rs.getDate("display_end_date");
				Date regDate = rs.getDate("regi_date");
				AnnouncementDto dto = new AnnouncementDto(pnumber,serialNum,displayStatus,subject,content,startDate,endDate,regDate);
				announce.add(dto);
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
		return announce;
	}
	// Announcement 조회하는 메서드
	// 파라미터 : select(long) : Announcement시리얼넘버
	public AnnouncementDto select(long num) {
		Connection conn = Jdbc.connect();
		AnnouncementDto announce = null;
		String sql = "SELECT * FROM announcement WHERE serial_number=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				long pnumber = rs.getLong("pnumber");
				long serialNum = rs.getLong("serial_number");
				String displayStatus = rs.getString("display_status");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date startDate = rs.getDate("display_start_date");
				Date endDate = rs.getDate("display_end_date");
				Date regDate = rs.getDate("regi_date");
				announce = new AnnouncementDto(pnumber, serialNum,displayStatus,subject,content,startDate,endDate,regDate);
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
		return announce;
	}
	// Announcement 조회하는 메서드
	// 파라미터 : select(String, String) : (제목vs전시상태), (제목이름vs전시상태-전시중,전시종료)
	public ArrayList<AnnouncementDto> selectS(String con,String seller_id) {
		Connection conn = Jdbc.connect();
		ArrayList<AnnouncementDto> announce = new ArrayList<AnnouncementDto>();
		String sql = "SELECT * FROM announcement a, product p WHERE a.pnumber = p.pnumber AND a.subject LIKE ? AND p.seller_id= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, con);
			pstmt.setString(2, seller_id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				long pnumber = rs.getLong("pnumber");
				long serialNum = rs.getLong("serial_number");
				String displayStatus = rs.getString("display_status");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date startDate = rs.getDate("display_start_date");
				Date endDate = rs.getDate("display_end_date");
				Date regDate = rs.getDate("regi_date");
				AnnouncementDto dto = new AnnouncementDto(pnumber, serialNum,displayStatus,subject,content,startDate,endDate,regDate);
				announce.add(dto);
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
		return announce;
	}
	public ArrayList<AnnouncementDto> selectS(String con, String con2, String seller_id) {
		Connection conn = Jdbc.connect();
		ArrayList<AnnouncementDto> announce = new ArrayList<AnnouncementDto>();
		String sql = "SELECT * FROM  announcement a, product p WHERE a.pnumber=p.pnumber AND a.subject LIKE ? AND a.display_status LIKE ? AND p.seller_id= ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, con);
			pstmt.setString(2, con2);
			pstmt.setString(3, seller_id);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				long pnumber = rs.getLong("pnumber");
				long serialNum = rs.getLong("serial_number");
				String displayStatus = rs.getString("display_status");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date startDate = rs.getDate("display_start_date");
				Date endDate = rs.getDate("display_end_date");
				Date regDate = rs.getDate("regi_date");
				AnnouncementDto dto = new AnnouncementDto(pnumber, serialNum,displayStatus,subject,content,startDate,endDate,regDate);
				announce.add(dto);
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
		return announce;
	}
}
