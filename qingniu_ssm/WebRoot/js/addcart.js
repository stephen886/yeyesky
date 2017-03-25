// JavaScript Document

$(document).ready(function(e) {
    getnum();
	
	var num=$("#pnum span").text()*1;
	if(num>0){
		$("#pnum").show();
	}else{
		$("#pnum").hide();
	}
	
	$("#sendcart").click(function(e) {
		var pamount=$("#p_number").val();
		var pprice=$("#pprice").val();
		var pid=$("#pid").val();
		$.post("addcart",{pamount:pamount,pprice:pprice,pid:pid},function(data){
			if(data.result==1){
				getnum();
			}else if(data.result==-1){
				alert("用户未登录，请先登录！");
				window.location.href="login.html";
			}else{
				alert("添加失败！")
			}
		},"json");
    });
	
	
	function getnum(){
		$.get("getCartNum",null,function(data){
			if(data.result==1){
				$("#pnum span").text(data.data);
				$("#pnum").show();
			}
		},"json");
	}
});