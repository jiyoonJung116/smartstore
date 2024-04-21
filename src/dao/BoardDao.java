package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BoardDto;

public class BoardDao {
	public Connection getConnetion() { //<%부터  % >까지  ㅡ선언부
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";

		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
	public BoardDto getBoardDto(int bno) throws Exception {
		Connection conn = getConnetion();

		String sql = "SELECT * FROM board1 ORDER BY bno DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		BoardDto dto = null;
		if (rs.next()) {
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			String writedate = rs.getString("writedate");
			dto = new BoardDto(bno, title, content, writer, writedate);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dto;
	}
	public ArrayList<BoardDto> getBoardListByPageNum(int pageNum) throws Exception {
		Connection conn = getConnetion();
		int endRnum = pageNum * 15;   // 이해
		int startRnum = endRnum - 14;  // 이해
		ArrayList<BoardDto> listBoard = new ArrayList<BoardDto>();
		String sql = "SELECT *"
					+ " FROM (SELECT rownum rnum, t1.*"
					+ " FROM (SELECT * FROM board1 ORDER BY bno DESC) t1) t2"
					+ " WHERE t2.rnum>=? AND t2.rnum<=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRnum);
		pstmt.setInt(2, endRnum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			String writedate = rs.getString("writedate");
			BoardDto dto = new BoardDto(bno,title,content,writer,writedate);
			listBoard.add(dto);
		}
		rs.close();
		pstmt.close();
		return listBoard;
	}
}
