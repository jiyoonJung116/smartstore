<%@page import="dao.NoticeBoardInsertDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	request.setCharacterEncoding("utf-8"); 
    
		int bno = Integer.parseInt(request.getParameter("bno"));
		String loginId = request.getParameter("loginId");
		String content = request.getParameter("content");
		String nickname = request.getParameter("nickname");
    	
    	NoticeBoardInsertDao dao = new NoticeBoardInsertDao();
    	dao.writeComment(bno, loginId, content);
    %>
	<script>
		alert("댓글이 등록 되었습니다.");
		location.href = "NoticeBoardDetail.jsp?bno=<%=bno%>&nickname=<%=nickname%>";
	</script>