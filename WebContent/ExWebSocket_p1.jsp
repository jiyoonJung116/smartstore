<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="js/jquery-3.7.0.min.js"></script> 
	<script>
		var webSocket = new WebSocket("ws://localhost:9090/WebProject1/broadcasting1");//프로토콜의 이름 
		webSocket.onmessage = function(e) {
			onMessage(e);
		}
		//메시지가 발생하거나 도착했을 때
		
		webSocket.onopen = function(e) {
			onOpen(e);
		}
		//접속했을 때 실행
		
		webSocket.onerror = function(e) {
			onError(e);
		}
		//에러가 났을 때 
		
		function onOpen(e){
			$("#div_message").append("<p class='chat'>채팅에 참여하였습니다.</p>");
		}
		function onClose(e){
			alert(e.data);
		}
		function onMessage(e) {				 
			$("#div_message").append("<p class='chat'>"+e.data+"</p>"); 
		} 
		//말풍선 추가
		
		$(function(){
			$("#btn_send").click(function() { 
				var my_id = $("#id_chat").val(); 
				var msg = $("#input_message").val(); 
				webSocket.send(my_id + "|" + msg); //전송버튼을 눌렀을 때 서버 쪽으로 전송. 
				$("#div_message").append("<p class='chat'>나 : " + msg + "</p>"); 
			}); 
		});
	</script>
</head>
<body>
	My ID : <input type="text" id="id_chat" value="YG"/> <br/>
	Chat : 
	<div id="div_message">
		<input type="text" id="input_message"/>
		<input type="button" id="btn_send" value="전송"/>
	</div>
</body>
</html>