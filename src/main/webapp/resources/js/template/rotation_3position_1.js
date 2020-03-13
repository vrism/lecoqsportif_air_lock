(function(ssq){
	var win = ssq(window), bdy = ssq(ssq("body")[0]), device = (vr.device == "desktop")? "dt":"mb", vrd = vr[device];
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
		var winW, winH, winS, area = ssq("div#viewContent"), areaY, areaH, areaE, 
			curr=0, step=vrd.scrollStep, ea=vrd.position.length, pos;
		win.on("resize", setSize); 
		win.on("scroll", setScroll);
		setSize();
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
			areaH = area.height();
			areaE = areaY + areaH;
			setScroll();
		}
		function setScroll(e){
			winS = win.scrollTop();
			if (winS < 50) {
				bdy.addClass("_scroll_vr_top").addClass("_scroll_vr").removeClass("_scroll_vr_bottom").removeClass("_scroll_after");
			} else if (winS < areaE - win.height() ) {
				bdy.removeClass("_scroll_vr_top").addClass("_scroll_vr").removeClass("_scroll_vr_bottom").removeClass("_scroll_after");
			} else if (winS < areaE) {
				bdy.removeClass("_scroll_vr_top").addClass("_scroll_vr").addClass("_scroll_vr_bottom").removeClass("_scroll_after");
			} else {
				bdy.removeClass("_scroll_vr_top").removeClass("_scroll_vr").removeClass("_scroll_vr_bottom").addClass("_scroll_after");
				return;
			}
			// curr = (winS - areaY) / step;
			curr = (winS) / step;
			curr = Math.max(0, Math.min(ea-1, curr));
			if (vr.device == "desktop") pos = vr.viewer.curvePosition(curr, 0.6, 0.8);
			else pos = vr.viewer.curvePosition(curr,0.8);	//0.4
			setExtra();
			setBg();
			if (curr === ea-1) {
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
				item.css({"transform":"translate3d("+x+"px, "+y+"px, "+z+"px)", "z-index":Math.round(z/10+50), "top":(winH*posY)});
			});
		}
		
		function setBg(){
			var wd = area.width();
			var xy = Math.sin(pos[0]), xx = Math.cos(pos[0]), radX = Math.atan2(xy,xx),
				yy = Math.sin(pos[1]), yx = Math.cos(pos[1]), radY = Math.atan2(yy,yx);
			ssq("div#conBg").css({"background-position":(radX*10)+"vw "+(radY*10-winS*-0.003-100)+"vh"});
			
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
			pageCurr = no;
			ssq("html,body").stop().animate({"scrollTop":pageCurr*vrd.scrollStep}, gab*1300, "linear");
			
		};
	}
	window.onbeforeunload = function () {
		ssq("body").css("opacity",0);
		window.scrollTo(0, 0);
		ssq("body")[0].scrollTo(0, 0);
	};
})(jQuery);