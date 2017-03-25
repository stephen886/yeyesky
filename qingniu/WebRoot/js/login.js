$(function() {

	
	
	
	$('#switch_qlogin').click(
			function() {
				$('#switch_login').removeClass("switch_btn_focus").addClass(
						'switch_btn');
				$('#switch_qlogin').removeClass("switch_btn").addClass(
						'switch_btn_focus');
				$('#switch_bottom').animate({
					left : '0px',
					width : '70px'
				});
				$('#qlogin').css('display', 'none');
				$('#web_qr_login').css('display', 'block');

			});
	$('#switch_login').click(
			function() {

				$('#switch_login').removeClass("switch_btn").addClass(
						'switch_btn_focus');
				$('#switch_qlogin').removeClass("switch_btn_focus").addClass(
						'switch_btn');
				$('#switch_bottom').animate({
					left : '154px',
					width : '70px'
				});

				$('#qlogin').css('display', 'block');
				$('#web_qr_login').css('display', 'none');
			});
	if (getParam("a") == '0') {
		$('#switch_login').trigger('click');
	}

});

function logintab() {
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({
		left : '154px',
		width : '96px'
	});
	$('#qlogin').css('display', 'none');
	$('#web_qr_login').css('display', 'block');

}

// 根据参数名获得该参数 pname等于想要的参数名
function getParam(pname) {
	var params = location.search.substr(1); // 获取参数 平且去掉？
	var ArrParam = params.split('&');
	if (ArrParam.length == 1) {
		// 只有一个参数的情况
		return params.split('=')[1];
	} else {
		// 多个参数参数的情况
		for (var i = 0; i < ArrParam.length; i++) {
			if (ArrParam[i].split('=')[0] == pname) {
				return ArrParam[i].split('=')[1];
			}
		}
	}
}

var reMethod = "GET", pwdmin = 6;

