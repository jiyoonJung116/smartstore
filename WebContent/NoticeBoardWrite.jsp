<%@page import="dto.BoardListDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = (String)session.getAttribute("loginId");   

	if(loginId==null){
%> 
	<script>alert("로그인부터 하세요");</script>
<% 
	}
%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 상세보기</title>
	<link rel="stylesheet" href="css/NoticeBaordDetail.css" />
</head>
<body>
	<div class="board">
		<div class="board_background">
			<div class="fl po_rela">
				<span class="board_font">Board</span>
			</div>
		</div>
		<form action="NoticeBoardInsertAction.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th class="detail_st1 detail_st2">제목</th>
	                    <td class="detail_st">
	                    	<input type="text" name="title" style="width: 1163px; height: 40px;">
	                    </td>
	                </tr>
	                <tr class="view">
						<th class="detail_st1 detail_st2">내용</th>
						<td class="detail_st">
	                    	<textarea name = "content" class="board_area"></textarea>
	                    </td>
	                </tr>
	                <tr class="view">
						<th class="detail_st1 detail_st2">첨부파일</th>
						<td class="detail_st">
	                    	<p><input type="file" name="photo_video" class=file_upload></p>
	                    </td>
	                </tr>
				</tbody>
			</table>
			<div>
				<button class="wirte_bt fr" type = "submit">등록</button>
			</div>
		</form>
	</div>
</body>
</html>