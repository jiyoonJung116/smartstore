<%@page import="java.util.List"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String seller_id = request.getParameter("seller_id");
	LocalDate today = LocalDate.now();
	MainInquiryDao mainInquiryDao = new MainInquiryDao();
	ArrayList<MainInquiryDto> inquiyDto = mainInquiryDao.mainpage(seller_id);
	ArrayList<MainInquiryDto> inquiyDto2 = mainInquiryDao.mainsender(seller_id);
	ArrayList<MainInquiryDto> talkDto = mainInquiryDao.maintalk(seller_id);
	

	MainProductDao mainProductDao = new MainProductDao();
	MainViewDao mainViewDao = new MainViewDao();
	MainOrderDeliveryDao mainOrderDeliveryDao = new MainOrderDeliveryDao();
	
	int productCnt = mainProductDao.mainproduct(seller_id);
	int amount = mainProductDao.mainproduct2(seller_id);
	int buyer_count = mainViewDao.mainReview(seller_id);
	int reviewcount = mainViewDao.mainReview2(seller_id);
	int paymentcnt = mainOrderDeliveryDao.mainod(seller_id);
	int deliverycnt = mainOrderDeliveryDao.mainod2(seller_id);
	int fdeliverycnt = mainOrderDeliveryDao.mainod3(seller_id);
	int neworder = mainOrderDeliveryDao.mainod4(seller_id);
	
	String loginId = (String)session.getAttribute("id");
	if(seller_id==null) {
		inquiyDto = mainInquiryDao.mainpage(seller_id);
		inquiyDto2 =  mainInquiryDao.mainsender(seller_id);
		talkDto = mainInquiryDao.maintalk(seller_id);
		productCnt = mainProductDao.mainproduct(seller_id);
		amount = mainProductDao.mainproduct2(seller_id);
		buyer_count = mainViewDao.mainReview(seller_id);
		reviewcount = mainViewDao.mainReview2(seller_id);
		paymentcnt = mainOrderDeliveryDao.mainod(seller_id);
		deliverycnt = mainOrderDeliveryDao.mainod2(seller_id);
		fdeliverycnt = mainOrderDeliveryDao.mainod3(seller_id);
		neworder = mainOrderDeliveryDao.mainod4(seller_id);
	} else {
		seller_id = loginId;
		inquiyDto = mainInquiryDao.mainpage(seller_id);
		inquiyDto2 =  mainInquiryDao.mainsender(seller_id);
		talkDto = mainInquiryDao.maintalk(seller_id);
		productCnt = mainProductDao.mainproduct(seller_id);
		amount = mainProductDao.mainproduct2(seller_id);
		buyer_count = mainViewDao.mainReview(seller_id);
		reviewcount = mainViewDao.mainReview2(seller_id);
		paymentcnt = mainOrderDeliveryDao.mainod(seller_id);
		deliverycnt = mainOrderDeliveryDao.mainod2(seller_id);
		fdeliverycnt = mainOrderDeliveryDao.mainod3(seller_id);
		neworder = mainOrderDeliveryDao.mainod4(seller_id);
	}
	ChartDao chartdao = new ChartDao();
	List<LocalDate> datesInRange = chartdao.getDatesInRange(LocalDate.now().minusMonths(1), LocalDate.now());
	
	String logout = request.getParameter("logout");
	if (logout != null && logout.equals("true")) {
	    HttpSession sessionObj = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	    response.sendRedirect("Login.jsp");
	    return;
	}
	    HttpSession sessionObj = request.getSession(false);
	    String id = null;
	    if (session != null) {
	        id = (String) session.getAttribute("id");
	    }
	%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
		<script src="../js/jquery-3.7.0.min.js"></script>
		<link rel="stylesheet" href="../css/TopSidebar.css"/>
		<link rel="stylesheet" href="../css/mainpage2.css"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
	    $(document).ready(function(){
	      $(".slider").bxSlider({
	    	  auto:true,
	    	  controls:true
	      });
	      $('#tab1').on('click', function() {
	    	    $(this).attr('aria-selected', 'true');
	    	    $('#tab2, #tab3').attr('aria-selected', 'false');
	    	    $('.inquiry-content').css('display', 'block');
	    	    $('.inquiry-content2, .inquiry-content3').css('display', 'none');
	    	  });

    	  $('#tab2').on('click', function() {
    	    $(this).attr('aria-selected', 'true');
    	    $('#tab1, #tab3').attr('aria-selected', 'false');
    	    $('.inquiry-content2').css('display', 'block');
    	    $('.inquiry-content, .inquiry-content3').css('display', 'none');
    	  });

    	  $('#tab3').on('click', function() {
    	    $(this).attr('aria-selected', 'true');
    	    $('#tab1, #tab2').attr('aria-selected', 'false');
    	    $('.inquiry-content3').css('display', 'block');
    	    $('.inquiry-content, .inquiry-content2').css('display', 'none');
    	  });
	    });
	    
	    $(function(){
	    	$(".smartlogo").click(function(){
	    		location.href = "MainPage.jsp";
	    	});
	    });
	
		function sidebarbtn(a, b){
			let sc = document.getElementById(a);
			let di = document.getElementById(b);
			if(sc.style.display=="none"){
				sc.style.display="block";
				di.className = "afterdropbtn";
			}else if(sc.style.display=="block"){
				sc.style.display="none";
				di.className = "dropbtn";
			}
		}
	
		function topserachbtn(a, b){
			let serc = document.getElementById(a);
			let cs = document.getElementById(b);
			if(serc.style.display=="none"){
				serc.style.display="block";
				cs.className = "after_serach";
			}else if(serc.style.display=="block"){
				serc.style.display="none";
				cs.className = "drop_serach";
			}
		}
		</script>
