<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%int bno = Integer.parseInt(request.getParameter("bno")); %>
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
    <%
    	Connection conn = getConnection();
    	String sql = "SELECT * FROM board1 WHERE bno=?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1,bno);
    	
    	ResultSet rs = pstmt.executeQuery();
    	String title = "";
    	String content = "";
    	String writer = "";
    	if(rs.next()){
    		title= rs.getString("title");
    		content = rs.getString("content");
    		writer = rs.getString("writer");
    	}
    	
    	rs.close();
    	pstmt.close();
    	conn.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("#btn_delete").click(function(){
			location.href="Ex13BoardDelete_2.jsp?bno="+<%=bno%>;
		});
	});
</script>
<style>
	table { border-collapse: collapse;}
	tr,td { border : 1px solid grey; padding : 8px;}
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
	<button onclick="location.href='Ex13BoardList_2.jsp';">목록으로</button>
	<button onclick="location.href='Ex13BoardUpdate_2.jsp?bno=<%=bno%>'">수정하기</button>
	<button id="btn_delete">삭제</button>
</body>
</html>