<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.ANCMDao"%>
<% 
	request.setCharacterEncoding("utf-8");
	ANCMDao ancmdao = new ANCMDao();
	long pnumber= Long.parseLong(request.getParameter("pnumber"));
	String subject= request.getParameter("subject");
	String content= request.getParameter("content");
	String endDate= request.getParameter("endDate");
	
	if(endDate==null){
		ancmdao.insert(pnumber, subject, content);
	}else{
		ancmdao.insert(pnumber, subject, content, endDate);
	}
	
%>

<script>
alert("등록되었습니다.");
 location.href="DailyLeftANCM.jsp";
</script>