<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%
	String loginId = (String)session.getAttribute("id");
	AnnouncementDao andao = new AnnouncementDao();
	ArrayList<AnnouncementDto> andto = null;
	String con2 = request.getParameter("con2");
	String con = request.getParameter("con");
	if(con2==null&&con==null){
		con2="";
		con="";
		andto = andao.select(loginId);
	}else if(con2==null&&con!=null){
		con2="";
		con=request.getParameter("con");
		andto = andao.selectS("%"+con+"%",loginId);
	} else {
		andto = andao.selectS("%"+con+"%", con2, loginId);
	}
	int cnt = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<link rel="stylesheet" href="../css/TopSidebar.css" />
<link rel="stylesheet" href="../css/Notice.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="../js/jquery-3.7.0.min.js"></script>
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
function open1() {
	window.open('Announcement.jsp', '_self');
}
	function topserachbtn(a, b) {
		let serc = document.getElementById(a);
		let cs = document.getElementById(b);
		if (serc.style.display == "none") {
			serc.style.display = "block";
			cs.className = "after_serach";
		} else if (serc.style.display == "block") {
			serc.style.display = "none";
			cs.className = "drop_serach";
		}
	}
	function ds(id) {
		var getId = document.getElementById(id);
		getId.style.display = (getId.style.display == 'block') ? 'none': 'block';
	}
	
	$(function() {
		$("#searchbutton22").click(function(){
			loaction.href="Noticeregistration.html";
		});
		$(".smartlogo").click(function(){
    		location.href = "MainPage.jsp";
    	});
		$(".prepare").click(function() {
			alert("준비중입니다");
		});
		$(".form-group").click(function() {
			let showdis = $(".selectize-dropdown").css('display');
			if (showdis == 'none') {
				let showdis = $(".selectize-dropdown").css('display', 'block');
			} else if (showdis == 'block') {
				let showdis = $(".selectize-dropdown").css('display', 'none');
			}
		});
		$(".folding").click(function() {
			$(this).toggleClass("rotate");
		});
		$(".orderlistsize2").click(function() {
			$(this).toggleClass("rotate");
		});
		$(".form-group").click(function() {
			$(".selectize-input").toggleClass("rotate");
		});

		$(document).ready(function() {
			$("#sel_date2").change(function() {
				$("#lbl_date2").text(this.value);
			});
		});

		$(document).ready(function() {
			$(".option").click(function() {
				let select_value = $(this).attr("data-value");
				if (select_value === "TITLE") {
					$(".item").text("제목");
				} else if (select_value === "ID") {
					$(".item").text("번호");
				}
			});
		});

	});
	window.onload = function() {
		var Grid = tui.Grid;

		var instance = new Grid(
				{
					el : document.getElementById('grid'), // Container element
					scrollX : true,
					bodyHeight : 400,
					rowHeaders : [ 'checkbox' ],
					columns : [ {
						width : 100,
						header : '수정',
						name : 'modify',
						align : 'center',
						valign : 'middle'
					}, {
						width : 170,
						header : '번호',
						name : 'number',
						align : 'center',
						valign : 'middle'
					}, {
						width : 170,
						header : '분류',
						name : 'classification',
						align : 'center',
						valign : 'middle'
					}, {
						width : 170,
						header : '전시상태',
						name : 'displaystatus',
						align : 'center',
						valign : 'middle'
					}, {
						width : 310,
						header : '제목',
						name : 'title',
						align : 'center',
						valign : 'middle'
					}, {
						width : 170,
						header : '전시 시작일',
						name : 'displaystart',
						align : 'center',
						valign : 'middle'
					}, {
						width : 170,
						header : '전시 종료일',
						name : 'displayend',
						align : 'center',
						valign : 'middle'
					}, {
						width : 170,
						header : '등록일',
						name : 'signdate',
						align : 'center',
						valign : 'middle'
					}, {
						width : 100,
						header : '삭제',
						name : 'deletion',
						align : 'center',
						valign : 'middle'
					} ],
					data : [ 
						<% for(AnnouncementDto dto : andto){
							cnt++;
						%>
						{
						modify : '<a href="NoticeModify.html" type="button" class="btn_type">수정</a>',
						number : '<%=dto.getSerialNum()%>',
						classification : '상품',
						displaystatus : '<%=dto.getDisplayStatus()%>',
						title : '<%=dto.getSubject()%>',
						displaystart : '<%=dto.getStartDate()%>',
						displayend : '<%=(dto.getEndDate()==null?"-":dto.getEndDate())%>',
						signdate : '<%=dto.getRegDate()%>',
						deletion : '<a type="button" class="btn_type">삭제</a>'
					}, 
					<%}%>
					]

				});

		Grid.applyTheme('clean', {
			cell : {
				header : {
					background : '#f8f9fd',
					border : '#d3d8e1',
					showVerticalBorder : true,
					showHorizontalBorder : true
				},
				normal : {
					background : '#ffffff',
					border : '#e9ebf0',
					showVerticalBorder : true,
					showHorizontalBorder : true
				},
				rowHeader : {
					showHorizontalBorder : true
				}
			},
			outline : {
				border : '#d3d8e1',
				showVerticalBorder : true
			},
			scrollbar : {
				border : '#e9ebf0',
				emptySpace : '#f8f9fd',
				background : '#ffffff'
			}
		});

	}
