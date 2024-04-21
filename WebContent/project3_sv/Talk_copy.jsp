<%@page import="dto.톡톡채팅상태Dto"%>
<%@page import="dto.톡톡Dto"%>
<%@page import="dto.톡톡상담Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>

<%	String loginId = "jiyoonjung";   // (String)session.getAttribute("loginId"); %>
    
<%	
	request.setCharacterEncoding("utf-8");

	TalkTalkChatContent_firstDao firstdao = new TalkTalkChatContent_firstDao();
	TalkTalkChatContentDao contentdao = new TalkTalkChatContentDao();
	TalktalkchatDao talkchatdao = new TalktalkchatDao();
	
	
	firstdao.setupTalkStatusToWait();   // '모두 안읽음' 상태인 상담을 '대기' 상태로 만듦.
	int waitCount = talkchatdao.countByStatus("대기");
	int proceedingCount = talkchatdao.countByStatus("진행중");
	int totalCount = talkchatdao.countByStatus("전체");

	//int waitCount = talkchatdao.waitselect();
	//int proceedingCount = talkchatdao.proceedingselect();
	//int totalCount = talkchatdao.totalselect();

	String paramDate1 = request.getParameter("param_date1");
	String paramDate2 = request.getParameter("param_date2");  // 2023.07.14
	String paramRead = request.getParameter("param_read");   // 안읽음 or 전체
	String paramOrder = request.getParameter("param_order");  // '먼저문의순', '최근문의순'
	//채팅상태 글 불러오기
	String paramChatstatus = request.getParameter("param_chatstatus");  //채팅상태 불러오는건데 null값이 들어옴. 질문.
	

	ArrayList<톡톡상담Dto> listchat = firstdao.chatContent(paramDate1, paramDate2, paramRead, paramOrder, paramChatstatus);
	ArrayList<톡톡Dto> talkdto = null;
	String customerId = null;

	int num = 0;
	try {
	    num = Integer.parseInt(request.getParameter("num"));
	} catch (NumberFormatException e) {
	    //num = 1; // 기본값으로 설정
	}
	
	contentdao.setTalkContentStatusToRead(loginId, num);
	
	if(num>0) {
		talkdto = contentdao.chatContent(num);
		customerId = contentdao.getCustomerIdFromRoomNumber(num);
	}
	
	 
%>
    <!--  파라미터 num이 없으면, 변수 num이 0이 되고 talkdto가 null이 된다... -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>톡톡상담관리</title>
<link rel="stylesheet" href="../css/TopSidebar.css" />
<link rel="stylesheet" href="../css/TalkTalk2_copy2_final_copy.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="../js/jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	function sidebarbtn(a, b) {
		let sc = document.getElementById(a);
		let di = document.getElementById(b);
		if (sc.style.display == "none") {
			sc.style.display = "block";
			di.className = "afterdropbtn";
		} else if (sc.style.display == "block") {
			sc.style.display = "none";
			di.className = "dropbtn";
		}
	}
