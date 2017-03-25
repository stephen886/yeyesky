
$(document).ready(function(e) {
    $(".pay-option a").click(function(e) {
        $(".pay-option .selected").removeClass("selected");
		$(this).addClass("selected");
    });
	
	var prices=$(".td-inner").find("i");

	var total=new Array(prices.length);

	for(var i=0;i< prices.length;i++){
		
	}
	
	
	
});