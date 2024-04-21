package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MainInquiryDto;
public class MainInquiryDao {
	public int count(String seller_id) {
		Connection conn = Jdbc.connect();
	    String sql = "SELECT COUNT(*) FROM customer_inquiry WHERE status = '미답변' AND seller_id = ? AND pnumber IS NOT NULL";
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int num = 0;
	    try {
		    pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, seller_id);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            num = rs.getInt("count(*)");
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
	    return num;
	}
	public ArrayList<MainInquiryDto> mainpage(String seller_id) {
        Connection conn = Jdbc.connect();
        ArrayList<MainInquiryDto> mainpInquiry = new ArrayList<MainInquiryDto>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String select = "SELECT inquiry_content, inquiry_date ";
        String from = "FROM customer_inquiry ";
        String where ="WHERE status = '誘몃떟蹂�' AND seller_id = ? AND pnumber IS NOT NULL";
        String sql2 = select+ from + where;
        //�긽�뭹臾몄쓽
        try {
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, seller_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Date inquiry_date = rs.getDate("inquiry_date");
                String inquiry_content = rs.getString("inquiry_content");
                MainInquiryDto dto = new MainInquiryDto(inquiry_date, inquiry_content);
                mainpInquiry.add(dto);
            }
            System.out.println();
        }catch (SQLException e) {
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
        return mainpInquiry;
	}
	//硫붿씤�럹�씠吏� 怨좉컼臾몄쓽 誘몃떟蹂�
	public int count2(String seller_id) {
		Connection conn = Jdbc.connect();
		 PreparedStatement pstmt = null;
         ResultSet rs = null;
         String sql = "SELECT COUNT(*) FROM customer_inquiry WHERE status = '誘몃떟蹂�' AND seller_id = ? AND product_order_num IS NOT NULL";
         int num2 = 0;
         try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, seller_id);
	         rs = pstmt.executeQuery();
	         
	         while (rs.next()) {
	             num2 = rs.getInt("count(*)");
	             }
         } catch(SQLException e) {
        	 	e.printStackTrace();
         } finally{
        	 try {
				pstmt.close();
				rs.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
         }
         return num2;
	}
	
	public ArrayList<MainInquiryDto> mainsender(String seller_id) {
            	Connection conn = Jdbc.connect();
            	ArrayList<MainInquiryDto> customerinq = new ArrayList<MainInquiryDto>();
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String select2 = "SELECT inquiry_title, inquiry_date ";
                String from = "FROM customer_inquiry ";
                String where2 ="WHERE status = '誘몃떟蹂�' AND seller_id = ? AND product_order_num IS NOT NULL";
                String sql2 = select2+ from+ where2;
                //怨좉컼臾몄쓽
                try {
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, seller_id);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    String inquiry_title = rs.getString("inquiry_title");
                    Date inquiry_date = rs.getDate("inquiry_date");
                    MainInquiryDto dto = new MainInquiryDto(inquiry_title,inquiry_date);
                    customerinq.add(dto);
                }
                System.out.println();
            }catch (SQLException e) {
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
                return customerinq;
      }
      public int count3(String seller_id) {
  		Connection conn = Jdbc.connect();
  		PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM talktalk_content WHERE read_status = '0' AND seller_id = ?";
        int num3 = 0;
        	try{
        		pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, seller_id);
                	rs = pstmt.executeQuery();
                  while (rs.next()) {
                      num3 = rs.getInt("count(*)");
                      }
        	} catch(SQLException e) {
        		e.printStackTrace();
        	} finally {
        		try {
					pstmt.close();
					rs.close();
					conn.close();
        		} catch (SQLException e) {
					e.printStackTrace();
				}
        	}
        	return num3;
  	}
      // �넚�넚�긽�떞 誘몃떟蹂� 硫붿꽌�뱶
      public ArrayList<MainInquiryDto> maintalk(String seller_id) {
    	 Connection conn = Jdbc.connect();
    	 ArrayList<MainInquiryDto> maintalk = new ArrayList<MainInquiryDto>();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
       	  String select3 = "SELECT sender_id,talk_time,talk_content ";
          String from2 = "FROM talktalk_content ";
          String where3 ="WHERE read_status = '0' AND seller_id = ?";
          String sql2 = select3 + from2+ where3;
          //�넚�넚臾몄쓽
          try {
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, seller_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String sender_id = rs.getString("sender_id");
                Date talk_time = rs.getDate("talk_time");
                String talk_content = rs.getString("talk_content");
                MainInquiryDto dto = new MainInquiryDto(sender_id,talk_time,talk_content);
                maintalk.add(dto);
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
          return maintalk;
    }
}

