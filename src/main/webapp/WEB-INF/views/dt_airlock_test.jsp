<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    	<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes">
		<meta name="keyword" content="르꼬끄,에어락,airlock,AIRLOCK,3D,viewer,contents,vrism,뷰어,플랫폼,브리즘">
		<meta name="title" content="AIR LOCK">
		<meta name="description" content="더 높이, 더 멀리. 러닝만을 위한 설계 르꼬끄 에어락">
		<meta name="image" content="./resources/images/20FS5LC004/assets/preview_20FS5LC004.png">
		<meta name="author" content="VRISM">
		<meta property="og:type" content="website" />
		<meta property="og:title" content="AIR LOCK" />
		<meta property="og:description" content="더 높이, 더 멀리. 러닝만을 위한 설계 르꼬끄 에어락" />
		<meta property="og:url" content="https://vrism.net/lecoqsportif/airlock" />
		<meta property="og:image" content="./resources/images/20FS5LC004/assets/preview_20FS5LC004.png">
		<title>AIR LOCK</title>
		<link rel="shortcut icon" href="./resources/images/favicon.ico">
		<link rel="stylesheet" type="text/css" href="./resources/css/dt_airlock.css">
		<script src="./resources/js/lib/jquery-3.4.1.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
		<script type="text/javascript" src="https://contents.vrism.net/assets/src/blender/b4w.min.js"></script>
		<script type="text/javascript" src="https://contents.vrism.net/assets/src/vrism/vrism.viewer.latest.test.js"></script>
		<!-- <script src="./resources/js/lib/stickyfill.min.js"></script> -->
		<script src="./resources/js/vrAreaDefault_test.js"></script>
		<!-- <script src="./resources/js/lib/require.js"></script> -->
		<!-- <script src="./resources/js/vrArea.js"></script> -->
	</head>
	<body>
		<div class="vr_wrap" id="vrWrap">
			<div class="vr_area view_template" id="vrArea">
				<style class="view_template_style">
					
					.vr_wrap .vr_area {
						min-height:100vh;
					}
					.vr_wrap .vr_area::after {
						content:"";
						position:absolute;
						display: block;
						left:0;
						top:0px;
						width:100vw;
						height:calc(100vh);
						background-image:url('./resources/images/loading_shoes_wt.gif');
						background-size: 120px;
						background-repeat: no-repeat;
						background-position: center;
						mix-blend-mode: screen;
						z-index:9999;
					}
					._mode_start .view_template_contents {
						
						/* perspective-origin: center; */
						transition : background-color 3s;
					}
					._mode_start._device_desktop .view_template_contents {
						/* height:calc(100vh + (1800px * 4) + 600px); */
						height:100vh;
						/* perspective: 300px; */
					}
					._mode_start._device_mobile .view_template_contents {
						/* height:calc(100vh + (800px * 6) + 200px); */
						height:100vh;
						/* perspective: 130px; */
					}
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
					._device_desktop .con_rolling #extraItem4 {
						transform-origin: left top;
						transform: scale(0.5) translate(90%,-50%);
					}
					._device_mobile .con_rolling .extra_item img {
						transform-origin: left top;
						transform: scale(0.2) translate(-50%,-50%);
					}
					.con_main {
						/* position: -webkit-sticky; */
						position: absolute;
						width: 100vw;
						left: 0;
						/* top:0; */
					}
					.con_main .con_main_wrap {
						width:100%;
						height:100vh;
						position:relative;
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
					._device_desktop .con_main .descrs .artcl_item h4.con_headline {
						font-family: 'Noto Sans KR', 'Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						font-size:60px;
						line-height:68px;
						font-weight: 900;
						color: black;
						letter-spacing: -3px;
						text-align: justify;
						margin: 0;
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
						width: 100%;
						/* left: calc((100% - 680px)/2); */
						z-index: 2;
					}
					
					._device_desktop .view_template_contents div#artclItem1 {
						top: 24vh;
						left: 17.5%;
					}
					._device_desktop .view_template_contents div#artclItem2 {
						top: 43vh;
						left: 56%;
					}
					._device_desktop .view_template_contents div#artclItem3 {
						top: 39vh;
						left: 14%;
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
					
					/* mobile descriptions */
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
					._device_mobile .con_main .descrs .artcl_item h4.con_headline {
					
						font-family: 'Nanum Gothic', 'Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						font-size:44px;
						line-height:48px;
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
					
					._device_mobile .con_main .descrs .artcl_item a.con_linkbtn {
						display:none;
					}
					._device_mobile .con_main .descrs .artcl_item p.con_btm {
						font-family: 'Noto Sans KR', 'Malgun Gothic','맑은 고딕','Nanum Barun Gothic', sans-serif;
						font-size: 14px;
						font-weight: 700;
						text-align: left;
						padding-left: 30px;
					}
					._device_mobile .view_template_contents div.artcl_item {
						transition: all 1s;
						opacity: 0;
						visibility: hidden;
						position:absolute;
						bottom: calc(220px + constant(safe-area-inset-bottom));
						bottom: calc(220px - env(safe-area-inset-bottom));
						left: 100px;
						right:20px;
					}
					._device_mobile._mode_desc_view .view_template_contents div.artcl_item {
						transition: all 1s;
						opacity: 1;
						visibility: visible;
					}
					._device_mobile .view_template_contents div#artclItem0 {
						display: block;
					}
					
					._device_mobile .view_template_contents div#artclItem1 {
						display: block;
					}
					._device_mobile .view_template_contents div#artclItem2 {
						display: block;
						top: 58vh;
						/* left: 28%; */
					}
					._device_mobile .view_template_contents div#artclItem3 {
						display: block;
					}
					
					._device_mobile._view_desc .view_template_contents.vr_pos_0 div#artclItem0 {
						opacity: 1;
						visibility: visible;

					}
					._device_mobile .view_template_contents.vr_pos_0 div#artclItem0 {
						opacity: 1;
						visibility: visible;
						top: 14vh;
    					z-index: 0;
    					left: 60px;
					}
					._device_mobile .view_template_contents.vr_pos_1 div#artclItem1 {
						opacity: 1;
						visibility: visible;
						top: 14vh;
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
						top: 14vh;
    					z-index: 0;
					}
					
				</style>
				<div class="view_template_contents" id="viewContent">
					<div class="bg_area" id="conBg"></div>
					<div class="con_main _sticky">
						<div class="con_main_wrap">
							<div class="con_rolling">
								<div class="extra_item extra_circle extra_circle_1" id="extraItem0" data-pos-radin="0.5" data-pos-depth="1.0" data-pos-y="0.8"><img src="./resources/images/ball_w.png" alt="extra image"/></div>
								<div class="extra_item extra_circle extra_circle_1" id="extraItem1" data-pos-radin="3.2" data-pos-depth="0.8" data-pos-y="0.2"><img src="./resources/images/ball_w.png" alt="extra image"/></div>
								<div class="extra_item extra_circle extra_circle_1" id="extraItem2" data-pos-radin="6.1" data-pos-depth="1.1" data-pos-y="0.6"><img src="./resources/images/ball_w.png" alt="extra image"/></div>
								<div class="extra_item extra_circle extra_circle_1" id="extraItem3" data-pos-radin="5.6" data-pos-depth="0.7" data-pos-y="0.4"><img src="./resources/images/ball_w.png" alt="extra image"/></div>
								<!-- <div class="extra_item extra_circle extra_circle_1" id="extraItem4" data-pos-radin="4.6" data-pos-depth="0.5" data-pos-y="0.7"><img src="./resources/images/ball_w.png" alt="extra image"/></div> -->
								<div class="extra_item extra_circle extra_circle_1" id="extraItem5" data-pos-radin="1.2" data-pos-depth="0.9" data-pos-y="0.1"><img src="./resources/images/ball_w.png" alt="extra image"/></div>
								
								<div class="vrism_item" id="vrismContent"></div>
								<div class="item_shadow"></div>
							</div>
							<div class="end_content" id="conText"><img src="./resources/images/airlock_opa.svg" alt="airlock back image"></div>
							<div class="descrs">
								<div class="logo_wrap">
									<h1><a href="https://www.lecoqsportif.co.kr/index.do?netFunnelYn=N&loginUsrId=" title="link to content">airlock</a></h1>
								</div>
								<div class="btn_wrap">
									<!-- <a class="area_scroll">scroll<img src="./resources/images/scroll.svg"></a> -->
									<!-- <a class="btn_video" title="link to content">video</a> -->
									<a class="btn_buy" href="https://www.lecoqsportif.co.kr/index.do?netFunnelYn=N&loginUsrId=" target="_blank" title="link to content">구매하기</a>
								</div>
								<!-- <div id="airlockVideo" class="video_wrap _video_hide_">
									<video class="video_source" src="https://contents.vrism.net/images/Airlock_Final_14.mp4" controls></video>
									<a class="video_off">x</a>
								</div> -->
								<div class="navi_wrap">
									<!-- <a class="area_click">click</a> -->
									<ul class="navi_list">
										<li class="navi_no"><a href="javascript:changePage(0);void(0);" title="link to content">1</a></li>
										<li class="navi_no"><a href="javascript:changePage(1);void(0);" title="link to content">2</a></li>
										<li class="navi_no"><a href="javascript:changePage(2);void(0);" title="link to content">3</a></li>
										<li class="navi_no"><a href="javascript:changePage(3);void(0);" title="link to content">4</a></li>
										<li class="navi_no"><a href="javascript:changePage(4);void(0);" title="link to content">5</a></li>
									</ul>
								</div>
								<div class="main_nm_wrap">
									<p class="main_nm">air lock</p>
								</div>
								<div class="artcl_item" id="artclItem0">
									<p class="con_sub1">더 높이, 더 멀리.</p>
									<h2 class="main_nm">air lock</h2>
									<a class="area_scroll">scroll<img src="./resources/images/scroll.svg"></a>
									<a class="area_click">click</a>
									
								</div>
								<div class="artcl_item" id="artclItem1">
									<h4 class="con_headline _tmp_edit">매일 편안한<br/>러닝을 서포트</h4>
									<p class="con_btm">안 쪽의 샌드위치 메쉬는 발 모양을 따라<br/>부드럽게 감싸주고, 바깥쪽에 새롭게 적용된<br/>나노 프린트는 러닝에 꼭 필요한 부분만<br/>편안하게 잡아줍니다.</p>
								</div>
								<div class="artcl_item" id="artclItem2">
									<h4 class="con_headline _tmp_edit">러닝만을 위한 설계<br/></h4>
									<p class="con_btm">정교하게 설계된 아웃솔 패턴은 달릴 때<br/>지면을 정확하게 파악할 수 있도록 도와주며<br/>동시에 앞으로 나아가는 추진력을 더해줍니다.</p>
								</div>
								<div class="artcl_item" id="artclItem3">
									<h4 class="con_headline _tmp_edit">혁신적인 쿠셔닝 시스템</h4>
									<p class="con_btm">달리는 동작을 분석해 최적의 위치에 설계된<br/>에어쿠션이 발에 전해지는 충격을 효과적으로<br/>흡수하고 다음 스텝의 에너지로 전환시킵니다.
									</p>
								</div>
							</div>

						</div>
					</div>
				</div>
				<script class="view_template_script">
					window.vr={
						cid:"20FS5LC004",
						type:"rotation_3position_1",
						dt:{
							position:[
								[3.1, 0, 9, -0.128, 0.041, 0.1],
								[2.4000003337860107, -0.6872194409370422, 7.999999932887191, 1, -0.4000000059604645, -0.10000000149011612],
								[1.3176153302192688, 1.494508981704712, 7.980334576749868, 0.10311078280210495, 0.8693609833717346, -0.37355461716651917],
								[5.402434539794922, 0.40048912167549133, 7.000000028368478, -0.9339706301689148, 0.3424968123435974, 0.4304385185241699],
								[2.4000003337860107, -0.6872194409370422, 7.999999932887191, -0.128, 0.041, 0.01]
							],
							
							degree:0,
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
							],
							degree:60,
							scrollStep:800
						}
					}
				</script>
			</div>
		</div>
		<!-- <div style="height:100px; position:relative; background-color:orange; z-index:9999999999;"><a href="#aaaaaa" target="top">gogogo</a></div>
		<div style="height:100px; position:relative; background-color:gold; z-index:9999999999;"><a href="javascript:window.parent.postMessage({ childData : 'scrollTop' }, '*');" target="top">up up up</a></div> -->
	</body>
</html>		
