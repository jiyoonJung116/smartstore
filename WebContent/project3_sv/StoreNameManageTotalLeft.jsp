<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.util.*"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
   <% 
	request.setCharacterEncoding("utf-8");
	CommonDao commonDao = new CommonDao();
	SellerDao sellerdao = new SellerDao();
	String seller_id = request.getParameter("seller_id");
	CommonDto dto = null;
	SellerDto sellerdto = null;
	StoreDto storedto = null;
  	if(seller_id==null){
  		seller_id="jiyoonjung";
		dto = commonDao.colorselect(seller_id);
		sellerdto = sellerdao.select(seller_id);
		storedto = sellerdao.selectName(seller_id);
	}else {
		seller_id = request.getParameter("seller_id");
		dto = commonDao.colorselect(seller_id);
		sellerdto = sellerdao.select(seller_id);
		storedto = sellerdao.selectName(seller_id);
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
  	NewPDao newpdao = new NewPDao();
	ArrayList<NewPDto> dto3 = newpdao.select(seller_id);
	
	//프로모션이미지
  	PromotionImage pro_image = new PromotionImage();
	ArrayList<PromotionImageDto> pimg_select = pro_image.select();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어이름관리</title>
<link rel="stylesheet" href="../css/StoreNameManage.css" />
<link rel="stylesheet" href="../css/smartstoresidebar.css"/>
<link rel="stylesheet" href="../css/SmallCustomerDailyTop.css" />
<script src="../js/jquery-3.7.0.min.js"></script>
<script>
	$(function() {
		$(".component").attr("class","component backcolor2");
		$(".common").attr("class","common backcolor1");
		$(".component_margin").css("display", "block");
		$(".common_margin").css("display", "none");
		//스마트스토어 사이드바
		$(".common").click(function() {
			$(this).attr("class","common backcolor2");
			$(".component").attr("class","component backcolor1");
			$(".common_margin").css("display", "block");
			$(".component_margin").css("display", "none");
		});
		$(".component").click(function() {
			$(this).attr("class","component backcolor2");
			$(".common").attr("class","common backcolor1");
			$(".component_margin").css("display", "block");
			$(".common_margin").css("display", "none");
		});
		$(".color").click(function() {
			$(".color[aria-checked=true]").attr("aria-checked","false");
			$(this).attr("aria-checked","true")
		});
		$(".component_txtbtn").click(function() {
			$(".component_txtbtn[aria-checked=true]").attr("aria-checked","false");
			$(this).attr("aria-checked","true")
			$(".component_txtbtn[aria-check=true]").attr($(".component_list_box").attr("aria-checked","false"));
		});
		$(".component_list_box").click(function() {
			$(".component_list_box[aria-checked=true]").attr("aria-checked","false");
			$(this).attr("aria-checked","true")
			$(".component_list_box[aria-check=true]").attr($(".component_txtbtn").attr("aria-checked","false"));
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
<form action="StoreNameActionTop.jsp">
	<div id="header">
		<div class="fl left_header">
			<a href="https://www.naver.com/" class="naverlogo"></a>
			<a href="https://sell.smartstore.naver.com/d/v2/home" class="storelogo">스마트스토어 관리</a>
		</div>
		<div class="fr right_header">
			<button class="out_btn" type="button">나가기</button>
			<button class="apply_btn" type="submit">전체 적용하기</button>
			<!-- input box 아이디 넣어줌!!!!!!!!!!-->
			<input type="hidden" name="seller_id" value="<%=seller_id%>">
		</div>
		<div style="clear:both;"></div>
	</div>
		<div id="left_side" class="fl">
		<div class="left_width">
			<div class="left_height">
					<div class="left_padding"> 
						<div class="left_menutxt">
							<strong>관리 메뉴</strong>
							<button type="button" class="sideclose_btn">
								<span class="close_icon"></span>
							</button>
						</div>
						<div class="com_btn">
							<button type="button" class="common" name="common">공통 관리
								<span class="blind">선택됨</span>
							</button>
							<button type="button" class="component" name="component">컴포넌트 관리</button>
						</div>
						<div class="component_margin">
							<div>
								<div class="component_txtbtn" role="button" aria-checked="true">
									<div class=component_txt>스토어 이름</div>
								</div>
								<div class="component_txtbtn" role="button" aria-checked="false">
									<div class=component_txt>카테고리 & 메뉴</div>
								</div>
								<div class="component_txtbtn" role="button" aria-checked="false">
									<div class=component_txt>프로모션 이미지</div>
								</div>
								<div class="component_txtbtn" role="button" aria-checked="false">
									<div class=component_txt>스토어 및 셀러 정보</div>
								</div>
								<div class="component_txtbtn" role="button" aria-checked="false">
									<div class=component_txt>고객혜택 배너</div>
								</div>
								
								<div class="component_list_box" role="button" aria-checked="false">
									<div class="component_listtxt">베스트 상품</div>
									<div class="check_box">
										<div class="list_slide">
											<input id="bestp" class="blind" type="checkbox" checked/>
											<label for="bestp" class="check_label"></label>
										</div>
									</div>
								</div>
								<div class="component_list_box" role="button" aria-checked="false">
									<div class="component_listtxt">신상품</div>
									<div class="check_box">
										<div class="list_slide">
											<input id="new_p" class="blind" type="checkbox" checked/>
											<label for="new_p" class="check_label"></label>
										</div>
									</div>
								</div>
								<div class="component_list_box" role="button" aria-checked="false">
									<div class="component_listtxt">베스트리뷰 상품</div>
									<div class="check_box">
										<div class="list_slide">
											<input id="bestreview" class="blind" type="checkbox" checked/>
											<label for="bestreview" class="check_label"></label>
										</div>
									</div>
								</div>
								<div class="component_list_box" role="button" aria-checked="false">
									<div class="component_listtxt">자유상품</div>
									<div class="check_box">
										<div class="list_slide">
											<input id="freep" class="blind" type="checkbox" checked/>
											<label for="freep" class="check_label"></label>
										</div>
									</div>
								</div>
								<div class="component_list_box" role="button" aria-checked="false">
									<div class="component_listtxt">전체상품</div>
									<div class="check_box">
										<div class="list_slide">
											<input id="allp" class="blind" type="checkbox" checked/>
											<label for="allp" class="check_label"></label>
										</div>
									</div>
								</div>
								<div class="component_txtbtn" role="button" aria-checked="false">
									<div class=component_txt>푸터</div>
								</div>
								
							</div>
						</div>
							<div class="common_margin">
								<div>
									<strong class="color_txt">컬러 테마</strong>
									<div class="color_btn">
										  <button type="button" class="color color_black" aria-checked="true" name="colorType" value="black">
	                                 			<span class="blind">black</span>
			                              </button>
			                              <button type="button" class="color color_gray" aria-checked="false" name="colorType" value="gray">
			                                 <span class="blind">gray</span>
			                              </button>
			                              <button type="button" class="color color_blue" aria-checked="false" name="colorType" value="blue">
			                                 <span class="blind">blue</span>
			                              </button>
			                              <button type="button" class="color color_brown" aria-checked="false" name="colorType" value="brown">
			                                 <span class="blind">brown</span>
			                              </button>
			                              <button type="button" class="color color_green" aria-checked="false" name="colorType" value="green">
			                                 <span class="blind">green</span>
			                              </button>
			                              <button type="button" class="color color_cyan" aria-checked="false" name="colorType" value="cyan">
			                                 <span class="blind">cyan</span>
			                              </button>
			                              <button type="button" class="color color_pink" aria-checked="false" name="colorType" value="pink">
			                                 <span class="blind">pink</span>
			                              </button>
			                              <button type="button" class="color color_hotpink" aria-checked="false" name="colorType" value="hotpink">
			                                 <span class="blind">hotpink</span>
			                              </button>
			                              <button type="button" class="color color_orangered" aria-checked="false" name="colorType" value="orangered">
			                                 <span class="blind">orangered</span>
			                              </button>
			                              <button type="button" class="color color_red" aria-checked="false" name="colorType" value="red">
			                                 <span class="blind">red</span>
			                              </button>
			                              <button type="button" class="color color_violet" aria-checked="false" name="colorType" value="violet">
			                                 <span class="blind">violet</span>
			                              </button>
			                              <button type="button" class="color color_yellow" aria-checked="false" name="colorType" value="yellow">
			                                 <span class="blind">yellow</span>
			                              </button>
			                              <button type="button" class="color color_orange" aria-checked="false" name="colorType" value="orange">
			                                 <span class="blind">orange</span>
			                              </button>
			                              <button type="button" class="color color_ivory" aria-checked="false" name="colorType" value="ivory">
			                                 <span class="blind">ivory</span>
			                              </button>
									</div>
								</div>
								<div class="gnb_position">
									<strong class="position_txt">PC GNB 위치</strong>
									<div class="position_btn">
										<div class="radio_position">
											<div class="radio_box">
												<input type="radio" id="top_radio" class="cilck_position blind" name="checkedType" value="top" checked="checked"/>
												<label for="top_radio" class="for_top">
													<span class="top_icon"></span>
													<span class="radio_txt">상단형</span>
													<span class="radio_btn"></span>
												</label>
											</div>
										</div>
										<div class="radio_position">
											<div class="radio_box">
												<input type="radio" id="left_radio" class="cilck_position blind" name="checkedType" value="left"/>
												<label for="left_radio" class="for_top">
													<span class="top_icon"></span>
													<span class="radio_txt">좌측형</span>
													<span class="radio_btn"></span>
												</label>
											</div>
										</div>
									
									</div>
								</div>
								
							</div>
						
					</div>
				</div>
			</div>	
		</div>
			<div class="hole_style fl" style="height: 900px; width: 830px;">
		<div class="top_title1">
			<strong class="top_title">스토어 이름 관리</strong>
		</div>
		<div class="stnamebox">
			<div>
				<strong class="stnamestr">스토어명</strong>
			</div>
			<ul class="pd_select_ul" style="margin-top:10px;">
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip1"class="blind pd_sel_input" type="radio" name="sortType" >
						<label class="pd_sel_lb" for="pd_sel_ip1">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">로고형</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip2"class="blind pd_sel_input" type="radio" name="sortType" checked>
						<label class="pd_sel_lb" for="pd_sel_ip2">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">텍스트형</span>
						</label>
					</div>
				</li>
			</ul>
			<div class="inputbox">
				<input name="new_name" type="text" class="inputstorename" placeholder="<%=storedto.getStore_name() %>" value="">
			</div>
			<p class="stnamep">텍스트형을 지정한 경우, <a class="stnamea">스마트스토어 설정</a> 메뉴에 등록된 스토어명으로 노출됩니다.</p>
		</div>
		<div class="stnamebox">
			<div>
				<strong class="stnamestr">스토어 소개</strong>
			</div>
			<div class="inputbox">
				<input name="store_introduce" type="text" id="store_introduce" class="inputstorename" placeholder="<%=storedto.getStore_introduce()%>" value="">
			</div>
		</div>
	</div>
</form>
<div class="fl theme_display">
	<div class="smallss">
		<div class="pc">
		<div id="headert" class="topcolor firsttop">
		<div class="topmargin topcolor">
			<div class="fl">
				<a class="naverlogo2" href="https://www.naver.com"></a>
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
				<a class="myself">
					<img src="img/profile.jpg" class="profile"/>
					<span class="introduce"><%=storedto.getStore_introduce() %></span>
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
						<a>
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
							<a class="listtype">스포츠/레저
								<span class="ardown"></span>
							</a>
						</li>
						<li class="listyle">
							<a class="listtype">가구/인테리어
								<span class="ardown"></span>
							</a>
						</li> -->
						<li class="listyle">
							<a class="listtype">전체상품
							</a>
						</li>
					</ul>
					<ul class="ulstype">
						<li class="listyle2">
							<a class="submenulist">묻고 답하기</a>
						</li>
						<li class="listyle2">
							<a class="submenulist">공지사항</a>
						</li>
						<li class="listyle2">
							<a class="submenulist">리뷰이벤트</a>
						</li>
						<li class="listyle2">
							<a class="submenulist">쇼핑스토리</a>
						</li>
						<li class="listyle2">
							<a class="submenulist">판매자 정보</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="promotion">
			<ul class="promotionlist">
			 	 <%for(PromotionImageDto promotiondto : pimg_select){%>
					<li class="promotionimg" style="background-image: url(Images/<%=promotiondto.getImageF()%>)!important">
						<div class="promotiontext">
							<div class="promotiontext1">
								<div class="promotiontext2">
									<strong class="pmtext"><%=promotiondto.getSubject()%></strong>
								</div>
							</div>
						</div>
					</li>
				<%} %>
			</ul>
		</div>
		<div class="pcontent">
			<div class="newpcontent">
				<strong class="newpname">신상품</strong>
				<ul class="newpul">
					<%int newPpage = 0;
					for(NewPDto newpdto : dto3) { 
						if(newPpage<=3){%>
							<li class="newpli">
								<a  class="newpimg">
									<span class="newpimgbox">
										<img  style=" height:330;" class="newpimgdetail"src="Images/<%=newpdto.getImage() %>">
									</span>
									<span class="newpnamebox">
										<strong class="newp1name"><%=newpdto.getPname() %></strong>
									</span>
									<span class="newpricebox">
										<strong class="newp1price"><%=newpdto.getPrice() %>
											<span class="wonkorea">원</span>
										</strong>
									</span>
								</a>
							</li>
							<%}
						}%>
					<!-- <li class="newpli">
						<a class="newpimg">
							<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f400_324">
							<span class="newpnamebox">
								<strong class="newp1name">가구 수평패드</strong>
							</span>
							<span class="newpricebox">
								<strong class="newp1price">25,000
									<span class="wonkorea">원</span>
								</strong>
							</span>
						</a>
					</li>
					<li class="newpli">
						<a class="newpimg">
							<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f400_324">
							<span class="newpnamebox">
								<strong class="newp1name">요가매트</strong>
							</span>
							<span class="newpricebox">
								<strong class="newp1price">29,900
									<span class="wonkorea">원</span>
								</strong>
							</span>
						</a>
					</li> -->
				</ul>
			</div>
		</div>
		<div class="fpcontent">
			<div class="freepcontent">
				<strong class="freepname">자유상품</strong>
				<div class="freepbox">
					<ul class="freepul">
						<li class="freepli">
							<a class="freeptext">
								<span class="freepimgbox">
									<img class="freepimg" src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f640"/>
								</span>
								<strong class="freep1name">가구수평패드</strong>
								<span class="freepricebox">
								<strong class="freep1price">25,000
									<span class="wonkorea2">원</span>
								</strong>
							</span>
							</a>
							<div class="tag">
								<a class="hashtag">#가구수평패드</a>
								<a class="hashtag">#가구높이조절캡</a>
								<a class="hashtag">#흔들림방지</a>
							</div>
							<a class="pdetaillook">상품상세보기</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="pcontent">
			<div class="allpcontent">
				<strong class="allpname">전체상품</strong>
				<div class="orderby">
					<ul class="orderbyul" role="tablist">
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn" role="tab">
								인기도순
							</button>
						</li>
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn0" role="tab">
								최신등록순
							</button>
						</li>
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn0" role="tab">
								낮은 가격순
							</button>
						</li>
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn0" role="tab">
								높은 가격순
							</button>
						</li>
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn0" role="tab">
								할인율순
							</button>
						</li>
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn0" role="tab">
								누적 판매순
							</button>
						</li>
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn0" role="tab">
								리뷰 많은순
							</button>
						</li>
						<li class="orderbyli" role="presentation">
							<button type="button" class="orderbybtn0" role="tab">
								평점 높은순
							</button>
						</li>
					</ul>
				</div>
				<ul class="allpul">
					<%int allPpage = 0;
					for(AllProductDto allPdto : dto2) {
						allPpage++;
						if(allPpage<=5) {%>
							<li class="allpli">
								<a class="allpimg">
									<span class="allpimgbox">
										<img  style="width: 220px;height: 290px;" class="allpimgdetail"src="Images/<%=allPdto.getImage()%>">
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
						<% }
						}%>
				<!-- 	<li class="allpli">
						<a class="allpimg">
							<span class="allpimgbox">
								<img class="allpimgdetail"src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f295_381">
							</span>
							<span class="allpnamebox">
								<strong class="allp1name">가구 수평패드</strong>
							</span>
							<span class="allpricebox">
								<strong class="allp1price">25,000원
								</strong>
							</span>
						</a>
						<div class="starreview">
							<span class="starreviewcon">평점 5.0</span>
							<span class="starreviewcon">리뷰 1</span>
						</div>
						<button type="button" class="likey"></button>
					</li>
					<li class="allpli">
						<a class="allpimg">
							<span class="allpimgbox">
								<img class="allpimgdetail"src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f295_381">
							</span>
							<span class="allpnamebox">
								<strong class="allp1name">요가매트</strong>
							</span>
							<span class="allpricebox">
								<strong class="allp1price">29,900원
								</strong>
							</span>
						</a>
						<button type="button" class="likey"></button>
					</li> -->
				</ul>
			</div>
		</div>
			<% String phone = sellerdto.getPhone(); %>
									<% String phone0 = phone.substring(0, 3) + "-"
							                + phone.substring(3, 7) + "-"
							                + phone.substring(7); %>
		<div class="last">
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
</body>
</html>