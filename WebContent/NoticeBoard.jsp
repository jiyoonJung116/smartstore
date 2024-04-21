<%@page import="dto.BoardListDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
   	String loginId = (String)session.getAttribute("loginId");   

      	BoardDao dao = new BoardDao();
   	ArrayList<BoardListDto> listBoard = dao.getBoardListByPageNum(1);
   %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<script src="js/jquery-3.7.0.min.js"></script>
	<script>
	let page_requested = 1;
	function request_one_page(){
		page_requested +=1;
		//ajax -> 한 페이지 요청
		$.ajax({
			type : 'get',
			url : 'NoticeBoardServlet',
			data : { 'pageNum': page_requested },
			datatype : 'json',
			success: function(data){
				//console.log(data);
				for(var i = 0; i<=data.length-1; i++){
					let str = "<tr>"
				         +"<td class=\"bno\">"+data[i].bno+"</td>"
				         +"<td>"+data[i].title+"</td>"
				         +"<td class=\"nickname\">"+data[i].nickname+"</td>"
				         +"<td>"+data[i].writedate+"</td>"
				         +"<td>"+data[i].hitcount+"</td>"
				         +"</tr>";
				$("#board_table").append(str);
				}
			},
			error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		    }
		});
	}
		$(function() {
			/* $("#searchButton").click(function() {
				  // 검색어를 가져옴
				  var searchKeyword = $("#searchWord").val();

				  // 서버로 전달할 데이터 준비
				  var requestData = { 'searchWord': searchKeyword };

				  $.ajax({
				    type: 'post',
				    url: 'NoticeBoardSearchServlet', // 서버에서 검색 결과를 제공하는 URL로 수정해야 합니다.
				    data: requestData,
				    dataType: 'html', // 검색 결과는 HTML로 받아옴
				    success: function(response) {
				      // 검색 결과를 보여줄 영역에 동적으로 추가
				      $("#searchResults").html(response);
				    },
				    error: function (request, status, error) {
				      console.log("code: " + request.status);
				      console.log("message: " + request.responseText);
				      console.log("error: " + error);
				    }
				  });
				}); */
			$(window).scroll(function(){
				  var scrT = $(window).scrollTop();
				  console.log(scrT); //스크롤 값 확인용
				  if(scrT == $(document).height() - $(window).height()){
				  	//스크롤이 끝에 도달했을때 실행될 이벤트
				  	request_one_page();
				  } 
				});
			$("tr").click(function() {
				let bno = $(this).find(".bno").text();
				let nickname = $(this).find(".nickname").text();
				location.href = "NoticeBoardDetail.jsp?bno=" + bno+"&nickname="+nickname;
			});
			$(".write_bt").click(function(){
				location.href = "NoticeBoardWrite.jsp";
			});
			$(".login_bt").click(function(){
				location.href = "NoticeBoardLogin.jsp";
			});
			$(".join_bt").click(function(){
				location.href = "NoticeBoardJoin.jsp";
			});
			$(".logout_bt").click(function(){
				location.href = "LogoutAction.jsp";
			});
		});
	</script>
	<link rel="stylesheet" href="css/NoticeBoard.css" />
</head>
<body>
	<div id="searchResults">
		<div class="board_background">
			<div class="fl po_rela">
				<span class="board_font">Board</span>
			</div>
			<form method="post" action="searchedBbs.jsp" class="notice_st" id="searchForm">
			  <div>
			    <input type="text" class="form-control pull-right" placeholder="Search" name="searchWord" id="searchWord" />
			  </div>
			  <button class="notice_st1" type="button" id="searchButton">
			    <span>검색</span>
			  </button>
			</form>
		</div> <!-- 제목라인 -->
		<div class="board_background1">
			<div class="fr po_rela">
			<%if(loginId !=null) {%>
				<button type="button" class="notice_bt logout_bt">로그아웃</button>
				<button type="button" class="notice_bt write_bt">글쓰기</button>
			<%} else { %>
				<button type="button" class="notice_bt login_bt">로그인</button>
				<button type="button" class="notice_bt join_bt">회원가입</button>
			<%} %>
			</div>
		</div> <!-- 로그인 -->
		<div style="height : 100%">
			<table id="board_table" class="po_rela notice_location">
				<tr>
					<th class="board notice_width2">번호</th>
					<th class="board notice_width">제목</th>
					<th class="board notice_width1">작성자</th>
					<th class="board notice_width3">작성일시</th>
					<th class="board">조회수</th>
				</tr>
				<% for(BoardListDto dto : listBoard) { %>
				<tr>
					<td class="bno"><%=dto.getBno() %></td>
					<td><%=dto.getTitle() %></td>
					<td class="nickname"><%=dto.getNickname() %></td>
					<td><%=dto.getWritedate() %></td>
					<td><%=dto.getHitcount() %></td>
				</tr>
				<% } %>
			</table>
		</div> <!-- 글목록 -->
	</div>
</body>
</html>