
$(document).ready(function(e) {
	
	$(".rest-li").mouseover(function(e){
		$(this).addClass("hover");
	});
	$(".rest-li").mouseout(function(e){
		$(this).removeClass("hover");
	});
	
	$(".prices").mouseover(function(e) {
        $(".prices ul").show();
		$(".prices ul").mouseout(function(e) {
			$(this).hide();
		});
		$(".prices ul li").click(function(e) {
             $(".prices ul").hide();
			 $(".all").text($(this).text());
        });
    });
	
	$(".prices ul li").mouseover(function(e) {
        $(this).css("background-color","#CCC");
    });
	
	$(".prices ul li").mouseout(function(e) {
        $(this).css("background-color","white");
    });
	
	
	$(".sort-filter a").click(function(e) {
        
		var index =$(this).attr("data-sort");
		if(index==1||index==2){
			$(".i-orderdown-click").removeClass("i-orderdown-click");
			$(this).find("i").addClass("i-orderdown-click");
			$(".i-orderup-click").removeClass("i-orderup-click");
			$(".ti-sort").find("i").addClass("i-orderup");
			$(".active").removeClass("active");
			$(this).addClass("active");	
		}
		else if(index==3){
			$(".i-orderdown-click").removeClass("i-orderdown-click");
			$(this).find("i").addClass("i-orderup-click");
			$(".active").removeClass("active");
			$(this).addClass("active");
		}
		else if(index==0){
			$(".i-orderdown-click").removeClass("i-orderdown-click");
			$(".i-orderup-click").removeClass("i-orderup-click");
			$(".active").removeClass("active");
			$(this).addClass("active");
		}
		
    });
	
	$(".rest-filter .checkbox").toggle(function(){
			$(this).addClass("checked");
		},function(){
			$(this).removeClass("checked");
	});
	
	$(".imgsort-content li").click(function(e) {
        $(".imgsort-content").find(".selected").removeClass("selected");
		$(this).addClass("selected");
    });
	
});
