// JavaScript Document

$(document).ready(function(e) {
	
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
	
    
});