</script>
<script>
	function parake(_this) { /*$(this)  */
		let name = _this.attr("src");
		$(".talk_st2 > button > img").each(function(index, item) {
			let name2 = $(item).attr("src").replace("파란", "");
			$(item).attr("src", name2);
		});
		//alert("_this.attr( src ) : " + _this.attr("src"));    // "../Images/말풍선.png"
		let idx1 = _this.attr("src").lastIndexOf("/") + 1;
		let idx2 = _this.attr("src").lastIndexOf(".") - 1;
		let filename = _this.attr("src").substring(idx1, idx2 + 1); // '말풍선' : 마지막 슬래쉬(/)부터 쩜(.) 직전까지.
		//alert("filename : " + filename);

		// 파란말풍선 <--> 말풍선
		if (name.indexOf("파란") > -1) {
			_this.attr("src", "../Images/" + filename + ".png");
			$(".talk_st4").removeClass("on");
		} else {
			_this.attr("src", "../Images/파란" + filename + ".png");
			$(".talk_st4").removeClass("on");
			_this.parent().find(".talk_st4").addClass("on");
		}
	}
	
	function apply_parameters_to_current_page() {
		let num = <%=num%>;
		let str_href = "Talk_copy.jsp?num=<%=num%>";
		if(param_date1 != "null" && param_date1 != "") str_href += "&param_date1=" + param_date1;
		if(param_date2 != "null" && param_date2 != "") str_href += "&param_date2=" + param_date2;
		if(param_read != "null" && param_read != "") str_href += "&param_read=" + param_read;
		if(param_order != "null" && param_order != "") str_href += "&param_order=" + param_order;
		
		if(param_chatstatus != "null" && param_chatstatus != "") str_href += "&param_chatstatus=" + param_chatstatus;
		location.href = str_href;
	}
	function apply_parameters_to_page(page_num) {
		let str_href = "Talk_copy.jsp?num=" + page_num;
		if(param_date1 != "null" && param_date1 != "") str_href += "&param_date1=" + param_date1;
		if(param_date2 != "null" && param_date2 != "") str_href += "&param_date2=" + param_date2;
		if(param_read != "null" && param_read != "") str_href += "&param_read=" + param_read;
		if(param_order != "null" && param_order != "") str_href += "&param_order=" + param_order;
		
		if(param_chatstatus != "null" && param_chatstatus != "") str_href += "&param_chatstatus=" + param_chatstatus;
		location.href = str_href;
	}
	
	document.addEventListener("DOMContentLoaded", function() {
		let textarea = document.querySelector("#consultation_info3 textarea");
		let counter = document.querySelector("#consultation_info3 .q_st2");

		textarea.addEventListener("input", function() {
			let content = textarea.value;
			let maxLength = 200;
			let currentLength = content.length;

			counter.textContent = currentLength;

			if (currentLength > maxLength) {
				textarea.value = content.substring(0, maxLength);
				counter.textContent = maxLength;
			}
		});
	});

	let param_date1 = "<%=paramDate1%>";
	let param_date2 = "<%=paramDate2%>";  // 2023.07.14
	let param_read = "<%=paramRead%>";   // 안읽음 or 전체
	let param_order = "<%=paramOrder%>";  // '먼저문의순', '최근문의순'
	
	//채팅 상태 
	let param_chatstatus = "<%=paramChatstatus%>"; //대기, 진행중, 완료
	function parake2(_this) {
		let src = _this.attr("src");
		src = src.replace("Images/", "Images/파란");
		_this.attr("src", src);
	}
	$(function() {
		if(param_date1!='null')
			$("#date_picker_from").val(param_date1);
		if(param_date2!='null')
			$("#date_picker_to").val(param_date2);
		if(param_read=='안읽음')
			$("#bt2 .talk_st8").text("안읽음");
		else if(param_read=='전체')
			$("#bt2 .talk_st8").text("읽음여부");
		if(param_order!='null' && param_order!='')
			$("#bt3 .talk_st11").text(param_order.substring(0,2) + " " + param_order.substring(2));
		
		//채팅 상태 o
		if(param_chatstatus!='null' && param_chatstatus!='')
			$(".talk_font").text();
		
		if(param_chatstatus=='전체') {
			$("#chatroom1").css('display','block');	
			$("#chatroom2").css('display','none');
			parake2($("#chatroom1 > button:nth-child(1) img"));
			$("#chatroom1 > button:nth-child(1) .talk_st4").addClass("on");	
		} else if(param_chatstatus=='대기') {
			$("#chatroom1").css('display','block');	
			$("#chatroom2").css('display','none');	
			parake2($("#chatroom1 > button:nth-child(2) img"));
			$("#chatroom1 > button:nth-child(2) .talk_st4").addClass("on");	
		} else if(param_chatstatus=='진행중') {
			$("#chatroom1").css('display','block');	
			$("#chatroom2").css('display','none');	
			parake2($("#chatroom1 > button:nth-child(3) img"));
			$("#chatroom1 > button:nth-child(3) .talk_st4").addClass("on");	
		} else if(param_chatstatus=='보류') {
			$("#chatroom1").css('display','block');	
			$("#chatroom2").css('display','none');	
			parake2($("#chatroom1 > button:nth-child(4) img"));
			$("#chatroom1 > button:nth-child(4) .talk_st4").addClass("on");	
		} else if(param_chatstatus=='완료') {
			$("#chatroom1").css('display','none');	
			$("#chatroom2").css('display','block');	
			parake2($("#chatroom2 > button:nth-child(2) img"));
			$("#chatroom2 > button:nth-child(2) .talk_st4").addClass("on");	
		} else if(param_chatstatus=='차단') {
			$("#chatroom1").css('display','none');	
			$("#chatroom2").css('display','block');	
			parake2($("#chatroom2 > button:nth-child(3) img"));
			$("#chatroom2 > button:nth-child(3) .talk_st4").addClass("on");	
		} else {
			$("#chatroom1").css('display','block');	
			$("#chatroom2").css('display','none');
		}
		
		$("#complete_bt").click(function(){
			alert("상담이 종료되었습니다");
			$(this).css('display','none');
			$(this).parent().find("#complete_bt_ok").css('display','block');
			let num = document.getElementById("room_num").getAttribute("value");
			location.href = "TalkStatusUpdateAction.jsp?num="+num;
			/* location.href = "................action.jsp?num=방번호";  // ------> action.jsp) update문 날리고 ----> talk_copy.jsp?num=방번호" */
		});
		
		$(".chat1").click(function() {
			let n = $(this).find(".talk_font2 > span").eq(0).text();
			//location.href = "../project3_sv/Talk_copy.jsp?num=" + n;
			apply_parameters_to_page(n);
		});

		$("#date_picker_from").datepicker({
					showOn : 'both',
					buttonImage : 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==',
					dateFormat : "yy-mm-dd",
					prevText : '이전 달',

					nextText : '다음 달',
					monthNames : [ '01', '02', '03', '04', '05', '06',
							'07', '08', '09', '10', '11', '12' ],
					monthNameshort : [ '1월', '2월', '3월', '4월', '5월',
							'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '.',
					onSelect : function(dateText, inst) {
						let dateObj = $(this).datepicker('getDate');
						let formattedDate = $.datepicker.formatDate(
								"yy-F-DDDD", dateObj);
						$("#formatted_date").text(formattedDate);
					}
				});
		$("#date_picker_to").datepicker({
					showOn : 'both',
					buttonImage : 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAeCAYAAABe3VzdAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODgwN0NCRURFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODgwN0NCRUVFODgzMTFFNzhFNzQ4NjYwMENFMEQ3RTciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4ODA3Q0JFQkU4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ODA3Q0JFQ0U4ODMxMUU3OEU3NDg2NjAwQ0UwRDdFNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjTBh6MAAAEoSURBVHjaYvz//z/DYAZMDIMcjDpw1IGjDiQAWEjVUNXUiS4EKqcYsSjFEG+rK6e9A6EWEyOGTZyRXlHMiITfo/EZkRyCzh+QNCiExxMDnkk6gFgAiB2AOAIqVgDEGlDxjoF2oCDUDA4g5oaK8QExK1RckO65GA2sBuJvQHwDiJ9AxXYB8XOo+OqBDsGZ0DToAcTJULE6INaFis8c6BBUhtIzkMS8sMgPWAiCyjk5IK4A4qVQsUtA7A0V/z/QIQiKxo9APAGImaFiNkD8HYj/4imC6BaCu4FYDFrEVELFZgGxOVR890CHIKhi/gTEJ4D4OlRsHhDfhYp3DpQDYeXbHiBmB+KXUAwSPw2VY4fKCw6EA9/Rq7nFONqrG3XgqANHHTjCHQgQYAAjWTNTyGzxagAAAABJRU5ErkJggg==',
					dateFormat : "yy-mm-dd",
					prevText : '이전 달',

					nextText : '다음 달',
					monthNames : [ '01', '02', '03', '04', '05', '06',
							'07', '08', '09', '10', '11', '12' ],
					monthNameshort : [ '1월', '2월', '3월', '4월', '5월',
							'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '.',
					onSelect : function(dateText, inst) {
						let dateObj = $(this).datepicker('getDate');
						let formattedDate = $.datepicker.formatDate(
								"yy-F-DDDD", dateObj);
						$("#formatted_date").text(formattedDate);
					}
				});
				$(".nickname_st_only .nickname_st3").keyup(function(e) {
					let content = $(this).val();
					let count = content.length;
					let limit = $(this).attr("maxlength");
					$(this).closest(".nickname_st_only").find(".count").text(count);
					$(this).closest(".nickname_st_only").find(".limit").text(limit);

					if (count > limit) {
						alert("최대 " + limit + "자까지 입력 가능합니다.");
						$(this).val(content.substring(0, limit));
						count = limit;
					}

					$(this).closest(".nickname_st_only").find(".count").text(count);
					
					 if (count > 0) {
					      $(".nickname_bt1").prop("disabled", false);
					    } else {
					      $(".nickname_bt1").prop("disabled", true);
					    }
				});
		$(".nickname_st").click(function() {
			$(".background").css('display', 'block');
		});
		$(".nickname_bt").click(function() {
			$(".background").css('display', 'none');
		});
		$(".tagstyle").click(function() {
			alert("준비중입니다!");
		});
		$(".talk_st2 > button > img").click(function() {
			parake($(this));
		});
		$(".talk_st4").click(function() {
			parake($(this).parent().find("img"));
		});
		$("#bt1").click(function() {
			if ($(".drop_down_wrap").css('display') === 'none') {
				$(".drop_down_wrap").css('display', 'block');
			} else if ($(".drop_down_wrap").css('display') === 'block') {
				$(".drop_down_wrap").css('display', 'none');
			}
		});
		$("#bt2").click(function() {
			if ($(".drop_down_wrap1").css('display') === 'none') {
				$(".drop_down_wrap1").css('display', 'block');
			} else if ($(".drop_down_wrap1").css('display') === 'block') {
				$(".drop_down_wrap1").css('display', 'none');
			}
		});
		$("#bt3").click(function() {
			if ($(".drop_down_wrap2").css('display') === 'none') {
				$(".drop_down_wrap2").css('display', 'block');
			} else if ($(".drop_down_wrap2").css('display') === 'block') {
				$(".drop_down_wrap2").css('display', 'none');
			}
		});

		let seller_id = $(".topid").text();
		let customer_id = $(".nicknamest > strong").text();
		let sender_id = seller_id;
		$("#input_seller_id").val(seller_id);
		$("#input_customer_id").val(customer_id);
		$("#input_sender_id").val(sender_id);
		
		/* 		let num = 0;
		 $("#but2").click(function () {
		 if(num == 0) {
		 $(this).attr("src", "../Images/파란말풍선2.png");
		 num = 1;
		 }else {
		 $(this).attr("src", "../Images/말풍선2.png");
		 num = 0;
		 }
		 }); */
		 
		 <% if(num>0) { %>
			$('.talktalk_dis2').show();
			$(".talktalk_dis3").show();
	        $(".talktalk_dis1").hide();
		 <% } %>

		 $(".set_date > button").click(function() {
			param_date1 = $("#date_picker_from").val();
			param_date2 = $("#date_picker_to").val();
			apply_parameters_to_current_page();
		 });
		 $(".sorting_item .drop_down_wrap1 ul.list_dropDown > li > button").click(function() {
			param_read = $(this).text();
			apply_parameters_to_current_page();
		 });
		 $(".sorting_item .drop_down_wrap2 ul.list_dropDown > li > button").click(function() {
			param_order = $(this).text().replace(" ","");
			apply_parameters_to_current_page();
		 });
		 
/* 		 $(".talk_st4 > .talk_font").click(function(){
			 param_chatstatus = $(this).text();
			 apply_parameters_to_current_page();
		 });
 */		 
		 $("#chatroom1 > button:not(:nth-child(5))").click(function() {
			 //채팅상태 글 불러오기o
			 param_chatstatus = $(this).find("span > span.talk_font").text();
			 apply_parameters_to_current_page();
		 });
		 $("#chatroom2 > button:not(:nth-child(1))").click(function() {
			 //채팅상태 글 불러오기o
			 param_chatstatus = $(this).find("span > span.talk_font").text();
			 apply_parameters_to_current_page();
		 });
		 
		$(".buttonstyle6").click(function() {
			$(".buttonstyle6").removeClass("on");
			$(this).addClass("on");
		});
	});

	function fnspread(id, show) {
		let purchaseHistory = document.getElementById('purchase_history');
		let consultationInfo = document.getElementById('consultation_info');
		let consultationInfo1 = document.getElementById('consultation_info1');
		let consultationInfo2 = document.getElementById('consultation_info2');
		let consultationInfo3 = document.getElementById('consultation_info3');

		if (id === 'purchase_history') {
			purchaseHistory.style.display = show ? 'block' : 'none';
			$("#consultation_info").css('display', 'none');
			$("#consultation_info1").css('display', 'none');
			$("#consultation_info2").css('display', 'none');
			$("#consultation_info3").css('display', 'none');
		} else if (id === 'consultation_info') {
			purchaseHistory.style.display = show ? 'none' : 'block';
			consultationInfo.style.display = show ? 'block' : 'none';
			consultationInfo1.style.display = show ? 'block' : 'none';
			consultationInfo2.style.display = show ? 'block' : 'none';
			consultationInfo3.style.display = show ? 'block' : 'none';
		}
	}
	function spread2(id, show) {
		let chatroom1 = document.getElementById('chatroom1');
		let chatroom2 = document.getElementById('chatroom2');

		if (id === 'chatroom1') {
			chatroom1.style.display = show ? 'block' : 'none';
			$("#chatroom2").css('display', 'none');
		} else if (id === 'chatroom2') {
			chatroom2.style.display = show ? 'block' : 'none';
			chatroom1.style.display = show ? 'none' : 'none';
		}
	}

	function spread3(id, show) {
		let total_counsel = document.getElementById('total_counsel');
		let wait_counsel = document.getElementById('wait_counsel');
		let complete_counsel = document.getElementById('complete_counsel');
		let hold_counsel = document.getElementById('hold_counsel');
		let cut_counsel = document.getElementById('cut_counsel');

		if (id === 'total_counsel') {
			total_counsel.style.display = show ? 'block' : 'none';
			wait_counsel.style.display = show ? 'none' : 'block';
			complete_counsel.style.display = show ? 'none' : 'block';
			hold_counsel.style.display = show ? 'none' : 'block';
			cut_counsel.style.display = show ? 'none' : 'block';
		} else if (id === 'wait_counsel') {
			wait_counsel.style.display = show ? 'block' : 'none';
			total_counsel.style.display = show ? 'none' : 'block';
			complete_counsel.style.display = show ? 'none' : 'block';
			hold_counsel.style.display = show ? 'none' : 'block';
			cut_counsel.style.display = show ? 'none' : 'block';
		} else if (id === 'complete_counsel') {
			complete_counsel.style.display = show ? 'block' : 'none';
			wait_counsel.style.display = show ? 'none' : 'block';
			total_counsel.style.display = show ? 'none' : 'block';
			hold_counsel.style.display = show ? 'none' : 'block';
			cut_counsel.style.display = show ? 'none' : 'block';
		} else if (id === 'hold_counsel') {
			hold_counsel.style.display = show ? 'block' : 'none';
			complete_counsel.style.display = show ? 'none' : 'block';
			wait_counsel.style.display = show ? 'none' : 'block';
			total_counsel.style.display = show ? 'none' : 'block';
			cut_counsel.style.display = show ? 'none' : 'block';
		} else if (id === 'cut_counsel') {
			cut_counsel.style.display = show ? 'block' : 'none';
			hold_counsel.style.display = show ? 'none' : 'block';
			complete_counsel.style.display = show ? 'none' : 'block';
			wait_counsel.style.display = show ? 'none' : 'block';
			total_counsel.style.display = show ? 'none' : 'block';
		}
	}
</script>
</head>
<body>
	<div id="header">
		<div class="left-header fl">
			<div class="fl smartlogo"></div>
				<div class="fl topmenu">
					<span>쇼핑파트너센터</span> <span>커머스솔루션마켓</span> <span>네이버광고 <img src="../Images/headerlogo.png"></span>
				</div>
			<div style="clear: both;"></div>
		</div>
		<div class="right-header fr">
			<div class="topright fl">
				<div class="fl">
					<span class="topid">jiyoonjung</span>님 <span class="myhome">내정보</span>
				</div>
				<div class="fl">
					<i class="bell"></i> <i class="newicon"></i>
				</div>
				<div class="logout fl">로그아웃</div>
				<div class="imformation fl">도움말</div>
				<div class="header-talk fl">
					<img src="../Images/headertalk.png" /> 
					<span>톡톡상담</span>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<!-- 왼쪽 사이드바 -->
	<div id="left_side" class="fl">
		<div>
			<img src="https://sell.smartstore.naver.com/images/no-img.jpg">
			<p>CustomerDaily</p>
		</div>
		<!-- 2번쨰________________ -->
		<div>
			<div class="top"
				onclick="topserachbtn('serach_content','clickserach')">
				<div class="toptext">수취인명</div>
				<div id="clickserach" class="drop_serach"></div>
			</div>
			<div id="serach_content" class="top_serach" style="display: none;">
				<div class="drop_serachtext">
					<div class="find_text">
						<div class="option_text">수취인명</div>
						<div class="option_text">구매자명</div>
						<div class="option_text">구매자연락처</div>
						<div class="option_text">구매자ID</div>
						<div class="option_text">주문번호</div>
						<div class="option_text">상품주문번호</div>
						<div class="option_text">상품번호</div>
					</div>
				</div>
			</div>
			<div class="input_title">
				<input type="text" /> <img src="../Images/searchicon.png" />
			</div>
		</div>
		<!-- 3번쨰________________________-->
		<div>
			<div class="menu" onclick="sidebarbtn('side_content', 'dropicon')">
				<div>상품관리</div>
				<div id="dropicon" class="dropbtn"></div>
			</div>
			<div id="side_content" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/origin-list">상품 조회/수정</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/create">상품 등록</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/bulkadd">상품 일괄등록</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/navershopping-match-product">카탈로그 가격관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/relation-list">연관상품 관리</a>
					</div>
					<div>
						<a>사진 보관함</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/delivery/bundle">배송정보 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/template/delivery">템플릿 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/notice/search">공지사항 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/interest/subscription/search">구독 관리</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content2', 'dropicon2')">
				<div>
					판매관리 <i></i>
					<div id="dropicon2" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content2" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/manage/order">주문통합검색</a>
					</div>
					<div>
						<a>선물 수락대기</a>
					</div>
					<div>
						<a>미결재 확인</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/delivery">발주(주문)확인/발송관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/delivery/situation">배송현황 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/purchaseDecision">구매확정 내역</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/claim/cancel">취소 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/claim/return">반품 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/claim/exchange">교환 관리</a>
					</div>
					<div>
						<a>판매방해 고객관리</a>
					</div>
					<div>
						<a>반품안심케어</a>
					</div>
				</div>

			</div>

			<div class="menu" onclick="sidebarbtn('side_content3', 'dropicon3')">
				<div>
					정산관리 <i></i>
					<div id="dropicon3" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content3" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>정산 내역 (일별/건별)</a>
					</div>
					<div>
						<a>항목별 정산 내역</a>
					</div>
					<div>
						<a>빠른정산</a>
					</div>
					<div>
						<a>부가세신고 내역</a>
					</div>
					<div>
						<a>세금계산서 조회</a>
					</div>
					<div>
						<a>비즈월렛 관리 (충전금)</a>
					</div>
					<div>
						<a>초보판매자 정산가이드</a>
					</div>
					<div>
						<a>우대수수료 환급내역</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content4', 'dropicon4')">
				<div>문의/리뷰관리</div>
				<div id="dropicon4" class="dropbtn"></div>
			</div>
			<div id="side_content4" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/comment/">문의 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/qnas">고객문의
							관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/review/search">리뷰
							관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/event/REVIEW_EVENT/search">리뷰이벤트 관리</a>
					</div>
				</div>

			</div>
			<div class="menu" onclick="sidebarbtn('side_content5', 'dropicon5')">
				<div class="talk">
					톡톡상담관리 <img src="../Images/talkicon.png" />
				</div>
				<div id="dropicon5" class="dropbtn"></div>
			</div>
			<div id="side_content5" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/talktalk/chat">톡톡
							상담하기</a>
					</div>
					<div>
						<a>쇼핑챗봇/AI FAQ 설정</a>
					</div>
					<div>
						<a>톡톡 응대분석</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content6', 'dropicon6')">
				<div>
					스토어 전시관리 <span class="upicon">N</span>
				</div>
				<div id="dropicon6" class="dropbtn"></div>
			</div>
			<div id="side_content6" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/d/v2/home">스마트스토어</a>
					</div>
					<div>
						<a>쇼핑 스토리 관리</a>
					</div>
					<div>
						<a>라이브 예고 페이지 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/sellers/store/detail/smartstore">스토어 관리</a>
					</div>
					<div>
						<a>CLOVA MD 상품추천</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content7', 'dropicon7')">
				<div>노출관리</div>
				<div id="dropicon7" class="dropbtn"></div>
			</div>
			<div id="side_content7" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>기획전 관리</a>
					</div>
					<div>
						<a>노출 서비스 관리</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content8', 'dropicon8')">
				<div>
					고객혜택관리 <span class="upicon">N</span>
				</div>
				<div id="dropicon8" class="dropbtn"></div>
			</div>
			<div id="side_content8" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>혜택 등록</a>
					</div>
					<div>
						<a>혜택 조회/수정</a>
					</div>
					<div>
						<a>혜택 리포트</a>
					</div>
					<div>
						<a>고객등급 관리</a>
					</div>
					<div>
						<a>포인트 지급관리</a>
					</div>
					<div>
						<a>포인트 지급내역 조회</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content9', 'dropicon9')">
				<div>마케팅메세지</div>
				<div id="dropicon9" class="dropbtn"></div>
			</div>
			<div id="side_content9" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>마케팅 보내기</a>
					</div>
					<div>
						<a>마케팅 이력</a>
					</div>
					<div>
						<a>마케팅 통계</a>
					</div>
					<div>
						<a>쇼핑 소식 광고 소개</a>
					</div>
					<div>
						<a>AI 마케팅 효과분석</a>
					</div>
				</div>

			</div>
			<div class="menu" onclick="sidebarbtn('side_content10', 'dropicon10')">
				<div>
					커머스솔루션 <span class="upicon">N</span>
				</div>
				<div id="dropicon10" class="dropbtn"></div>
			</div>
			<div id="side_content10" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>솔루션 목록</a>
					</div>
					<div>
						<a>결제내역</a>
					</div>
				</div>

			</div>
			<div class="menu" onclick="sidebarbtn('side_content11', 'dropicon11')">
				<div>
					통계 <span class="upicon">N</span>
				</div>
				<div id="dropicon11" class="dropbtn"></div>
			</div>
			<div id="side_content11" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>요약</a>
					</div>
					<div>
						<a>판매분석</a>
					</div>
					<div>
						<a>마케팅분석</a>
					</div>
					<div>
						<a>쇼핑행동분석</a>
					</div>
					<div>
						<a>시장벤치마크</a>
					</div>
					<div>
						<a>판매성과예측</a>
					</div>
					<div>
						<a>고객현황</a>
					</div>
					<div>
						<a>재구매 통계</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content12', 'dropicon12')">
				<div>
					원쁠딜 <span class="upicon">N</span>
				</div>
				<div id="dropicon12" class="dropbtn"></div>
			</div>
			<div id="side_content12" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>원쁠딜 소개</a>
					</div>
					<div>
						<a>원쁠딜 제안관리</a>
					</div>
					<div>
						<a>원쁠템 제안관리</a>
					</div>
					<div>
						<a>공지/FAQ</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content13', 'dropicon13')">
				<div>판매자지원프로그램</div>
				<div id="dropicon13" class="dropbtn"></div>
			</div>
			<div id="side_content13" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>판매자 지원 프로그램</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content14', 'dropicon14')">
				<div>판매자정보</div>
				<div id="dropicon14" class="dropbtn"></div>
			</div>
			<div id="side_content14" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a href="https://sell.smartstore.naver.com/#/seller/info">판매자 정보</a>
					</div>
					<div>
						<a>상품판매권한 신청</a>
					</div>
					<div>
						<a>심사내역 조회</a>
					</div>
					<div>
						<a>판매자 등급</a>
					</div>
					<div>
						<a>매니저 관리</a>
					</div>
					<div>
						<a>사업자 전환</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content15', 'dropicon15')">
				<div>지식재산권침해관리</div>
				<div id="dropicon15" class="dropbtn"></div>
			</div>
			<div id="side_content15" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>지식재산권 침해관리</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content16', 'dropicon16')">
				<div>
					물류 관리 <span class="upicon">N</span>
				</div>
				<div id="dropicon16" class="dropbtn"></div>
			</div>
			<div id="side_content16" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>NFA 서비스 신청</a>
					</div>
					<div>
						<a>판매량 예측</a>
					</div>
				</div>

			</div>
			<div class="menu" onclick="sidebarbtn('side_content17', 'dropicon17')">
				<div>공지사항</div>
				<div id="dropicon17" class="dropbtn"></div>
			</div>
			<div id="side_content17" class="dropcontent" style="display: none;">
				<div class="droptext">
					<div>
						<a>공지사항</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 4번쨰 _______________________-->
		<div id="menuline"></div>
		<div>
			<h2 class="title">교육 프로그램 바로가기</h2>
			<div class="shortcut">
				<div>
					온라인 교육 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					쇼핑 라이브 교육 <img src="../Images/shorcuticon.png" />
				</div>
			</div>
			<h2 class="title mg35">네이버 비즈니스 금융센터</h2>
			<div class="shortcut">
				<div>
					정책지원금 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					빠른정산 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					사업자 대출 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					사업자 보험 <img src="../Images/shorcuticon.png" />
				</div>
			</div>
			<h2 class="title mg35">공식 블로그 바로가기</h2>
			<div class="shortcut">
				<div>
					네이버쇼핑 파트너 <img src="../Images/shorcuticon.png" />
				</div>
				<div class="subtitle">
					쇼핑윈도 <img src="../Images/shorcuticon.png" />
				</div>
			</div>
		</div>

		<!-- 5번째 ______________ -->
		<div class="last_leftside">
			<div class="clicktalk">
				<img class="minitalk" src="../Images/talkicon2.png" />톡톡상담
			</div>
		</div>
	</div>
	<div id="right_side" class="fl">
		<div class="background" style="display: none;">
			<div class="window">
				<div class="popup">
					<div class="nickname_st">
						<strong class="nickname_st1">닉네임 관리</strong>
					</div>
					<div class="nickname_st2">
						<div class="nickname_st_only">
							<label for=""> <span class="blind">닉네임 입력</span> <input
								type="text" class="nickname_st3" placeholder="닉네임을 입력하세요"
								maxlength="8" value="">
							</label>
							<div class="nickname_st4 charcount">
								<span class="count">0</span>/<span class="limit">8</span>
							</div>
						</div>
					</div>
					<div class="nickname_st5">
						<button class="nickname_bt">
							<span>취소</span>
						</button>
						<button class="nickname_bt1" disabled>
							<span>저장하기</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="backgroundtheme">
			<div class="fl talk_st1 linestyle">

				<div class="talk_st3">
					<input type="text" id="chatsearch" placeholder="대화내용, 닉네임, 태그 검색">

					<button class="buttonstyle">
						<svg class="deletebutton">
							<span class="buttonfont">x</span>
						</svg>
					</button>
					<button class="buttonstyle1">
						<svg class="searchbutton">
							<img class="glass" src="../Images/돋보기.png">
						</svg>
					</button>
					<div style="clear: both;"></div>
				</div>

				<div id="chatroom1" class="talk_st1 talk_st2" style="display: none;">
					<button type="button" id="chatid1" class="buttonstyle2 buttonstyle8" onclick="spread3('total_counsel',true)">
						<img src="../Images/말풍선.png" id="but1" class="imgstyle">
						 <span id="but1" class="talk_st4">
						 	<span class="talk_font">전체</span>
						 	<span id="but1" class="talk_font1"><%=totalCount %></span>
						 </span>
					</button>
					<button type="button" id="chatid2" class="buttonstyle3" onclick="spread3('wait_counsel',true)">
						<img src="../Images/말풍선2.png" id="but2" class="imgstyle1 imgstyle21"> 
						<span class="talk_st4">
							<span class="talk_font">대기</span>
							<span class="talk_font1"><%=waitCount%>
							</span>
						</span>
					</button>
					<button type="button" id="chatid3" class="buttonstyle2 buttonstyle8">
						<img src="../Images/말풍선3.png" id="but3" class="imgstyle2"> 
						<span class="talk_st4 talk_st5">
							<span class="talk_font">진행중</span>
							<span class="talk_font1"><%=proceedingCount%></span>
						</span>
					</button>
					<button type="button" id="chatid4" class="buttonstyle2 buttonstyle4 buttonstyle8" onclick="spread3('hold_counsel',true)">
						<img src="../Images/말풍선4.png" id="but4" class="imgstyle3"> 
							<span class="talk_st4 talk_st6">
								<span class="talk_font">보류</span><span class="talk_font1">0</span>
							</span>
					</button>
					<button type="button" class="buttonstyle2 talk_st16 buttonstyle8" onclick="spread2('chatroom2', true);">
						<img src="../Images/화살표1.png" class="imgstyle4 talk_st17">
					</button>
					<div style="clear: both;"></div>
				</div>
				<div id="chatroom2" class="talk_st1 talk_st2" style="display: none;">
					<button type="button" class="buttonstyle2 talk_st16 buttonstyle8" onclick="spread2('chatroom1', true);">
						<img src="../Images/화살표5.png" class="imgstyle22 talk_st17">
					</button>
					<button type="button" id="chatid5" class="buttonstyle2 buttonstyle8" onclick="spread3('complete_counsel',true)">
						<img src="../Images/말풍선5.png" id="but1" class="imgstyle"> 
						<span id="but1" class="talk_st4">
							<span class="talk_font">완료</span>
						</span>
					</button>
					<button type="button" id="chatid6" class="buttonstyle3" onclick="spread3('cut_counsel',true)">
						<img src="../Images/말풍선6.png" id="but2" class="imgstyle1 imgstyle21"> 
						<span class="talk_st4">
							<span class="talk_font">차단</span>
						</span>
					</button>
				</div>

				<div class="talk_st7 talk_st9 buttonstyle9">
					<button id="bt1" type="button" class="buttonstyle2 buttonstyle9" style="right: 20px;">
						<span class="talk_st6 talk_st10">
							<span class="talk_st8">최근 3개월</span> 
							<img src="../Images/화살표2.png" class="imgstyle5"> 
						</span>
					</button>
					<div class="drop_down_wrap">
						<ul class="list_dropDown static">
							<li>
								<button type="button" class="N=a:srt.week">최근 1주일</button>
							</li>
							<li>
								<button type="button" class="N=a:srt.month">최근 1개월</button>
							</li>
							<li>
								<button type="button" class="N=a:srt.quarter">최근 3개월</button>
							</li>
							<li>
								<button type="button" class="N=a:srt.year">최근 1년</button>
							</li>
							<li>
								<div class="set_date">
									<p class="text_title">직접입력</p>
									<div class="box_setDate">
										<div class="form_wrap">
											<div class="column_middle">
												<label for="date_picker_from" class="form_field">
													<span class="blind">검색기간</span>
													<input type="text" id="date_picker_from" class="basic_input" readonly>
													<button type="button" class="btn_calendar calendar_st">
														<span class="blind">달력 열기</span>
													</button>
												</label>
											</div>
										</div>
									</div>
									<div class="box_setDate">
										<div class="form_wrap">
											<div class="column_middle">
												<label for="date_picker_to" class="form_field">
													<span class="blind">검색기간</span>
													<input type="text" id="date_picker_to" class="basic_input" readonly>
													<button type="button" class="btn_calendar calendar_st">
														<span class="blind">달력 열기</span> 
													</button>
												</label>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn_default full N=a:srt.self talkst">
										<span>적용하기</span>
									</button>
								</div>
							</li>
						</ul>
					</div>
					<button id="bt2" type="button" class="buttonstyle2 buttonstyle9">
						<span class="talk_st6 talk_st10">
							<span class="talk_st8">읽음여부</span> 
							<img src="../Images/화살표2.png" class="imgstyle5"> 
						</span>
					</button>
					<div class="sorting_item read">
						<div class="drop_down">
							<button type="button" class="title_drop static N=a:srt.read">
								<span class="name_item ellipsis">읽음여부</span>
							</button>
							<div class="drop_down_wrap1">
								<ul class="list_dropDown">
									<li>
										<button type="button" class="N=a:srt.unread">안읽음</button>
									</li>
									<li>
										<button type="button" class="N=a:srt.all">전체</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<button id="bt3" type="button" class="buttonstyle2 buttonstyle9 buttonstyle11 ">
						<span class="talk_st6 talk_st10">
							<span class="talk_st11 talk_st40">최근 대화순</span> 
							<img src="../Images/화살표3.png" class="imgstyle6"> 
						</span>
					</button>
					<div class="sorting_item condition">
						<div class="drop_down">
							<button type="button" class="title_drop static N=a:srt.listing">
								<span class="name_item">최근 대화순</span>
							</button>
							<div class="drop_down_wrap2">
								<ul class="list_dropDown">
									<li>
										<button type="button" class="N=a:srt.ascend">먼저 문의순</button>
									</li>
									<li>
										<button type="button" class="N=a:srt.descend">최근 문의순</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>

				<div id="cut_counsel" style="background: white; height: 830px; display: none;">
					<div class="contentno">
						<div>
							<img src="../Images/느낌표.png" class="wait"> 
							<strong class="wait1 wait2">차단한 상담이 없습니다.</strong>
							<button class="searchbutton2">
								<span>전체목록보기</span>
							</button>
						</div>
					</div>
				</div>

				<div id="hold_counsel" style="background: white; height: 830px; display: none;">
					<div class="contentno">
						<div class="wait4">
							<img src="../Images/느낌표.png" class="wait5"> 
							<strong class="wait3">보류한 상담이 없습니다.</strong>
							<button class="searchbutton3">
								<span>전체목록보기</span>
							</button>
						</div>
					</div>
				</div>

				<div id="complete_counsel" style="background: white; height: 830px; display: none;">
					<div class="contentno">
						<div>
							<img src="../Images/느낌표.png" class="wait"> 
							<strong class="wait1">완료된 상담이 없습니다.</strong>
							<button id="searchbutton1">
								<span>전체목록보기</span>
							</button>
						</div>
					</div>
				</div>

				<div id="wait_counsel" style="background: white; height: 830px; display: none;">
					<div class="contentno">
						<div>
							<img src="../Images/느낌표.png" class="wait"> 
							<strong class="wait1">대기 중인 상담이 없습니다.</strong>
							<button id="searchbutton1" class="searchbutton_wait">
								<span>전체목록보기</span>
							</button>
						</div>
					</div>
				</div>


				<div id="total_counsel" class="talk_st12">
					<%for(톡톡상담Dto dto: listchat){ %>
						<a class="<%=dto.getTalk_num() %>" >
							<div class="talk_st13 linestyle1">
								<div>
									<img class="imgstyle7" src="https://talk.sell.smartstore.naver.com/nstatic/images/common/partner_default_profile.png?20230601185700">
								</div>
							    <div class="chat1" style="position: absolute;width: 369px;margin-top: -52px;height: 101px;">
							      <p class="talk_font2">
							      	<span style="display:none;"><%=dto.getTalk_num() %></span>
							        <span class="talk_font3"><%=dto.getSender_id() %></span> 
							        <span class="talk_font4">
								        <%
								        if (dto.getDiff() < 1.0) {
								            out.print("<방금>");
								          } else if (dto.getDiff() < 60 * 24) {
								            out.print(dto.getStrTime());
								          } else {
								            out.print(dto.getStrDate());
								          }
								       %>
							       </span>
							      </p>
							      <p class="talkstyle">
							        <b class="talk_font5"><%=dto.getName() %></b> 
							        <span class="talk_font5"><%=dto.getTalk_content() %></span>
							      </p>
							    </div>
							</div>
					</a>
					<% }%>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div class="fl">
				<div class="fl talkstyle26 talktalk_dis2" style="display: none;">
					<div class="talkstyle4">
						<div class="fl">
							<img class="imgstyle11 imgstyle10" src="https://talk.sell.smartstore.naver.com/nstatic/images/common/partner_default_profile.png?20230601185700">
						</div>
						<div class="fl nicknamest">
							<strong><%=customerId %></strong>
							<div>
								<button class="talkstyle5 nickname_st">
									<span>닉네임을 입력하세요.</span> 
									<img src="../Images/연필.png" class="imgstyle12">
								</button>
							</div>
						</div>
						<div class="fl talkstyle6">
							<% if("완료".equals(firstdao.getTalkStatusByTalkNum(num))) { %>
								<button type="button" id="complete_bt_ok" class="buttonstyle5" style="background-color: #8890a2;color: #fff;">완료됨</button>
							<% } else { %>
								<button type="button" id="complete_bt" class="buttonstyle5">상담완료</button>
							<% } %>
						</div>
						<div>
							<button class="talkstyle5">
								<img src="../Images/점.png" class="imgstyle13">
							</button>
						</div>
					</div>

					<%
						if(talkdto!=null) { 
					%>
					<div style="overflow-y: auto; border-bottom: 1px solid #dbdde2; overflow-x: hidden;">
						<div class="talkstyle25">
							<% 
								for(톡톡Dto dto : talkdto) {
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
									
									if(dto.getSellerId().equals(dto.getSenderId())) {						
							%>
											<div class="message_balloon card_message rgt">
												<p class="talk_font13 talk_font14"><%=dto.isReadStatus() ? "읽음" : "안읽음" %></p>
												<span class="talk_font13 "><%=hour>=12 ? "오후" : "오전" %> <span><%=hour>12 ? hour-12 : hour %>:<%=minute<10 ? "0"+minute : minute %></span></span>
												<p class="hi speechbubble"><%=dto.getTalkContent() %></p>
											</div>
							<% 		} else { %>
										<div class="message_balloon card_message rgt">
											<img src="../Images/사람.png" class="imgstyle15">
											<p class="hi speechbubble5"><%=dto.getTalkContent() %></p>
											<span class="talk_font19"><%=hour>=12 ? "오후" : "오전" %> <span><%=hour>12 ? hour-12 : hour %>:<%=minute<10 ? "0"+minute : minute %></span></span>
										</div>
								<% 	} %>
							<% 	} %>
						</div>
					</div>
					<!--  -->
					<%
						}
					%>
				<!--  -->
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
							<form id="form_message" action="TalkTalkChatInsertAction.jsp" method="post">
								<input type="hidden" id="input_seller_id" name="sellerId" value="<%=loginId%>"/>
								<input type="hidden" id="input_customer_id" name="customerId" value="<%=customerId%>"/>
								<input type="hidden" id="input_sender_id" name="senderId" value="<%=loginId%>"/>
								<input type="hidden" id="room_num" name="roomnum" value="<%=num%>"/>
								<input type="text" placeholder="메시지를 입력해 주세요" name="chat" class="talkstyle9">
								<button id="searchbutton" type="submit">
									<span>전송</span>
								</button>
							</form>
						</div>
					</div>
					<!--  -->
				</div>

				<div class="fl talktalk_dis3" style="width: 380px; height: 768px; display: none;">
					<div class="talk_st25 talkstyle24">
						<div class="talk_st26">
							<h3 class="talk_st27">스마트 요약
								<span class="betastyle">Beta</span>
							</h3>
						</div>
						<div class="talk_st29">
							<img class="talk_st30" src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f344">
							<p class="talk_st31">
								<span class="talk_font21">가구수평패드</span>에서 문의했어요.
							</p>
							<p class="talkstyle10">https://smartstore.naver.com/inflow/outlink/product?p=4897977260&amp;tr=tsf&amp;frm=chat</p>
						</div>
					</div>
					<div class="talkstyle24 buttonstyle8 talk_st38 bordercolor">
						<button class="bs buttonstyle6" onclick="fnspread('purchase_history', true);">
							<span>구매이력</span>
						</button>
						<button class="bs on buttonstyle6 talkstyle28" onclick="fnspread('consultation_info', true);">
							<span>상담정보</span>
						</button>
						<div id="purchase_history" style="background: white; height: 830px; display: none;">
							<div class="contentno">
								<div>
									<img src="../Images/느낌표.png" class="question"> 
									<strong class="question1">구매이력이 없습니다.</strong>
									<p class="question2">상담고객의 구매이력이 없습니다.</p>
								</div>
							</div>
						</div>

						<div id=consultation_info class="talk_st32">
							<h3 class="talk_font22">상담정보</h3>
							<div class="talk_font23">
								<div>상담시작</div>
								<div class="talk_st33">오후 15:41 2023/05/15</div>
							</div>
							<div class="talk_font23 talk_st34">
								<div>첫 응대시작</div>
								<div class="talk_st33">오후 15:42 2023/05/15</div>
							</div>
						</div>
					</div>
					<div id=consultation_info1 class="buttonstyle8 talk_st38 bordercolor" style="width: 380px; height: 160px;">
						<div class="talk_st36 talk_st37">
							<h3 class="talkstyle13">태그</h3>
							<div class="talkstyle14">
								<button type="button" class="tagstyle">+태그 추가</button>
							</div>
						</div>
					</div>
					<div id=consultation_info2 class="buttonstyle8 bordercolor talk_st39" style="width: 380px; height: 160px;">
						<div class="talkstyle22">
							<h3 class="talkstyle15">이전 대화 이력</h3>
							<div class="talkstyle16">이전 대화 이력이 없습니다.</div>
						</div>
					</div>
					<div id=consultation_info3 class="talkstyle18 bordercolor talk_st39" style="width: 380px; height: 160px;">
						<div class="talkstyle19">
							<h3 class="talk_font24">고객메모</h3>
							<div class="talk_font25">
								<span class="q_st2">0</span> 
								<span class="q_st2_2">/200</span>
							</div>
						</div>
						<div class="talkstyle20">
							<textarea cols="30" rows="3" maxlength="200" placeholder="고객메모를 입력해 주세요." class="talkstyle21"></textarea>
						</div>
					</div>
				</div>
			</div>

			<div class="fl talk_st2 talk_st15 talktalk_dis1">
				<div class="talkstyle2">
					<div>
						<img src="../Images/아이콘.png" class="imgstyle9"> 
						<strong class="talk_font11">대화내역이 없습니다.</strong>
						<p class="talk_font12">기간과 기준, 필터를 확인한 후 다시 조회해 주세요.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
