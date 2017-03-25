// JavaScript Document

$(document).ready(function(e) {
	
	totalorder();
	
	function totalorder(){
		
		var total=0;
		var allItem =$(".p-sum");
		for(var i=0;i<allItem.length;i++){	
				total=total+parseFloat($(allItem[i]).text());	
		}
		//alert(total);
		$("#total-price").text(total.toFixed(2));
		
	}
	
	$("#confirm").click(function(e) {
                var items=$(".goodid");

				var che="";
				for (var i = 0; i < items.length; i++) {
                        che+= items[i].value+",";
                }
				alert(che);
				
				window.location.href="addorder?cid="+che+"";
				
	});
	
    
});


