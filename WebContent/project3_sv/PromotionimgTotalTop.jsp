<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로모션 이미지 관리</title>
<link rel="stylesheet" href="../css/PromotioniImg.css" />
<link rel="stylesheet" href="../css/smartstoresidebar.css" />
<link rel="stylesheet" href="../css/SmallCustomerDailyTop.css" />
<script src="../js/jquery-3.7.0.min.js"></script>
<script>
	$(function() {
		$(".design_list").click(function() {
			$(this).find("input[type='radio']").prop('checked', true);
		});
		/*  이미지 삽입 구간*/
		$(document).on("click", ".piimgst7", function() {
			$(".background").css('display', 'block');
		});
		$(document).on("click", ".popupbt", function() {
			$(".background").css('display', 'none');
		});

		$(".common").click(function() {
			$(this).attr("class", "common backcolor2");
			$(".component").attr("class", "component backcolor1");
			$(".common_margin").css("display", "block");
			$(".component_margin").css("display", "none");
		});
		$(".component").click(function() {
			$(this).attr("class", "component backcolor2");
			$(".common").attr("class", "common backcolor1");
			$(".component_margin").css("display", "block");
			$(".common_margin").css("display", "none");
		});
		$(".color").click(function() {
			$(".color[aria-checked=true]").attr("aria-checked", "false");
			$(this).attr("aria-checked", "true")
		});
		$(".component_txtbtn").click(
				function() {
					$(".component_txtbtn[aria-checked=true]").attr(
							"aria-checked", "false");
					$(this).attr("aria-checked", "true")
					$(".component_txtbtn[aria-check=true]").attr(
							$(".component_list_box").attr("aria-checked",
									"false"));
				});
		$(".component_list_box").click(
				function() {
					$(".component_list_box[aria-checked=true]").attr(
							"aria-checked", "false");
					$(this).attr("aria-checked", "true")
					$(".component_list_box[aria-check=true]").attr(
							$(".component_txtbtn")
									.attr("aria-checked", "false"));
				});

		$(document).on("click", ".pist6", function() {
			let piimgst24 = $(this).next('.piimgst24');
			if (piimgst24.css('display') === 'none') {
				piimgst24.css('display', 'block');
			} else if (piimgst24.css('display') === 'block') {
				piimgst24.css('display', 'none');
			}
		});
		
		$(".piimgst21").each(function() {
    	    $(this).keyup(function(e) {
    	        let content = $(this).val();
    	        $(this).siblings(".charcount").html('<div class="piimgst22 charcount"><span class="piimgst23">'+content.length+'</span>/30</div>');
    	        if (content.length > 30) {
    	            alert("최대 30자까지 입력 가능합니다.");
    	            $(this).val(content.substring(0,30));
    	            $(this).siblings(".charcount").html('<div class="piimgst22 charcount"><span class="piimgst23">'+content.length+'</span>/30</div>');
    	        }
    	    });
    	});

		$(document).on("click", ".pist11", function() {
			$(this).parent().parent().remove();
		});

		$(document).on("click", ".pist11", function() {
			$(this).parents('.pist3').find('.pist6, .piimgst24').remove();
		});

		$(document).on("click", ".pist6", function() {
			$(this).toggleClass("rotate");
		});

		let namest = 6;
	    let greenbt = 90;
	    let bt = 4;
		$(".pisbt").click(function() {
		    
		    namest = namest + 100;
		    greenbt = greenbt + 300;
		    bt = bt + 5;
		    
		    let addbt = $(".pist6").length + 2;
		    
		    let asd = '<div class="piimgst_only">' +
		        '<div id="pist6_1" class="pist6">' +
		        '<div class="pist7">' +
		        '<div class="pist8" style="background-image: url(https://shop-phinf.pstatic.net/20230404_12/16805891579145KtrD_JPEG/https___kr.hypebeast.com_files_2021_12_makoto-shinkai-new-anime-movie-suzume-no-.jpg?type=f80_80);"></div>' +
		        '</div>' +
		        '<div class="pist9">' +
		        '<strong class="pist10">프로모션 준비중입니다</strong>' +
		        '</div>' +
		        '<button class="pist11" type="button">' +
		        '<span class="blind">삭제</span>' +
		        '</button>' +
		        '<div class="pist12">' +
		        '<div class="pist13">' +
		        '<input id="' + addbt + '" class="blind" type="checkbox" checked><label class="piimg" for="' + addbt + '"></label>' +
		        '</div>' +
		        '</div>' +
		        '<a class="pist14" role="button"><span class="blind">상품' +
		        '클릭</span></a>' +
		        '</div>' +
		        '<div class="piimgst piimgst24" style="height: 444px; display: none;">' +
		        '<div class="piimgst1">' +
		        '<div>' +
		        '<div class="piimgst2">' +
		        '<strong class="piimgst3">PC 이미지</strong>' +
		        '<button type="button" class="piimgst4" style="height: 120px;"></button>' +
		        '<p class="piimgst5">' +
		        '권장 사이즈 (1920x400)<br>최대 2,000KB, 확장자 jpg, jpeg, png 가능' +
		        '</p>' +
		        '<div class="piimgst6">' + 
		        '<p><input type="file" name="photo_video" class=file_upload></p>' +
		        '</div>' +
		        '</div>' +
		        '</div>' +
		        '</div>' +
		        '<div class="piimgst8"></div>' +
		        '<div class="piimgst2">' +
		        '<strong class="piimgst9">제목</strong>' +
		        '</div>' +
		        '<div class="piimgst19 piimgst20" style="margin-top: 3px;">' +
		        '<textarea name="title" placeholder="Enter로 줄바꿈 처리, 최대 3줄 가능"' +
		        'class="piimgst21" maxlength="30" style="height: 23px;">제목을 입력하세요.</textarea>' +
		        '<div class="piimgst22 charcount">' +
		        '<span class="piimgst23">10</span>/30' +
		        '</div>' +
		        '</div><button id="' + bt + '" type="button" class="complete" style = "background: white; border: 1px solid #e3dede; margin-top: 6px;">등록완료</button>'+
		        '</div>' + '</div>';

		    $(".pist5").append(asd);

		    $(".piimgst21").each(function() {
		        $(this).off("keyup").on("keyup", function(e) {
		            let content = $(this).val();
		            $(this).siblings(".charcount").html('<div class="piimgst22 charcount"><span class="piimgst23">' + content.length + '</span>/30</div>');
		            if (content.length > 30) {
		                alert("최대 30자까지 입력 가능합니다.");
		                $(this).val(content.substring(0, 30));
		                $(this).siblings(".charcount").html('<div class="piimgst22 charcount"><span class="piimgst23">' + content.length + '</span>/30</div>');
		            }
		        });
		    });
		});
		$(".common").click(function() {
			$(this).attr("class", "common backcolor2");
			$(".component").attr("class", "component backcolor1");
			$(".common_margin").css("display", "block");
			$(".component_margin").css("display", "none");
		});
		$(".component").click(function() {
			$(this).attr("class", "component backcolor2");
			$(".common").attr("class", "common backcolor1");
			$(".component_margin").css("display", "block");
			$(".common_margin").css("display", "none");
		});
		$(".color").click(function() {
			$(".color[aria-checked=true]").attr("aria-checked", "false");
			$(this).attr("aria-checked", "true")
		});
		$(".component_txtbtn").click(function() {
					$(".component_txtbtn[aria-checked=true]").attr(
							"aria-checked", "false");
					$(this).attr("aria-checked", "true")
					$(".component_txtbtn[aria-check=true]").attr(
							$(".component_list_box").attr("aria-checked",
									"false"));
				});
		$(".component_list_box").click(function() {
					$(".component_list_box[aria-checked=true]").attr(
							"aria-checked", "false");
					$(this).attr("aria-checked", "true")
					$(".component_list_box[aria-check=true]").attr(
							$(".component_txtbtn")
									.attr("aria-checked", "false"));
				});

	});
