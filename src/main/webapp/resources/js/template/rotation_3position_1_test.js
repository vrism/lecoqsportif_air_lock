(function(ssq){
	var win = ssq(window), bdy = ssq(ssq("body")[0]), device = (vr.device == "desktop")? "dt":"mb", vrd = vr[device], _view = 0, _target = {curr:0, timer:null}, _enableReturnScroll = 0;
	window.pageCurr=0; window.changePage;
	vr.vrismOption = {
		autoRun:"on",
		blender:{
			angle:[vrd.position[0][0],vrd.position[0][1]],
			controlEnable : false,
			positionCssDepth : 0.3,
			positions : [],
			jsonPath:vr.jsonPath,
			objectRotate:[{name:"mainobject", value:vr.data.deg["deg"+vrd.degree]}],
			objectScale:[{"name":"shadowplane", "value":0}],
			pivot:[vrd.position[0][3],vrd.position[0][4],vrd.position[0][5]],
			preloaderImage:"./resources/images/loading_shoes_wt.gif",
			preloaderSize:"medium",
			preloaderType:"bar",
			zoom:vrd.position[0][2],
			maxZoom:5,
			minZoom:13
		},
		linkObject:["#viewContent"],
		userControl:"disabled",
		controlHandle:{
			angleImage: './resources/images/360.svg'
		}
	};
	for (var i=0; i<vrd.position.length; i++) {
		var tmpPos = vrd.position[i];
		vr.vrismOption.blender.positions[i] = {
			"cssName":"vr_pos_"+i,
			"angle":[tmpPos[0], tmpPos[1]],
			"pivot":[tmpPos[3], tmpPos[4], tmpPos[5]],
			"zoom":tmpPos[2],
			"position":tmpPos
		};
	}
	
	vr.contentStart = function() {
		vr_type_scroll_1();
	};
	
	function vr_type_scroll_1(){
		var winW, winH, area = ssq("div#viewContent"), areaY, areaH, areaE, 
			curr=0, step=vrd.scrollStep, ea=vrd.position.length, pos;
		win.on("resize", setSize); 
		setSize();
		//$("html, body").on("mousewheel DOMMouseScroll", setChangeTarget);
		if (device == "dt")
		win[0].addEventListener('mousewheel', setChangeTarget, {passive: false});
		else {
			var moveMode, touchY, moveY;
			win[0].addEventListener('touchstart', function(e){
				if (ssq(e.target).hasClass("vr_handle")) moveMode = false;
				else moveMode = true;
				//console.log("s");
				if (_target.timer) {
					clearInterval(_target.timer);
					_target.timer=null;
				}
				touchY = e.touches[0].screenY;
			}, {passive: false});
			win[0].addEventListener('touchmove', function(e){
				if (!moveMode) return;
				moveY = touchY - e.touches[0].screenY;
				touchY = e.touches[0].screenY;
				_view += moveY;
				_view = Math.min(Math.max(0, _view), vrd.position.length*vrd.scrollStep-winH);
				setChange();
				parentFrameScrollControl(e, moveY);
			}, {passive: false});
			win[0].addEventListener('touchend', function(e){
				if (!moveMode) return;
				_target.curr = _view + (moveY * 5);
				_target.curr = Math.min(Math.max(0, _target.curr), vrd.position.length*vrd.scrollStep-winH);
				//console.log(_target.curr, _view, moveY);
				_target.timer = setInterval(change, 1000/30); change();
				function change(){
					if (Math.round((_target.curr-_view)) == 0) {
						clearInterval(_target.timer);
						_target.timer=null;
						_view = _target.curr;
						setChange();
					} else {
						_view += (_target.curr - _view)*0.2;
						_view = Math.round(_view*10)/10;
						setChange();
					}
					//console.log("e", _view);
				}
			}, {passive: false});
			function parentFrameScrollControl(e, delta){
				if (delta<0){
					if (_enableReturnScroll >3) window.parent.postMessage({ childData : 'scrollTop' }, '*');
					_enableReturnScroll += 1;
				} else {
					_enableReturnScroll = 0;
				}
				if (_view < 50) window.parent.postMessage({ childData : 'scrollTop' }, '*');
				if (_view < areaE - win.height() ) {
					e.preventDefault();
					e.stopPropagation();
					e.returnValue = false;
					return false;
				}
			}



		}
		ssq("html,body").on("scroll", function(e){
			//console.log("scroll");
			e.preventDefault();
			e.stopPropagation();
			return false;
		});
		//win.on("scroll", setScroll);
		area.on("mousedown", ".vr_handle", dragStart);
		area.on("touchstart", ".vr_handle", dragStart);
		/*if (device == "mb") {
			area.find("div.descrs").on("click", function(e){
				if (vr.container.hasClass("_mode_desc_view")) vr.container.removeClass("_mode_desc_view");
				else vr.container.addClass("_mode_desc_view");
			});
		}*/
		function setSize() {
			winW = win.width();
			winH = win.height();
			areaY = area.offset().top;
			areaH = vrd.scrollStep * vrd.position.length;
			areaE = areaY + areaH;
			setChange();
		}
		function setChangeTarget(e) {
			if (win.scrollTop() != 0) return;
			var delta = (e.detail) ? e.detail * 40 : -e.wheelDelta;
			//delta = Math.max(Math.min(100,delta),-100);
			_target.curr = _view+delta;
			_target.curr = Math.min(Math.max(0, _target.curr), vrd.position.length*vrd.scrollStep-winH);
			if (_target.timer) {
				clearInterval(_target.timer);
				_target.timer=null;
			}
			_target.timer = setInterval(change, 1000/30); change();
			function change(){
				if (Math.round((_target.curr-_view)) == 0) {
					clearInterval(_target.timer);
					_target.timer=null;
					_view = _target.curr;
					setChange();
				} else {
					_view += (_target.curr - _view)*0.4;
					_view = Math.round(_view*10)/10;
					setChange();
				}
			}
			
			if (delta>0) {
				if (_view <= areaE) {
					if(navigator.userAgent.match(/Trident\/7\./)) ssq("html").css("pointer-events", "none");
				}
			} else {
				if(navigator.userAgent.match(/Trident\/7\./)) ssq("html").css("pointer-events", "all");
				window.parent.postMessage({ childData : 'scrollTop' }, '*');
			}
			if (_view < areaE - win.height() ) {
				e.preventDefault();
				e.stopPropagation();
				e.returnValue = false;
				return false;
			}
		}
		function setChange(e) {
			//console.log(win.scrollTop());
			if (_view < 50) {
				bdy.addClass("_scroll_vr_top").addClass("_scroll_vr").removeClass("_scroll_vr_bottom").removeClass("_scroll_after");
			} else if (_view < areaE - win.height() ) {
				bdy.removeClass("_scroll_vr_top").addClass("_scroll_vr").removeClass("_scroll_vr_bottom").removeClass("_scroll_after");
			} else if (_view < areaE) {
				bdy.removeClass("_scroll_vr_top").addClass("_scroll_vr").addClass("_scroll_vr_bottom").removeClass("_scroll_after");
			} else {
				bdy.removeClass("_scroll_vr_top").removeClass("_scroll_vr").removeClass("_scroll_vr_bottom").addClass("_scroll_after");
				return;
			}
			curr = (_view) / step;
			curr = Math.max(0, Math.min(ea-1, curr));
			if (vr.device == "desktop") pos = vr.viewer.curvePosition(curr, 0.6, 0.8);
			else pos = vr.viewer.curvePosition(curr,0.8);	//0.4
			setExtra();
			setBg();
			if (Math.round(curr*10)/10 === ea-1) {
				vr.viewer.setUserControl("angle-handle");
			} else {
				vr.viewer.setUserControl("disabled");
			}
			pageCurr = Math.round(curr);
			for (var i=0; i<vrd.position.length; i++) {
				if (i==pageCurr) {
					ssq(".navi_list li:nth("+i+")").addClass("_curr");
					bdy.addClass("_page_no_"+i);
				} else {
					ssq(".navi_list li:nth("+i+")").removeClass("_curr");
					bdy.removeClass("_page_no_"+i);
				}
			}
		}
		function setExtra() {
			var extra = area.find(".extra_item"), r360 = Math.PI*2;
			extra.each(function(i){
				var item = ssq(this), 
					posRadin=Number(item.attr("data-pos-radin")), 
					posDepth = Number(item.attr("data-pos-depth")), 
					posY = Number(item.attr("data-pos-y")),
					maxW = winW / 2,
					rdn = (posRadin + pos[0]) % r360,
					x = (maxW * posDepth) * Math.cos(rdn),
					z = (maxW * posDepth) * -Math.sin(rdn),
					y = z * Math.sin(pos[1]);
				z = z * -Math.cos(pos[1]);
				item.stop(true).css({"transform":"translate3d("+x+"px, "+y+"px, "+z+"px)", "z-index":Math.round(z/10+50), "top":(winH*posY)});
			});
		}
		
		function setBg(){
			var wd = area.width();
			var xy = Math.sin(pos[0]), xx = Math.cos(pos[0]), radX = Math.atan2(xy,xx),
				yy = Math.sin(pos[1]), yx = Math.cos(pos[1]), radY = Math.atan2(yy,yx);
			ssq("div#conBg").css({"background-position":(radX*10)+"vw "+(radY*10-_view*-0.003-100)+"vh"});
		}
		function dragStart(e){
			if (e.type=="mousedown") {
				win.on("mousemove",dragMove);
				win.on("mouseup",dragEnd);
			} else {
				win.on("touchmove",dragMove);
				win.on("touchend",dragEnd);
			}
			vr.container.addClass("_drag_mode");
		}
		function dragMove(e){
			pos = vr.viewer.position;
			setExtra();
			setBg();
		}
		function dragEnd(e){
			if (e.type=="mouseup") {
				win.off("mousemove",dragMove);
				win.off("mouseup",dragEnd);
			} else {
				win.off("touchmove",dragMove);
				win.off("touchend",dragEnd);
			}
			vr.container.removeClass("_drag_mode");
		}
		changePage = function(no){
			no = Math.round(no);
			if(no === pageCurr) return;
			var gab = Math.abs(no - pageCurr);
			var time = 0, timeTotal = Math.ceil(gab*30*1.3), start=pageCurr*vrd.scrollStep, end=no*vrd.scrollStep, move = end-start;
			pageCurr = no;
			//ssq("html,body").stop().animate({"scrollTop":pageCurr*vrd.scrollStep}, gab*1300, "linear");
			if (_target.timer) {
				clearInterval(_target.timer);
				_target.timer=null;
			}
			_target.timer = setInterval(changeCurrFn, 1000/30);
			function changeCurrFn() {
				time++;
				if (time >=timeTotal) {
					clearInterval(_target.timer);
					_target.timer=null;
					_view = end;
				} else {
					_view = start + (move*(time/timeTotal));
				}
				setChange();
			}
		};
	}
	window.onbeforeunload = function () {
		ssq("body").css("opacity",0);
		window.scrollTo(0, 0);
		ssq("body")[0].scrollTo(0, 0);
	};
})(jQuery);