<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
	<title>전체상품/좌측형</title>
	<link rel="stylesheet" href="css/AllProductM.css" />
	<link rel="stylesheet" href="css/smartstoresidebar.css"/>
	<link rel="stylesheet" href="css/SmallCustomerDailyLeft.css" />
	<script src="js/jquery-3.7.0.min.js"></script>
	<style>
		.topcolor {
			background-color : <%=dto.getColor_theme()%>;
		}
		
	</style>
	<script>
	$(function() {
		
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
		
		//키보드로 칠때마다 숫자바뀌는 거
		$(".input_style1").keyup(function(e) {
	         let content = $(this).val();
	         $(".charcount").html('<div class="fl charcount"><span class="freefont1">'+content.length+'</span><span class="freefont2">15</span></div>');
	         if(content.length>15) {
	            alert("최대 15자까지 입력 가능합니다.");
	            $(this).val(content.substring(0,15));
	            $(".charcount").html('<div class="fl charcount"><span class="freefont1">'+content.length+'</span><span class="freefont2">15</span></div>');
	         }
	      }); 
		//전시할상품 리스트 열기
		$("#allpdisplay").click(function() {
			if($("#allpdisplaybox").css("display")==="none"){
				$("#allpdisplaybox").css("display","block");
			}else {
				$("#allpdisplaybox").css("display","none");
			}
		});
		//전시할 상품 갯수 바꾸기
		$("#apd50").click(function() {
			$("#allpdisplay").text($(this).text());
			$("#allpdisplaybox").css("display","none");
		});
		$("#apd60").click(function() {
			$("#allpdisplay").text($(this).text());
			$("#allpdisplaybox").css("display","none");
		});
		$("#apd70").click(function() {
			$("#allpdisplay").text($(this).text());
			$("#allpdisplaybox").css("display","none");
		});
		$("#apd80").click(function() {
			$("#allpdisplay").text($(this).text());
			$("#allpdisplaybox").css("display","none");
		});
		//정렬하기
		$(".pd_sel_lb").click(function() {
			if($('this > .pd_sels_span').text()==="최신등록순"){
			}
		});
		
		 $('.pd_sel_lb').click(function() {
			    var selectedColor = $('#pd:checked').val();
			    var currentUrl = window.location.href;
			    
			    // 파라미터 변경
			    var updatedUrl = updateQueryStringParameter(currentUrl, 'color', selectedColor);
			    
			    // 변경된 URL로 리다이렉트
			    window.location.href = updatedUrl;
			  });
	});
	
	</script>
	<style>
		.topcolor {
			background-color : <%=dto.getColor_theme()%>;
		}
		
	</style>
