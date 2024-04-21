<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="dao.PromotionImage"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8");

int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트   
String location = application.getRealPath("/Images");
MultipartRequest multi = new MultipartRequest(request,
										location,
										  maxSize,
										  "utf-8",
										  new DefaultFileRenamePolicy());

String userName = multi.getParameter("userName");

Enumeration<?> files = multi.getFileNames(); 
	
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

String id = "jiyoonjung";
String image = filesystemName;
String title = multi.getParameter("title");
PromotionImage pro_image = new PromotionImage();
pro_image.proImageInsert(id, image, title);




%>
<script> 
	alert("등록되었습니다.");
	location.href="PromotionimgTotalLeft.jsp"
</script>
