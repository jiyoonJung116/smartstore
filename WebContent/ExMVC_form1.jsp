<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Controller_1">
		num1 : <input type="text" name="num1"/> <br/>
		[+] <br/>
		num2 : <input type="text" name="num2"/> <br/>
		<input type="hidden" name = "command" value="plus"/>
		<input type="submit" value="계산!"/> <br/>
	</form>
</body>
</html>