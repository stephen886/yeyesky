// JavaScr$("#menu1").mousemove(function(){
$(document).ready(function() {
	guess();
	
	var index = 0;
	var timer = null;// 定时器
	// 图片轮播
	// 下一张
	function nextPIC() {

		index = index + 1;
		if (index == 4) {
			index = 0;
		}
		changbgc(index);

		$("#slideitem ul li").eq(index).addClass("changSlieItembgColor");
		var oldindex = index - 1;
		if (index == 0) {
			oldindex = 3
		}
		;
		$("#slideitem ul li").eq(oldindex).removeClass("changSlieItembgColor");

	}
	;

	// 上一张
	function lastPIC() {

		index = index - 1;
		if (index == -1) {
			index = 3;
		}
		changbgc(index);
		$("#slideitem ul li").eq(index).addClass("changSlieItembgColor");
		var oldindex = index + 1;
		if (index == 4) {
			oldindex = 0
		}
		;
		$("#slideitem ul li").eq(oldindex).removeClass("changSlieItembgColor");

	}
	;

	// 上一张下一张
	$("#nextleft").mouseover(function(e) {
		cleanTimer();
		stopAnimate();
		nextPIC();
	});

	$("#nextright").mouseover(function(e) {
		cleanTimer();
		stopAnimate();
		lastPIC();
	});

	$("#nextright,#nextleft").mouseout(function(e) {
		stopAnimate();
		startTimer();
	});

	// 定时任务
	$(function() {
		$.extend({
			a : function(t) {
				nextPIC();
			}
		});
		timer = setInterval("$.a()", 2000);
	});

	// 清除定时器
	function cleanTimer() {
		clearInterval(timer);
	}

	// 重启定时器
	function startTimer() {
		timer = setInterval("$.a()", 2000);
	}

	$("#slideitem ul li ").mouseover(function(e) {
		cleanTimer();
		$(this).addClass("changSlieItembgColor");
		var i = $(this).index();
		index = i;
		changbgc(i);

	});

	$("#slideitem ul li ").mouseout(function(e) {
		startTimer();
		$(this).removeClass("changSlieItembgColor");

	});

	function changbgc(index) {
		switch (index) {
		case 0:
			stopAnimate();
			Reset();
			$("#slideBox_A").animate({
				right : '0px'
			});
			$("#SlideBox").css("background-color", "#9ae7e9");
			break;
		case 1:
			stopAnimate();
			Reset();
			$("#slideBox_A").animate({
				right : '1002px'
			});
			$("#SlideBox").css("background-color", "#eddc7a");
			break;
		case 2:
			stopAnimate();
			Reset();
			$("#slideBox_A").animate({
				right : '2004px'
			});
			$("#SlideBox").css("background-color", "#309595");
			break;
		case 3:
			stopAnimate();
			Reset();
			$("#slideBox_A").animate({
				right : '3008px'
			});
			$("#SlideBox").css("background-color", "#eef6ca");
			break;
		}
	}

	function Reset() {
		$("#slideBox_A").attr("left", "'0px'");
	}
	function stopAnimate() {
		$("#slideBox_A").stop();
	}
	// 更换列表项的背景颜色
	function changeListBgColor() {

	}

	// 猜你喜欢变色
	$(".changeCargo img").mouseover(function() {
		$(this).attr("src", "images/change2.png");
		$(this).css("cursor", "pointer");

	});

	$(".changeCargo img").mouseout(function() {
		$(this).attr("src", "images/change1.png");
	});

	$(".changeCargo img").mousedown(function() {
		$(".cargos").fadeOut(500);
		$.getJSON("Guessyoulike", function(data) {

			$.each(data, function(idx, item) {
				if (idx == 0) {
					return true;// 同countinue，返回false同break
				}
				var i = idx + 1;

				switch (idx) {
				case 1:
					$("#cdesc1").text(item.goods_name);
					$("#cprice1").text("￥" + item.specifition[0].price);
					$("#cimg_1").attr("src", item.preview_img[0]);
					$("#chref1").attr("href", "product?pid=" + item.goods_id);
					break;
				case 2:
					$("#cdesc2").text(item.goods_name);
					$("#cprice2").text("￥" + item.specifition[0].price);
					$("#cimg_2").attr("src", item.preview_img[0]);
					$("#chref2").attr("href", "product?pid=" + item.goods_id);
					break;

				case 3:
					$("#cdesc3").text(item.goods_name);
					$("#cprice3").text("￥" + item.specifition[0].price);
					$("#cimg_3").attr("src", item.preview_img[0]);
					$("#chref3").attr("href", "product?pid=" + item.goods_id);
					break;

				case 4:
					$("#chref4").attr("href", "product?pid=" + item.goods_id);
					$("#cdesc4").text(item.goods_name);
					$("#cprice4").text("￥" + item.specifition[0].price);
					$("#cimg_4").attr("src", item.preview_img[0]);
					break;
				default:
					break;

				}

			});
		});

		$(".cargos").fadeIn(500);
	});

	$("#cargo1").mousemove(function() {
		$(this).css("border", "2px solid #FF0066");
	});
	$("#cargo1").mouseout(function() {
		$(this).css("border", "2px solid #ffffff");
	});
	$("#cargo2").mousemove(function() {
		$(this).css("border", "2px solid #FF0066");
	});
	$("#cargo2").mouseout(function() {
		$(this).css("border", "2px solid #ffffff");
	});
	$("#cargo3").mousemove(function() {
		$(this).css("border", "2px solid #FF0066");
	});
	$("#cargo3").mouseout(function() {
		$(this).css("border", "2px solid #ffffff");
	});
	$("#cargo4").mousemove(function() {
		$(this).css("border", "2px solid #FF0066");
	});
	$("#cargo4").mouseout(function() {
		$(this).css("border", "2px solid #ffffff");
	});
	$("#cargo5").mousemove(function() {
		$(this).css("border", "2px solid #FF0066");
	});
	$("#cargo5").mouseout(function() {
		$(this).css("border", "2px solid #ffffff");
	});

	// 圆圈
	$(".circle").mousemove(function() {

		$(this).css("background-color", " #e9aae5");
	});
	$(".circle").mouseout(function() {
		$(this).css("background-color", " #ffffff");
	});

	// 产品

	$(".comcargobox").mousemove(function() {

		$(this).addClass("addbgcolor");
	});

	$(".comcargobox").mouseout(function() {

		$(this).removeClass("addbgcolor");
	});

	function guess() {
		$(".cargos").fadeOut(500);
		$.getJSON("Guessyoulike", function(data) {

			$.each(data, function(idx, item) {
				if (idx == 0) {
					return true;// 同countinue，返回false同break
				}
				var i = idx + 1;

				switch (idx) {
				case 1:
					$("#cdesc1").text(item.goods_name);
					$("#cprice1").text("￥" + item.specifition[0].price);
					$("#cimg_1").attr("src", item.preview_img[0]);
					$("#chref1").attr("href", "product?pid=" + item.goods_id);
					break;
				case 2:
					$("#cdesc2").text(item.goods_name);
					$("#cprice2").text("￥" + item.specifition[0].price);
					$("#cimg_2").attr("src", item.preview_img[0]);
					$("#chref2").attr("href", "product?pid=" + item.goods_id);
					break;

				case 3:
					$("#cdesc3").text(item.goods_name);
					$("#cprice3").text("￥" + item.specifition[0].price);
					$("#cimg_3").attr("src", item.preview_img[0]);
					$("#chref3").attr("href", "product?pid=" + item.goods_id);
					break;

				case 4:
					$("#chref4").attr("href", "product?pid=" + item.goods_id);
					$("#cdesc4").text(item.goods_name);
					$("#cprice4").text("￥" + item.specifition[0].price);
					$("#cimg_4").attr("src", item.preview_img[0]);
					break;
				default:
					break;

				}

			});
		});

		$(".cargos").fadeIn(500);
	}

});
