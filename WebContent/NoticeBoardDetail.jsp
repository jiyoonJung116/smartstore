<%@page import="dto.NoticeBoardCommentDto"%>
<%@page import="dto.BoardListDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String loginId = (String)session.getAttribute("loginId"); 
        		int bno = Integer.parseInt(request.getParameter("bno"));
            	String nickname = request.getParameter("nickname");
            	
            	BoardDao dao = new BoardDao();
            	dao.hitupdate(bno);
        		ArrayList<BoardListDto> listBoard = dao.board_detail(bno);	
        		String writerId = dao.getWriterId(nickname, bno);
        		ArrayList<NoticeBoardCommentDto> listComment = dao.comment_select(bno);
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
		<table>
			<tbody>
			<%
				for(BoardListDto dto : listBoard){
			%>
				<tr>
					<th class="detail_st1 detail_st2">제목</th>
                    <td class="detail_st"><%=dto.getTitle()%></td>
                </tr>
                <tr>
					<th class="detail_st1 detail_st2">작성자</th>
                    <td class="writer txtLittle detail_st3"><%=dto.getNickname()%></td>
                </tr>
                <tr>
					<th class="detail_st1 detail_st2">작성일</th>
                    <td class="writer txtLittle detail_st3"><%=dto.getWritedate()%></td>
                </tr>
                <tr>
					<th class="detail_st1 detail_st2">조회</th>
                    <td class="writer txtLittle detail_st3"><%=dto.getHitcount()%></td>
                </tr>
                <tr class="view">
					<td>
                        <div class="detail">
                        	<%
                        		String photoUrl = dto.getPhoto();
                        						   if (photoUrl != null && !photoUrl.isEmpty()) {
                        	%>
							    <img src="Images/<%=photoUrl%>">
							<%
								}
							%>
                        	<div><%=dto.getContent()%></div>
                        </div>
                    </td>
                </tr>
                <%
                	}
                %>
			</tbody>
		</table>
		<div>
			<button id="btn_write" class="detail_bt" onclick="location.href='NoticeBoard.jsp';">목록</button>
			<%
				if(loginId.equals(writerId)) {
			%>
			<button class="detail_bt" onclick="location.href='NoticeBoardUpdate.jsp?bno=<%=bno%>'">수정하기</button>
			<button class="detail_bt" onclick="location.href='NoticeBoardDeleteAction.jsp?bno=<%=bno%>'">삭제하기</button>
			<%
				} else if (loginId != null && writerId != null) {
			%>
			
		    <%
					    	}
					    %>
		</div>
		 <h3 class="detail_st4">댓글</h3>
		  <div>
		  	<%
		  		for(NoticeBoardCommentDto dto : listComment){
		  	%>
			<div class="comment_area">
				<div class="comment_box">
					<div class="comment_nick_box">
						<div class="comment_nickname detail_st5"><%=dto.getNickname() %></div>
						<p>
			        		<span class="comment_content detail_st5"><%=dto.getContent() %></span>
			        	</p>
		        	</div>
			        <div>
			        	<span class="comment_date detail_st5 detail_st6"><%=dto.getWritedate() %></span>
			        </div>
			    </div>
		    </div>
		    <%} %>
		    
		</div>
	</div>
</body>
</html>