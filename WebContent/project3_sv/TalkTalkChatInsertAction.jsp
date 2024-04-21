<%@page import="dao.TalktalkchatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	request.setCharacterEncoding("UTF-8");
	String sellerId = request.getParameter("sellerId");
	String customerId = request.getParameter("customerId");
	String senderId = request.getParameter("senderId");
	String chat = request.getParameter("chat");
	int num = Integer.parseInt(request.getParameter("roomnum"));
	
	TalktalkchatDao talkinsert = new TalktalkchatDao();
	talkinsert.chat(sellerId, customerId, senderId, chat, num);


%>

<script> 
	location.href="Talk_copy.jsp?num="+<%=num%>;
</script>