<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/NoticeBoardLogin.css" />
</head>
<body>
	<div class="login-container">
        <h1>로그인</h1>
        <form id="loginForm" action="NoticeBoardLoginAction.jsp">
            <label for="username">아이디:</label>
            <input type="text" id="username" name="id" required>
            <br>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="pw" required>
            <br>
            <input type="submit" value="로그인">
        </form>
    </div>
</body>
</html>