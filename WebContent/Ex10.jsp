<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 연습</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="Ex10RegisterAction.jsp" method="post">	<!-- 요청방식 : post, get방식은 get으로 넘어옴(default는 get) get방식은 파라미터 정보가 쿼리스트링에 다 실림, post방식은 querystring에 붙지 않고 숨겨짐. 자바스크립트 코드 방식으로 post쓰는 방법도 있음  -->
	  아이디 :<input type="text" name="id"/> </br>				<!-- post와 get방식의 차이 -->
	  패스워드 :<input type="password" name="pw"/> </br>
	  이름 :<input type="text" name="name"/> </br>
	  <input type="submit" value="작성완료"/>
	</form>
</body>
</html>