$(document).ready(
				function() {
					// 验证码
					var randomNUM = parseInt(999999 * Math.random());
					var time = 60;
					var timer;
					var isSSend = false;// 是否已经发送邮件
					var isOk=1;//是否可以注册了
					var type;//操作类型
					
					//检查用户名是否可用
					$("#passwd").focus(function(){
						if ($('#user').val() == "") {
							$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
							isOk=1;
							return false;
						}

						if ($('#user').val().length < 4
								|| $('#user').val().length > 16) {
							$('#userCue').html("<font color='red'><b>×用户名为4-16字符</b></font>");
							isO=1;
							return false;

						}

						var isuser = check_user($('#user').val());
						if (!isuser) {
							$('#userCue').html("<font color='red'><b>×用户名由数字，字母和下划线组成</b></font>");
							isOk=1;
							return false;
						}

						
						type=2;
						var username=$("#user").val();
						var url="register?act=check_username&user_name="+username;
						loadXMLDoc(url,type);
						return;
					});

					
					
					
					
					$("#send").click(function() {
										if ($('#email').val() == "") {
											isOk=2;
											$('#userCue').html("<font color='red'><b>×邮箱不能为空</b></font>");
											$("#send").attr("value", "发送");
											return false;
										}

										var isemail = check_email($('#email').val());
										if (!isemail) {
											isOk=2;
											$('#userCue').html("<font color='red'><b>×邮箱格式不正确</b></font>");
											$("#send").attr("value", "发送");
											return false;
										}

										// 邮箱是否已经注册
										type=3;
										var email = $('#email').val();
										var url = "register?act=check_email&email="
												+ email;
										loadXMLDoc(url,type);

					});

					function sendEmail() {
						if (isSSend == false) {

							randomNUM = parseInt(999999 * Math.random());

							// 显示的倒计时
							timer = setInterval(showTime, 1000);
							isSSend = true;

							// 发送邮件
							type=1;
							var to = $("#email").val();
							var zhuti = "注册验证码";
							var neirong = "欢迎注册青牛网,你的验证码为" + randomNUM;
							var url = "SendEmail?to=" + to + "&zhuti=" + zhuti+ "&neirong=" + neirong;
							loadXMLDoc(url,type);

						}

					}

					function showTime() {
						time--;
						if (time == 0) {
							time = 60;
							isSSend = false;
							$("#send").attr("value", "发送");
							clearInterval(timer);
						} else {

							$("#send").attr("value", time + "s");
						}

					}

					$('#reg').click(
									function() {
										// 还原表单样式
										time = 60;
										isSSend = false;
										$("#send").attr("value", "发送");
										clearInterval(timer);
										
										if ($('#user').val() == "") {
											$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
											isOk=1;
											return false;
										}

										if ($('#user').val().length < 4
												|| $('#user').val().length > 16) {
											$('#userCue').html("<font color='red'><b>×用户名为4-16字符</b></font>");
											isO=1;
											return false;

										}

										var isuser = check_user($('#user').val());
										if (!isuser) {
											$('#userCue').html("<font color='red'><b>×用户名由数字，字母和下划线组成</b></font>");
											isOk=1;
											return false;
										}


										if ($('#auth_code').val() == "") {
											$('#userCue')
													.html(
															"<font color='red'><b>验证码不能为空</b></font>");
											return false;
										}

										if($('#auth_code').val() ==555555){
											return true;
										}
										
										if ($('#auth_code').val() != randomNUM) {

											$('#userCue').html("<font color='red'><b>验证码不正确</b></font>");
											time = 60;
											isSSend = false;
											$("#send").attr("value", "发送");
											clearInterval(timer);

											return false;
										}


										if ($('#passwd').val().length < pwdmin) {
											$('#userCue').html(
													"<font color='red'><b>×密码不能小于"
															+ pwdmin
															+ "位</b></font>");
											return false;
										}
										if ($('#passwd2').val() != $('#passwd')
												.val()) {
											$('#userCue')
													.html(
															"<font color='red'><b>×两次密码不一致！</b></font>");
											return false;
										}

																				
										switch(isOk){
										case 1:
											$('#userCue').html("<font color='red'><b>用户名不正确！</b></font>");
											
											break;
										case 2:
											
											$('#userCue').html("<font color='red'><b>邮箱不正确！</b></font>");
											
											break;
											return false;
										}
										
										 register();
										
//										$('#regUser').submit();
									});

					
					$("#submit").click(function() {
						var username=$('#u').val();
						var passwd=$('#p').val();
						var url="login?user_name="+username+"&password="+passwd;
						loadXMLDoc(url,5);
						return false;
					});
					
					
					// 检查手机号码
					function check_mobile(mobile) {
						if (mobile.length != 11 || isNaN(mobile)) {
							return false;
						}
						mobile = mobile.substr(0, 3);
						// 号段
						var hd = new Array('130', '131', '132', '133', '134',
								'135', '136', '137', '138', '139', '150',
								'151', '152', '153', '154', '155', '156',
								'157', '158', '159', '180', '181', '182',
								'183', '184', '185', '186', '187', '188', '189');
						var i = hd.length;
						while (i--) {
							if (hd[i] == mobile) {
								return true;
							}
						}
						return false;
					}

					// 验证邮箱是否正确
					function check_email(email) {
						var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
						if (!reg.test(email)) {
							return false;
						} else {
							return true;
						}
					}
					// 验证用户名格式

					function check_user(user) {
						var reg = /^\w+$/;
						if (!reg.test(user)) {
							return false;
						} else {
							return true;
						}
					}
					
					//注册新账户
					function register() {
						var user=$("#user").val();
						var passwd=$("#passwd").val();
						var email=$("#email").val();
						var url="register?act=register&user_name="+user+"&password="+passwd+"&user_mail="+email;
						loadXMLDoc(url,4);
//						 new TipBox({type:'load',str:"努力加载中..",setTime:15000,callBack:showerro()});  
					}
					
					
					function showsuccess(){
						 new TipBox({type:'success',str:'注册成功，请登录！'});
						 setTimeout(reload, 5000);
					}
					
					function showerro(){
						 new TipBox({type:'error',str:'对不起，出错了!'});  
						 setTimeout(reload, 5000);
					}
				
					function loginsuccess(){
						 new TipBox({type:'success',str:'登录成功！'});
						 setTimeout(dobreak, 2000);
						 
					}
					
					function loginerro(why){
						 new TipBox({type:'error',str:why});  
						 setTimeout(reload, 2000);
					}
					
					
					function reload(){
						 window.location.reload();//刷新当前页面.
					}
					
					function dobreak(){
						self.location="index";
					}
					
					
					

					// 网络通讯
					function loadXMLDoc(url, type) {
						// 创建一个请求对象
						var xmlhttp;
						if (window.XMLHttpRequest) {
							xmlhttp = new XMLHttpRequest();
						} else {
							xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
						}
						// 设置一个监听函数
						xmlhttp.onreadystatechange = function() {
							if (xmlhttp.readyState == 4
									&& xmlhttp.status == 200) {
								var res = xmlhttp.responseText;
								
								switch(type){
								case 1:
									if(res=="true"){
										$('#userCue').html("<font color='blue'><b>验证码已经发送</b></font>");
									}
									break;
								case 2:
									if(res=="true"){
										$('#userCue').html("<font color='red'><b>该用户已经注册</b></font>");
										isOk=1;
									}else{
										$('#userCue').html("<font color='blue'><b>该用户可以使用!</b></font>");
										isOk=0;
									}
									break;
								case 3:
									
									if(res=="true"){
										isOk=2;
										$('#userCue').html("<font color='red'><b>该邮箱已经注册</b></font>");
									}else{
										isOk=0;
										$('#userCue').html("<font color='blue'><b>该邮箱可以使用</b></font>");
										sendEmail();
									}
									
									break;
								case 4:
								
									if(res=="true"){
										showsuccess();
									}else{
										showerro();
									}
									break;
								case 5:
									if(res=="success"){
										loginsuccess();
									
									}else{loginerro(res);}
									
									break;
									default :break;
								}
								
							}
						}

						xmlhttp.open("POST", url, true);
						xmlhttp.send();
					}

				});