</script>
</head>
<body>
	<div id="header">
		<div class="left-header fl">
			<div class="fl smartlogo">
			  <a href="MainPage.jsp"></a>
			</div>
			<div class="fl topmenu">
				<span>쇼핑파트너센터</span> 
				<span>커머스솔루션마켓</span> 
				<span>네이버광고 
					<img src="../Images/headerlogo.png">
				</span>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div class="right-header fr">
			<div class="topright fl">
				<div class="fl">
					<span class="topid"><%=loginId %></span>님 <span class="myhome">내정보</span>
				</div>
				<div class="fl">
					<i class="bell"></i> <i class="newicon"></i>
				</div>
				<div class="logout fl">로그아웃</div>
				<div class="imformation fl">도움말</div>
				<div class="header-talk fl">
					<img src="../Images/headertalk.png" /> <span>톡톡상담</span>
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
				<!-- <select>
					<option value="addressee_name">수취인명</option>
					<option value="buyer_name">구매자명</option>
					<option value="buyer_phone">구매자연락처</option>
					<option value="buyer_id">구매자ID</option>
					<option value="ordernumber">주문번호</option>
					<option value="order_pnumber">상품주문번호</option>
					<option value="pnumber">상품번호</option>
				</select>  -->
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
						<a href="ProductInsert2.jsp">상품 등록</a>
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
						<a href="https://sell.smartstore.naver.com/#/products/delivery/bundle">배송정보
							관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/template/delivery">템플릿
							관리</a>
					</div>
					<div>
						<a href="Notice.jsp">공지사항 관리</a>
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
						<a href="OrderUnitSearch.jsp">주문통합검색</a>
					</div>
					<div>
						<a>선물 수락대기</a>
					</div>
					<div>
						<a>미결재 확인</a>
					</div>
					<div>
						<a href="OrderConfirm.jsp">발주(주문)확인/발송관리</a>
					</div>
					<div>
						<a href="DeliveryStatusManage.jsp">배송현황 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/naverpay/sale/purchaseDecision">구매확정 내역</a>
					</div>
					<div>
						<a href="CancelManage.jsp">취소 관리</a>
					</div>
					<div>
						<a href="ReturnManage.jsp">반품 관리</a>
					</div>
					<div>
						<a href="ExchangeManagement.jsp">교환 관리</a>
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
						<a href="InquiryManage.jsp">문의 관리</a>
					</div>
					<div>
						<a href="CustomerInquiry.jsp">고객문의 관리</a>
					</div>
					<div>
						<a href="Review.jsp">리뷰 관리</a>
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
						<a href="Talk_copy2.jsp">톡톡 상담하기</a>
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
						<a href="CommonManageTotalLeft.jsp">스마트스토어</a>
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
				<div>고객혜택관리 
					<span class="upicon">N</span>
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
			<div class="menu"
				onclick="sidebarbtn('side_content10', 'dropicon10')">
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
						<a href="PSellerInformation.jsp">판매자 정보</a>
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
		<div class="backgroundtheme">
			<div class="width12 fl">
				<!-- 배송현황 관리 -->
				<div class="salehead">
					<h2 class="manage notice_style4">상품 공지사항 관리</h2>
				</div>
				<div style="clear: both;"></div>
				<div class="notice_pad">
					<h3 class="notice_style2 notice_style4">상품 공지사항 조회</h3>
					<button id="searchbutton22" onclick="open1()">
						<span>새 상품 공지사항 등록</span>
					</button>
				</div>
				<form action="NoticeAction.jsp">
					<div class="notice_st">
						<div id="fl" class="date">
							<div class="date1 fl notice_style5">검색어</div>
							<div id="notice_st__win" class="fl">
								<div class="form-group">
									<div class="selectize-control ng-pristine ng-untouched ng-valid single">
										<div class="selectize-input rotate items ng-valid ng-pristine full has-options has-items">
											<div class="item">제목</div>
											<input type="text" style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
										</div>
										<div class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
											style="display: none; width: 206px; top: 34px; left: 0px; visibility: visible;">
											<div class="selectize-dropdown-content">
												<div class="option selected">제목</div>
												<div data-value="ID" class="option">번호</div>
											</div>
										</div>
									</div>
									<select class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
										style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
										<option value="? string:TITLE ?" selected="selected"></option>
										<option value="TITLE">제목</option>
									</select>
								</div>
								<div class="detailcondition fr date1">
									<div id=detail_detail>
										<input type="text" name="con" class="fr inputdetail" placeholder="제목을 입력하세요.">
									</div>
								</div>
								<div style="clear: both;"></div>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div id="detailsearch" class="date fl" style="display: none;">
							<div class="detailsearchstyle">
								<div class="date1 fl notice_style6">상세검색</div>
								<div id="div_date">
									<label for="sel_date2" id="lbl_date2" class="rotate">전시상태 전체</label> 
									<select id="sel_date2" name="con2" class="selectoption">
										<option selected disabled>전시상태 전체</option>
										<option value="전시중">전시중</option>
										<option value="전시중지">전시중지</option>
									</select>
								</div>
							</div>
						</div>
						<div id="notice_st__win" class="fl">
							<div id="notice_st__win" class="fl">
								<div class="buttonsize2">
									<button type="submit" id="searchbutton">
										<span>검색</span>
									</button>
									<button type="button" id="searchbutton11" class="prepare">
										<span>초기화</span>
									</button>
									<button type="button" class="buttoncolor buttonsize folding rotate fl"
										onclick="ds('detailsearch')">
										<span class="buttonsize1 fr">상세검색</span>
									</button>
									<div style="clear: both;"></div>
								</div>
							</div>
							<div class="notice_st2 gapstyle">
								<div>
									<div class="totallistsize">
										<h3 class="totallist listsize notice_style4" style="white-space: nowrap;">
											상품 공지사항 목록 총(<span class="totallistcolor"> <%=cnt %> </span>)개
										</h3>
										<div id="div_date">
											<label id="lbl_order" class="orderlistsize">100개씩 보기</label> 
											<select id="sel_order" class="selectoption proudctorder orderlistsize2 rotate">
												<option selected>100개씩 보기</option>
											</select>
											<div style="clear: both;"></div>
										</div>
										<div style="clear: both;"></div>
									</div>
								</div>
								<div class="inputdeliver2">
									<button  type="button" class="exeldown3">
										<span class="searchitemset">선택삭제</span>
									</button>
									<span class="notice_style3">전시상태 ‘전시중’ 인 경우에만 서비스에 노출됩니다.</span>
									<div id="grid"></div>
									<div class="numbutton numbuttonstyle">
										<a><strong class="numbuttonstrong1">1</strong></a>
									</div>
									<button class="exeldown2">
										<span class="searchitemset">전시중</span>
									</button>
									<button class="exeldown2">
										<span class="searchitemset">전시중지</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div>
					<footer class="storefooter">
						<div class="innerfooter">
							<ul class="provis bottomstyle">
								<li class="li2">
									<a class="footerstyle" href="https://sell.smartstore.naver.com/#/terms/agreement" target="_blank">이용약관</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://new-m.pay.naver.com/member/terms-policy/finance" target="_blank">전자금융거래
										이용약관</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://business.naver.com/privacy/privacy.html" target="_blank">
										<strong>개인정보 처리방침</strong>
									</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://policy.naver.com/policy/youthpolicy.html" target="_blank">청소년 보호정책</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="javascript:void(0)" title="팝업">책임의 한계와 법적고지</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://ips.smartstore.naver.com/main/rules/safety" target="_blank" title="새창">안전거래가이드</a>
								</li>
								<li class="li2">
									<a class="footerstyle" href="https://help.sell.smartstore.naver.com/index.help" target="_blank">고객센터</a>
								</li>
							</ul>
							<p class="notice noticestyle bottomstyle">
								네이버㈜는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게
								있습니다. <br> 또한 판매자와 구매자간의 직거래에 대하여 당사는 관여하지 않기 때문에 거래에 대해서는
								책임을 지지 않습니다.
							</p>
							<ul class="provis bottomstyle">
								<li class="liststyles">사업자등록번호 : 220-81-62517</li>
								<li class="liststyles">통신판매업신고번호 : 제2006-경기성남-0692호</li>
								<li class="liststyles">대표이사 : JSMG</li>
								<li class="liststyles">
									<a id="businessinfo" href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208162517"
									class="btn-box" target="_blank" title="새창">사업자정보확인</a>
								</li>
							</ul>
							<ul class="provis totalinfo bottomstyle">
								<li id="addressinformat" class="address">주소 : 경기도 성남시 분당구 정자일로 95, NAVER 1784, 13561</li>
								<li>
									<button id="callchat" class="totalinfo2 totalinfo4 btn-box" type="button">전화상담 (전화 전 클릭)</button>
								</li>
								<li>
									<a class="talktalkline totalinfo3" class="btn-box" target="_blank" href="https://talk.naver.com/ct/wcbgqj?frm=cstpn">
										<i class="" aria-hidden="true"></i> 
										<img src="../Images/talktalk.png"> 톡톡상담
									</a>
								</li>
							</ul>
							<address class="naverlinkstyle2 bottomstyle">
								<p>
									<a class="navericon logo" href="https://www.navercorp.com/" target="_blank" title="새창"></a>
								</p>
								<p class="naverlinkstyle3">Copyright ©</p>
								<a class="naverlinkstyle4 copy-navercorp" href="https://www.navercorp.com/" target="_blank" title="새창">
									<strong class="naverlinkstyle">NAVER Corp.</strong>
								</a>
								<p class="naverlinkstyle5">All rights reserved.</p>
							</address>
						</div>
					</footer>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
</body>
</html>
