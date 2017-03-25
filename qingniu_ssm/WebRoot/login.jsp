<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="zh">
<head>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>登录注册</title>
	<style type="text/css">
		.red{
			color: red;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<!--[if IE]>
		<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
 <body>
	<div class="jq22-container">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
				<div class="login-form">
					<form action="userlogin" method="post">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">用户名</label>
							<input id="user" name="username" type="text" class="input">
							<span class="red">${errors.username[0]}</span>
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="pass" name="password" type="password" class="input" data-type="password">
							<span class="red">${errors.password[0]}</span>
						</div>
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span>记住我</label>
						</div>
						<div class="group">
							<input type="submit" class="button" value="登录">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="#forgot">忘记密码?</a>
						</div>
					</div>
					</form>
					<form action="userregister" method="post">
					<div class="sign-up-htm">
						<div class="group">
							<label for="user" class="label">用户名</label>
							<input id="user" name="username" type="text" class="input">
							<span class="red">${errors.username[0]}</span>
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="pass" name="password" type="password" class="input" data-type="password">
							<span class="red">${errors.password[0]}</span>
						</div>
						<div class="group">
							<label for="pass" class="label">确认密码</label>
							<input id="pass" name="repassword" type="password" class="input" data-type="password">
							<span class="red">${errors.repassword[0]}</span>
						</div>
						<div class="group">
							<label for="pass" class="label">邮箱</label>
							<input id="pass" name="email" type="text" class="input">
							<span class="red">${errors.email[0]}</span>
						</div>
						<div class="group">
							<input type="submit" class="button" value="注册">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">已经注册?</a>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>