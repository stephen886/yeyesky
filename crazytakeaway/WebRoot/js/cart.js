
$(document).ready(function(e) {
	
	getList();

    $(".minus").live('click',function(e) {
		
		var removeli=$(this).parent().parent();
		var menu_id=removeli.find(".cart_menu_id").val();
//		var menu_id=$(this).parent().parent().find(".menu_id").val();
        var num=$(this).parent().find(".txt-count").val();
		if(num>0){
			num=num*1-1;
			$(this).parent().find(".txt-count").val(num);
			updatecart(menu_id,num);
		}
		
		if(num<=0){
			
			var url="shopCartdelMenu?menu_id="+menu_id+"";

			$.get(url, function(data, status) {
				var obj = jQuery.parseJSON(data);
				if(obj==-1){
					alert("删除失败！！！");	
				}
			});
			removeli.remove();
		}
		
    });
	
	$(".plus").live('click',function(e) {
		
		var cart_id=$(this).parent().parent().find(".cart_menu_id").val();
		
        var num=$(this).parent().find(".txt-count").val();
		if(num<99){
			num=num*1+1;
			$(this).parent().find(".txt-count").val(num);
			updatecart(cart_id,num);
		}else{
			alert("订单数量过大,可能不能及时制作！！！");	
		}
		
    });
	
	function updatecart(id,amount){
		var url="shopCartupdateMenu?menuid="+id+"&amount="+amount+"";
	
		$.get(url, function(data, status) {
				var obj = jQuery.parseJSON(data);
				if(obj==-1){
					alert("更新失败！！！");	
				}else{
					getList();
				}
		});				
	}	
	
	$(".add_top_cart").live('click',function(e) {
		var name=$(this).parent().parent().find("h4").text();
		var price=$(this).parent().find(".only span").text();
		var menu_id=$(this).parent().parent().find(".menu_id").val();
				
		var flag=0;
		// 遍历
		$.each($(".cart_menu_id"),function(i,m){
			var cart_menu_id=$(this).val();
			var cart_id=$(this).parent().find(".cart_id").val();

			if(menu_id==cart_menu_id){
				var amount=$(this).parent().parent().find(".txt-count").val();
				amount=amount*1+1;
				updatecart(menu_id,amount);
				flag=1;
				return;
			}
		});
		
		if(flag!=1){
			
			var url="shopCartaddMenu?menuid="+menu_id+"&amount=1&price="+price+"";
			$.get(url, function(data, status) {
			
				var obj = jQuery.parseJSON(data);
				if(obj==-1){
					var storeid=$("#storeid").val();
					window.location.href="userloginOut?continueUrl=storeview?store_id="+storeid;	
				}else{
					getList();
				}
			});	
		}
		
	});
	
	$(".clear-cart").live('click',function(){
		var storeid=$("#storeid").val();
		var url="shopCartclearAll?storeid="+storeid;
		$.get(url, function(data, status) {
			var obj = jQuery.parseJSON(data);
			if(obj==-1){
				alert("删除失败！！！");	
			}
		});
		getList();
	});
	
	
	
	
	function getList(){
var storeid=$("#storeid").val();
		var url="shopCartgetMenu?storeid="+storeid;		
		$.get(url,function(condition,status){
		
		
			if(condition==null){
				$(".order-list").hide();
			}		
			else {
				$(".order-list").show();
					$(".order-list ul li").remove();
					
					var store_id=$("#store_id").val();
					$.each(condition,function(i,m){
					
						$(".order-list ul").append($('<li class="clearfix"><div class="fl na clearfix" title=""><input type="hidden" class="cart_id"  value="'+m.cartID+'" /><input type="hidden" class="cart_menu_id"  value="'+m.menu.menuID+'" /><div class="">'+m.menu.menuName+'</div></div><div class="fl modify clearfix"><a href="javascript:;" class="fl minus">-</a><input type="text" class="fl txt-count" value="'+m.amount+'" maxlength="2"><a href="javascript:;" class="fl plus">+</a></div><div class="fl pri "><span>¥<span>'+m.price*m.amount+'</span></span></div></li>'));						
					});	
					sumPrice();
			}
		});		
	}
	
	function sumPrice(){
		
		var price=0;
		var amount=0
		$.each($(".pri span span"),function(){
			price=price+$(this).text()*1;
		});
		
		
		$.each($(".txt-count"),function(){
			amount=amount+$(this).val()*1;
		});
		$(".totalnumber").text(amount);
				
		var start_price=$(".start_price span").text()*1;
		if(price<start_price){
			$(".shippingfee span").text($(".delivery-fee span span").text());
		}else{
			$(".shippingfee span").text("0");
		}
		price=price+$(".shippingfee span").text()*1;
		$(".bill").text("¥"+price);
	}
	
	
	
	
});