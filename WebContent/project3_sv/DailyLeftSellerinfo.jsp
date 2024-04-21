<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
     <% 
	CommonDao commonDao = new CommonDao();
	String seller_id = request.getParameter("seller_id");
	CommonDto dto = null;
  	if(seller_id==null){
  		seller_id="jiyoonjung";
		dto = commonDao.colorselect(seller_id);
	}else {
		seller_id = request.getParameter("seller_id");
		dto = commonDao.colorselect(seller_id);
		
	} 
  	SellerDao sellerdao = new SellerDao();
  	StoreDto storedto = sellerdao.selectName(seller_id);
  	SellerDto sellerdto = sellerdao.select(seller_id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DailyLeftSellerinfo</title>
	<link rel="stylesheet" href="../css/DailyLeftSellerinfo.css" />
	<script src="../js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
			$(".alarm3").click(function() {
				if($(".belltext").text()==="알림받기"){
					$(this).attr("aria-pressed","true");
					$(this).attr("class","alarm3");
					$(".belltext").text("알림받는중");
				}else {
					$(this).attr("aria-pressed","false");
					$(this).attr("class","alarm3 topcolor");
					$(".belltext").text("알림받기");
				}
			});
			$(".preparing").click(function() {
				alert("준비중입니다.");
			});
		});
	</script>
	<style>
		.topcolor {
			background-color : <%=dto.getColor_theme()%>;
		}
		.listtype:hover {
			color: <%=dto.getColor_theme()%>;
		}
	</style>
