<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("bno:" + bno);
	%>
    <%
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";
	%>
	<%
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,dbId,dbPw);
	%>
	<%
		String sql = "SELECT * FROM board1 WHERE bno=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,bno);
		
		ResultSet rs = pstmt.executeQuery();
		String title = "";
		String content="";
		String writer="";
		String writeDate ="";
		if(rs.next()){
			title = rs.getString("title");
			content = rs.getString("content");
			writer = rs.getString("writer");
			writeDate = rs.getString("writedate");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script>
	$(function(){
		$("#btn_list").click(function(){
			location.href = "Ex12_1.jsp";
		});
		$("#btn_delete").click(function(){
			location.href = "Ex12_1DeleteAction.jsp?bno="+<%=bno%>;
		});
		$("#btn_update").click(function(){
			location.href = "Ex12_1Update.jsp?bno="+<%=bno%>;
		});
	});
</script>
<style>
	table{border-collapse: collapse;}
	tr,td{border : 1px solid grey; padding : 8px;}
</style>
</head>
<body>
	<table>
		<tr>
			<td>글 번호</td>
			<th><%=bno %></th>
		</tr>
		<tr>
			<td>글 제목</td>
			<th><%=title %></th>
		</tr>
		<tr>
			<td>내용</td>
			<th><%=content %></th>
		</tr>
		<tr>
			<td>작성자</td>
			<th><%=writer %></th>
		</tr>
		<tr>
			<td>작성일시</td>
			<th><%=writeDate %></th>
		</tr>
	</table>
	<button id="btn_list">목록으로</button>
	<button id="btn_delete">삭제하기</button>
	<button id="btn_update">수정하기</button>
</body>
</html>