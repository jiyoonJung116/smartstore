<%@page import="dao.TalkTalkChatContentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	TalkTalkChatContentDao talkstatus = new TalkTalkChatContentDao();
	talkstatus.talkstatusupdate(num);
%>
<script> 
	alert("수정되었습니다.");
	location.href="Talk_copy.jsp?num="+<%=num%>;
</script>