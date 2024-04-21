<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<% int pageNum = 1; %>
<%!
	public Connection getConnetion(){
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "testw8";
	String dbPw = "pass1234";
	
	Connection conn = null;
	try{
		Class.forName(driver);
	conn = DriverManager.getConnection(url,dbId,dbPw);
	} catch (Exception e){
		e.printStackTrace();
	}
	
	return conn;
	
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("tr").click(function(){
			let bno = $(this).find(".bno").text();
			location.href = "Ex13BoardDetail_1.jsp?bno="+bno;
		});
	});
</script>
<style>
	table{border-collapse: collapse;}
	tr, th{border : 1px solid grey; padding : 8px;}
</style>
</head>
<body>
	<table>
		<tr>
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<% 
		 Connection conn = getConnetion();
		
		 String sql = "SELECT b2.*"+
				" FROM(SELECT rownum rnum, b1.*"+
						" FROM(SELECT * FROM board1 ORDER BY bno DESC) b1) b2"+
						" WHERE b2.rnum>=? AND b2.rnum<=?";
						
		int endNum = pageNum*10;
		int startNum = endNum-9;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startNum);
		pstmt.setInt(2, endNum);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
		%>
		<tr>
			<th class="bno"><%=rs.getInt("bno") %></th>
			<th><%=rs.getString("title") %></th>
			<th><%=rs.getString("writer") %></th>
			<th><%=rs.getString("writedate") %></th>
		</tr>
		<%} %>
	</table>
	<div style="padding-left:100px;">
	<%for(int i = 1; i<=10; i++){
		%>
		<a href="Ex13BoardList_1.jsp?page=<%=i%>"><%=i %></a>
		<%}%>
	</div>
	<div>
		<button id="btn_write">글쓰기</button>
	</div>
</body>
</html>
<%
	 rs.close();
	 pstmt.close();
	 conn.close();
%>