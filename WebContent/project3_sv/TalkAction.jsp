<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.TalkDao"%>

<%
	request.setCharacterEncoding("utf-8");

	String sellerId = request.getParameter("sellerId");
	String customerId = request.getParameter("customerId");
	String senderId = request.getParameter("senderId");
	String chat = request.getParameter("chat");
	
	TalkDao talkDao = new TalkDao();
	
	talkDao.chat(sellerId, customerId, senderId, chat);
%>

<script>location.href = "Talk.jsp";</script>