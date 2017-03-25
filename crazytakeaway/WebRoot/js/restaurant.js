$(document).ready(function() {
	var storeid = $("#storeid").val();
	$("#store_blok").mouseover(function() {
		$("#store_hiddle_info").show();
	});

	$("#store_blok").mouseout(function() {
		$("#store_hiddle_info").hide();
	});
	
	 $(".example--1").click(function () {
    $("body").overhang({
      type : "success",
      message: "Woohoo! Our message works!"
    });
  });

	//收藏操作的js
	$("#collect").click(function() {
		var collectid = $("#collectID").val();
		if(collectid != 0) {
			//执行取消收藏的操作
			$.get("collectCanel?store_id=" + storeid, function(data, status) {
//				alert("Data: " + data + "\nStatus: " + status);
				if(data == -1) {
					//跳转登录
					$("body").overhang({
						type: "success",
						message: "亲！你还没登录呢",
						duration: 2
					});
					setTimeout(goherf, 3000);
				} else {
					$("body").overhang({
						type: "error",
						message: "已经取消收藏!",
						duration: 2
					});
					$("#collectID").val("0");
					var num = parseInt($("#collectmun").text());
					num = num - 1;
					$("#collectmun").text(num);
					$("#collect").css("color", "gray");

				}
			});

		} else {
			$.get("collectStore?store_id=" + storeid, function(data, status) {
//				alert("Data: " + data + "\nStatus: " + status);
				if(data != 0) {
					$("body").overhang({
						type: "success",
						message: "收藏成功!",
						duration: 2,
						upper: true
					});
					$("#collectID").val("22");
					var num = parseInt($("#collectmun").text());
					num = num + 1;
					$("#collectmun").text(num);
					$("#collect").css("color", "red");
				}
			});

			

			
		}
	});

	function goherf() {
		location.href = "userloginOut?continueUrl=storeview?store_id=" + storeid;
	}

});