<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	int bno = Integer.parseInt(request.getParameter("bno"));
    	String title =request.getParameter("title");
    	String content = request.getParameter("content");
    	String writer = request.getParameter("writer");
    	
    	boardWrite(bno, title, content, writer);
    %>
<%!
    	public Connection getConnection(){
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";
		
		Connection conn = null;
		try{
		Class.forName(driver);
		 conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return conn;
    }
    %>
    <%!
    	public void boardWrite(int bno, String title, String content, String writer){
    	
    	Connection conn = getConnection();
    	String sql = "INSERT INTO board1(bno,title,content,writer) VALUES(?,?,?,?)";
    	
    	PreparedStatement pstmt = null;
    	try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,bno);
            pstmt.setString(2,title);
            pstmt.setString(3,content);
            pstmt.setString(4,writer);
            pstmt.executeUpdate();
        } catch(SQLException e){
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
   	}
    %>
    <script>
     alert("작성되었습니다!");
     location.href = "Ex13BoardList_2.jsp";
    </script>