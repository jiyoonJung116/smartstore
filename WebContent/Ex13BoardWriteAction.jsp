<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    <%
    	request.setCharacterEncoding("utf-8"); //POST 방식의 한글깨짐 방지
    											//첫 부분에서 하세요.(request 쓰기 전에.)
    	int bno = Integer.parseInt(request.getParameter("bno"));
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	String writer = request.getParameter("writer");
    	
    	boardWrite(bno, title, content, writer);
    %>
    <%!
    public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";

		Class.forName(driver); //JDBC 드라이버 로딩
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		// DB 접속을 시도 ---> Connection 객체를 리턴.

		return conn;
	}
	public void boardWrite(int bno, String title, String content, String writer) throws Exception{
		Connection conn = getConnection();
		String sql = "INSERT INTO board1(bno,title, content, writer)"
					+ " VALUES(?,?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,bno);
		pstmt.setString(2,title);
		pstmt.setString(3,content);
		pstmt.setString(4,writer);
		
		pstmt.executeUpdate();
		
		conn.close();
	}
	
	%>
	
	<script>
		alert("작성하신 글이 등록되었습니다.");
		location.href="Ex13BoardList.jsp";
	</script>