</head>
<body>
	<div id="header">
		<div class="left-header fl"> 
			<div class="fl smartlogo"></div>
			<div class="fl topmenu">
				<span>쇼핑파트너센터</span>
				<span>커머스솔루션마켓</span>
				<span>네이버광고
					<img src="../Images/headerlogo.png">
				</span>
			</div>
			<div style="clear:both;"></div>	
		</div>	
		<div class="right-header fr">
			<div class="topright fl">
				<div class="fl">
					<span class="topid"><%=loginId %></span>님
					<span class="myhome">내정보</span>
				</div>
				<div class="fl">
					<i class="bell"></i>
					<i class="newicon"></i>
				</div>
				<div class="logout fl">로그아웃</div>
				<div class="imformation fl">도움말</div>
				<div class="header-talk fl">
					<img src="../Images/headertalk.png"/> 
					<span>톡톡상담</span>
				</div>
				<div style="clear:both;"></div>	
			</div>
		</div>
		<div style="clear:both;"></div>	
	</div>
	
	<!-- 왼쪽 사이드바 -->
	<div id="left_side" class="fl">
		<div>
			<img src="https://sell.smartstore.naver.com/images/no-img.jpg">
			<p>CustomerDaily</p>
		</div>
		<!-- 2번쨰________________ -->
		<div>
			<div class="top" onclick="topserachbtn('serach_content','clickserach')"> 
				<div class="toptext">수취인명</div>
				<div id="clickserach" class="drop_serach"></div>	
			</div>
			<div id="serach_content" class="top_serach" style="display:none;">
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
					<input type="text"/>
					<img src="../Images/searchicon.png"/>
			</div>
		</div>
		<!-- 3번쨰________________________-->
		<div>
			<div class="menu" onclick="sidebarbtn('side_content', 'dropicon')">
				<div>상품관리</div>
				<div id="dropicon" class="dropbtn"></div>
			</div>
			<div id="side_content" class="dropcontent" style="display:none;">
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
						<a href="https://sell.smartstore.naver.com/#/products/delivery/bundle">배송정보 관리</a>
					</div>
					<div>
						<a href="https://sell.smartstore.naver.com/#/products/template/delivery">템플릿 관리</a>
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
				<div>판매관리
					<i></i>
					<div id="dropicon2" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content2" class="dropcontent" style="display:none;">
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
				<div>정산관리
					<i></i>
					<div id="dropicon3" class="dropbtn"></div>
				</div>
			</div>
			<div id="side_content3" class="dropcontent" style="display:none;">
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
			<div id="side_content4" class="dropcontent" style="display:none;">
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
				<div class="talk">톡톡상담관리
					<img src="../Images/talkicon.png"/>
				</div>
				<div id="dropicon5" class="dropbtn"></div>
			</div>
			<div id="side_content5" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a href="Talk_copy3.jsp">톡톡 상담하기</a>
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
				<div>스토어 전시관리
					<span class="upicon">N</span>
				</div>
				<div id="dropicon6" class="dropbtn"></div>
			</div>
			<div id="side_content6" class="dropcontent" style="display:none;">
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
						<a>스토어 관리</a>
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
			<div id="side_content7" class="dropcontent" style="display:none;">
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
			<div id="side_content8" class="dropcontent" style="display:none;">
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
			<div id="side_content9" class="dropcontent" style="display:none;">
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
				<div>커머스솔루션
					<span class="upicon">N</span>
				</div>
				<div id="dropicon10" class="dropbtn"></div>
			</div>
			<div id="side_content10" class="dropcontent" style="display:none;">
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
				<div>통계
					<span class="upicon">N</span>
				</div>
				<div id="dropicon11" class="dropbtn"></div>
			</div>
			<div id="side_content11" class="dropcontent" style="display:none;">
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
				<div>원쁠딜
					<span class="upicon">N</span>
				</div>
				<div id="dropicon12" class="dropbtn"></div>
			</div>
			<div id="side_content12" class="dropcontent" style="display:none;">
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
			<div id="side_content13" class="dropcontent" style="display:none;">
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
			<div id="side_content14" class="dropcontent" style="display:none;">
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
			<div id="side_content15" class="dropcontent" style="display:none;">
				<div class="droptext">
					<div>
						<a>지식재산권 침해관리</a>
					</div>
				</div>
			</div>
			<div class="menu" onclick="sidebarbtn('side_content16', 'dropicon16')">
				<div>물류 관리
					<span class="upicon">N</span>
				</div>
				<div id="dropicon16" class="dropbtn"></div>
			</div>
			<div id="side_content16" class="dropcontent" style="display:none;">
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
			<div id="side_content17" class="dropcontent" style="display:none;">
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
				<div>온라인 교육
					<img src= "../Images/shorcuticon.png"/>
				</div>
				<div class="subtitle">쇼핑 라이브 교육
					<img src= "../Images/shorcuticon.png"/>
				</div>
			</div>
			<h2 class="title mg35">네이버 비즈니스 금융센터</h2>
				<div class="shortcut">
					<div>정책지원금
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">빠른정산
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">사업자 대출
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">사업자 보험
						<img src= "../Images/shorcuticon.png"/>
					</div>
				</div>
			<h2 class="title mg35">공식 블로그 바로가기</h2>
				<div class="shortcut">
					<div>네이버쇼핑 파트너
						<img src= "../Images/shorcuticon.png"/>
					</div>
					<div class="subtitle">쇼핑윈도
						<img src= "../Images/shorcuticon.png"/>
					</div>
				</div>
		</div>
		
		<!-- 5번째 ______________ -->
		<div class="last_leftside">
			<div class="clicktalk">
			<img class="minitalk" src="../Images/talkicon2.png"/>톡톡상담
			</div>
		</div>
	</div>
	<div id="right_side" class="fl" style="width : 89%;">
		<div class="seller-sub-title">
			<div class="fl">
				<div class="navbar fl">
					<input type="button" style="border:none; height:60px; width:20px;"/>
				</div>
				<div>
					<h2 class="title">메인페이지</h2>
					<span class="notice-date"><%=today %></span>
				</div>
			</div>
		</div>
		<div class="seller-sub-content">
			
				<div class="panel-wrap fl">
					<div class="panel">
						<div class="text-center">
							<div class="slider_div">
								<div class="slider">
										<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-left/20230405-top-banner-left5-pc.png"/>
										</div>
										<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-left/top-banner-left1-pc.png"/>
										</div>
										<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-left/top-banner-left2-pc.png"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-wrap fr">
					<div class="panel">
						<div class="text-center">
							<div class="slider_div">
								<div class="slider">
									<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-right/20230308-top-banner-right5-pc.png"/>
									</div>
									<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-right/20221215-top-banner-right1-pc.png"/>
									</div>
									<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-right/20220727-top-banner-right2-pc.png"/>
									</div>
									<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-right/20221130-top-banner-right3-pc.png"/>
									</div>
									<div class="img_div">
											<img class="topimg" src="https://sell.smartstore.naver.com/images/dashboard/top-banner-right/20220420-top-banner-right4-pc.png"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="clear:both"></div>	
		</div>
		<div class="seller-sub-content">
			<div class="fl orderclaim">
				<div class="panel-heading">
					<div class="pull-left">
						<h3 class="panel-title">주문/배송</h3>
					</div>
				</div>
				<div class="panel-body">
					<div class="list_wrap fl">
						<div class="panel-icon-box">
							<span class="square-ico">
								<i class="order-icon"></i>
							</span>
						</div>
						<ul class="panel-text">
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">신규주문</em>
									</span>
									<span class="number-area fr">
										<a class="text-number"><%=neworder %></a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
						</ul>
					</div>
					<div class="list_wrap fr lf-bd">
						<div class="panel-icon-box">
							<span class="deli-ico">
								<i class="delivery-icon"></i>
							</span>
						</div>
						<ul class="panel-text">
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">결제완료</em>
									</span>
									<span class="number-area fr">
										<a class="text-number1"><%=paymentcnt %></a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">배송중</em>
									</span>
									<span class="number-area fr">
										<a class="text-number1"><%=deliverycnt %></a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">배송완료</em>
									</span>
									<span class="number-area fr">
										<a class="text-number1"><%=fdeliverycnt %></a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
						</ul>
					</div>
					<div style="clear:both"></div>
				</div>
			</div>
			<div class="fr orderclaim">
				<div class="panel-heading">
					<div class="pull-left">
						<h3 class="panel-title">클레임/정산</h3>
					</div>
				</div>
				<div class="panel-body">
					<div class="list_wrap fl">
						<div class="panel-icon-box">
							<span class="re-ico">
								<i class="return-icon"></i>
							</span>
						</div>
						<ul class="panel-text">
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">취소요청</em>
									</span>
									<span class="number-area fr">
										<a class="text-number2">0</a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">반품요청</em>
									</span>
									<span class="number-area fr">
										<a class="text-number2">0</a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">교환요청</em>
									</span>
									<span class="number-area fr">
										<a class="text-number2">0</a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
						</ul>
					</div>
					<div class="list_wrap fr lf-bd">
						<div class="panel-icon-box">
							<span class="pay-ico">
								<i class="payment-icon"></i>
							</span>
						</div>
						<ul class="panel-text">
							<li>
								<div class="order_div">
									<span class="info-title fl">
										<em class="pull_left">구매확정</em>
									</span>
									<span class="number-area fr">
										<a class="text-number3">0</a>
										<span>건</span>
									</span>
									<div style="clear:both"></div>
								</div>
							</li>
						</ul>
					</div>
					<div style="clear:both"></div>
				</div>
			</div>
			<div style="clear:both"></div>
		</div>
		<div class="seller-sub-content2">
		  <div class="fl orderclaim">
		    <div class="panel-heading">
		      <div class="pull-left">
		        <h3 class="panel-title">스토어 매출 통계</h3>
		      </div>
		    </div>
		    <div class="panel-body2">
		      <div class="text-center">
		        <div class="buy-btn">
		          <label class="buy-cnt">결제건수</label>
		        </div>
		      </div>
		      <div class="chart_div">
		       <canvas id="myChart" width="400" height="200"></canvas>
		       <script>
		        // 샘플 데이터
		       var datesInRange = [<%for (LocalDate date : datesInRange) {%>
		       "<%=date%>",
				<% }%>];
				
				var data = {
				    labels: datesInRange,
				    datasets: [{
				        label: "주 결제건수",
				        data: [1, 2, 0, 3, 0, 0, 0,0,0,0,0,0,0,0,0,0,0],
				        backgroundColor: "rgba(75, 192, 192, 0.2)",
				        borderColor: "rgba(75, 192, 192, 1)",
				        borderWidth: 1
				    }]
				};
				
				// 차트 옵션
				var options = {
				    responsive: true,
				    maintainAspectRatio: false, 
				    scales: {
				        y: {
				            beginAtZero: true
				        }
				    }
				};
				
				// 차트 생성
				var ctx = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(ctx, {
				    type: 'line',
				    data: data,
				    options: options
				});
		    </script>
		      </div>
		    </div>
		  </div>
		  <div class="fr orderclaim">
		    <div class="panel-heading">
		      <div class="pull-left">
		        <h3 class="panel-title">미답변 문의</h3>
		      </div>
		    </div>
		    <div class="panel-body2" style="padding: 0;">
		      <div class="inquiry-main">
		      	<ul class="panel-answer">
		      		<li role="tab" id="tab1" aria-selected="true">
		      			<div class="tab-container">
		      				<a class="tab-content product">
		      					<span class="text-service">상품문의</span>
		      				</a>
		      			</div>
		      		</li>
		      		<li role="tab" id="tab3" aria-selected="false">
		      			<div class="tab-container">
		      				<a class="tab-content talk">
		      					<span class="text-service">톡톡문의</span>
		      				</a>
		      			</div>
		      		</li>
		      	</ul>
		      	<div class="inquiry-content" style="display:block;">
		      		<ul class="content-list">
		      			<li>
		      				<% for(MainInquiryDto dto: inquiyDto) {%>
		      				<a style="margin: 10px 85px; border-bottom: 1px solid #bbbbbb" href="InquiryManage.jsp?seller_id=<%=seller_id%>">
		      					<span class="question">Q.</span>
		      					<span class="inquiry_title"><%=dto.getInquiry_content() %></span>
		      					<span class="date fr"><%=dto.getInquiry_date() %></span> <br/>
		      				</a>
		      					<% } %>
		      			</li>
		      		</ul>
		      	</div>
		      	<div class="inquiry-content3" style="display:none;">
		      		<ul class="content-list">
		      			<li>
		      				<% for(MainInquiryDto dto3 : talkDto) { %>
		      				<a style=" border-bottom: 1px solid #bbbbbb;padding-right: 20px; " href="">
		      					<span class="question">Q.</span>
		      					<span class="inquiry_title"><%=dto3.getSender_id() %></span>
		      					<span class="date fr" style="padding-right: 40px;"><%=dto3.getTalk_time()%></span><br/>
		      					<span class="inquiry_title"><%=dto3.getTalk_content() %></span>
		      				</a>
		      				<%} %>
		      			</li>
		      		</ul>
		      	</div>
		      </div>
			  <div class="clear:both"></div>
		      
		    </div>
		  </div>
		  <div class="clear:both"></div>
		</div>
		  <div class="clear:both"></div>
		<div class="seller-sub-content">
			<div class="fl orderclaim">
			    <div class="panel-heading">
			      <div class="pull-left">
			        <h3 class="panel-title">상품</h3>
			      </div>
			    </div>
			    <div class="panel-body">
					<ul class="panel-border-list">
						<li>
							<div class="order-div">
								<span class="info-title fl">판매중 상품</span>
								<span class="number-area fr">
									<a class="text-number "><%=productCnt %></a>
									<span>건</span>
								</span>
								<div style="clear:both"></div>
							</div>
						</li>
						<li>
							<div class="order-div">
								<span class="info-title fl">품절 상품</span>
								<span class="number-area fr">
									<a class="text-number"><%=amount %></a>
									<span>건</span>
								</span>
								<div style="clear:both"></div>
							</div>
						</li>
					</ul>			    	
			    </div>
			</div>
			<div class="fr orderclaim">
			    <div class="panel-heading">
			      <div class="pull-left">
			        <h3 class="panel-title">리뷰</h3>
			      </div>
			    </div>
			    <div class="panel-body">
			    	<ul class="panel-border-list">
						<li>
							<div class="order-div">
								<span class="info-title fl">새로 작성된 리뷰</span>
								<span class="number-area fr">
									<a class="text-number "><%=reviewcount %></a>
									<span>건</span>
								</span>
								<div style="clear:both"></div>
							</div>
						</li>
						<li>
							<div class="order-div">
								<span class="info-title fl">평점 낮은 리뷰</span>
								<span class="number-area fr">
									<a class="text-number"><%=buyer_count %></a>
									<span>건</span>
								</span>
								<div style="clear:both"></div>
							</div>
						</li>
					</ul>			
			    </div>
			</div>
		</div>
		<div class="clear:both"></div>
	</div>
</body>
</html>
