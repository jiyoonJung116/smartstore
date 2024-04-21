package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.ANCMDto;



public class ANCMDao {
	public ANCMDto select1(long pnumber) {
		Connection conn = Jdbc.connect();
		ANCMDto announce = null;
		String sql = "SELECT * FROM announcement WHERE pnumber=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pnumber);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				long serialNum = rs.getLong("serial_number");
				long pNum = rs.getLong("pnumber");
				String displayStatus = rs.getString("display_status");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date startDate = rs.getDate("display_start_date");
				Date endDate = rs.getDate("display_end_date");
				Date regDate = rs.getDate("regi_date");
				announce = new ANCMDto(serialNum,pNum,displayStatus,subject,content,startDate,endDate,regDate);
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
	
	public ArrayList<ANCMDto> select(long num) {
		Connection conn = Jdbc.connect();
		ArrayList<ANCMDto> announce = new ArrayList<ANCMDto>();
		String sql = "SELECT * FROM announcement WHERE serial_number=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				long serialNum = rs.getLong("serial_number");
				long pNum = rs.getLong("pnumber");
				String displayStatus = rs.getString("display_status");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date startDate = rs.getDate("display_start_date");
				Date endDate = rs.getDate("display_end_date");
				Date regDate = rs.getDate("regi_date");
				ANCMDto dto = new ANCMDto(serialNum,pNum,displayStatus,subject,content,startDate,endDate,regDate);
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

	// 공지사항 조회하는 메서드
	// 파라미터 : select(String, String) : (제목vs전시상태), (제목이름vs전시상태-전시중,전시종료)
	public ArrayList<ANCMDto> select(String base, String con) {
		Connection conn = Jdbc.connect();
		ArrayList<ANCMDto> announce = new ArrayList<ANCMDto>();
		String sql = "SELECT * FROM announcement WHERE ";
		if (base.equals("제목")) {
			sql += "subject=?";
		}
		if (base.equals("전시상태")) {
			sql += "display_status=?";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, con);
			pstmt.executeUpdate();
			rs = pstmt.executeQuery(sql);
			while (rs.next()) {
				long serialNum = rs.getLong("serial_number");
				long pNum = rs.getLong("pnumber");
				String displayStatus = rs.getString("display_status");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date startDate = rs.getDate("display_start_date");
				Date endDate = rs.getDate("display_end_date");
				Date regDate = rs.getDate("regi_date");
				ANCMDto dto = new ANCMDto(serialNum,pNum,displayStatus,subject,content,startDate,endDate,regDate);
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
	public void insert(long pnumber, String subject, String content) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO announcement(serial_number,pnumber,display_status,subject,content,display_start_date,regi_date)"
				+ " VALUES(seq_announce.nextval,?,'전시중',?,?, SYSDATE, SYSDATE)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,pnumber);
			pstmt.setString(2,subject);
			pstmt.setString(3,content);
			pstmt.executeUpdate();
		} catch(SQLException e) {
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
	//공지사항 등록하는 메서드 (전시기간 설정함 - 전시종료기간입력가능한 메서드)!
	//insert(long, String, String) : 상품번호, 공지사항제목, 공지사항내용, 전시종료일시
	public void insert(long pnumber, String subject, String content, String endDate) {
		Connection conn = Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO announcement(serial_number,pnumber,display_status,subject,content,display_start_date, display_end_date, regi_date)"
				+ " VALUES(seq_announce.nextval, ?, '전시중',?,?,SYSDATE, TO_DATE(?,'YYYY-MM-DD'), SYSDATE)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,pnumber);
			pstmt.setString(2,subject);
			pstmt.setString(3,content);
			pstmt.setString(4,endDate);
			pstmt.executeUpdate();
		} catch(SQLException e) {
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
	
	//공지사항 삭제하는 메서드
		//파라미터 delete(long) : 공지사항 시리얼 넘버 입력
	public void delete(long s_num) {
		Connection conn =Jdbc.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM announcement WHERE serial_number=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,s_num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
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
	
	public void update(long s_num, String s_con, String s_content) {
		Connection conn = Jdbc.connect();
		String ad = "";

		PreparedStatement pstmt = null;
		if (s_con.equals("전시상태")) {
			if (s_content.equals("전시중")) {
				ad = "DISPLAY_STATUS =?,DISPLAY_START_DATE = SYSDATE";
			} else if (s_content.equals("전시중지")) {
				ad = "DISPLAY_STATUS =?,DISPLAY_END_DATE = SYSDATE";
			}
		}
		if (s_con.equals("제목")) {
			ad = "SUBJECT =?";
		}
		if (s_con.equals("내용")) {
			ad = "CONTENT =?";
		}
		if (s_con.equals("전시종료일")) {
			ad = "DISPLAY_END_DATE = TO_DATE(?,'YYYY-MM-DD HH24:MI:SS')";
		}
		String sql = "UPDATE announcement SET " + ad + " WHERE serial_number=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_content);
			pstmt.setLong(2, s_num);
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
