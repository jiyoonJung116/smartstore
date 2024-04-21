<%@page import="dao.TalkDao"%>
<%@page import="dao.TalkTalkChatContentPurchaseDao"%>
<%@page import="dao.TalktalkchatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	request.setCharacterEncoding("UTF-8");
	String sellerId = request.getParameter("sellerId");
	String customerId = request.getParameter("customerId");
	String senderId = request.getParameter("senderId");
	String chat = request.getParameter("chat");
	int talkNum = Integer.parseInt(request.getParameter("talkNum"));
	
	TalkTalkChatContentPurchaseDao purchase = new TalkTalkChatContentPurchaseDao();
	purchase.purchaseShow(customerId, sellerId, talkNum);
	
	TalkDao talkinsert = new TalkDao();
	talkinsert.chat(sellerId, customerId, senderId, chat);

%>

<script> 
	location.href="TalkTalkPurchase.jsp";
</script>