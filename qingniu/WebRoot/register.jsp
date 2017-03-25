<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>欢迎注册！青牛</title>
<link type="text/css" rel="stylesheet" href="css/register.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript" src="js/checkcode.js"></script>

</head>
<body onload="createCode()">
	<div id="register_head">
		<div id="register_logo"><a href="index.jsp">
			<img src="images/logo1.png" width="482" height="219" /></a>
		</div>
		<div id="welcomeregister">欢迎注册</div>
		<div id="login">
			已有账号 <a href="login.jsp">请登录</a>
		</div>
	</div>


	<div class="w">
		<div class="contentbox">
			<div class="frombox">
				<form method="get" action="Servlet_register">
					<p>
						<label><em>*</em>用户名：</label> <input id="userId" type="text"
							name="user_name" class="textinfo" /> <span class="tipinfo">4-20位字符，支持汉字、字母、数字及"_"组合</span>
						<span class="errorinfo">由4-20位中文、英文、数字及"_"组成不能以数字或"_"开头</span>

					</p>
					<p>
						<label><em>*</em>登录密码：</label> <input id="user_pwd"
							type="password" name="password" class="textinfo" /> <span
							class="tipinfo">6-20位字符，建议由字母、数字和符号两种以上组合</span> <span
							class="errorinfo">密码长度只能在6-20位字符之间</span>
					</p>
					<p>
						<label><em>*</em>确认密码：</label> <input id="confirm_pwd"
							type="password" name="" class="textinfo" /> <span
							class="tipinfo">请再次输入密码</span> <span class="errorinfo">两次输入密码不一致</span>
					</p>
					<p>
						<label><em>*</em>注册邮箱：</label> <input id="user_mail" type="text"
							name="user_mail" class="textinfo" /> <span class="tipinfo">请输入邮箱地址</span>
						<span class="errorinfo">输入邮箱地址格式不正确</span>
					</p>

					<p class="yz">
						<label><em>*</em>验证码：</label> <input id="codetxt" type="text"
							name="" class="textinfo" /> <input type="button" id="code" /> <input
							type="button" id="reflash" value="刷新" onclick="createCode()" />
						<span class="tipinfo">请输入验证码</span> <span class="errorinfo">输入验证码错误@_@</span>
					</p>
					<p class="checkTitle">
						<input id="argeeId" type="checkbox" name="" /> <span>我已阅读并同意<a
							href="#">《用户注册协议》 </a></span> <span class="errorinfo">请同意《用户注册协议》</span>
					</p>
					<p>
						<input type="submit" class="bt" value="立即注册" />
					</p>

				</form>
			</div>

			<div class="bg_img">
				<img src="images/register.png" />
			</div>
		</div>
	</div>

	<div id="Login_Register_bottom">
		<div id="links">
			<a rel="nofollow" target="_blank" href="//www.jd.com/contact/">联系我们</a>|
			<a rel="nofollow" target="_blank" href="//zhaopin.jd.com/">人才招聘</a>|
			<a rel="nofollow" target="_blank"
				href="//www.jd.com/contact/joinin.aspx">商家入驻</a>| <a rel="nofollow"
				target="_blank" href="//www.jd.com/intro/service.aspx">广告服务</a>| <a
				rel="nofollow" target="_blank" href="//app.jd.com/">手机青牛</a>| <a
				target="_blank" href="//club.jd.com/links.aspx">友情链接</a>| <a
				target="_blank" href="//cps.jd.com/">销售联盟</a>| <a
				href="//club.jd.com/" target="_blank">青牛社区</a>| <a
				href="//gongyi.jd.com" target="_blank">青牛公益</a>| <a target="_blank"
				href="//en.jd.com/" clstag="pageclick|keycount|20150112ABD|9">English
				Site</a>
		</div>
		<div id="copyright">
			Copyright&copy;2004-2016&nbsp;&nbsp;青牛qingniu.com&nbsp;版权所有</div>
	</div>
</body>
</html>