</head>
<body>
	<div id="header">
		<div class="fl left_header">
			<a href="https://www.naver.com/" class="naverlogo"></a>
			<a href="https://sell.smartstore.naver.com/d/v2/home" class="storelogo">스마트스토어 관리</a>
		</div>
		<div class="fr right_header">
			<button class="out_btn" type="button">나가기</button>
			<button class="apply_btn" type="button">전체 적용하기</button>
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
								<div class="component_txtbtn" role="button" aria-checked="false">
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
										<button type="button" class="color_black color" aria-checked="true" name="colorType" value="black">
											<span class="blind">black</span>
										</button>
										<button type="button" class="color_gray color" aria-checked="false" name="colorType" value="gray">
											<span class="blind">gray</span>
										</button>
										<button type="button" class="color_blue color" aria-checked="false" name="colorType" value="blue">
											<span class="blind">blue</span>
										</button>
										<button type="button" class="color_brown color" aria-checked="false" name="colorType" value="brown">
											<span class="blind">brown</span>
										</button>
										<button type="button" class="color_green color" aria-checked="false" name="colorType" value="green">
											<span class="blind">green</span>
										</button>
										<button type="button" class="color_cyan color" aria-checked="false" name="colorType" value="cyan">
											<span class="blind">cyan</span>
										</button>
										<button type="button" class="color_pink color" aria-checked="false" name="colorType" value="pink">
											<span class="blind">pink</span>
										</button>
										<button type="button" class="color_hotpink color" aria-checked="false" name="colorType" value="hotpink">
											<span class="blind">hotpink</span>
										</button>
										<button type="button" class="color_orangered color" aria-checked="false" name="colorType" value="orangered">
											<span class="blind">orangered</span>
										</button>
										<button type="button" class="color_red color" aria-checked="false" name="colorType" value="red">
											<span class="blind">red</span>
										</button>
										<button type="button" class="color_violet color" aria-checked="false" name="colorType" value="violet">
											<span class="blind">violet</span>
										</button>
										<button type="button" class="color_yellow color" aria-checked="false" name="colorType" value="yellow">
											<span class="blind">yellow</span>
										</button>
										<button type="button" class="color_orange color" aria-checked="false" name="colorType" value="orange">
											<span class="blind">orange</span>
										</button>
										<button type="button" class="color_ivory color" aria-checked="false" name="colorType" value="ivory">
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
		<div class="freest fl freest37"  style="height: 900px; width: 830px;">
		<div class="freest1 ">
			<div class="freest2">
				<strong class="freefont">전체상품 관리</strong>
			</div>
			<div class="freest3">
				<div class="custom_product_list_form">
					<div class="title">
						<div class="freest4">
							<strong class="freest5">제목</strong>
						</div>
						<div class="input_style">
							<input name="title" type="text" class="input_style1 fl"
								placeholder="제목을 입력해주세요." maxlength="15" value="전체상품">
							<div class="fl charcount">
								<span class="freefont1">4</span><span class="freefont2">15</span>
							</div>
						</div>
					</div>
					<div class="custom_product_list_area">
						<div class="freest15"></div>
						<div class="custom_project2">
							<div class="freest16">
								<strong class="freest17">썸네일 타입</strong>
							</div>
							<ul class="freest8">
								<li class="freest18"><div class="freest19 custom1"
										data-value="SQUARE">
										<input id="customProductWidget-thumbnail-type-SQUARE"
											class="O1gTqVQj7O blind" type="radio"
											name="thumbnailShapeType" value="SQUARE" checked><label
											class="freest20"
											for="customProductWidget-thumbnail-type-SQUARE"><span
											class="freest21"></span><span class="freest22">정사각형</span><span
											class="freest23"></span></label>
									</div></li>
								<li class="freest18 freest24"><div class="freest19 custom2"
										data-value="V_RECT">
										<input id="customProductWidget-thumbnail-type-V_RECT"
											class="O1gTqVQj7O blind" type="radio"
											name="thumbnailShapeType" value="V_RECT"><label
											class="freest20"
											for="customProductWidget-thumbnail-type-V_RECT"><span
											class="freest21"></span><span class="freest22">세로직사각형</span><span
											class="freest23"></span></label>
									</div></li>
								<li class="freest18 freest24"><div class="freest19 custom3"
										data-value="H_RECT">
										<input id="customProductWidget-thumbnail-type-H_RECT"
											class="O1gTqVQj7O blind" type="radio"
											name="thumbnailShapeType" value="H_RECT"><label
											class="freest20"
											for="customProductWidget-thumbnail-type-H_RECT"><span
											class="freest21"></span><span class="freest22">가로직사각형</span><span
											class="freest23"></span></label>
									</div></li>
							</ul>
			<div style="margin-top : 30px;" >
			<div style="margin-bottom : 10px;">
				<strong class="pd_select_sd">상품 선정기준</strong>
			</div>
			<ul class="pd_select_ul">
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip1"class="blind pd_sel_input" type="radio" name="sortType" checked>
						<label class="pd_sel_lb" for="pd_sel_ip1">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">인기도순</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip2"class="blind pd_sel_input" type="radio" name="sortType">
						<label class="pd_sel_lb" for="pd_sel_ip2">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">최신등록순</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip3"class="blind pd_sel_input" type="radio" name="sortType">
						<label class="pd_sel_lb" for="pd_sel_ip3">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">낮은 가격순</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip4"class="blind pd_sel_input" type="radio" name="sortType">
						<label class="pd_sel_lb" for="pd_sel_ip4">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">높은 가격순</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip5"class="blind pd_sel_input" type="radio" name="sortType">
						<label class="pd_sel_lb" for="pd_sel_ip5">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">할인율순</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip6"class="blind pd_sel_input" type="radio" name="sortType">
						<label class="pd_sel_lb" for="pd_sel_ip6">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">누적 판매순</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip7"class="blind pd_sel_input" type="radio" name="sortType">
						<label class="pd_sel_lb" for="pd_sel_ip7">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">리뷰 많은순</span>
						</label>
					</div>
				</li>
				<li class="pd_select_li">
					<div style="position:relative;">
						<input id="pd_sel_ip8"class="blind pd_sel_input" type="radio" name="sortType">
						<label class="pd_sel_lb" for="pd_sel_ip8">
							<span class="pd_sel_span"></span>
							<span class="pd_sels_span">평점 높은순</span>
						</label>
					</div>
				</li>
			</ul>
		</div>
						</div>
						<div class="freest25"></div>
						<div class="custom_project3">
							<div class="freest26">
								<div class="freest4">
									<strong class="freest27">전시할 상품</strong>
								</div>
							</div>
							<div class="freest28">
								<div class="freest4">
									<a href="#" id="allpdisplay" class="freest29" aria-owns="props_select_box"
										aria-expanded="false" aria-haspopup="listbox" role="button">50</a>
									<ul id="allpdisplaybox"
										class="freest30" role="listbox">
										<li id="apd50" role="presentation"><a href="#" class="freest31"
											role="option" aria-selected="false">50</a></li>
										<li id="apd60" role="presentation"><a href="#" class="freest31"
											role="option" aria-selected="false">60</a></li>
										<li id="apd70" role="presentation"><a href="#" class="freest31"
											role="option" aria-selected="false">70</a></li>
										<li id="apd80" role="presentation"><a href="#" class="freest31"
											role="option" aria-selected="false">80</a></li>
										
									</ul>
								</div>
							</div>
						</div>
						<div class="product_button" style="margin-top: 13px;">
							<p class="detail_style " style="margin-bottom: 10px;">인기도순으로 최대 50개 상품을 자동선정하여 정렬합니다.</p>
							<div class="display17">
								<table class="display16">
									<caption>
										<span class="blind">전시 상품</span>
									</caption>
									<thead class="display18">
										<tr>
											<th class="display19" scope="col"><div class="display20">
													<input type="checkbox" id="check_all"
														class="display21_1 blind" checked> <label
														for="check_all" class="display21"><span
														class="blind">전체 선택</span></label>
												</div></th>
											<th class="display19" scope="col"><div class="display22">
													전시<br>순서
												</div></th>
											<th class="display19" scope="col"><div class="display23">상품번호
													/ 상품명 / 카테고리</div></th>
											<th class="display19" scope="col"><div class="display24">주문수</div></th>
											<th class="display19" scope="col"><div class="display24">유입수</div></th>
											<th class="display19" scope="col"><div class="display24">구매율</div></th>
											<th class="display19" scope="col"><div class="display24">찜수</div></th>
											<th class="display19" scope="col"><div class="display25">판매가</div></th>
											<th class="display19" scope="col"><div class="display25">할인가</div></th>
											<th class="display19" scope="col"><div class="display26">전시상태</div></th>
										</tr>
									</thead>
									<% int cnt=1; %>
									<tbody class="display27">
										<%int cnt2=0; %>
							<%for(AllProductDto allPdto : dto2) { %>
										<tr class="_3Xmg5ZrngK" draggable="true" style="opacity: 1;">
											<td class="display28"><div class="display29">
													<input type="checkbox" id="check_4897832395"
														class="display29_1 blind" checked><label
														for="check_4897832395" class="display30"><span
														class="blind">상품 선택</span></label>
												</div></td>
											<td class="display28"><div class="display31">
													<%= cnt2++ %>
												</div></td>
											<td class="display28"><div class="display33">
													<div class="display34"
														style="background-image: url(&quot;https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f80_80&quot;);"></div>
													<div class="display35">
														<a class="display36" target="_blank"
															href="https://smartstore.naver.com/customerfordaily/products/4897832395">[<%=allPdto.getPnumber() %>]
															<%=allPdto.getPname()%></a><span class="display37"><%=allPdto.getLarge()%>&gt;<%=allPdto.getMiddle() %>&gt;<%=allPdto.getSub() %>&gt;<%=allPdto.getSmall()%></span>
													</div>
													<a class="display38" target="_blank"
														href="https://sell.smartstore.naver.com/#/products/edit/4882283804">수정</a>
												</div></td>
											<td class="display28"><div class="display40 display39"><%=allPdto.getCount()%></div></td>
											<td class="display28"><div class="display40 display39"><%=allPdto.getHitcount()%></div></td>
											<td class="display28"><div class="display40 display39">0</div></td>
											<td class="display28"><div class="display40 display39"><%=allPdto.getLike_count()%></div></td>
											<td class="display28"><div class="display41"><%=allPdto.getPrice()%></div></td>
											<td class="display28"><div class="display41">할인없음</div></td>
											<td class="display28"><div class="display42">
													<%=allPdto.getDisplay_status()%><em></em>
												</div></td>
										</tr>
										<%
											} 
										%>
										<%-- <% while(rs.next()) { //다음 row가 있으면 손가락 이동, true 리턴.%>
										<tr class="_3Xmg5ZrngK" draggable="true" style="opacity: 1;">
											<td class="display28"><div class="display29">
													<input type="checkbox" id="check_4897832395"
														class="display29_1 blind" checked><label
														for="check_4897832395" class="display30"><span
														class="blind">상품 선택</span></label>
												</div></td>
											<td class="display28"><div class="display31">
													<%= cnt++ %>
												</div></td>
											<td class="display28"><div class="display33">
													<div class="display34"
														style="background-image: url(&quot;https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f80_80&quot;);"></div>
													<div class="display35">
														<a class="display36" target="_blank"
															href="https://smartstore.naver.com/customerfordaily/products/4897832395">[<%=rs.getLong("pnumber") %>]
															<%=rs.getString("pname") %></a><span class="display37"><%=rs.getString("large") %>&gt;<%=rs.getString("middle") %>&gt;<%=rs.getString("sub") %>&gt;<%=rs.getString("small") %></span>
													</div>
													<a class="display38" target="_blank"
														href="https://sell.smartstore.naver.com/#/products/edit/4882283804">수정</a>
												</div></td>
											<td class="display28"><div class="display40 display39"><%=rs.getInt("count(po.pnumber)") %></div></td>
											<td class="display28"><div class="display40 display39"><%=rs.getInt("hitcount") %></div></td>
											<td class="display28"><div class="display40 display39">0</div></td>
											<td class="display28"><div class="display40 display39"><%=rs.getInt("like_count") %></div></td>
											<td class="display28"><div class="display41"><%=rs.getInt("price") %></div></td>
											<td class="display28"><div class="display41">할인없음</div></td>
											<td class="display28"><div class="display42">
													<%=rs.getString("display_status") %><em></em>
												</div></td>
										</tr>
										<%
											} 
										%> --%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="fl theme_display">
	<div class="smallss">
		<div class="pc">
				<div id="headert" class="topcolor firsttop">
		<div class="topmargin topcolor">
			<div class="fl">
				<a class="naverlogo2"></a>
				<a class="navershopinglogo"></a>
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
					<span class="introduce">안녕하세요 은하수의 데일리마켓입니다☆</span>
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
							<a>
								<span class="storemainname">CustomerDaily</span>
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
							<li>
								<a class="listtype">스포츠/레저
								</a>
							</li>
							<li>
								<a class="listtype">가구/인테리어
								</a>
							</li>
							<li>
								<a class="listtype">전체상품
								</a>
							</li>
						</ul>
						<ul class="ulstype2">
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
				<div class="promotion">
					<ul class="promotionlist">
					 	<li class="promotionimg">
					 		<div class="promotiontext">
					 			<div class="promotiontext1">
					 				<div class="promotiontext2">
					 					<strong class="pmtext">프로모션 준비중입니다</strong>
					 				</div>
					 			</div>
					 		</div>
					 	</li>
					</ul>
				</div>
				<div class="pcontent">
					<div class="newpcontent">
						<strong class="newpname">신상품</strong>
						<ul class="newpul">
							<li class="newpli">
								<a class="newpimg">
									<span class="newpimgbox">
										<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20230418_111/1681799580486YXXTK_JPEG/31283187665536431_1220162550.jpg?type=f400_324">
									</span>
									<span class="newpnamebox">
										<strong class="newp1name">폼폼푸린 손목쿠션</strong>
									</span>
									<span class="newpricebox">
										<strong class="newp1price">400,000
											<span class="wonkorea">원</span>
										</strong>
									</span>
								</a>
							</li>
							<li class="newpli">
								<a class="newpimg">
									<span class="newpimgbox">
										<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f400_324">
									</span>
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
									<span class="newpimgbox">
										<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f400_324">
									</span>
									<span class="newpnamebox">
										<strong class="newp1name">요가매트</strong>
									</span>
									<span class="newpricebox">
										<strong class="newp1price">29,900
											<span class="wonkorea">원</span>
										</strong>
									</span>
								</a>
							</li>
							
						</ul>
					</div>
				</div>
				<div class="pcontent">
					<div class="newpcontent">
						<strong class="newpname">자유상품</strong>
						<ul class="newpul">
							<li class="newpli">
								<a class="newpimg">
									<span class="newpimgbox">
										<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20230418_111/1681799580486YXXTK_JPEG/31283187665536431_1220162550.jpg?type=f400_324">
									</span>
									<span class="newpnamebox">
										<strong class="newp1name">폼폼푸린 손목쿠션</strong>
									</span>
									<span class="newpricebox">
										<strong class="newp1price">400,000
											<span class="wonkorea">원</span>
										</strong>
									</span>
								</a>
							</li>
							<li class="newpli">
								<a class="newpimg">
									<span class="newpimgbox">
										<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f400_324">
									</span>
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
									<span class="newpimgbox">
										<img class="newpimgdetail"src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f400_324">
									</span>
									<span class="newpnamebox">
										<strong class="newp1name">요가매트</strong>
									</span>
									<span class="newpricebox">
										<strong class="newp1price">29,900
											<span class="wonkorea">원</span>
										</strong>
									</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="pcontent">
					<div class="newpcontent">
						<div class="fl">
							<strong class="newpname">전체상품</strong>
						</div>
						<div class="fr">
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
						</div>
						<div style="clear:both;"></div>					
						<div>
						<ul class="allpul">
							<li class="allpli">
								<a class="allpimg">
									<span class="allpimgbox">
										<img class="allpimgdetail"src="https://shop-phinf.pstatic.net/20230418_111/1681799580486YXXTK_JPEG/31283187665536431_1220162550.jpg?type=f400_324">
									</span>
									<span class="allpnamebox">
										<strong class="allp1name">폼폼푸린 손목쿠션</strong>
									</span>
									<span class="allpricebox">
										<strong class="allp1price">400,000원
										</strong>
									</span>
								</a>
								<button type="button" class="likey"></button>
							</li>
							<li class="allpli">
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
							</li>
						</ul>
						</div>
					</div>
				</div>
				<div class="last" style="width:1020px;">
					<div class="lastfooter">
						<div class="footer1">
							<p class="fanounce">반품 배송비, 반품 배송주소 등은 해당 상품 페이지 내 안내를 참고해주세요.</p>
							<div class="footer11">
								<div class="sellername fl">정지윤</div>
								<div class="sellernumber2 fl">
									010-5920-5226
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
		<div style="clear:both;"></div>
	</div>
		</div>
	</div>
	</div>
	<div style="clear:both;"></div>
</body>
</html>