</head>
<body>
	<!-- 상단바 -->
	<div id="header" class="topcolor firsttop">
		<div class="topmargin topcolor">
			<div class="fl">
				<a class="naverlogo" href="https://www.naver.com"></a>
				<a class="navershopinglogo" href="https://shopping.naver.com/home"></a>
			</div>
			<div class="fr">
				<a class="likestore">관심스토어</a>
				<a class="mypage">마이페이지</a>
				<a class="basket">장바구니</a>
				<a class="nickname">jiyoonjung</a>
				<a class="listcube"></a>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="topmargin topcolor secondtop">
			<div class="fl">
				<a href="DailyLeftSellerinfo.jsp" class="myself">
					<img src="../Images/profile.jpg" class="profile"/>
					<span class="introduce"><%=storedto.getStore_introduce() %></span>
					<span class="blind" id="param_id"><%=seller_id %></span>
				</a>
				<span class="likecustomer">관심고객수 1</span>
				<button type="button" class="que"></button>
			</div>
			<div class="fr searchbar">
				<div class="searchinsert">
					<input type=text class="search1" placeholder="검색어를 입력해보세요"/>
					<button type="button" class="searchbtn">
						<span class="serchdetailbtn topcolor"></span>
					</button>
				</div>
			</div>
			<div style="clear:both;"></div>
		</div>
	</div>
	<!-- 컨텐츠 -->
	<div id="container" class="conmargin">
		<div class="fl">
			<div class="subjectbar">
				<div class="storename">
					<div class="center">
						<h1 class="storemiddle">
							<a href="CustomerDailyLeft.jsp">
								<span class="storemainname"><%=storedto.getStore_name() %></span>
							</a>
						</h1>
					</div>
					<div class="alarm">
						<div class="alarm2">
							<button type="button" class="topcolor alarm3">
								<span class="bell"></span>
								<span class="belltext">알림받기</span>
							</button>
						</div>
					</div>
				</div>
				<div class="topmenu">
					<div class="menucontent">
						<ul class="ulstype">
							<!-- <li>
								<a href="DailyLeft01.jsp" class="listtype">스포츠/레저
								</a>
							</li>
							<li>
								<a href="DailyLeft01.jsp" class="listtype">가구/인테리어
								</a>
							</li> -->
							<li>
								<a href="DailyLeft01.jsp" class="listtype">전체상품
								</a>
							</li>
						</ul>
						<ul class="ulstype2">
							<li class="listyle2">
								<a href="DailyLeftQNA.jsp" class="submenulist">묻고 답하기</a>
							</li>
							<li class="listyle2">
								<a href="DailyLeftANCM.jsp" class="submenulist">공지사항</a>
							</li>
							<li class="listyle2">
								<a class="preparing submenulist">리뷰이벤트</a>
							</li>
							<li class="listyle2">
								<a class="preparing submenulist">쇼핑스토리</a>
							</li>
							<li class="listyle2">
								<a href="DailyLeftSellerinfo.jsp"  class="submenulist">판매자 정보</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="today">
					<div class="todayandtotal">
						<span>오늘
							<em class="visit">1</em>
						</span>
						<span class="total">전체
							<em class="visit">596</em>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="fr">
			<div class="right">
			<div>
			<!-- 여기까지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->
			<div class="pdcontent">
			<div>
				<div class="pd_title">
					<strong class="pd_titles">판매자 정보</strong>
				
				</div>
			<div class="pd_menu">
					<div class="store_name">
						<strong class="name"><%=storedto.getStore_name() %></strong>
						<p class="subname"><%=storedto.getStore_introduce() %></p>
						<dl class="mt39 dlcon"></dl>
					</div>
					<div class="storeinfo">
						<strong style="font-size:16px;">사업자정보</strong>
						<div class="storeinfoin">
							<div class="fl storeinfoin2">
								<div class="stinfoin2">
									<div class="stinfoin201">상호명</div>
									<div class="stinfoin202"><%=sellerdto.getName() %></div>
								</div>
								<div class="stinfoin2">
									<div class="stinfoin201">대표자</div>
									<div class="stinfoin202"><%=sellerdto.getName() %>(<%=sellerdto.getBirth().substring(0, 10) %>)</div>
								</div>
								<div class="stinfoin2">
									<div class="stinfoin201">고객센터</div>
									<div class="stinfoin202">
									<% String phone = sellerdto.getPhone(); %>
									<% String phone0 = phone.substring(0, 3) + "-"
							                + phone.substring(3, 7) + "-"
							                + phone.substring(7); %>
										<div class="sellernumber2">
											<%=phone0 %>
											<span class="ing">인증</span>
											<button type="button" class="wrongnumber">잘못된 번호 신고</button>
										</div>
									</div>
								</div>
							</div>
							<div class="fl storeinfoin2 ml30">
								<div class="stinfoin2">
									<div class="stinfoin201">사업장 소재지</div>
									<div class="stinfoin202"><%=sellerdto.getWorkplace() %></div>
								</div>
								<div class="stinfoin2">
									<div class="stinfoin201">e-mail</div>
									<div class="stinfoin202"><%=sellerdto.getEmail() %></div>
								</div>
							</div>
							<div style="clear:both;"></div>
						</div>
					
					</div>
				</div>
		<!-- 여기까지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->
			<div class="last" style="width:1020px; margin-top:315px;">
					<div class="lastfooter">
						<div class="footer1">
							<p class="fanounce">반품 배송비, 반품 배송주소 등은 해당 상품 페이지 내 안내를 참고해주세요.</p>
							<div class="footer11">
								<div class="sellername fl"><%=sellerdto.getName() %></div>
								<div class="sellernumber2 fl">
									<%=phone0 %>
									<span class="ing">인증</span>
									<button type="button" class="wrongnumber">잘못된 번호 신고</button>
								</div>
								<div class="sellerinfo fl">
									<button type="button" class="sellerinfm">판매자 정보</button>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div class="footer2">
							<ul class="ft2_ul">
								<li class="ft2_li"><a href="https://policy.naver.com/rules/service.html" class="ft2_lia" target="_blank">네이버 약관</a></li>
								<li class="ft2_li"><a href="https://new-m.pay.naver.com/member/terms-policy/npay-usage" class="ft2_lia" target="_blank">네이버페이 이용약관</a></li>
								<li class="ft2_li"><a href="https://new-m.pay.naver.com/member/terms-policy/finance" class="ft2_lia" target="_blank">전자금융거래 이용약관</a></li>
								<li class="ft2_li"><a href="http://mktg.naver.com/privacy/privacy.html" class="ft2_lia" target="_blank"><strong>개인정보처리방침</strong></a></li>
								<li class="ft2_li"><a href="/main/rules/responsibility" class="ft2_lia" target="_blank">책임의 한계와 법적고지</a></li>
								<li class="ft2_li"><a href="http://www.naver.com/rules/youthpolicy.html" class="ft2_lia" target="_blank">청소년보호정책</a></li>
								<li class="ft2_li"><a href="https://ips.smartstore.naver.com/owner/intro" class="ft2_lia" target="_blank">지식재산권신고센터</a></li>
								<li class="ft2_li"><a href="https://ips.smartstore.naver.com/main/rules/safety" class="ft2_lia" target="_blank">안전거래 가이드</a></li>
								<li class="ft2_li"><a href="http://help.pay.naver.com" class="ft2_lia" target="_blank">쇼핑&amp;페이 고객센터</a></li>
							</ul>
							<div class="ft2_div">
								<div class="fl ft2_div1">
									<strong>네이버㈜</strong>
									<div class="ft2_div1in">
										사업자등록번호 220-81-62517
										<span class="ft2_div1inspan"></span>
										통신판매업신고번호 2006-경기성남-0692호<br/>
										대표이사 최수연
										<span class="ft2_div1inspan"></span>
										경기도 성남시 분당구 정자일로 95, NAVER 1784, 13561<br>
										전화 1588-3819
										<span class="ft2_div1inspan"></span>이메일
										<a href="mailto:helpcustomer@naver.com" class="ft2_div1ina" target="_blank">helpcustomer@naver.com</a>
										<span class="ft2_div1inspan"></span>
										<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208162517" target="_blank" class="ft2_div1ina">사업자등록정보 확인</a><br/>
										호스팅 서비스 제공 : NAVER Cloud
									</div>
								</div>
								<div class="fl ft2_div2">
									<strong>고객센터</strong>
									<div class="ft2_div2in">
										강원도 춘천시 퇴계로 89 강원전문건설회관<br/>
										전화 1588-3819
										<a href="#" class="ft2_div2ina" target="_blank">전화전클릭</a><br/>
										결제도용신고 1588-3816<br/>
										<a href="https://help.pay.naver.com/mail/form.help" class="ft2_div1ina" target="_blank">
											<strong>1:1문의 바로가기</strong>
										</a>
									</div>
								</div>
								<div class="fl ft2_div3">
									<strong>전자금융거래 분쟁처리</strong>
									<div class="ft2_div3in">전화 1588-3819<br/>
										<a href="https://help.pay.naver.com/mail/form.help" class="ft2_div3ina" target="_blank">
											<strong>1:1문의 바로가기</strong>
										</a>
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							<p class="ft2_p">
								네이버㈜는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있습니다.
								<a href="https://help.pay.naver.com/faq/alias/cashpay01.help" class="ft2_pa">자세히보기</a>
							</p>
							<div class="naverlast">
								<a href="http://www.naver.com/" target="_blank" class="naverlasta">
									<span class="blind">NAVER</span>
								</a>
								<em>Copyright ©</em>
								<a href="http://www.navercorp.com/" target="_blank" class="naverlasta1">
								<strong>NAVER Corp.</strong>
								</a>
								All Rights Reserved.
							</div>
			
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</div>
	</div>
</body>
</html>