<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
  <meta charset="utf-8">
<head>
  <title>네이버 공유하기</title>
  <script>
    function share() {
      var url = encodeURI(encodeURIComponent(myform.url.value));
      var title = encodeURI(myform.title.value);
      var shareURL = "https://share.naver.com/web/shareView?url=" + url + "&title=" + title;
      document.location = shareURL;
    }
  </script>
</head>
<body>
  <form id="myform">
    URL입력:  <input type="text" id="url" value="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&oquery=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0&ie=utf8&query=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0"><br/>
    Title입력:  <input type="text" id="title" value="제목을 입력하세요"><br/>
  </form>
  <input type="button" value="네이버공유하기" onclick="share()"/>
  <span>
	<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
	<script type="text/javascript">
	new ShareNaver.makeButton({"type": "c" , "title":""});
	</script>
</span>
</body>
</html>