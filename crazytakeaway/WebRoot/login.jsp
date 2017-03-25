<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE html>
<html lang="zh-CN">
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>登陆丨Sharelink</title>
<link rel="stylesheet" href="css/login_singin.css">
<link rel="stylesheet" href="css/mdialog.css" />
<link rel="icon" href="img/favicon-16x16.png" size="16x16 32x32">
<body>

	<div class="login-container">
		<h1>疯了么</h1>

		<div class="connect">
			<p>连接世界，分享世界！</p>
		</div>

		<form id="loginForm">
			<div>
				<input type="text" name="user_name" class="username"
					placeholder="用户名" autocomplete="off" />
			</div>
			<div>
				<input type="password" name="password" class="password"
					placeholder="密码" oncontextmenu="return false"
					onpaste="return false" />
			</div>
			<button id="submit" type="button">登 陆</button>
		</form>

		<a href="register.jsp">
			<button type="button" class="register-tis">还有没有账号？</button>
		</a>

	</div>

</body>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>

<script type="text/javascript" src="js/zepto.min.js"></script>
<script type="text/javascript" src="js/mdialog.js"></script>

<script type="text/javascript">
	//成功  
	var conutin = 'index.jsp';
	$("#submit").click(
			function() {
				var Url = "userlogin?"
						+ $("#loginForm").serialize();

				$.get(Url, function(obj, status) {
				
					
					conutin = obj.url;
					if (obj.res == 1) {
						succeed();
						setTimeout(goherf, 2000);
					} else {
						fail(obj.res);
					}

				});

			});

	function goherf() {
		location.href = conutin;
	}

	//错误  

	function succeed() {
		new TipBox({
			type : 'success',
			str : '操作成功',
		});
	}

	function fail(i) {
		var tipstr = "用户名不存在"
		if (i == 0) {
			tipstr = "用户名不存在！"
		} else if (i == -1) {
			tipstr = "密码错误！"
		}
		new TipBox({
			type : 'error',
			str : tipstr,
			clickDomCancel : true,
			setTime : 10000500,
			hasBtn : true
		});
	}

	function load() {
		new TipBox({
			type : 'load',
			str : "努力加载中..",
		});
	}
</script>

</html>