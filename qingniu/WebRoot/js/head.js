// JavaScr$("#menu1").mousemove(function(){
$(document).ready(function(){
	
	  
	$("#showcart").click(function(e) {
        window.location.href="shopcart.jsp";
    });
	
	//地址栏目
	$("#adress ").mouseover(function(e) {
        //加自己 的边框
		//$(this).css("border","1px solid silver");
		//$(this).css("border-bottom","none");
		//显示其它城市
		$(".othercity").show();
		//改变图标
	$(".locationbg").attr("src","images/up.png");
    });

	$("#adress").mouseout(function(e) {
        //去自己 的边框
		//$(this).css("border","1px solid white");
		//隐藏其它城市
		$(".othercity").hide();
		//把图标改回向下
		$(".locationbg").attr("src","images/down.png");
    });
	
	
	//微信关注
	$("#topmenu #topmenuright ul li").mouseover(function(e) {
        
		var i=$(this).index();
		
		if(i==10){
			//改变图标
			$(".locationbg").attr("src","images/up.png");
			//显示
			$("#attention").show();
		}
    });

	$("#topmenu #topmenuright ul li").mouseout(function(e) {
		var i=$(this).index();
		if(i==10){
		
				//隐藏其它
				$("#attention").hide();
				//把图标改回向下
				$(".locationbg").attr("src","images/down.png");		
		}
    });
	
	
	//目录列表
	 $(".allcargo").mouseover(function(){
		 $("#centre3").show();
	 });
	 $(".allcargo").mouseout(function(){
		  $("#centre3").hide();
	 });
	
	
  $("#container #centre3 ul li").mouseover(function(){
	var index=$(this).index();
	changbgc(index);
	//$(this).css("background-color","#ebdc36");
    $("#navbox"+(index+1)).show();	
  });
  
  $("#container #centre3 ul li").mouseout(function(){
	var index=$(this).index();
	$("#navbox"+(index+1)).stop(true,true);
    $("#navbox"+(index+1)).hide();
	
	$("#container #centre3 ul li").eq(index).css("background","none");

  });
  
  
  
  
  function changbgc(index){
	  switch(index){
		case 0:
	 $("#container #centre3 ul li").eq(index).css("background-color","#61d7f7");
		break;
		case 1:
		 $("#container #centre3 ul li").eq(index).css("background-color","#60ef60");
		break;
		case 2:
		 $("#container #centre3 ul li").eq(index).css("background-color","#b7aa00");
		break;
		case 3:
		 $("#container #centre3 ul li").eq(index).css("background-color","#8c97cb");
		break;
		case 4:
		 $("#container #centre3 ul li").eq(index).css("background-color","#009944");
		break;
		case 5:
		  $("#container #centre3 ul li").eq(index).css("background-color","#00a0e9");
		break;
		case 6:
		  $("#container #centre3 ul li").eq(index).css("background-color","#ebdc36");
		break;
		  }
	  }
	  
	  
	
		 
		 
  
  
  
});
