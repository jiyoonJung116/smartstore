<%@page import="dao.NoticeBoardInsertDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dao.ReviewInsertDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String loginId = (String)session.getAttribute("loginId");
	int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   
	//String location = "C:\\자바\\eclipse\\workspace\\WebProject1\\WebContent\\Images";
	String location = request.getRealPath("Images");
	MultipartRequest multi = new MultipartRequest(request,
											location,
											  maxSize,
											  "utf-8",
											  new DefaultFileRenamePolicy());

	String userName = multi.getParameter("userName");

	Enumeration<?> files = multi.getFileNames(); // <input type="file">인 모든 파라메타를 반환
		
	String element = "";
	String filesystemName = "";
	String originalFileName = "";
	String contentType = "";
	long length = 0;

	if (files.hasMoreElements()) {
	    element = (String) files.nextElement();
	    filesystemName = multi.getFilesystemName(element);
	    originalFileName = multi.getOriginalFileName(element);
	    
	    // 파일이 첨부되었을 때만 파일 크기 가져오기
	    if (filesystemName != null) {
	        length = multi.getFile(element).length();
	        contentType = multi.getContentType(element);
	    }
	}

	String title = multi.getParameter("title");
	String photo = filesystemName; 
	String content = multi.getParameter("content");

	NoticeBoardInsertDao boardWrite = new NoticeBoardInsertDao();

	if (title == null) {
	    title = ""; 
	}

	if (content == null) {
	    content = ""; 
	}

	if (photo != null && !photo.isEmpty()) {
	    boardWrite.boardInsert(title, content, photo); // 파일 첨부가 있는 경우
	} else {
	    boardWrite.boardWriteInsert(title, content, loginId); // 파일 첨부가 없는 경우
	}

	
	
	
	%>
<script> 
	alert("등록되었습니다.");
	location.href="NoticeBoard.jsp"
</script>