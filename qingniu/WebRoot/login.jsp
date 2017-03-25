<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>欢迎登录，青牛</title>
<link type="text/css" rel="stylesheet" href="css/login.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>


<body>
	<div id="Login_Register_head">
		<div id="welcomeImg">
			<a href="index.jsp"> <img src="images/logo1.png" width="482"
				height="219" /></a>

		</div>
		欢迎登录
	</div>

	<div class="centre">
		<div class="loginbox">
			<div id="LOGINCHANG" class="loginchangA"></div>
			<!-- 面板A-->
			<div class="loginA">
				<div class="ltitle">账户登录</div>
				<div id="form">
					<form action="Servlet_login" method="get" class="form">
						<div id="EditText">
							<img src="images/lusername.png" width="40" height="40" /> <input
								name="username" type="text" placeholder="会员名/邮箱" maxlength="12" />
						</div>


						<div id="EditText">
							<img src="images/lpassword.png" width="40" height="40" /> <input
								name="password" type="password" maxlength="12" placeholder="密码" />
						</div>


						<div class="lable">
							<div id="labA">
								<a href="#">忘记登录密码</a>
							</div>
							<div id="labB">
								<a href="register.jsp">免费注册</a>
							</div>
						</div>

						<input name="startlogin" type="submit" class="startlogin"
							value="登        录" />
					</form>
				</div>


			</div>
			<!-- 面板B-->
			<div class="loginB">
				<div class="ltitle">手机扫码，安全登录</div>
				<div class="loginCode">
					<div class="scalimg">
						<img src="images/erweima.png" width="130" height="130" />
					</div>

				</div>

				<div class="scanText">

					<img src="images/scan.png" width="39" height="39" />

					<div class="scaltexts">打开手机青牛扫一扫登录</div>
				</div>
			</div>





		</div>
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
