package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import dto.톡톡상담Dto;

public class TalkTalkChatContent_firstDao {
/*
-- 1. getAllCountTalkTalkContent(int talkNum)  // 13
SELECT count(*) FROM talktalk_content WHERE talk_num=1;
-- 2. getUnreadCountTalkTalkContent(int talkNum)  // 13
select count(*) from talktalk_content where talk_num=1 and read_status=0;

*/
	
	private int getAllCountTalkTalkContent(int talkNum) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*) FROM talktalk_content WHERE talk_num=?";
		PreparedStatement pstmt = null;
		int ret = 0;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, talkNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ret = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
	private int getUnreadCountTalkTalkContent(int talkNum) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT count(*) FROM talktalk_content WHERE talk_num=? AND read_status=0";
		int ret = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, talkNum);
		    rs = pstmt.executeQuery();
		    if (rs.next()) {
		        ret = rs.getInt(1);
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
		return ret;
	}
	private ArrayList<Integer> getTalkNumListUncomplete() {
		ArrayList<Integer> listRet = new ArrayList<Integer>();
		Connection conn = Jdbc.connect();
		String sql = "SELECT talk_num FROM talktalk_list WHERE talk_status!='완료' OR talk_status IS NULL ORDER BY talk_num";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int talkNum = rs.getInt(1);
				listRet.add(talkNum);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return listRet;
	}
	public void setupTalkStatusToWait() { 
		ArrayList<Integer> listTalkNum = getTalkNumListUncomplete();
		for(int talkNum : listTalkNum) {
			int numOfAllCount = getAllCountTalkTalkContent(talkNum);
			int numOfUnreadCount = getUnreadCountTalkTalkContent(talkNum);
//System.out.println("["+talkNum+"] all="+numOfAllCount + " / unread="+numOfUnreadCount);
			if(numOfAllCount == numOfUnreadCount) {
				Connection conn = Jdbc.connect();
				String sql = "UPDATE talktalk_list SET talk_status='대기' WHERE talk_num=?";
				PreparedStatement pstmt = null;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, talkNum);
					pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch(SQLException e) {
						e.printStackTrace();
					}
				}
			}
			else if(numOfAllCount > numOfUnreadCount) {
				Connection conn = Jdbc.connect();
				String sql = "UPDATE talktalk_list SET talk_status='진행중' WHERE talk_num=?";
				PreparedStatement pstmt = null;
				try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, talkNum);
				pstmt.executeUpdate();
				} catch(SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						pstmt.close();
						conn.close();
					} catch(SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	public ArrayList<톡톡상담Dto> chatContent(String date1, String date2, String read, String order, String talkStatus) { 
		Connection conn = Jdbc.connect();
		ArrayList<톡톡상담Dto> listchat = new ArrayList<톡톡상담Dto>();

		String sql = "SELECT ts.talk_num,m.name, ts.talk_final_date, t.sender_id, t.talk_content, t.talk_time,ROUND((SYSDATE - t.talk_time) * 24 * 60, 2) AS diff_min" + 
				" FROM talktalk_list ts" + 
				" JOIN member m ON m.id = ts.customer_id " + 
				" JOIN ( " + 
				" SELECT sender_id, talk_content, talk_time," + 
				" ROW_NUMBER() OVER (PARTITION BY sender_id ORDER BY talk_time DESC) AS row_num" + 
				" FROM talktalk_content" + 
				" ) t ON t.sender_id = ts.customer_id" + 
				" WHERE t.row_num = 1";
		if(talkStatus == null) {
			System.out.println("YG");
		} else if(talkStatus.equals("진행중")) {
			sql+= " AND talk_status='진행중'";
		} else if(talkStatus.equals("대기")) {
			sql+= " AND talk_status='대기'";
		} else if(talkStatus.equals("완료")) {
			sql+= " AND talk_status='완료'";
		} else if(talkStatus.equals("차단")) {
			sql+= " AND talk_status='차단'";
		} else if(talkStatus.equals("보류")) {
			sql+= " AND talk_status='보류'";
		}
				
		if(date1 != null) {
			sql += " AND t.talk_time >= '" + date1 +"'";
		}
		if(date2 != null) {
			sql += " AND t.talk_time <= '" + date2 +"'";
		}
		if(read != null) {
			if(read.equals("안읽음")) {
				sql+=" AND (SELECT COUNT(read_status) AS count" + 
						" FROM talktalk_content" + 
						" WHERE read_status = 0 AND talk_num = ts.talk_num)>0";
			}
		}
		
		if(order != null) {
			if(order.equals("최근문의순")) {
				sql +=	" ORDER BY t.talk_time DESC";
			} else if(order.equals("먼저문의순")) {
				sql += " ORDER BY t.talk_time";
			}
		} else {
			sql +=	" ORDER BY t.talk_time DESC";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int talk_num = rs.getInt("talk_num");
				String name = rs.getString("name");
				String final_date = rs.getString("talk_final_date");
				String sender_id = rs.getString("sender_id");
				String talk_content = rs.getString("talk_content");
				String talk_time = rs.getString("talk_time");
				String strDate = talk_time.split(" ")[0];
				String strTime = talk_time.split(" ")[1];
				double diff = rs.getDouble("diff_min");
				톡톡상담Dto dto = new 톡톡상담Dto(talk_num, name, final_date, sender_id, talk_content, talk_time, strDate, strTime, diff);
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
	
	public String getTalkStatusByTalkNum(int talkNum) {
		Connection conn = Jdbc.connect();
		String sql = "SELECT talk_status FROM talktalk_list WHERE talk_num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String status = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, talkNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				status = rs.getString(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return status;
	}
	
}