</script>
</head>
<body>
	<div id="header">
		<div class="fl left_header">
			<a href="https://www.naver.com/" class="naverlogo"></a> <a
				href="https://sell.smartstore.naver.com/d/v2/home" class="storelogo">스마트스토어
				관리</a>
		</div>
		<div class="fr right_header">
			<button class="out_btn" type="button">나가기</button>
			<button class="apply_btn" type="button">전체 적용하기</button>
		</div>
		<div style="clear: both;"></div>
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
						<button type="button" class="common" name="common">
							공통 관리 <span class="blind">선택됨</span>
						</button>
						<button type="button" class="component" name="component">컴포넌트
							관리</button>
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
								<div class=component_txt>프로모셔 이미지</div>
							</div>
							<div class="component_txtbtn" role="button" aria-checked="false">
								<div class=component_txt>스토어 및 셀러 정보</div>
							</div>
							<div class="component_txtbtn" role="button" aria-checked="false">
								<div class=component_txt>고객혜택 배너</div>
							</div>

							<div class="component_list_box" role="button"
								aria-checked="false">
								<div class="component_listtxt">베스트 상품</div>
								<div class="check_box">
									<div class="list_slide">
										<input id="bestp" class="blind" type="checkbox" checked /> <label
											for="bestp" class="check_label"></label>
									</div>
								</div>
							</div>
							<div class="component_list_box" role="button"
								aria-checked="false">
								<div class="component_listtxt">신상품</div>
								<div class="check_box">
									<div class="list_slide">
										<input id="new_p" class="blind" type="checkbox" checked /> <label
											for="new_p" class="check_label"></label>
									</div>
								</div>
							</div>
							<div class="component_list_box" role="button"
								aria-checked="false">
								<div class="component_listtxt">베스트리뷰 상품</div>
								<div class="check_box">
									<div class="list_slide">
										<input id="bestreview" class="blind" type="checkbox" checked />
										<label for="bestreview" class="check_label"></label>
									</div>
								</div>
							</div>
							<div class="component_list_box" role="button"
								aria-checked="false">
								<div class="component_listtxt">자유상품</div>
								<div class="check_box">
									<div class="list_slide">
										<input id="freep" class="blind" type="checkbox" checked /> <label
											for="freep" class="check_label"></label>
									</div>
								</div>
							</div>
							<div class="component_list_box" role="button"
								aria-checked="false">
								<div class="component_listtxt">전체상품</div>
								<div class="check_box">
									<div class="list_slide">
										<input id="allp" class="blind" type="checkbox" checked /> <label
											for="allp" class="check_label"></label>
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
								<button type="button" class="color color_black"
									aria-checked="true" name="colorType" value="black">
									<span class="blind">black</span>
								</button>
								<button type="button" class="color color_gray"
									aria-checked="false" name="colorType" value="gray">
									<span class="blind">gray</span>
								</button>
								<button type="button" class="color color_blue"
									aria-checked="false" name="colorType" value="blue">
									<span class="blind">blue</span>
								</button>
								<button type="button" class="color color_brown"
									aria-checked="false" name="colorType" value="brown">
									<span class="blind">brown</span>
								</button>
								<button type="button" class="color color_green"
									aria-checked="false" name="colorType" value="green">
									<span class="blind">green</span>
								</button>
								<button type="button" class="color color_cyan"
									aria-checked="false" name="colorType" value="cyan">
									<span class="blind">cyan</span>
								</button>
								<button type="button" class="color color_pink"
									aria-checked="false" name="colorType" value="pink">
									<span class="blind">pink</span>
								</button>
								<button type="button" class="color color_hotpink"
									aria-checked="false" name="colorType" value="hotpink">
									<span class="blind">hotpink</span>
								</button>
								<button type="button" class="color color_orangered"
									aria-checked="false" name="colorType" value="orangered">
									<span class="blind">orangered</span>
								</button>
								<button type="button" class="color color_red"
									aria-checked="false" name="colorType" value="red">
									<span class="blind">red</span>
								</button>
								<button type="button" class="color color_violet"
									aria-checked="false" name="colorType" value="violet">
									<span class="blind">violet</span>
								</button>
								<button type="button" class="color color_yellow"
									aria-checked="false" name="colorType" value="yellow">
									<span class="blind">yellow</span>
								</button>
								<button type="button" class="color color_orange"
									aria-checked="false" name="colorType" value="orange">
									<span class="blind">orange</span>
								</button>
								<button type="button" class="color color_ivory"
									aria-checked="false" name="colorType" value="ivory">
									<span class="blind">ivory</span>
								</button>
							</div>
						</div>
						<div class="gnb_position">
							<strong class="position_txt">PC GNB 위치</strong>
							<div class="position_btn">
								<div class="radio_position">
									<div class="radio_box">
										<input type="radio" id="top_radio"
											class="cilck_position blind" name="checkedType" value="top" />
										<label for="top_radio" class="for_top"> <span
											class="top_icon"></span> <span class="radio_txt">상단형</span> <span
											class="radio_btn"></span>
										</label>
									</div>
								</div>
								<div class="radio_position">
									<div class="radio_box">
										<input type="radio" id="left_radio"
											class="cilck_position blind" name="checkedType" value="left" />
										<label for="left_radio" class="for_top"> <span
											class="top_icon"></span> <span class="radio_txt">좌측형</span> <span
											class="radio_btn"></span>
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




	<div class="background" style="display: none;">
		<div class="window">
			<div class="popup popup1">
				<div class="popup2">
					<strong class="popupfont1">이미지 편집 및 적용 스토어 로고 PC</strong>
					<button type="button" class="popupbt">
						<span class="blind">닫기</span>
					</button>
				</div>
				<div class="popup3">
					<div class="popup4">
						<div class="popup5">
							<div class="popup6">
								<p class="popup7">이미지를 등록하세요.</p>
							</div>
						</div>
						<div class="popup8">
							<div>
								<div class="popup9">
									<form>
										<label for="fileUpload" class="popup10">이미지찾기</label> 
										<input id="fileUpload" class="blind" type="file" accept="image/*">
									</form>
								</div>
							</div>
							<ul class="mg1">
								<li class="footerli">권장 사이즈 <span class="footerli1">(30
										~ 660) x (30 ~ 30)</span></li>
								<li class="footerli">파일용량 <span class="footerli1">2,000KB</span>초과불가
								</li>
								<li class="footerli">확장자 jpg, jpeg, png가능</li>
								</br>
								<li class="footerli">좌/우 여백없는 크롭된 이미지 권장</li>
							</ul>
							<div class="footerdi">
								<button class="footbut footbut1" type="button">적용하기</button>
								<button class="footbut1" type="button">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="fl"
		style="position: relative; overflow: hidden; width: 829px; height: 896px;">
		<div
			style="position: absolute; inset: 0px; overflow: scroll; margin-right: -17px; margin-bottom: -17px;">
			<div class="pist">
				<strong class="pist1">프로모션 이미지 관리</strong>
				<button class="pist2" type="button">
					<span class="blind">닫기</span>
				</button>
			</div>
			<div class="pist3">
				<div>
					<div class="pist4">
						<strong>이미지 관리</strong>
					</div>
					<p class="pistfont" style="margin-top: 16px;">
						프로모션 이미지는 최대 10장까지 등록할 수 있습니다.</br>Drag&amp;Drop 으로 노출순서를 설정할 수 있습니다.
					</p>
					<div class="mg1"></div>
					<div style="margin-top: 24px;">
						<div>
							<div class="pist5">

								<div class="pist6">
									<div class="pist7">
										<div class="pist8"
											style="background-image: url(https://shop-phinf.pstatic.net/20230404_12/16805891579145KtrD_JPEG/https___kr.hypebeast.com_files_2021_12_makoto-shinkai-new-anime-movie-suzume-no-.jpg?type=f80_80);"></div>
									</div>
									<div class="pist9">
										<strong class="pist10">프로모션 준비중입니다</strong>
									</div>
									<button class="pist11" type="button">
										<span class="blind">삭제</span>
									</button>
									<div class="pist12">
										<div class="pist13">
											<input id="2" class="blind" type="checkbox" checked><label
												class="piimg" for="2"></label>
										</div>
									</div>
									<a class="pist14" role="button"><span class="blind">상품
											클릭</span></a>
								</div>
								<form action="PromotionimgTotalLeftInsertAction.jsp" method="post" enctype="multipart/form-data">
								<div class="piimgst piimgst24 piimgst24_1" style="height: 444px;">
									<div class="piimgst1">
										<div>
											<div class="piimgst2">
												<div class="piimgst6">
													<p><input type="file" name="photo_video" class=file_upload></p>
												</div>
											</div>
										</div>
									</div>
									<div class="piimgst8"></div>
									<div class="piimgst2">
										<strong class="piimgst9">제목</strong>
									</div>
									<div class="piimgst19 piimgst20" style="margin-top: 3px;">
											<textarea name="title" placeholder="Enter로 줄바꿈 처리, 최대 3줄 가능"
												class="piimgst21" maxlength="30" style="height: 23px;">제목을 입력하세요.</textarea>
											<div class="piimgst22 charcount">
												<span class="piimgst23">10</span>/30
											</div>
									</div>
									<button id="1" type="submit" class="complete" style = "background: white; border: 1px solid #e3dede; margin-top: 6px;">등록완료</button>
								</div>
								</form>
							</div>
						</div>
					</div>
					<button class="pisbt" type="button" style="margin-top: 24px;">이미지
						추가</button>
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
							<a class="naverlogo2" href="https://www.naver.com"></a> <a
								class="navershopinglogo" href="https://shopping.naver.com/home"></a>
						</div>
						<div class="fr">
							<a class="likestore">관심스토어</a> <a class="mypage">마이페이지</a> <a
								class="basket">장바구니</a> <a class="nickname">긍정부자</a> <a
								class="listcube"></a>
						</div>
						<div style="clear: both;"></div>
					</div>
					<div class="topmargin topcolor secondtop">
						<div class="fl">
							<a class="myself"> <img src="img/profile.jpg" class="profile" />
								<span class="introduce">안녕하세요 은하수의 데일리마켓입니다☆</span>
							</a> <span class="likecustomer">관심고객수 1</span>
							<button type="button" class="que"></button>
						</div>
						<div class="fr searchbar">
							<div class="searchinsert">
								<input type=text class="search1" placeholder="검색어를 입력해보세요" />
								<button type="button" class="searchbtn">
									<span class="serchdetailbtn topcolor"></span>
								</button>
							</div>
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>
				<!-- 컨텐츠 -->
				<div id="container" class="conmargin">
					<div class="subjectbar">
						<div class="storename">
							<div class="alarm fl">
								<div class="alarm2">
									<button type="button" class="topcolor alarm3">
										<span class="bell"></span> <span class="belltext">알림받기</span>
									</button>
								</div>
							</div>
							<div class="fl center">
								<h1 class="storemiddle">
									<a href="https://smartstore.naver.com/customerfordaily"> <span
										class="storemainname">CustomerDaily</span>
									</a>
								</h1>
							</div>
							<div class="fr today">
								<div class="todayandtotal">
									<span>오늘 <em class="visit">1</em>
									</span> <span class="total">전체 <em class="visit">596</em>
									</span>
								</div>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="topmenu">
							<div class="menucontent">
								<ul class="ulstype">
									<li class="listyle"><a class="listtype">스포츠/레저 <span
											class="ardown"></span>
									</a></li>
									<li class="listyle"><a class="listtype">가구/인테리어 <span
											class="ardown"></span>
									</a></li>
									<li class="listyle"><a class="listtype">전체상품 </a></li>
								</ul>
								<ul class="ulstype">
									<li class="listyle2"><a class="submenulist">묻고 답하기</a></li>
									<li class="listyle2"><a class="submenulist">공지사항</a></li>
									<li class="listyle2"><a class="submenulist">리뷰이벤트</a></li>
									<li class="listyle2"><a class="submenulist">쇼핑스토리</a></li>
									<li class="listyle2"><a class="submenulist">판매자 정보</a></li>
								</ul>
							</div>
						</div>
					</div>
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
								<li class="newpli"><a class="newpimg"> <img
										class="newpimgdetail"
										src="https://shop-phinf.pstatic.net/20230418_111/1681799580486YXXTK_JPEG/31283187665536431_1220162550.jpg?type=f400_324">
										<span class="newpnamebox"> <strong class="newp1name">폼폼푸린
												손목쿠션</strong>
									</span> <span class="newpricebox"> <strong class="newp1price">400,000
												<span class="wonkorea">원</span>
										</strong>
									</span>
								</a></li>
								<li class="newpli"><a class="newpimg"> <img
										class="newpimgdetail"
										src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f400_324">
										<span class="newpnamebox"> <strong class="newp1name">가구
												수평패드</strong>
									</span> <span class="newpricebox"> <strong class="newp1price">25,000
												<span class="wonkorea">원</span>
										</strong>
									</span>
								</a></li>
								<li class="newpli"><a class="newpimg"> <img
										class="newpimgdetail"
										src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f400_324">
										<span class="newpnamebox"> <strong class="newp1name">요가매트</strong>
									</span> <span class="newpricebox"> <strong class="newp1price">29,900
												<span class="wonkorea">원</span>
										</strong>
									</span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="fpcontent">
						<div class="freepcontent">
							<strong class="freepname">자유상품</strong>
							<div class="freepbox">
								<ul class="freepul">
									<li class="freepli"><a class="freeptext"> <span
											class="freepimgbox"> <img class="freepimg"
												src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f640" />
										</span> <strong class="freep1name">가구수평패드</strong> <span
											class="freepricebox"> <strong class="freep1price">25,000
													<span class="wonkorea2">원</span>
											</strong>
										</span>
									</a>
										<div class="tag">
											<a class="hashtag">#가구수평패드</a> <a class="hashtag">#가구높이조절캡</a>
											<a class="hashtag">#흔들림방지</a>
										</div> <a class="pdetaillook">상품상세보기</a></li>
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
											인기도순</button>
									</li>
									<li class="orderbyli" role="presentation">
										<button type="button" class="orderbybtn0" role="tab">
											최신등록순</button>
									</li>
									<li class="orderbyli" role="presentation">
										<button type="button" class="orderbybtn0" role="tab">
											낮은 가격순</button>
									</li>
									<li class="orderbyli" role="presentation">
										<button type="button" class="orderbybtn0" role="tab">
											높은 가격순</button>
									</li>
									<li class="orderbyli" role="presentation">
										<button type="button" class="orderbybtn0" role="tab">
											할인율순</button>
									</li>
									<li class="orderbyli" role="presentation">
										<button type="button" class="orderbybtn0" role="tab">
											누적 판매순</button>
									</li>
									<li class="orderbyli" role="presentation">
										<button type="button" class="orderbybtn0" role="tab">
											리뷰 많은순</button>
									</li>
									<li class="orderbyli" role="presentation">
										<button type="button" class="orderbybtn0" role="tab">
											평점 높은순</button>
									</li>
								</ul>
							</div>
							<ul class="allpul">
								<li class="allpli"><a class="allpimg"> <span
										class="allpimgbox"> <img class="allpimgdetail"
											src="https://shop-phinf.pstatic.net/20230418_111/1681799580486YXXTK_JPEG/31283187665536431_1220162550.jpg?type=f400_324">
									</span> <span class="allpnamebox"> <strong class="allp1name">폼폼푸린
												손목쿠션</strong>
									</span> <span class="allpricebox"> <strong class="allp1price">400,000원
										</strong>
									</span>
								</a>
									<button type="button" class="likey"></button></li>
								<li class="allpli"><a class="allpimg"> <span
										class="allpimgbox"> <img class="allpimgdetail"
											src="https://shop-phinf.pstatic.net/20200418_210/15871866582182zgqf_JPEG/24548991791616982_1239311195.jpg?type=f295_381">
									</span> <span class="allpnamebox"> <strong class="allp1name">가구
												수평패드</strong>
									</span> <span class="allpricebox"> <strong class="allp1price">25,000원
										</strong>
									</span>
								</a>
									<div class="starreview">
										<span class="starreviewcon">평점 5.0</span> <span
											class="starreviewcon">리뷰 1</span>
									</div>
									<button type="button" class="likey"></button></li>
								<li class="allpli"><a class="allpimg"> <span
										class="allpimgbox"> <img class="allpimgdetail"
											src="https://shop-phinf.pstatic.net/20200418_185/1587177491423jftcj_JPEG/24540879945101569_322730714.jpg?type=f295_381">
									</span> <span class="allpnamebox"> <strong class="allp1name">요가매트</strong>
									</span> <span class="allpricebox"> <strong class="allp1price">29,900원
										</strong>
									</span>
								</a>
									<button type="button" class="likey"></button></li>
							</ul>
						</div>
					</div>
					<div class="last">
						<div class="lastfooter">
							<div class="footer1">
								<p class="fanounce">반품 배송비, 반품 배송주소 등은 해당 상품 페이지 내 안내를
									참고해주세요.</p>
								<div class="footer11">
									<div class="sellername fl">정지윤</div>
									<div class="sellernumber2 fl">
										010-5920-5226 <span class="ing">인증</span>
										<button type="button" class="wrongnumber">잘못된 번호 신고</button>
									</div>
									<div class="sellerinfo fl">
										<button type="button" class="sellerinfm">판매자 정보</button>
									</div>
									<div style="clear: both;"></div>
								</div>
							</div>
							<div class="footer2">
								<ul class="ft2_ul">
									<li class="ft2_li"><a
										href="https://policy.naver.com/rules/service.html"
										class="ft2_lia" target="_blank">네이버 약관</a></li>
									<li class="ft2_li"><a
										href="https://new-m.pay.naver.com/member/terms-policy/npay-usage"
										class="ft2_lia" target="_blank">네이버페이 이용약관</a></li>
									<li class="ft2_li"><a
										href="https://new-m.pay.naver.com/member/terms-policy/finance"
										class="ft2_lia" target="_blank">전자금융거래 이용약관</a></li>
									<li class="ft2_li"><a
										href="http://mktg.naver.com/privacy/privacy.html"
										class="ft2_lia" target="_blank"><strong>개인정보처리방침</strong></a></li>
									<li class="ft2_li"><a href="/main/rules/responsibility"
										class="ft2_lia" target="_blank">책임의 한계와 법적고지</a></li>
									<li class="ft2_li"><a
										href="http://www.naver.com/rules/youthpolicy.html"
										class="ft2_lia" target="_blank">청소년보호정책</a></li>
									<li class="ft2_li"><a
										href="https://ips.smartstore.naver.com/owner/intro"
										class="ft2_lia" target="_blank">지식재산권신고센터</a></li>
									<li class="ft2_li"><a
										href="https://ips.smartstore.naver.com/main/rules/safety"
										class="ft2_lia" target="_blank">안전거래 가이드</a></li>
									<li class="ft2_li"><a href="http://help.pay.naver.com"
										class="ft2_lia" target="_blank">쇼핑&amp;페이 고객센터</a></li>
								</ul>
								<div class="ft2_div">
									<div class="fl ft2_div1">
										<strong>네이버㈜</strong>
										<div class="ft2_div1in">
											사업자등록번호 220-81-62517 <span class="ft2_div1inspan"></span>
											통신판매업신고번호 2006-경기성남-0692호<br /> 대표이사 최수연 <span
												class="ft2_div1inspan"></span> 경기도 성남시 분당구 정자일로 95, NAVER
											1784, 13561<br> 전화 1588-3819 <span
												class="ft2_div1inspan"></span>이메일 <a
												href="mailto:helpcustomer@naver.com" class="ft2_div1ina"
												target="_blank">helpcustomer@naver.com</a> <span
												class="ft2_div1inspan"></span> <a
												href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208162517"
												target="_blank" class="ft2_div1ina">사업자등록정보 확인</a><br /> 호스팅
											서비스 제공 : NAVER Cloud
										</div>
									</div>
									<div class="fl ft2_div2">
										<strong>고객센터</strong>
										<div class="ft2_div2in">
											강원도 춘천시 퇴계로 89 강원전문건설회관<br /> 전화 1588-3819 <a href="#"
												class="ft2_div2ina" target="_blank">전화전클릭</a><br /> 결제도용신고
											1588-3816<br /> <a
												href="https://help.pay.naver.com/mail/form.help"
												class="ft2_div1ina" target="_blank"> <strong>1:1문의
													바로가기</strong>
											</a>
										</div>
									</div>
									<div class="fl ft2_div3">
										<strong>전자금융거래 분쟁처리</strong>
										<div class="ft2_div3in">
											전화 1588-3819<br /> <a
												href="https://help.pay.naver.com/mail/form.help"
												class="ft2_div3ina" target="_blank"> <strong>1:1문의
													바로가기</strong>
											</a>
										</div>
									</div>
									<div style="clear: both;"></div>
								</div>
								<p class="ft2_p">
									네이버㈜는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은
									판매자에게 있습니다. <a
										href="https://help.pay.naver.com/faq/alias/cashpay01.help"
										class="ft2_pa">자세히보기</a>
								</p>
								<div class="naverlast">
									<a href="http://www.naver.com/" target="_blank"
										class="naverlasta"> <span class="blind">NAVER</span>
									</a> <em>Copyright ©</em> <a href="http://www.navercorp.com/"
										target="_blank" class="naverlasta1"> <strong>NAVER
											Corp.</strong>
									</a> All Rights Reserved.
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
</body>
</html>