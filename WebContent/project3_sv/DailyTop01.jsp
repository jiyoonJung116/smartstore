<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
  	AllProductSelectDao allpDao = new AllProductSelectDao();
  	String sq = request.getParameter("sq");
  	ArrayList<AllProductDto> dto2 = null;
  	if(sq==null){
  		sq="인기도순";
  		dto2 = allpDao.allSelect(seller_id, sq);
	}else {
		sq = request.getParameter("sq");
  		dto2 = allpDao.allSelect(seller_id, sq);
	} 
  	SellerDao sellerdao = new SellerDao();
  	SellerDto sellerdto = sellerdao.select(seller_id);
  	StoreDto storedto = sellerdao.selectName(seller_id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DailyTop01</title>
	<link rel="stylesheet" href="../css/DailyTop01.css" />
	<script src="../js/jquery-3.7.0.min.js"></script>
	<script>
		$(function() {
			$(".pd_orderbylibtn").click(function() {
				$(".pd_orderbylibtn[aria-selected=true]").attr("aria-selected","false");
				$(this).attr("aria-selected","true");
				if($(this).text()=="할인율순"){
					alert("준비중입니다.");
				}else if($(this).text()=="평점높은순"){
					alert("준비중입니다.");
				}else {
					let currentUrl = window.location.href;
					let sq = $(this).text();
					// 기존 쿼리 문자열 파싱
					var url = new URL(currentUrl);
					var searchParams = new URLSearchParams(url.search);
				
					// 파라미터 추가 또는 변경
					searchParams.set("sq", sq);
				
					// 변경된 쿼리 문자열을 새로운 URL에 적용
					url.search = searchParams.toString();
				
					// 새로운 URL로 페이지 새로고침
					window.location.href = url.toString();
				}
			});
			$(".listupicon3btn").click(function() {
				$(".listupicon3btn[aria-selected=true]").attr("aria-selected","false");
				$(this).attr("aria-selected","true");
			});
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
		.listupicon3btn[aria-selected=true] {
			    background-color: <%=dto.getColor_theme()%>;
			    border-color : <%=dto.getColor_theme()%>;
		}
		.pagenuma[aria-current="true"] {
			    background-color: <%=dto.getColor_theme()%>;
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
				<a class="nickname">긍정부자</a>
				<a class="listcube"></a>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="topmargin topcolor secondtop">
			<div class="fl">
				<a href="DailyTopSellerinfo.jsp" class="myself">
					<img src="img/profile.jpg" class="profile"/>
					<span class="introduce"><%=storedto.getStore_introduce() %></span>
					<span class="blind" id="param_id">jiyoonjung</span>
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
		<div class="subjectbar">
			<div class="storename">
				<div class="alarm fl">
					<div class="alarm2">
						<button type="button" class="topcolor alarm3">
							<span class="bell"></span>
							<span class="belltext">알림받기</span>
						</button>
					</div>
				</div>
				<div class="fl center">
					<h1 class="storemiddle">
						<a href="CustomerDailyTop.jsp">
							<span class="storemainname"><%=storedto.getStore_name() %></span>
						</a>
					</h1>
				</div>
				<div class="fr today">
					<div class="todayandtotal">
						<span>오늘
							<em class="visit">1</em>
						</span>
						<span class="total">전체
							<em class="visit">596</em>
						</span>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div class="topmenu">
				<div class="menucontent">
					<ul class="ulstype">
						<!-- <li class="listyle">
							<a href="DailyTop01.jsp" class="listtype">스포츠/레저
								<span class="ardown"></span>
							</a>
						</li>
						<li class="listyle">
							<a href="DailyTop01.jsp" class="listtype">가구/인테리어
								<span class="ardown"></span>
							</a>
						</li> -->
						<li class="listyle">
							<a href="DailyTop01.jsp" class="listtype">전체상품
							</a>
						</li>
					</ul>
					<ul class="ulstype">
						<li class="listyle2">
							<a href="DailyTopQNA.jsp" class="submenulist">묻고 답하기</a>
						</li>
						<li class="listyle2">
							<a href="DailyTopANCM.jsp" class="submenulist">공지사항</a>
						</li>
						<li class="listyle2">
							<a class="submenulist preparing">리뷰이벤트</a>
						</li>
						<li class="listyle2">
							<a class="submenulist preparing">쇼핑스토리</a>
						</li>
						<li class="listyle2">
							<a href="DailyTopSellerinfo.jsp" class="submenulist">판매자 정보</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="pdcontent">
			<div>
				<div class="pd_title">
					<strong class="pd_titles">전체상품</strong>
					<div class="menudiv">
						<ul class="menuul">
							<li class="menuli">
								<a href="/customerfordaily" class="menulia">홈</a>
							</li>
							<li class="menuli">
								<div class="menulidiv">
								<%int cnt=0; %>
								<%for(AllProductDto allPdto : dto2) { %>
								<%cnt++; %>
								<%} %>
									<span class="menulidivspan">(총 <strong><%=cnt %></strong>개)</span>
									<span class="menulidivspan">전체상품</span>
								</div>
								<div class="menulibtnbox">
									<button type="button" class="menulidivbtn">
									</button>
								</div>
							</li>
							<li class="menuli">
								<div class="menulibtnbox">
									<button type="button" class="menulidivbtn2">
										전체
									</button>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="pd_menu">
					<ul class="pd_menuul">
						<li class="pd_menuli">
							<input type="checkbox" class="blind" id="free-d">
							<label for="free-d" class="menulilb">무료배송</label>
						</li>
						<li class="pd_menuli">
							<button type="button" class="pd_menulibtn">혜택정보</button>
						</li>
						<li class="pd_menuli">
							<button type="button" class="pd_menulibtn">배송유형</button>
						</li>
						<li class="pd_menuli">
							<button type="button" class="pd_menulibtn">상품유형</button>
						</li>
						<li class="pd_menuli">
							<button type="button" class="pd_menulibtn">가격대</button>
						</li>
					</ul>
					<div class="adjust">
						<button type="button" class="adjustbtn">
							<span class="adbtnspan"></span>
						</button>
					</div>
				</div>
				<div class="pd_orderby">
					<div class="pd_orderby1">
						<ul class="pd_orderbyul" role="tablist">
							<%if(sq.equals("인기도순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">인기도순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">인기도순</button>
								</li>
							<%} %>
							<%if(sq.equals("최신등록순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">최신등록순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">최신등록순</button>
								</li>
							<%} %>
							<%if(sq.equals("낮은가격순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">낮은가격순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">낮은가격순</button>
								</li>
							<%} %>
							<%if(sq.equals("높은가격순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">높은가격순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">높은가격순</button>
								</li>
							<%} %>
							<%if(sq.equals("할인율순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">할인율순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">할인율순</button>
								</li>
							<%} %>
							<%if(sq.equals("누적판매순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">누적판매순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">누적판매순</button>
								</li>
							<%} %>
							<%if(sq.equals("리뷰많은순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">리뷰많은순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">리뷰많은순</button>
								</li>
							<%} %>
							<%if(sq.equals("평점높은순")) {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn" aria-selected="true">평점높은순</button>
								</li>
							<%}else {%>
								<li class="pd_orderbyli" role="presentation">
									<button type="button" class="pd_orderbylibtn">평점높은순</button>
								</li>
							<%} %>
						</ul>
					</div>
					<div class="listupicon">
						<div class="listupicon2">
							<button type="button" class="listupicon2btn">
								40개씩 보기
								<span class="listupicon2span"></span>
							</button>
						</div>
						<div class="listupicon3">
							<ul class="listupicon3ul">
								<li class="listupicon3li">
									<button type="button" class="listupicon3btn listupicon3btn1"></button>
								</li>
								<li class="listupicon3li">
									<button type="button" class="listupicon3btn listupicon3btn2"></button>
								</li>
								<li class="listupicon3li">
									<button type="button" class="listupicon3btn listupicon3btn3" aria-selected="true"></button>
								</li>
								<li class="listupicon3li">
									<button type="button" class="listupicon3btn listupicon3btn4"></button>
								</li>
							</ul>
						</div>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div>
				<ul class="allpul">
				<%for(AllProductDto allPdto : dto2) { %>
					<li class="allpli">
						<a href="CustomerDailyTopContent.jsp?pnumber=<%=allPdto.getPnumber() %>" class="allpimg">
							<span class="allpimgbox">
								<img class="allpimgdetail"src="Images/<%=allPdto.getImage()%>">
							</span>
							<span class="allpnamebox">
								<strong class="allp1name"><%=allPdto.getPname()%></strong>
							</span>
							<span class="allpricebox">
								<strong class="allp1price"><%=allPdto.getPrice()%>원
								</strong>
							</span>
						</a>
						<button type="button" class="likey"></button>
					</li>
					<% } %>
				</ul>
				<div style="clear:both;"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div class="pagenum">
			<a href="#" class="pagenuma" aria-current="true" role="menuitem">1</a>
		</div>
		<div class="last">
					<div class="lastfooter">
						<div class="footer1">
						<% String phone = sellerdto.getPhone(); %>
									<% String phone0 = phone.substring(0, 3) + "-"
							                + phone.substring(3, 7) + "-"
							                + phone.substring(7); %>
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
</body>
</html>