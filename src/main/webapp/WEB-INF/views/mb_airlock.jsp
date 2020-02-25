<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    	<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes">
		<title>KAWHI LEONARD</title>
		<script src="./resources/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="https://contents.vrism.net/assets/src/blender/b4w.min.js"></script>
		<script type="text/javascript" src="https://contents.vrism.net/assets/src/vrism/vrism.viewer.latest.test.js"></script>
		
		<script src="./resources/js/vrAreaDefault.js"></script>
		<link rel="stylesheet" type="text/css" href="./resources/css/default_m.css">
		<!-- <link rel="stylesheet" type="text/css" href="./resources/css/view_shoes_3d_m.css"> -->
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap" rel="stylesheet">
	</head>
	<body>
		<div id="conBg"></div>
		<div class="vr_wrap" ID="vrWrap">
			<div class="vr_area view_template" id="vrArea">
				<style class="view_template_style">
					@font-face {
					    font-family: 'League Gothic';
					    src: url('./resources/font/leaguegothic-regular-webfont.eot');
					    src: url('./resources/font/leaguegothic-regular-webfont.eot?#iefix') format('embedded-opentype'),
					         url('./resources/font/leaguegothic-regular-webfont.woff') format('woff'),
					         url('./resources/font/leaguegothic-regular-webfont.ttf') format('truetype'),
					         url('./resources/font/leaguegothic-regular-webfont.svg#league_gothicregular') format('svg');
					    font-weight: normal;
					    font-style: normal;
					}
					._sticky {
					    position: -webkit-sticky;
					    position: sticky;
					    top: 0;
					}
					._sticky:before,
					._sticky:after {
					    content: '';
					    display: table;
					}
					
					.vr_wrap .vr_area {
						min-height:100vh;
					}
					.vr_wrap .vr_area::after {
						content:"";
						position:fixed;
						display: block;
						left:0;
						top:0px;
						width:100vw;
						height:calc(100vh);
						/* background-image:url('./resources/images/loading_shoes_wt.gif');  */
						background-color: rgb(120,120,120);
						background-image: url('./resources/images/loading_shoes_wt.gif');
						background-size: 120px;
						background-repeat: no-repeat;
						background-position: center;
						mix-blend-mode: screen;
						z-index:9999;
					}
					._mode_start .view_template_contents {
						perspective-origin: center;
						transition : background-color 3s;
					}
					._mode_start._device_desktop .view_template_contents {
						height:calc(100vh + (1800px * 6) + 600px);
						perspective: 300px;
					}
					._mode_start._device_mobile .view_template_contents {
						height:calc(100vh + (800px * 6) + 200px);
						perspective: 130px;
					}
					/* ._mode_start .view_template::before {
						content:"스크롤하여 더 보기";
						display:block;
						visibility: hidden;
						opacity:0;
						transition: opacity,visibility 0.5s;
						position:fixed;
						bottom: calc(70px + constant(safe-area-inset-bottom));
						bottom: calc(70px + env(safe-area-inset-bottom));
						left:50%;
						transform:translateX(-50%);
						font-size: 12px;
						text-align: center;
						color:white;
						width:100px;
						height:50px;
						background-image:url("./resources/images/icon_scroll_info.svg");
						background-repeat: no-repeat;
						background-position: bottom;
						z-index:1;
					} */
					div.vr_wrap._mode_start .vr_area::after {
					    opacity:0;
					    visibility: hidden;
					    transition: all 1.0s;
					}
					body._scroll_vr_top ._mode_start .view_template::before {
						visibility:visible;
						opacity:1;
					}
					body._scroll_vr_top ._mode_start._mode_desc_view .view_template::before {
						visibility:hidden;
						opacity:0;
					}
					
					.view_template_contents>div.con_main {
						height:100vh;
						opacity:0;
					}
					._mode_start .view_template_contents>div.con_main {
						opacity:1;
						transition: opacity 0.5s 0.6s; 
						position: sticky;
					}
					.con_rolling {
						position:absolute;
						left:0;
						perspective-origin: center;
						top:0;
						width:100%;
						height:100vh;
						display:none;
						overflow:hidden
					}
					._device_desktop .con_rolling {
						perspective: 50vw;
					}
					._device_mobile .con_rolling {
						perspective: 120px;
					}
					._mode_start .con_rolling {
						display:block;
					}
					.con_rolling .extra_item {
						pointer-events: none;
						position:absolute;
						left:50%;
					}
					._device_desktop .con_rolling .extra_item {
						transition:all 0.6s;
						transition-timing-function: ease-out;
					}
					._device_mobile .con_rolling .extra_item {
						transition:none;
						transition:opacity 2s;
					}
					._drag_mode .con_rolling .extra_item {
						/* transition:none; */
						opacity:0;
					}
					._device_desktop .con_rolling .extra_item img {
						transform-origin: left top;
						transform: scale(0.5) translate(-50%,-50%);
					}
					._device_mobile .con_rolling .extra_item img {
						transform-origin: left top;
						transform: scale(0.2) translate(-50%,-50%);
					}
					.con_main {
						position: -webkit-sticky;
						position: sticky;
						top:0;
					}
					.con_main .con_main_wrap {
						width:100%;
						height:100vh;
						/* position:relative; */
						position: -webkit-sticky;
						position: sticky;
					}
					.con_main .vrism_item {
						width:100vw;
						height:100vh;
						position:absolute;
						left:50%;
						transform: translateX(-50%);
						top:0;
						z-index: 50;
					}
					.con_main .descrs {
						position:absolute;
						left:0;
						top:0;
						width:100%;
					}
					.con_main .descrs .artcl_item {
						text-align: center;
					}
					/* desktop descriptions */
					._device_mobile .con_main .descrs .artcl_item p.con_category {
						font-size:24px;
						font-weight: normal;
						font-family: 'League Gothic','Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						color:black;
						text-transform: uppercase;
						text-align: justify;
						letter-spacing: 1px;
						margin-bottom:18px;
						white-space: nowrap;
						background-color:transparent;
						border:0 none;
					}
					._device_desktop .con_main .descrs .artcl_item h3.con_headline {
						font-family: 'Noto Sans KR', 'Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						font-size:30px;
						line-height:45px;
						font-weight: bold;
						color: black;
						text-transform: uppercase;
						text-align:center;
						margin-bottom:22px;
						white-space: nowrap;
						background-color:transparent;
						border:0 none;
					}
					._device_mobile .con_main .descrs .artcl_item h4.con_headline {
						font-family: 'Noto Sans KR', 'Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						font-size:32px;
						line-height:37px;
						font-weight: 900;
						color: black;
						letter-spacing: -2px;
						text-align: justify;
						margin: 0;
						white-space: nowrap;
						background-color:transparent;
						border:0 none;
						padding-left: 30px;
					}
					._device_desktop .con_main .descrs .artcl_item p.con_description {
						font-size:12px;
						line-height:24px;
						font-weight: normal;
						font-family: 'futurademregular','Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						color:white;
						text-align:center;
						margin-bottom:25px;
						white-space: nowrap;
						background-color:transparent;
						border:0 none;
					}
					._device_desktop .con_main .descrs .artcl_item p.con_bot {
						font-family: 'Noto Sans KR', 'Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						font-weight: 400;
						font-size: 24px;
						color: black;
						
					}
					._device_desktop .con_main .descrs .artcl_item a.con_linkbtn,
					._device_desktop .con_main .descrs .artcl_item a.con_linkbtn:visited,
					._device_desktop .con_main .descrs .artcl_item a.con_linkbtn:active {
						display: block;
						margin: 0 auto;
						color: white;
						box-sizing: border-box;
						width: 190px;
						height: 35px;
						border: 1px solid rgba(255,255,255,0.6);
						padding-top: 10px;
						letter-spacing: 1px;
						font-size: 10px;
					}
					._device_desktop .con_main .descrs .artcl_item a.con_linkbtn:hover {
						border: 1px solid rgba(255,255,255,1);
					}
					._device_desktop body._mode_buying .con_main .descrs .artcl_item a.con_linkbtn {
						display:none;
					}
					._device_desktop .view_template_contents div.artcl_item {
						transition: all 0.6s;
						opacity: 0;
						visibility: hidden;
						position:absolute;
						width:fit-content;
						z-index: 2;
					}
					._device_desktop .view_template_contents div#artclItem0 {
						/* top: 224px; */
						top: 25vh;
						left: 20%;
						z-index: 2;
						/* transform:translate(-50%, -50%); */
					}
					
					._device_desktop .view_template_contents div#artclItem1 {
						/* top: 50vh; */
						top: 264px;
						left: 25%;
						transform:translate(-50%, -50%);
					}
					._device_desktop .view_template_contents div#artclItem2 {
						top: 43vh;
						left: 56%;
						/* transform:translate(-50%, -50%); */
					}
					._device_desktop .view_template_contents div#artclItem3 {
						top: 39vh;
						left: 14%;
						/* transform:translate(-50%, -50%); */
					}
					._device_desktop .view_template_contents div#artclItem4 {
						top: 26vh;
						left: 56%;
						text-align: justify;
						/* transform:translate(-50%, -50%); */
					}
					._device_desktop .view_template_contents div#artclItem5 {
						top: 25vh;
						left: 18%;
						text-align: justify;
						/* transform:translate(-50%, -50%); */
					}
					._device_desktop .view_template_contents.vr_pos_0 div#artclItem0 {
						opacity: 1;
						visibility: visible;
					}
					._device_desktop .view_template_contents.vr_pos_1 div#artclItem1 {
						opacity: 1;
						visibility: visible;
					}
					._device_desktop .view_template_contents.vr_pos_2 div#artclItem2 {
						opacity: 1;
						visibility: visible;
					}
					._device_desktop .view_template_contents.vr_pos_3 div#artclItem3 {
						opacity: 1;
						visibility: visible;
					}
					._device_desktop .view_template_contents.vr_pos_4 div#artclItem4 {
						opacity: 1;
						visibility: visible;
					}
					._device_desktop .view_template_contents.vr_pos_5 div#artclItem5 {
						opacity: 1;
						visibility: visible;
					}

					/* mobile descriptions */
					._device_mobile._mode_desc_view .con_main .descrs {
						height: calc(100vh - constant(safe-area-inset-bottom) + 13px);
						height: calc(100vh - env(safe-area-inset-bottom) + 13px);
						opacity:1;
						left:0; 
						top:0;
						background: linear-gradient(0deg, rgba(0,0,0,1), rgba(0,0,0,0.1));
						z-index:1;
					}
					
					._device_mobile._mode_desc_view .con_main .descrs::before {
						opacity:0.3;
					}
					
					._device_mobile .con_main .descrs>div.artcl_item {
						display: none;
					}
					._device_mobile._mode_desc_view .con_main .descrs>div.artcl_item {
						display: block;
					}
					._device_mobile .con_main .descrs .artcl_item p.con_category {
						display: block;
						text-align: left;
						color: black;
						line-height: 25px;
						margin-bottom: 10px;
						padding-left: 30px;
					}
					._device_mobile .con_main .descrs .artcl_item h3.con_headline {
						font-family: 'futurademregular', 'Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						font-size:20px;
						line-height:32px;
						font-weight: normal;
						color:white;
						text-transform: uppercase;
						word-wrap: none;
						text-align:left;
						margin-bottom:22px;
						background-color:transparent;
						border:0 none;
						white-space: unset;
						word-break: keep-all;
					}
					._device_mobile .con_main .descrs .artcl_item p.con_description {
						display: none;
					}
					._device_mobile .con_main .descrs .artcl_item a.con_linkbtn {
						display:none;
					}
					._device_mobile .view_template_contents div.artcl_item {
						transition: all 1s;
						opacity: 0;
						visibility: hidden;
						position:absolute;
						bottom: calc(220px + constant(safe-area-inset-bottom));
						bottom: calc(220px - env(safe-area-inset-bottom));
						left: 20px;
						right:20px;
					}
					._device_mobile._mode_desc_view .view_template_contents div.artcl_item {
						transition: all 1s;
						opacity: 1;
						visibility:visible;
					}
					._device_mobile .view_template_contents div#artclItem0 {
						display: block;
					}
					._device_mobile .view_template_contents div#artclItem0 p.con_description {
						display: block;
					}
					._device_mobile .view_template_contents div#artclItem1 {
						display: block;
					}
					._device_mobile .view_template_contents div#artclItem2 {
						display: block;
						top: 63vh;
						/* left: 28%; */
					}
					._device_mobile .view_template_contents div#artclItem3 {
						display: block;
					}
					._device_mobile .view_template_contents div#artclItem4 {
						display: block;
					}
					._device_mobile .view_template_contents div#artclItem5 {
						display: block;
					}
					._device_mobile._view_desc .view_template_contents.vr_pos_0 div#artclItem0 {
						opacity: 1;
						visibility: visible;

					}
					._device_mobile .view_template_contents.vr_pos_0 div#artclItem0 {
						opacity: 1;
						visibility: visible;
						top: 21vh;
    					z-index: 0;
					}
					._device_mobile .view_template_contents.vr_pos_1 div#artclItem1 {
						opacity: 1;
						visibility: visible;
						top: 18vh;
						visibility: visible;
					}
					._device_mobile .view_template_contents.vr_pos_2 div#artclItem2 {
						opacity: 1;
						visibility: visible;
    					z-index: 0;
					}
					._device_mobile .view_template_contents.vr_pos_3 div#artclItem3 {
						opacity: 1;
						visibility: visible;
						top: 18vh;
    					z-index: 0;
					}
					._device_mobile .view_template_contents.vr_pos_4 div#artclItem4 {
						opacity: 1;
						visibility: visible;
						top: 18vh;
    					z-index: 0;
					}
					._device_mobile .view_template_contents.vr_pos_5 div#artclItem5 {
						opacity: 1;
						visibility: visible;
						top: 60vh;
    					z-index: 0;
						
					}
				</style>
				<div class="view_template_contents" id="viewContent">
					<div class="con_main _sticky">
						<div class="con_main_wrap">
							
							<div class="con_rolling">
								<div class="vrism_item" id="vrismContent"></div>
								<!-- <div class="item_shadow"></div> -->
							</div>
							<div class="descrs">
								<div class="logo_wrap">
									<h1>omnist</h1>
								</div>
								<div class="btn_wrap">
									<a class="btn_video">video</a>
									<a href="https://www.hoopcity.co.kr/m2/goods/view.php?category=005&goodsno=6383" class="btn_buy">상세페이지</a>
								</div>
								<div id="omnistVideo" class="video_wrap _video_hide_">
									<video class="video_source" src="https://contents.vrism.net/images/OMN1S.mp4" controls></video>
									<a class="video_off">x</a>
								</div>
								<div class="navi_wrap">
									<ul class="navi_list">
										<li class="navi_no"><a href="javascript:changePage(0);void(0);" title="link to content">1</a></li>
										<li class="navi_no"><a href="javascript:changePage(1);void(0);" title="link to content">2</a></li>
										<li class="navi_no"><a href="javascript:changePage(2);void(0);" title="link to content">3</a></li>
										<li class="navi_no"><a href="javascript:changePage(3);void(0);" title="link to content">4</a></li>
										<li class="navi_no"><a href="javascript:changePage(4);void(0);" title="link to content">5</a></li>
										<li class="navi_no"><a href="javascript:changePage(5);void(0);" title="link to content">6</a></li>
										<li class="navi_no"><a href="javascript:changePage(6);void(0);" title="link to content">7</a></li>
									</ul>
								</div>
								<div class="main_nm_wrap">
									<p class="con_sub1">
										kawhi<br/> leonard
									</p>
									<!-- <p class="con_main">
										omn1s
									</p> -->
								</div>
								<div class="artcl_item" id="artclItem0">
									<p class="con_sub1">
										inspire <br/> the dream
									</p>
									<h2 class="con_main">
										omn1s
									</h2>
									<!-- <p class="con_sub2">change the game</p> -->
								</div>
								<div class="artcl_item" id="artclItem1">
									<p class="con_category _tmp_edit">
										detail 1
									</p>
									<h4 class="con_headline _tmp_edit">
										발목까지<br/>
										감싸주는 형태의<br/>
										High 모델<br/>
									</h4>
								</div>
								<div class="artcl_item" id="artclItem2">
									<p class="con_category _tmp_edit">
										detail 2
									</p>
									<h4 class="con_headline _tmp_edit">
										클리어 솔 방식으로<br/>
										플레이어의<br/>
										움직임에 필요한<br/>
										접지력 제공<br/>
									</h4>
								</div>
								<div class="artcl_item" id="artclItem3">
									<p class="con_category _tmp_edit">
										detail 3
									</p>
									<h4 class="con_headline _tmp_edit">
										FUELCELL<br/>
										테크놀로지로<br/>
										쿠셔닝과<br/>
										뛰어난 반발력<br/>
										경험<br/>
									</h4>
								</div>
								
								<div class="artcl_item" id="artclItem4">
									<p class="con_category _tmp_edit">
										detail 4
									</p>
									<h4 class="con_headline _tmp_edit">
										발목 뒷부분을<br/>
										고정시켜<br/>
										플레이어의 부상 방지<br/>
									</h4>
									<p class="con_btm">가죽 소재가 갑피에 혼합되어 있어<br/> 착화감 향상</p>
								</div>
								<div class="artcl_item" id="artclItem5">
									<p class="con_category _tmp_edit">
										detail 5
									</p>
									<h4 class="con_headline _tmp_edit">
										발 전체를<br/>
										부드럽게 감싸주는<br/>
										일체형 구조<br/>
									</h4>
									<p class="con_btm">조직감 있는 니트소재<br/> 발과 신발끈의 마찰 최소화</p>
								</div>
								
							</div>

						</div>
					</div>
				</div>
				<script class="view_template_script">
					window.vr={
						cid:"20FS1HC042",
						type:"rotation_3position_1",
						dt:{
							position:[
								[0.21180064976215363, 0.021999239921569824, 8.999999752974356, -1.7374796867370605, -1.3855023384094238, -0.2779521644115448],
								[1.144243812561035, -0.6187731623649597, 8.421686168556947, 0.010950956493616104, -0.248692125082016, 0.5388530492782593],
								[1.3176153302192688, 1.494508981704712, 5.980334576749868, 0.10311078280210495, 0.8693609833717346, -0.37355461716651917],
								[5.402434539794922, 0.40048912167549133, 7.000000028368478, -0.9339706301689148, 0.3424968123435974, 0.4304385185241699],
								
								[2.286655650138855, -0.47442248463630676, 7.719181441227674, -1.2015880346298218, 0.2712009847164154, -0.9245594143867493],
								[0.50, -0.15, 8.8, -1.5, -0.62, 0.19],
								[0.1, 0, 9.5, -0.128, 0.041, 0.029]
							],
							/* 
								[0.334424018859863, -0.2055135816335678, 7.000000246278062, 0.26333725452423096, 0.5310459136962891, 0.20588406920433044],
								position:[ 
								//[.23591630160808563,0.1267622858285904,7.270991212317192,1.7547811169061154e-17,1.7547811169061154e-17,-0.6000000238418579],
								[0.21180064976215363, 0.021999239921569824, 10.000000213627525, -2.7374796867370605, -1.3855023384094238, -0.2779521644115448],
								[2.763280153274536, -0.6007164120674133, 8.34848035776448, 0.06698836386203766, -0.18808409571647644, 0.5404059886932373],
								[0.8176153302192688, 1.494508981704712, 5.980334576749868, 0.10311078280210495, 0.8693609833717346, -0.37355461716651917],
								[5.702434539794922, 0.40048912167549133, 7.000000028368478, -0.9339706301689148, 0.3424968123435974, 0.4304385185241699],
								// [0.7247794270515442, -0.02505340799689293, 9.726506030753118, 0.10899905115365982, 0.921367347240448, -0.7960130572319031], 
								[1.926655650138855, -0.47442248463630676, 7.719181441227674, 0.0019094975432381034, 0.9075249433517456, -0.7592414617538452],
								[4.334424018859863, -0.2055135816335678, 7.000000246278062, 0.2314758002758026, 0.24027158319950104, 0.5511513948440552],
								[6.21242618560791, -0.007514416240155697, 9.49999993342682, -0.12826356291770935, 0.041687943041324615, 0.02985348366200924]
							], */
							degree:40,
							scrollStep:1800
						},
						mb:{
							position:[

								[0.21180064976215363, 0.021999239921569824, 7.943977862881471, -0.2, 0.3, 0.9], //0
								[2.8070664405822754, -0.3189876973628998, 5.559190342321084, 0,-0, 1.1], // 1
								[0.8552609086036682, 1.8905259370803833, 9.999999946170468, 0.4, -0.5, 4.8], // 2
								[5.302434539794922, -0.030048912167549133, 5.5, -0, 0.6, 1.3],  //3
								[2.286655650138855, -0.47442248463630676, 6.719181441227674, -0.2, 0.27, 1.2],  //4
								[0.523762583732605, -0.08275774121284485, 5.943977862881471, -0.2,-0.5, -1.0],  //5
								[0.1, 0, 7.5, -0.128, 0.041, 0.029]  //6
								
								

								/* 
								[0.21180064976215363, 0.021999239921569824, 7.943977862881471, -0.2, 0.3, 1],
								[2.8070664405822754, -0.3189876973628998, 5.559190342321084, 0,-0, 1],
								[0.8552609086036682, 1.8905259370803833, 9.999999946170468, 0.4, -0.5, 6],
								[5.302434539794922, -0.030048912167549133, 5.5, -0, 0.6, 1.5],
								[2.286655650138855, -0.47442248463630676, 6.719181441227674, -0.2, 0.27, -2.3],
								[0.523762583732605, -0.08275774121284485, 5.943977862881471, -0.2,-0.5, 1.5],
								[0.1, 0, 7.5, -0.128, 0.041, 0.029] 
								*/
							],
							degree:50,
							scrollStep:800
						}
					}
				</script>
			</div>
		</div>
	</body>
</html>		
