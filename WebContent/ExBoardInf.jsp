<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	BoardDao bDao = new BoardDao();
	ArrayList<BoardDto> listBoard = bDao.getBoardListByPageNum(1);	
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
		let page_requested = 1;
		function request_one_page(){
			page_requested +=1;
			//ajax -> 한 페이지 요청
			$.ajax({
				type : 'get',
				url : 'BoardServlet2',
				data : { 'pageNum': page_requested },
				datatype : 'json',
				success: function(data){
					//console.log(data);
					for(var i = 0; i<=data.length-1; i++){
					let str = "<tr>"
							+ "<td>"+data[i].bno+"</td>"
							+ "<td>"+data[i].title+"</td>"
							+ "<td>"+data[i].writer+"</td>"
							+ "<td>"+data[i].writedate+"</td>"
							+ "</tr>";
					$("#table1").append(str);
					}
				},
				error: function (request, status, error) {
			        console.log("code: " + request.status)
			        console.log("message: " + request.responseText)
			        console.log("error: " + error);
			    }
			});
		}
		$(function() {
			//바닥을 쳤을 때, request_one_page()를 호출
		$(window).scroll(function(){
			  var scrT = $(window).scrollTop();
			  console.log(scrT); //스크롤 값 확인용
			  if(scrT == $(document).height() - $(window).height()){
			  	//스크롤이 끝에 도달했을때 실행될 이벤트
			  	request_one_page();
			  } 
			});
		});
	</script>
	<style>
		body { min-height: 1500px;}
		table { border-collapse: collapse; }
		th, td { border: 1px solid gray; padding: 8px; }
		td { cursor: pointer; }
	</style>
</head>
<body>
	<table id="table1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<% for(BoardDto dto : listBoard) { %>
		<tr>
			<td class="bno"><%=dto.getBno() %></td>
			<td><%=dto.getTitle() %></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getWritedate() %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>






