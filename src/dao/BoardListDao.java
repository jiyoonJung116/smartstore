package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.BoardDto;
import dto.BoardListDto;
import dto.NoticeBoardCommetnDto;
import dto.ReviewDto;

public class BoardListDao {
	public ArrayList<BoardListDto> board_select() {
		Connection conn = JdbcConn.connect();
		ArrayList<BoardListDto> board_select = new ArrayList<BoardListDto>();
		String sql = "SELECT bs.bno, bs.title, m.nickname, bs.writedate, bs.hitcount, bs.photo" + 
					" FROM board_list bs, member m " + 
					" WHERE bs.writer_id=m.member_id";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String nickname = rs.getString("nickname");
				String writedate = rs.getString("writedate");
				int hitcount = rs.getInt("hitcount");
				String photo = rs.getString("photo");
				BoardListDto dto = new BoardListDto(bno, title, nickname, writedate, hitcount);
				board_select.add(dto);
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
		return board_select;
    }
	public ArrayList<BoardListDto> board_detail(int bno) {
		Connection conn = JdbcConn.connect();
		ArrayList<BoardListDto> board_select = new ArrayList<BoardListDto>();
		String sql = "SELECT * FROM board_list WHERE bno =?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next())  {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String nickname = rs.getString("nickname");
				String writedate = rs.getString("writedate");
				int hitcount = rs.getInt("hitcount");
				String photo = rs.getString("photo");
				BoardListDto dto = new BoardListDto(title, nickname, writedate, hitcount, content, photo);
				board_select.add(dto);
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
		return board_select;
	}
	public String getWriterId(String nickname,int bno) {	//별명이랑 글번호 통해서 작성자ID 가져오는 메서드
		Connection conn = JdbcConn.connect();
		String sql = "SELECT writer_id "
					+" FROM board_list" 
					+" WHERE nickname = ? AND bno =?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String writedId = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setInt(2, bno);
			rs = pstmt.executeQuery();
			if(rs.next())  {
				writedId = rs.getString("writer_id");
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
		return writedId;
	}
	public String getNickname(String loginId) {	//로그인아이디로 닉네임 가져오기
		Connection conn = JdbcConn.connect();
		String sql = "SELECT nickname" + 
				" FROM member" + 
				" WHERE member_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String loginNickname = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginId);
			rs = pstmt.executeQuery();
			if(rs.next())  {
				loginNickname = rs.getString("nickname");
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
		return loginNickname;
	}
	
	public void hitupdate(int bno) {
		Connection conn =JdbcConn.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD_LIST SET hitcount=hitcount+1 WHERE bno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bno);
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
	public ArrayList<NoticeBoardCommetnDto> comment_select(int bno) {
		Connection conn = JdbcConn.connect();
		ArrayList<NoticeBoardCommetnDto> comment_select = new ArrayList<NoticeBoardCommetnDto>();
		String sql = "SELECT c.*, m.nickname" + 
				" FROM comments c, member m" + 
				" WHERE c.writer_id = m.member_id" + 
				" AND c.bno=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bno);
				rs = pstmt.executeQuery();
				while(rs.next()) {
				int rno = rs.getInt("rno");
				String writerId = rs.getString("writer_id");
				String content= rs.getString("content");
				String writedate = rs.getString("writedate");
				String nickname = rs.getString("nickname");
				NoticeBoardCommetnDto dto = new NoticeBoardCommetnDto(rno, writerId, content, writedate, nickname);
				comment_select.add(dto);
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
		return comment_select;
    }
	public ArrayList<BoardListDto> getBoardListByPageNum(int pageNum) throws Exception {
		Connection conn = JdbcConn.connect();
		int endRnum = pageNum * 30;   // 이해
		int startRnum = endRnum - 29;  // 이해
		ArrayList<BoardListDto> listBoard = new ArrayList<BoardListDto>();
		String sql = "SELECT *" + 
					" FROM (SELECT rownum rnum, bs.*" + 
					" FROM (SELECT * FROM board_list ORDER BY bno DESC) bs) bs2" + 
					" WHERE rnum>=? AND rnum<=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRnum);
		pstmt.setInt(2, endRnum);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			String nickname = rs.getString("nickname");
			String writedate = rs.getString("writedate");
			int hitcount = rs.getInt("hitcount");
			BoardListDto dto = new BoardListDto(bno, title, nickname, writedate, hitcount);
			listBoard.add(dto);
		}
		rs.close();
		pstmt.close();
		return listBoard;
	}
	
}

