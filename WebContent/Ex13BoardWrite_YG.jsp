<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
	<form action="Ex13BoardWriteAction_YG.jsp" method="post">
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" name="bno"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"/></td>
			</tr>
		</table>
		<input type="submit" value="작성완료"/>
	</form>	
</body>
</html>