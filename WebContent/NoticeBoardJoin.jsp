<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/NoticeBoardJoin.css" />
</head>
<body>
	<div class="signup-container">
        <h1>회원가입</h1>
        <form id="signupForm" action = "NoticeBoardJoinInsertAction.jsp">
            <label for="username">아이디:</label>
            <input type="text" id="memberId" name="memberId" required>
            <br>
            <label for="password">패스워드:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <label for="name">이름:</label>
            <input type="text" id="name" name="name" required>
            <br>
            <label for="email">이메일 주소:</label>
            <input type="email" id="email" name="email" required>
            <br>
            <label for="nickname">닉네임:</label>
            <input type="text" id="nickname" name="nickname" required>
            <br>
            <label for="birthdate">생일:</label>
            <input type="date" id="birthdate" name="birthdate" required>
            <br>
            <label class="gender-label">성별:</label>
            <input type="radio" id="male" name="gender" value="남성" required>
            <label for="male" style="position: relative; bottom: 36px;">남성</label>
            <input type="radio" id="female" name="gender" value="여성" required>
            <label for="female" style="position: relative; bottom: 36px;">여성</label>
            <br>
            <label for="phone">핸드폰 번호:</label>
            <input type="tel" id="phone" name="phone" required>
            <br>
            <input type="submit" value="가입하기">
        </form>
    </div>
</body>
</html>