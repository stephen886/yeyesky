// JavaScript Document
	
$(document).ready(function(e) {	
	
	var picArray=new Array();
	$("#samplebox ul li img").each(function(index, element) {
        picArray.push($(this).attr("src"));
    });
	
	var picNo=0;
	var myClock=setInterval(function(){nextPic();},2000);
	function nextPic(){
		picNo=picNo+1;
		if(picNo>=picArray.length){
			picNo=0;
			}	
		move(picNo);
		
	}
	$("#samplebox ul li").mouseover(function(e) {
        picNo=$(this).index();
		move(picNo);
		window.clearInterval(myClock);
    });
	
	function move(i){
		$(".bannerImg").attr("src",picArray[i]);
		$(".change").removeClass("change");
		$("#samplebox ul li").eq(i).addClass("change");		
		}
	
	$("#samplebox ul li").mouseout(function(e) {
        myClock=setInterval(function(){nextPic();},2000);
		
    });
	
	$(".choose_list ul li").click(function(e) {
         list_no=$(this).index();
		 $(".selected").removeClass("selected");
		 $(".gou").removeClass("gou");
		 $(".choose_list ul li").eq(list_no).addClass("selected");
		 $(".choose_list ul li").eq(list_no).addClass("gou");
		 var price=$(".selected span b").text();
		 $("#price strong").text(price);
    });
	
	$("#product_detail").click(function(e) {
        $("#comment").css("display","none");
		$("#details").css("display","block");
		$("#product_detail").addClass("active");
		$("#user_comment").removeClass("active");
    });
	
	$("#user_comment").click(function(e) {
        $("#comment").css("display","block");
		$("#details").css("display","none");
		$("#user_comment").addClass("active");
		$("#product_detail").removeClass("active");
    });
	
	$(".p_box").mouseover(function(e) {
        $(this).find(".addtocar").show();
    });
	
	$(".p_box").mouseout(function(e) {
        $(this).find(".addtocar").hide();
    });

	
});


	function increase(){
		var num=document.getElementById("p_number");
		num.value=num.value*1+1;
		}
	
	function reduce(){
		var num=document.getElementById("p_number");
		if(num.value>1){
		num.value=num.value*1-1;
		}
	}