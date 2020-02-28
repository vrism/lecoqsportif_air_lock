(function(ssq){
	var	struc={}, config={}, listener={}, win, bdy, device, vrd;
	ssq(document).ready(function(){ struc.init() });
	struc = {
		init : function() {
			struc.regist(); 
			struc.pageMethod();
			listener.start();
		},
		regist : function() {
			win = ssq(window);
			bdy = ssq(ssq("body")[0]);
		},
		pageMethod : function () {
			setVr();
			videoOff();
			videoOn();
			checkManual();
		}
	};
	listener = {
		start : function(){
			//ssq(window).bind("resize", listener.resizePage); listener.resizePage();
		},
		resizePage : function(e) {			

		}
	};
	function setSticky() {
		var elements = document.querySelectorAll('._sticky');
		Stickyfill.add(elements);
	}
	function checkDevice() {
		var _isMobile=(navigator.userAgent.match(/(iPhone|iPad|iPod|Android|Windows Phone|IEMobile|BlackBerry|Mobile Safari|Opera Mobi)/)?true:false);
		if(_isMobile) {vr.device = "mobile"; device ="mb";}
		else {vr.device = "desktop"; device ="dt";}
	}
	function setVr() {
		vr.data={};
		vr.data.deg={
			deg0:[0.5, 0.5, 0.5, 0.5],
			deg10:[0.5416799783706665, 0.5416799783706665, 0.45451998710632324, 0.45450761914253235],
			deg20:[0.579230010509491, 0.579230010509491, 0.4055800139904022, 0.4055737257003784],
			deg30:[0.6123700141906738, 0.6123700141906738, 0.353549987077713, 0.35356518626213074],
			deg40:[0.6408600211143494, 0.6408600211143494, 0.2988399863243103, 0.29881688952445984],
			deg50:[0.6644600033760071, 0.6644600033760071, 0.24184000492095947, 0.2418661266565323],
			deg60:[0.6830099821090698, 0.6830099821090698, 0.18300999701023102, 0.1830357015132904],
			deg70:[0.6963599920272827, 0.6963599920272827, 0.12279000133275986, 0.12283378094434738],
			deg80:[0.7044199705123901, 0.7044199705123901, 0.0616299994289875, 0.061536602675914764],
			deg90:[0.7071099877357483, 0.7071099877357483, 0, 0]
		};
		bdy.addClass("_scroll_lock");
		if (!vr) return;
		checkDevice();
		if (device=="dt") setSticky();
		vrd = vr[device];
		vr.container = ssq("#vrWrap");
		vr.container.addClass("_device_"+vr.device);
		var vrURL = './resources/'+vr.cid+'/assets/';
		ssq.ajax({
			dataType: "json",
			url: vrURL+"config.json",
			success: function(data){
				var cfg = {};
				vr.jsonPath = vrURL+data.jsonPath.split("./assets/").join("");
				ssq.getScript("./resources/js/template/"+vr.type+".js", function(){
					buildViewer(vr.vrismOption);
				});
			}
		});
		function buildViewer(prt){
			vr.viewer = ssq("#vrismContent").vrismViewer(prt);
			vr.viewer.on("loaded", function(e){startVr();});
		}
		function startVr() {
			bdy.removeClass("_scroll_lock");
			vr.container.addClass("_mode_start");
			vr.contentStart();
		}
	}
	function videoOff(){
		jQuery('.video_off').on('click', function(){
			jQuery('#airlockVideo').addClass("_video_hide_");
			jQuery('.video_source')[0].pause();
		});
	}
	function videoOn(){
		jQuery('.btn_video').on('click', function(){
			jQuery('#airlockVideo').removeClass("_video_hide_");
			jQuery('.video_source')[0].play();
		});
	}
	function checkManual() {
		var scroll = jQuery(".area_scroll"), click = jQuery(".area_click");
		new Promise(function(resolve, reject){
			  setTimeout(function() {
			    resolve(scroll.addClass("_mode_on"));
			    click.addClass("_mode_on");
			  }, 2000);
			})
			.then(function(result) {
			  setTimeout(function() {
				    scroll.removeClass("_mode_on");
				    scroll.addClass("_mode_off");
				    click.removeClass("_mode_on");
					click.addClass("_mode_off");
			  }, 2000);
			});
			
	}
	
})(jQuery);