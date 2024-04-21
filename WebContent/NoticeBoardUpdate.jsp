<%@page import="dto.BoardListDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int bno = Integer.parseInt(request.getParameter("bno"));
        
        	BoardDao dao = new BoardDao();
    		ArrayList<BoardListDto> listBoard = dao.board_detail(bno);
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
		<form action="NoticeBoardUpdateAction.jsp" method="post">
			<table>
				<tbody>
				<%for(BoardListDto dto : listBoard){%>
					<tr>
						<th class="detail_st1 detail_st2">제목</th>
	                    <td class="detail_st">
	                    	<input type="text" name = "title" value="<%=dto.getTitle() %>"/>
	                    	<input type="hidden" name ="bno" value="<%=bno %>">
	                    </td>
	                </tr>
	                <tr>
						<th class="detail_st1 detail_st2">작성자</th>
	                    <td class="writer txtLittle detail_st3"><%=dto.getNickname() %></td>
	                </tr>
	                <tr>
						<th class="detail_st1 detail_st2">작성일</th>
	                    <td class="writer txtLittle detail_st3"><%=dto.getWritedate() %></td>
	                </tr>
	                <tr>
						<th class="detail_st1 detail_st2">조회</th>
	                    <td class="writer txtLittle detail_st3"><%=dto.getHitcount() %></td>
	                </tr>
	                <tr class="view">
						<td>
	                        <div class="detail">
	                        	<textarea name="content"><%=dto.getContent() %></textarea>
	                        </div>
	                    </td>
	                </tr>
	                <%} %>
				</tbody>
			</table>
			<input type="submit" value="작성완료"/>
		</form>	
		<div>
			<button id="btn_write" class="detail_bt" onclick="location.href='NoticeBoard.jsp';">목록</button>
			<button class="detail_bt" onclick="location.href='NoticeBoardUpdate.jsp?bno=<%=bno%>'">수정하기</button>
			<button class="detail_bt">삭제하기</button>
		</div>
	</div>
</body>
</html>