// JavaScript Document

$(document).ready(function(e) {
	
    $(".reduce,.increase").click(function(e) {
        var cid=$(this).parent().find(".cid").val();
		var pamount=$(this).parent().find(".p_number").val()
		$.post("updatecart",{cid:cid,pamount:pamount},function(data){
			if(data.result==1){
				
			}
		},"json");
    });
});