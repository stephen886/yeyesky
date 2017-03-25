
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
	
	
	
	var page=1;
	var status=false;//保存是否已经全部加载完毕的状态
	
	$(window).scroll(function () {
        //$(window).scrollTop()这个方法是当前滚动条滚动的距离
        //$(window).height()获取当前窗体的高度
        //$(document).height()获取当前文档的高度
		
        var bot =318; //bot是底部距离的高度
        if ((bot + $(window).scrollTop()) >= ($(document).height() - $(window).height())) {
           //当底部基本距离+滚动的高度〉=文档的高度-窗体的高度时；
            //我们需要去异步加载数据了
          
		   ++page;
		   var adressstr=$("#curr-location").text();
		   var totalpage=$("#totalpage").val();
		   if(status){
			   return;
		   }
		   
		   if(page==2){
			   $("body").overhang({
					type: "info",
					message: "一共有"+totalpage+"页",
					duration: 2
				}); 
		   }
		   
		   if(page>totalpage){
			   $("body").overhang({
					type: "success",
					message: "没有数据了",
					duration: 2
				});
			   status=true;
			   return;
		   }
		   var url="storesearchJson?adress="+adressstr+"&page="+page; 
		  
           $.get(url,function(data){
//        	   var obj = jQuery.parseJSON(data);
   
				$.each(data,function(i,object){
					 var url2="storeview?store_id="+object.storeID;
					$(".rest-list ul").append($('<li class="rest-li fl"> <div class="rest-outer transition "> <a href='+url2+' class="rest-atag"> <div class="top-content"> <div class="preview"> <img src="img/store_img/'+object.storeImg+'"> </div> <div class="content"> <div class="name"> <span>'+object.storename+'</span> </div> <div class="rank clearfix"> <span class="star-ranking fl"> <span class="star-score" style="width: 90%"> </span> </span> <span class="score-num fl"> 4.7分 </span> <span class="total fr"> 月售226单 </span>  </div> <div class="price"> <span class="start-price"> 起送￥15 </span> <span class=""> 免配送费 </span> <span class="send-time"> <i class="icon i-poi-timer"></i> 22分钟 </span> </div> </div> <div class="clear"></div> </div>  <div class="others"> <div class="discount"> <i class="icon i-pay"></i> <i class="icon i-reduce" title="减价"></i> <i class="icon i-first" title="首订优惠"></i> <i class="icon i-discount" title="优惠"></i> <i class="icon i-give" title="赠送"></i> <i class="icon i-group" title="团购卷"></i> </div>  </div> </a> </div> </li>'));

				});
			});

        }
    });
	
});
