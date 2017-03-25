// JavaScript Document


$(document).ready(function(e) {
	
        showcart();
		guesslike();

	$("#showcart").click(function(e) {
        showcart();
    });
	
	
function showcart(){
    $.post("showcart",null,function(data){
		if(data.result==1){
			$("#cart-list").html("");
			$(".cart-bar,.ht-cart").show();
			$.each(data.data,function(i,group){
				$("#cart-list").append(
						$('<div class="item-form"><input type="checkbox" class="checkItem" name="checkItem" value="'+group.cart_id+'" /><div class="p-goods"><div class="p-img"><a href="product?pid='+group.goods_id+'"><img src="images/preview_img/'+group.preview_img+'" /></a></div><div class="p-msg"><a href="product?pid='+group.goods_id+'">'+group.commodity_name+'</a></div></div><div class="p-props"></div><span class="p-price">'+group.goods_price+'</span><div class="p-quantity"><button class="reduce" >-</button><input class="p_number" type="text" maxlength="2" value="'+group.goods_amount+'" /><button class="increase" >+</button><input class="cid" type="hidden" value="'+group.cart_id+'" /></div><span class="p-sum">'+group.goods_price*group.goods_amount+'</span><div class="p-ops"><a href="" class="delcart">删除</a></div></div>'));
			})
						
			
			$(".checkItem").click(function(e) {
				if($(this).is(":checked")){
					$(this).parent().addClass("changbg");	
				}else{
					$(this).parent().removeClass("changbg");
					$(".selectAll").attr("checked", false);
				}
				total();
			});
			
			
			$(".selectAll").click(function(e) {
				if ($(".selectAll").attr("checked")) {  
					$(".checkItem").attr("checked", true);
					$(".checkItem").parent().addClass("changbg");  
				} else {  
					$(".checkItem").attr("checked", false);
					$(".checkItem").parent().removeClass("changbg");
				}
				total();
			});
			
			$(".reduce").click(function(e) {
				var num=$(this).parent().find(".p_number");
				if(num.val()>1){
					num.val((num.val()-1));
				}
				var price=$(this).parent().parent().find(".p-price");
				var sum=$(this).parent().parent().find(".p-sum");
				sum.text((price.text()*1.0*num.val()).toFixed(2));
				total();
			});
			
			$(".increase").click(function(e) {
				var num=$(this).parent().find(".p_number");		
				num.val((num.val()*1+1));
				var price=$(this).parent().parent().find(".p-price");
				var sum=$(this).parent().parent().find(".p-sum");
				sum.text((price.text()*1.0*num.val()).toFixed(2));
				total();
			});
			
			function total(){
				
				var total=0;
				var allItem =$(".checkItem");
				for(var i=0;i<allItem.length;i++){
					if(allItem[i].checked==true){
						total=total+parseFloat($(allItem[i]).parent().find(".p-sum").text());
					}	
				}
				//alert(total);
				$("#total-price").text(total.toFixed(2));
				
			}
			
			$(".reduce,.increase").click(function(e) {
				var cid=$(this).parent().find(".cid").val();
				var pamount=$(this).parent().find(".p_number").val()
				$.post("updatecart",{cid:cid,pamount:pamount},function(data){
					if(data.result==1){
						showcart();
					}
				},"json");
			});
			
			
			$(".delcart").click(function(e) {
				var cid=$(this).parent().parent().find(".cid").val();
				alert(cid);
				$.post("delcart",{cid:cid},function(data){
					if(data.result==1){
						showcart();
					}
				},"json");
			});
			
			$("#tosum").click(function(e) {
                var items=document.getElementsByClassName("checkItem");

				var che="";
				for (var i = 0; i < items.length; i++) {
                    if (items[i].checked) {
                        che+= items[i].value*1+",";
                    }
                }
				alert(che);
				
				window.location.href="showorder?cid="+che+"";
				
              /* $.get("showorder",{cid:che},function(data){
				   $(".content").html("");
				   if(data.result==1){
					   $("#cart-list").html("");
						$(".cart-bar,.ht-cart").show();
						$("#cart-list").append($('<div class="cart-bar"><span>全部商品</span></div><div class="ht-cart"><div class="cart-thead"><div class="t-checkbox"><span>选择</span></div><div class="t-goods">商品</div><div class="t-props"></div><div class="t-quantity">数量</div><div class="t-sum">小计（元）</div></div><div id="cart-list">'));
					   $.each(data.data,function(i,group){			   		
						$("#cart-list").append($('<div class="item-form"><div class="p-goods"><div class="p-img"><a href="#"><img src="images/'+group.preview_img+'" /></a></div><div class="p-msg"><a href="#">'+group.commodity_name+'</a></div></div><div class="p-props"></div><div class="p-quantity"><span class="p_number">'+group.goods_amount+'</span></div><span class="p-sum">'+group.goods_price*group.goods_amount+'</span></div></div>'));
						})
						$("#cart-list").append($('<div class="cart-footbar"><div class="f-checkbox"></div><div class="f-price">总价：<span>&yen;<b id="total-price">0.00</b></span></div><div class="btn-area"><a href="#"><span>确认订单</span></a></div></div></div>'));
				   }else{
					   $(".content").append($(<span>提交订单失败</span>));
				   }
			   },"json");
*/

            });
			
			
		}else if(data.result==-1){
			$(".cart-bar,.ht-cart").hide();
			$(".content").append('<div class="emptycart"><div class="eptxt"><img src="images/shopping_cart.png" />您的购物车还是空的，赶紧行动吧！您可以:<a href="index">随便逛逛</a></div></div>');			
		}else if(data.result==0){
			$(".cart-bar,.ht-cart").hide();
			$(".content").append('<div class="emptycart"><div class="eptxt"><img src="images/shopping_cart.png" />购物车内暂时没有商品，登录后将显示您之前加入的商品：<a href="login.html">登录</a></div></div>');	
		}
	},"json");
}


	$(".guessyoulike").click(function(e) {
        guesslike();
    });
	
	
	function guesslike(){
		$(".cargobox").html("");
		$.post("guess",null,function(data){
			$.each(data.other,function(i,group){
				if(i<4){
					$(".cargobox").append($('<div class="cargo"><a href="product?pid='+group.goods_id+'"><img src="'+group.preview_img[0]+'" width="160" height="160" /></a><div class="description">'+group.goods_name+'</div><div class="price">￥'+group.specifition[0].price+'</div></div>'));
				}		
			});
		},"json");
	}
	

			$(".changeCargo img").mouseover(function(){
					$(this).attr("src","images/change2.png");		
					$(this).css("cursor","pointer");			
			});
				 
				 
			$(".changeCargo img").mouseout(function(){
				$(this).attr("src","images/change1.png");		
			});
			
			 $(".changeCargo img").mousedown(function(){
				$(".cargos").fadeOut(500);
				$(".cargos").fadeIn(500);			
			 });
	
	
});