// JavaScript Document
$(document).ready(function(e) {
	
	
    $("#searchtxt").keyup(function(e) {
        var key=$(this).val();
		if(key.trim()==""||key==null){
			$(".searchRs ul").html("");
			return;
		}
		$.get("getName",{key:key},function(data){
			$(".searchRs ul").html("");		
			if(data.result==1){
				$(".searchRs").show();
				$.each(data.data,function(i,group){	
				if(i<10){	
					$(".searchRs ul").append($('<li class="showRsp">'+group.goods_name+'</li>'));					
				}
				});
				addFun();
			}
			else{
				$(".searchRs").show();
					$(".searchRs ul").html("").append("<li class='notfound'>未找到此商品！</li>");
				}
			},"json");
		
    });
	
	function addFun(){
		$(".searchRs ul li").mouseover(function(){
			$(this).css("background-color","#CCC");
			$(this).css("cursor","pointer");	
		});
		$(".searchRs ul li").mouseout(function(){
			$(this).css("background-color","#FFF");	
		});
		
		$(".searchRs ul li").click(function(e) {
            $("#searchtxt").val($(this).text());
			$(".searchRs").hide();
        });
		
		
	}
	
	$("#searchbtn").click(function(e) {
		var key=$("#searchtxt").val();
		if(key.trim()==""||key==null){
			alert("请输入关键词");
		}else{
			window.location.href="getSearch?key="+key+"";
		}
    });
	
	/*$(".h_search input").blur(function(e) {
        $(".searchRs").hide();
    });
*/
});