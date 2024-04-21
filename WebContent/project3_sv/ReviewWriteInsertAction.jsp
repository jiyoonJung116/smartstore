<%@page import="java.util.Enumeration"%>
<%@page import="dao.ReviewInsertDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("request getContentType : " + request.getContentType());
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
		element = (String)files.nextElement(); 
		filesystemName 			= multi.getFilesystemName(element); 
		originalFileName 		= multi.getOriginalFileName(element); 
		contentType 			= multi.getContentType(element);	
		length 					= multi.getFile(element).length(); 
		
	}

	String seller_id = "jiyoonjung";
	Long product_order_num = Long.parseLong(multi.getParameter("product_order_num"));
	String review_division = "일반";
	int buyer_grade = Integer.parseInt(multi.getParameter("buyer_grade"));
	//String photo_video = multi.getParameter("photo_video");
	String photo_video = filesystemName;
	String review_content = multi.getParameter("review_content");
	String review_display_status = "정상";
	
	ReviewInsertDao reviewinsert = new ReviewInsertDao();
	reviewinsert.review(seller_id, product_order_num, review_division, buyer_grade, photo_video, review_content, review_display_status);
%>
<script> 
	alert("등록되었습니다.");
	location.href="CustomerDailyLeftContent.jsp"
</script>