$(document).ready(function(e) {

	$(".pay-option a").click(function(e) {
		$(".pay-option .selected").removeClass("selected");
		$(this).addClass("selected");
	});

	function sumPrice() {

		var price = 0;

		$.each($(".menu_price i"), function() {
			price = price + $(this).text() * 1;
		});

		var start_price = $(".start_price").val();

		if (price < start_price) {
			$(".d-number span").text(start_price);
		} else {
			$(".d-number span").text("0");
		}
		price = price + $(".d-number span").text() * 1;
		$(".t-number span").text(price);
		$("#totalPrice").text(price);

	}

	$(".i-add-addr").click(function(e) {
		$("#inputform").animate({
			top : '0px'
		}, "slow");
	});

	$("#confirmOrder").click(function(e) {
		var storeid = $("#storeids").val()
		var url = "ordergenerate?storeid=" + storeid;
		$.get(url, function(data, status) {
			$("body").overhang({
				type : "success",
				message : "交易完成!"
			});
		});

	});

});