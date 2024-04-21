<%@page import="dao.NoticeBoardInsertDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");   

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	NoticeBoardInsertDao dao = new NoticeBoardInsertDao();

	dao.boardInsert(title, content);
%>


<script>
	alert("작성하신 글이 등록되었습니다.");
	location.href = "NoticeBoard.jsp";
</script>
