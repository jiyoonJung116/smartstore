package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.톡톡Dto;

public class TalkTalkChatContentPurchaseDao {
	public int chatNumber(String sellerId, String customerId) { //방번호를 조회하기 위한 메서드 
		Connection conn = Jdbc.connect();

		String sql = "SELECT talk_num" + 
				" FROM talktalk_list" + 
				" WHERE seller_id=? AND customer_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int talkNum = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sellerId);
			pstmt.setString(2,customerId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				talkNum = rs.getInt("talk_num");
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
		return talkNum;
	}
	public ArrayList<톡톡Dto> chatContent(int talkNum) {
		Connection conn = Jdbc.connect();
		ArrayList<톡톡Dto> listchat = new ArrayList<톡톡Dto>();

		String sql = "SELECT seller_id, sender_id,talk_content, talk_time,read_status " + 
				" FROM talktalk_content tc" + 
				" WHERE talk_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,talkNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String sellerId = rs.getString("seller_id");
				String senderId = rs.getString("sender_id");
				String talkContent = rs.getString("talk_content");
				boolean readStatus = rs.getInt("read_status")==1;
				String talkTime = rs.getString("talk_time");
				톡톡Dto dto = new 톡톡Dto(sellerId, senderId, talkContent,readStatus, talkTime);
				listchat.add(dto);
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
		return listchat;
	}
			//파라미터 String 고객아이디, String 판매자아이디, long 상품번호
			public void insert(String customer_id, String seller) {
				Connection conn = Jdbc.connect();
				PreparedStatement pstmt = null;
				String sql = "INSERT INTO TALKTALK_LIST(SELLER_ID,TALK_NUM,CUSTOMER_ID,Nickname,TALK_START_DATE,TALK_FINAL_DATE,TALK_STATUS)"
							+" VALUES(?,seq_talk_list.nextval,?,'',SYSDATE,SYSDATE,'대기')";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seller);
					pstmt.setString(2, customer_id);
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
			//구매자 입장에서 톡방이 없으면 생기고 있으면 원래 있는 방 보여주기
			public void purchaseShow(String customer_id, String seller, int talkNum) {
				Connection conn = Jdbc.connect();
				String sql = "SELECT talk_num" + 
							" FROM talktalk_list" + 
							" WHERE seller_id = ? AND customer_id=?";
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seller);
					pstmt.setString(2, customer_id);
					rs = pstmt.executeQuery();
					 if (rs.next()) {
						 chatContent(talkNum);//내용 보여주기
					    } else {
					    	insert(customer_id, seller); //판매자id와 구매자id가 없으면 새로 방 생성
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
			}
}
