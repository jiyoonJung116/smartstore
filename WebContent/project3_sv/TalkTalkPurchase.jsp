<%@page import="dao.TalkTalkChatContentPurchaseDao"%>
<%@page import="dto.톡톡Dto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TalkTalkChatContentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String loginId = (String)session.getAttribute("loginId"); 
%>
<%	
	request.setCharacterEncoding("utf-8");

	TalkTalkChatContentPurchaseDao contentdao = new TalkTalkChatContentPurchaseDao();
	TalkTalkChatContentDao read = new TalkTalkChatContentDao();
	
	String paramDate1 = request.getParameter("param_date1");
	String paramDate2 = request.getParameter("param_date2");  // 2023.07.14
	String paramRead = request.getParameter("param_read");   // 안읽음 or 전체
	String paramOrder = request.getParameter("param_order");  // '먼저문의순', '최근문의순'
	
	String customerId = request.getParameter("customerId");
	String seller_id = request.getParameter("seller_id");
	int talkNum = contentdao.chatNumber(seller_id, customerId);
	
	contentdao.purchaseShow(customerId, seller_id, talkNum);
	ArrayList<톡톡Dto> talkdto = contentdao.chatContent(talkNum);
	read.setTalkContentStatusToRead(customerId, talkNum); 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>톡톡상담(구매자/방문자)</title>
<link rel="stylesheet" href="../css/TalkTalk2_copy2_final_copy.css" />
<script src="../js/jquery-3.7.0.min.js"></script>
<script>
	//웹소켓 사용
	var webSocket = new WebSocket("ws://localhost:9090/WebProject1/talkbroadcasting");
	webSocket.onmessage = function(e) { 
		let sender_id = e.data.split(" : ")[0];
		let msg = e.data.split(" : ")[1];
		
		alert('sender_id = ' + sender_id + " / loginId : <%=loginId%>"); 
		if(sender_id == "<%=loginId%>") {
			let str = '<div class="message_balloon card_message rgt">'
					+ '<p class="talk_font13 talk_font14">안읽음</p>'
					+ '<span class="talk_font13 ">오후 <span>xx:xx</span></span>'
					+ '<p class="hi speechbubble">'+msg+'</p>'
					+ '</div>';
			$("div.talkstyle25").append(str);
		} else {
			let str = '<div class="message_balloon card_message rgt">'
				+ '<img src="../Images/사람.png" class="imgstyle15">'
				+ '<p class="hi speechbubble5">'+msg+'</p>'
				+ '<span class="talk_font19">오후 <span>xx:xx</span></span>'
				+ '</div>';
			$("div.talkstyle25").append(str);
		}
	} 
	webSocket.onopen = function(e) { 
		//$("#div_message").append("<p class='chat'>채팅에 참여하였습니다</p>"); 
	} 
	webSocket.onerror = function(e) { 
		alert(e.data); 
	} 
	$(function(){
		$("#sendbutton").click(function(){
			let sellerId = $("#input_seller_id").val();
			let customerId = $("#input_customer_id").val(); //
			let senderId = $("#input_sender_id").val();
			let room_num = $("#input_talk_num").val();//
			let talkchat = $(".talkstyle9").val();//
			//webSocket.send(sellerId + "|" + customerId+ "|" +senderId+ "|" +room_num+ "|" +talkchat);
			webSocket.send(room_num + "_" + senderId + "_" + talkchat);
		});
	});
</script>
</head>
<body>
<div class="fl talkstyle26 talktalk_dis2" style="background-color: rgba(240,242,245,.95);">
					<div class="talkstyle4">
						<div class="fl">
							<img class="imgstyle11 imgstyle10" src="https://talk.sell.smartstore.naver.com/nstatic/images/common/partner_default_profile.png?20230601185700">
						</div>
						<div class="fl nicknamest">
							<strong>CustomerDaily</strong>
						</div>
					</div>

					<!--  -->
					<div style="overflow-y: auto; border-bottom: 1px solid #dbdde2; overflow-x: hidden;">
					<div class="talkstyle25">
						<%for(톡톡Dto dto : talkdto) { 
							String t = dto.getTalkTime();
							int year = 0;
							int month = 0;
							int date = 0;
							int hour = 0;
							int minute = 0;
							
							if(t.indexOf("-")>2) {
								year = Integer.parseInt(t.substring(0,4));
								month = Integer.parseInt(t.substring(5,7));
								date = Integer.parseInt(t.substring(8,10));
								hour = Integer.parseInt(t.split(" ")[1].substring(0,2));
								minute = Integer.parseInt(t.split(" ")[1].substring(3,5));
							} else {
								year = Integer.parseInt(t.substring(0,2));
								month = Integer.parseInt(t.substring(3,5));
								date = Integer.parseInt(t.substring(6,7));
								hour = Integer.parseInt(t.split(" ")[1].substring(0,2));
								minute = Integer.parseInt(t.split(" ")[1].substring(3,5));
							}
							if(dto.getSellerId().equals(dto.getSenderId())) { %>
										<div class="message_balloon card_message rgt">
												<img src="../Images/사람.png" class="imgstyle15">
												<p class="hi speechbubble5"><%=dto.getTalkContent() %></p>
												<span class="talk_font19"><%=hour>=12 ? "오후" : "오전" %> <span><%=hour>12 ? hour-12 : hour %>:<%=minute<10 ? "0"+minute : minute %></span></span>
											</div>		
								<% 		} else { %>
								<div class="message_balloon card_message rgt">
													<p class="talk_font13 talk_font14"><%=dto.isReadStatus() ? "읽음" : "안읽음" %></p>
													<span class="talk_font13 "><%=hour>=12 ? "오후" : "오전" %> <span><%=hour>12 ? hour-12 : hour %>:<%=minute<10 ? "0"+minute : minute %></span></span>
													<p class="hi speechbubble"><%=dto.getTalkContent() %></p>
												</div>
											
									<% 	} %>
						<%} %>
						</div>
					</div>
					<div class="talkstyle23">
						<div>
							<button class="talkstyle5">
								<img src="../Images/스마일.png" class="imgstyle16">
							</button>
						</div>
						<div>
							<button class="talkstyle5">
								<img src="../Images/사진.png" class="imgstyle17">
							</button>
						</div>
						<div>
							<button class="talkstyle5">
								<img src="../Images/연필2.png" class="imgstyle18">
							</button>
						</div>
						<div>
							<button class="talkstyle5">
								<img src="../Images/좋아요.png" class="imgstyle19">
							</button>
						</div>
						<div>
							<button class="talkstyle5">
								<img src="../Images/파일.png" class="imgstyle20">
							</button>
						</div>
					</div>

					<div class="talkstyle27">
						<div class="talkstyle8">
								<input type="hidden" id="input_seller_id" name="sellerId" value="<%=loginId%>"/>
								<input type="hidden" id="input_customer_id" name="customerId" value="<%=customerId%>"/>
								<input type="hidden" id="input_sender_id" name="senderId" value="<%=customerId%>"/>
								<input type="hidden" id="input_talk_num" name="talkNum" value="<%=talkNum%>"/>
								<input type="text" placeholder="메시지를 입력해 주세요" name="chat" class="talkstyle9">
								<button id="sendbutton">
									<span>전송</span>
								</button>
						</div>
					</div>
				</div>
</body>
</html>