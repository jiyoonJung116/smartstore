<%@page import="dao.NoticeBoardInsertDao"%>
<%@page import="dao.NoticeBoardUpdateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
    <%
    	request.setCharacterEncoding("utf-8"); 
    
    	String memberId = request.getParameter("memberId");
    	String password = request.getParameter("password");
    	String username = request.getParameter("name");
    	String email = request.getParameter("email");
    	String nickname = request.getParameter("nickname");
    	String birth = request.getParameter("birthdate");
    	String gender = request.getParameter("gender");
    	String phone = request.getParameter("phone");
    	
    	NoticeBoardInsertDao dao = new NoticeBoardInsertDao();
    	dao.boardJoin(memberId, password, username, email, nickname, birth, gender, phone);
    %>
	<script>
		alert("가입되었습니다.");
		location.href="NoticeBoardDetail.jsp";
	</script>