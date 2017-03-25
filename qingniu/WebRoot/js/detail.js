// JavaScript Document

$(document).ready(function(e) {
	
	var i=0;
    $(".filter_sort li").click(function(e) {
        list_no=$(this).index();
		$(".on").removeClass("on");
		$(".filter_sort li").eq(list_no).addClass("on");
		if(list_no==1||list_no==3){
			$(".sort_gou").removeClass("sort_gou");
			$(".sort_up").removeClass("sort_up");
			$(".down_gou").removeClass("down_gou");
			$(".filter_sort li").eq(list_no).find("i").addClass("down_gou");
			i=0;
		}else if(list_no==2){
			$(".sort_gou").removeClass("sort_gou");
			$(".sort_up").removeClass("sort_up");
			$(".down_gou").removeClass("down_gou");
			if(i==0){
				$(".filter_sort li").eq(list_no).find("i").addClass("sort_gou");
				i=1;
			}else{
				$(".filter_sort li").eq(list_no).find("i").addClass("sort_up");
				i=0;
			}
		}else if(list_no==0){
			$(".sort_gou").removeClass("sort_gou");
			$(".sort_up").removeClass("sort_up");
			$(".down_gou").removeClass("down_gou");
			}
    });
	
	$(".product").mouseover(function(e) {
        $(this).find(".addtocar").show();
    });
	
	$(".product").mouseout(function(e) {
        $(this).find(".addtocar").hide();
    });
	
	/*function showRS(){
		var key=$("#searchtxt").val();
		alert(key);	
		$.get("getName",{key:key},function(data){
			$(".goods_list ul").html("");
			alert(data.result);		
			if(data.result==1){
				$.each(data.data,function(i,group){	
					$(".goods_list ul").append($('<li><div class="product"><div class="addtocar"><span>加入购物车</span></div><div class="p_img"><a href="#"><img src="images/'+group.preview_img+'" /></a></div><div class="p_info"><div class="p_name"><a href="#">'+group.goods_name+'</a></div><div class="p_price"><strong>&yen;<b>'+group.specifition[0].price+'</b></strong></div></div></div></li>'));
				});
			}
			else{
				$(".searchRs").show();
					$(".goods_list ul").html("").append("<li class='notfound'>未找到此商品！</li>");
				}
			},"json");
	}*/
	
	
	$(".addtocar").click(function(e) {
		var pprice=$(this).find("#pricetxt").val();
		var pid=$(this).find("#pidtxt").val();
		$.post("addcart",{pprice:pprice,pid:pid},function(data){
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