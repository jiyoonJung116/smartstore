<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "testw8";
		String dbPw = "pass1234";

		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<BoardDto> listBoard = new ArrayList<BoardDto>();
		String sql = "SELECT * FROM board1 ORDER BY bno DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			int bno = rs.getInt("bno");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			String writedate = rs.getString("writedate");
			BoardDto dto = new BoardDto(bno, title, content,writer, writedate);
			listBoard.add(dto);
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
	$(function() {
		$("#btn_write").click(function() {
			location.href = "Ex13BoardWrite.jsp";
		});
		$("tr").click(function() {
			let bno = Number($(this).find(".bno").text());
			/* alert(bno+"번 글을 클릭했음!"); */
			$.ajax({
				type : 'get',	
				url : 'BoardServlet',
				data : { "board_num" : bno},
				datatype : "json",
				success : function(data) {
					/* alert("성공"); */
					$(".bno").each(function(index, item){
						if($(item).text()==bno) {
							let txt = $(item).next().text();
							$(item).next().text(txt+'!');
						}
					});
				}, 
				 error: function (request, status, error) {
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText)
				        console.log("error: " + error);
				    }
			});
		});
	});
</script>
<style>
	table {
		border-collapse: collapse;
	} /*한 줄의 경계선으로 만듬.*/
	td, th {
		border: 1px solid gray; padding: 8px;
	}
	td { curosr : pointer;}
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
		<% for(BoardDto dto : listBoard){ %>
		<tr>
			<td class="bno"><%=dto.getBno() %></td>
			<td><%=dto.getTitle() %></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getWritedate()%></td>
		</tr>
		<%} %>
	</table>
</body>
</html>
