$(document).ready(function() {

	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("map_img");
	map.centerAndZoom("广州", 12); // 初始化地图,设置城市和地图级别。
	map.enableScrollWheelZoom(true); //启用滚轮放大缩小
	var locationStr = "";
	var geoc = new BMap.Geocoder();
	map.addEventListener("click", function(e) {
		var pt = e.point;
		geoc.getLocation(pt, function(rs) {
			var addComp = rs.addressComponents;
			locationStr = "";
			local = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
			locationStr = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
			G("locaion_text").innerHTML = "您的位置：" + "<br/><br/>" + local;
		});
	});

	var lat;
	var lng;

	function locate() {
		//启动定位加载动画

		var geolocation = new BMap.Geolocation();

		geolocation.getCurrentPosition(function(r) {
			if(this.getStatus() == BMAP_STATUS_SUCCESS) {
				var mk = new BMap.Marker(r.point);
				//			mk.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
				lat = r.point.lat;
				lng = r.point.lng;

				var geoc = new BMap.Geocoder();
				geoc.getLocation(r.point, function(rs) {

					var addComp = rs.addressComponents;
					locationStr = "";
					local = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
					locationStr = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
					G("locaion_text").innerHTML = "您的位置：" + "<br/><br/>" + local;
				});

				map.addOverlay(mk);
				map.panTo(r.point);

				map.enableScrollWheelZoom(true); //启用滚轮放大缩小
				map.centerAndZoom(r.point, 18);
			} else {
				//			alert('failed' + this.getStatus());
			}
		}, {
			enableHighAccuracy: true
		})
	};

	function dwdonghua() {
		setTimeout(locate, 2500);
		G("locaion_text").innerHTML = "<p>正在定位...<p/>" + "<div class='loading'><span></span></div>";

	}

	var ac = new BMap.Autocomplete( //建立一个自动完成的对象
		{
			"input": "search_adress",
			"location": map
		});

	var myValue;
	ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province + _value.city + _value.district + _value.street + _value.business;
		//	G("adress_tip").innerHTML = "onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		setPlace();
	});

	function setPlace() {
		map.clearOverlays(); //清除地图上所有覆盖物
		function myFun() {
			var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			//			map.centerAndZoom(pp, 15);
			map.enableScrollWheelZoom(true); //启用滚轮放大缩小
			map.addOverlay(new BMap.Marker(pp)); //添加标注
			map.enableScrollWheelZoom(); //启用滚轮放大缩小
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
			onSearchComplete: myFun
		});
		local.search(myValue);
	}

	//定位
	$("#btn_location").click(function() {
		$("#adress_map").slideDown(500);
		$("#map_img").fadeIn(1000);
		dwdonghua();
		//		setTimeout('locate()',3000);
	});

	//取消定位
	$("#btn_canel").click(function() {
		$("#adress_map").slideUp(500);
		$("#search_adress").val("");
	});

	//确定定位
	$("#btn_ok").click(function() {
		$("#search_adress").val(locationStr);
		$("#adress_map").fadeOut(600);

	});

	//点击输入框
	$("#search_adress").click(function() {
		$(".top_map").animate({
			top: '80px'
		});
	});
	//输入框失去焦点
	$("#search_adress").focusout(function() {
		$(".top_map").animate({
			top: '320px'
		});

	});

	$("#btn_search").click(function() {
		var adress = $("#search_adress").val();

		if(adress == "") {
			//如果内容为空
		} else {
			var urls = "storesearch?adress=" + adress + "&lat=" + lat + "&lng=" + lng;
//			var cc = encodeURI(urls);
			var cc =urls;
			location.href = cc;
		}
	});

});