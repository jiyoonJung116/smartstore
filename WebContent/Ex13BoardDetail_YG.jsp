<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
    
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
%>

<%!
	public Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";
		
		Class.forName(driver);   // JDBC 드라이버 로딩.
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
								// DB접속을 시도 ---> Connection객체를 리턴.
		
		return conn;
	}
%>
<%
	String title = "";
	String content = "";
	String writer = "";
	String writedate = "";
	
	try {
		Connection conn = getConnection();
		
		String sql = "SELECT * FROM board1 WHERE bno=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			title = rs.getString("title");
			content = rs.getString("content");
			writer = rs.getString("writer");
			writedate = rs.getString("writedate");
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch(Exception e) { e.printStackTrace(); }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		table {
			border-collapse: collapse;  /* 한 줄의 경계선으로 만듦. */
		}
		th,td {
			border: 1px solid grey;
			padding: 8px;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<td><%=bno %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=title %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=content %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=writer %></td>
		</tr>
	</table>
	<button onclick="location.href='Ex13BoardList_YG.jsp';">목록으로</button>
	<button onclick="location.href='Ex13BoardUpdate_YG.jsp?bno=<%=bno%>'">수정하기</button>
	<button>삭제하기</button>
</body>
</html>
