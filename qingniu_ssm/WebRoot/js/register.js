$(function(){
	
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		});
if(getParam("a")=='0')
{
	$('#switch_login').trigger('click');
}

	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


// 根据参数名获得该参数 pname等于想要的参数名
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        // 只有一个参数的情况
        return params.split('=')[1]; 
    } 
    else { 
         // 多个参数参数的情况
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  


var reMethod = "GET",
	pwdmin = 6;

$(document).ready(function() {
	// 验证码
	var randomNUM=parseInt(999999*Math.random()); 
	var time=60;
	var timer;
	var isSSend=false;// 是否已经发送邮件
	$("#send").click(function() {
		if ($('#email').val() == "") {
			$('#userCue').html("<font color='red'><b>×邮箱不能为空</b></font>");
			$("#send").attr("value","发送");
			return false;
		}
		
		var isemail=check_email($('#email').val());
		if (!isemail) {
			$('#userCue').html("<font color='red'><b>×邮箱格式不正确</b></font>");
			$("#send").attr("value","发送");
			return false;
		} 
		
		
		
		// 邮箱是否已经注册
		
		var url="register?act=check_username&user_name="+isemail;
		loadXMLDoc(url);
		$('#userCue').html("<font color='red'><b>该邮箱已注册！"+res+"</b></font>"); 
		if(res=="true"){
			return;
		}
		
		
		
		
		
		
		
		
		if(isSSend==false){
		
			$('#userCue').html("<font color='blue'><b>邮件已经发送</b></font>");
			randomNUM=parseInt(999999*Math.random()); 
			
			
			
			// 显示的倒计时
			timer=setInterval(showTime, 1000);  
			isSSend=true;
			
			// 发送邮件
			var to=$("#email").val();
			var zhuti="注册验证码";
			var neirong="欢迎注册青牛网,你的验证码为"+randomNUM;
			var url="SendEmail?to="+to+"&zhuti="+zhuti+"&neirong="+neirong;
			loadXMLDoc(url);	
		}
		
		
		
		
		
		
		
	});
	
	function  showTime(){
		time--;
		if(time==0){
			time=60;
			isSSend=false;
			$("#send").attr("value","发送");
			clearInterval(timer);  
		}else{
		
   		$("#send").attr("value",time+"s");
		}
		
	}
	
	


	$('#reg').click(function() {
		// 还原表单样式
		if ($('#user').val() == "") {
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			return false;
		} 


		
		if ($('#user').val().length < 4 || $('#user').val().length > 16) {
			$('#userCue').html("<font color='red'><b>×用户名为4-16字符</b></font>");
			return false;

		}
		
		var isuser=check_user($('#user').val());
		if(!isuser){
			$('#userCue').html("<font color='red'><b>×用户名由数字，字母和下划线组成</b></font>");
			return false;
		}
		
		
		
		
		
		if ($('#auth_code').val() == "") {
			$('#userCue').html("<font color='red'><b>验证码不能为空</b></font>");
			return false;
		}
		
		if ($('#auth_code').val()!=randomNUM) {
			
			$('#userCue').html("<font color='red'><b>验证码不正确</b></font>");
			time=60;
			isSSend=false;
			$("#send").attr("value","发送");
			clearInterval(timer); 
			
			return false;
		}
		
		
		
		$.ajax({
			type: reMethod,
			url: "/member/ajaxyz.php",
			data: "uid=" + $("#user").val() + '&temp=' + new Date(),
			dataType: 'html',
			success: function(result) {

				if (result.length > 2) {
					$('#user').focus().css({
						border: "1px solid red",
						boxShadow: "0 0 2px red"
					});$("#userCue").html(result);
					return false;
				} else {
					$('#user').css({
						border: "1px solid #D7D7D7",
						boxShadow: "none"
					});
				}

			}
		});


		if ($('#passwd').val().length < pwdmin) {
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			return false;
		} 
		if ($('#passwd2').val() != $('#passwd').val()) {
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			return false;
		} 
		
		
		// 用户是否已经注册
		var user=$("#user").val();
		var url="register?act=check_username&user_name="+user;
		var res=loadXMLDoc(url);
		$('#userCue').html("<font color='red'><b>该用户已注册！"+res+"</b></font>"); 
		if(res=="true"){
			return false;
		}
		
		

		$('#regUser').submit();
	});
	
	
	// 检查手机号码
function check_mobile(mobile){
	if(mobile.length != 11 || isNaN(mobile)){
		return false;
	}
	mobile = mobile.substr(0,3);
	// 号段
	var hd = new Array('130','131','132','133','134','135','136','137','138','139','150','151','152','153','154','155','156','157','158','159','180','181','182','183','184','185','186','187','188','189');
	var i = hd.length;
	while (i--) {
		if (hd[i] == mobile) {
			return true;
		}   
	}   
	return false;
}

	// 验证邮箱是否正确
	function check_email(email){
		var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if(!reg.test(email)){
			return false;
		}else{
			return true;
		}
	}
	// 验证用户名格式

		function check_user(user){
		var reg = /^\w+$/;
		if(!reg.test(user)){
			return false;
		}else{
			return true;
		}
	}
	
	// 网络通讯
	function loadXMLDoc(url)
	{
	// 创建一个请求对象
			var xmlhttp;
			if(window.XMLHttpRequest){
				xmlhttp=new XMLHttpRequest();
			}else{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			// 设置一个监听函数
			xmlhttp.onreadystatechange=function(){
				if(xmlhttp.readyState==4 && xmlhttp.status==200){
					 $("#userCue").html(xmlhttp.responseText);
					//$('#userCue').html("<font color='red'><b>该用户已注册！"+xmlhttp.responseText+"</b></font>"); 
					//return xmlhttp.responseText;
				}
			}
			
			xmlhttp.open("post",url, true);
			xmlhttp.send();
	}
		

	
	  
  
  
	
		

	});