// JavaScript Document
	
$(document).ready(function(e) {	
	
	$(".choose_list ul li").first().addClass("gou selected");
	getprice();
	var picArray=new Array();
	$("#samplebox ul li img").each(function(index, element) {
        picArray.push($(this).attr("src"));
    });
	
	var picNo=0;
	var myClock=setInterval(function(){nextPic();},2000);
	function nextPic(){
		picNo=picNo+1;
		if(picNo>4){
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
		 totalprice();
		 getprice();
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
	
	$(".reduce").click(function(e) {
        var num=document.getElementById("p_number");
		if(num.value>1){
		num.value=num.value*1-1;
		totalprice();
		}
    });
	
	$(".increase").click(function(e) {
        var num=document.getElementById("p_number");
		num.value=num.value*1+1;
		totalprice();
    });
	
	function totalprice(){
		var num=document.getElementById("p_number").value;
		var price=$(".selected span b").text();
		price=price*num;
		$("#price strong").text(price);
	}
	
	$("#backtop").click(function(e) {
        $("html,body").animate({scrollTop:0},"slow");
    });
	
	$(window).scroll(function(e) {
        if($(window).scrollTop()<100){
			$("#backtop").hide();
		}else{
			$("#backtop").show();
		}
    });
	
	function getprice(){
		$("#pprice").val($(".selected span b").text());
	}
	
});


	