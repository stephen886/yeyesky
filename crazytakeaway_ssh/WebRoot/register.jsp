<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>注册</title>
<style>
.red {
	color: red;
	font-family: "微软雅黑";
	font-size: 0.8em;
	text-align: center;
}
</style>
<link rel="stylesheet" href="css/login_singin.css">
<link rel="icon" href="img/favicon-16x16.png" size="16x16 32x32">
</head>
<body>

	<div class="register-container">
		<h1>疯了么</h1>

		<div class="connect">
			<p>连接世界，分享世界！</p>
		</div>

		<form action="<%=path%>/userregister!register.action" method="post"
			id="registerForm">
			<div>
				<input type="text" name="user_name" class="username"
					placeholder="您的用户名" autocomplete="off" /> <span class="red">${errors.user_name[0]}</span>
			</div>

			<div>
				<input type="password" name="password" class="password"
					placeholder="输入密码" oncontextmenu="return false"
					onpaste="return false" /> <span class="red">${errors.password[0]}</span>
			</div>
			<div>
				<input type="password" name="repassword"
					class="confirm_password" placeholder="再次输入密码"
					oncontextmenu="return false" onpaste="return false" /> <span
					class="red">${errors.repassword[0]}</span>
			</div>
			<div>
				<input type="text" name="phone" class="phone_number"
					placeholder="输入手机号码" autocomplete="off" id="number" /> <span
					class="red">${errors.phone[0]}</span>
			</div>
			<div>
				<input type="email" name="email" class="email"
					placeholder="输入邮箱地址" oncontextmenu="return false"
					onpaste="return false" /> <span class="red">${errors.email[0]}</span>
			</div>

			<button id="submit" type="submit">注 册</button>
		</form>
		<a href="login.jsp">
			<button type="button" class="register-tis">已经有账号？</button>
		</a>

	</div>

</body>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script
	src="view-source:www.jq22.com/demo/jquery-Sharelink20151012/js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>

</html>