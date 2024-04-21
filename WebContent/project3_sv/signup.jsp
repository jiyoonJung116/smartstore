<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name =  request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String workplace_address = request.getParameter("workplace_address");
	String p_main_cg = request.getParameter("p_main_cg");
	String release_address = request.getParameter("release_address");
	String return_address = request.getParameter("return_address");
	String store_name = request.getParameter("store_name");
	String store_introduce = request.getParameter("store_introduce");
	
	MemberDao signup = new MemberDao();
	signup.member(id, pw, name, birth, gender, email, phone, release_address, return_address);
	signup.store_manage(id, store_name, store_introduce, phone);
	
%>
<script>
	alert("가입되셨습니다!")
	location.href ="Login.jsp";
</script>