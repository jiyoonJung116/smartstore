<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* session.removeAttribute("loginId"); */
	session.setAttribute("loginId", request.getParameter("loginId"));
%>
<script>alert("됐다 지윤아 들어가");</script>