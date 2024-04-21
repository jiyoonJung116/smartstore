<%@page import="dao.NoticeBoardUpdateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    <%
    	request.setCharacterEncoding("utf-8"); 
    
    	int bno = Integer.parseInt(request.getParameter("bno"));
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	NoticeBoardUpdateDao dao = new NoticeBoardUpdateDao();
    	dao.reviewupdate(title, content, bno);
    %>
	<script>
		alert("수정되었습니다.");
		location.href="NoticeBoardDetail.jsp?bno=<%=bno%>";
	</script>