<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
System.out.println(bno);
%>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbId = "testw8";
String dbPw = "pass1234";
%>
<%
	Class.forName(driver);
Connection conn = DriverManager.getConnection(url, dbId, dbPw);

String sql = "SELECT * FROM board1 ORDER BY bno DESC";
PreparedStatement pstmt = conn.prepareStatement(sql);

ResultSet rs = pstmt.executeQuery();
String title = "";
String content = "";
String writer = "";
String writedate = "";
if (rs.next()) {
	title = rs.getString("title");
	content = rs.getString("content");
	writer = rs.getString("writer");
	writedate = rs.getString("writedate");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("#border_list").click(function(){
			location.href="Ex12_2.jsp";
		});
		$("#border_delete").click(function(){
			location.href="Ex12_2DeleteAction.jsp?bno=<%=bno%>";
		});
	});
</script>
<style>
	table{border-collapse: collapse;}
	tr,td{border:1px solid grey; padding : 8px;}
</style>
</head>
<body>
	<table>
		<tr>
			<th>글 번호</th>
			<td><%=rs.getInt("bno")%></td>
		</tr>
		<tr>
			<th>글 제목</th>
			<td><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=rs.getString("content")%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=rs.getString("writer")%></td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td><%=rs.getString("writedate")%></td>
		</tr>
	</table>
	<button id="border_list">목록으로</button>
	<button id="border_delete">삭제</button>
</body>
</html>
<%
	rs.close();
	pstmt.close();
	conn.close();
%>