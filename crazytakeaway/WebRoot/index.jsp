<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<!--
    	作者：lyw
    	时间：2016-10-16
    	描述：主页版本2.0，加入浏览器定位功能
    -->

<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>疯了么-网上订餐_外卖</title>
<link href="css/index.css" rel="stylesheet" />
<link rel="stylesheet" href="css/animate.min.css" />
<link rel="shortcut icon" href="img/favicon-16x16.png" type="image/png" />
<link rel="icon" href="img/favicon-16x16.png" type="image/png"
	sizes="16x16" />
</head>

<body>
	<div class="Container">

		<!--
            	作者：lyw
            	时间：2016-10-15
            	描述：上半部分
            -->
		<div class="top">

			<!--
                	作者：lyw
                	时间：2016-10-15
                	描述：logo和导航栏
                -->
			<div class="top_nav">
				<h1>
					<img src="img/map-logo.9a26ef.png" alt="Crazy"></a>
				</h1>
				<c:choose>
					<c:when test="${not empty user}">
						<span class="top_nav-right"> <a href="user.jsp">${user.userName}你好</a>
							<span>|</span> <a href="userloginOut">注销</a> <a
							class="btn-security btn-sm" href="#" target="_blank">我要开店</a>
						</span>
					</c:when>
					<c:otherwise>
						<span class="top_nav-right"> <a target="_blank"
							href="register.jsp">注册</a> <span>|</span> <a href="login.jsp">登录</a>
							<a class="btn-security btn-sm" href="#" target="_blank">我要开店</a>
						</span>
					</c:otherwise>
				</c:choose>



			</div>

			<div class="top_nav_logo-center  wow flipInX" data-wow-delay="1.5s">
				<img src="img/map-logo-center.4eb348.png " />
			</div>

			<div class="top_nav_leftimg wow slideInLeft ">
				<img src="img/logo_left.png " />
			</div>
			<div class="top_nav_rightimg wow slideInRight">
				<img src="img/logo_right.png " />
			</div>

			<div class="top_map wow bounceInDown" data-wow-delay="0.5s">
				<form action="<%=path%>/StoreAction.action" method="post">
					<button id="btn_location" type="button">定位</button>
					<input name="adress" id="search_adress" type="text " placeholder="请输入你的订餐地址 " />
					<button id="btn_search" type="button">搜索</button>

				</form>
			</div>

			<!--加载搜索提示插件-->
			<div id="adress_tip"></div>

			<!--加载百度地图插件-->
			<div id="adress_map">
				<div id="map_text">

					<div id="locaion_text">
						<p>正在定位</p>
					</div>
					<button id="btn_ok" type="button" class="btn">确定位置</button>
					<button id="btn_canel" type="button" class="btn">取消定位</button>
				</div>
				<div id="map_img"></div>
			</div>

		</div>

		<!--
            	作者：lyw
            	时间：2016-10-15
            	描述：下半部分
            -->
		<div class="bottom ">
			<div class="mapfooter-app ">
				<div class="mapfooter-app-image">
					<img src="img/appqc.95e532.png " alt="扫码下载 APP "> <span>扫码下载
						APP</span>
				</div>
				<div class="mapfooter-app-text ">
					<p>新用户首次下单</p>
					<strong>最高</strong><strong class="color-stress ">立减20元</strong>
					<p>立即下载APP，享更多优惠吧！</p>
				</div>
			</div>
			<p class="mapfooter-link ">
				<a href="# " ubt-click="1434 ">我要开店</a><i
					class="map-footer-separator ">|</i> <a href="# " ubt-click="1435 ">联系我们</a>
				<i class="map-footer-separator ">|</i> <a href="# "
					ubt-click="1436 ">服务条款和协议</a> <i class="map-footer-separator ">|</i>
				<a href="# " ubt-click="1437 ">加入我们</a>
			</p>
			<div class="footer-copyright ">
				增值电信业务许可证 : <a href="# " target="_blank ">粤B2-20150033</a> | <a
					href="# " target="_blank ">粤ICP备 09007032</a> | <a href="# "
					target="_blank ">广州工商行政管理</a> Copyright ©2008-2016 Crazy.com, All
				Rights Reserved.
			</div>
		</div>
	</div>

	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=MyZ2Me1W2wAsqFMP3dCcDhHpPtaZlaNk"></script>
	<script type="text/javascript" src="js/baidumap.js"></script>
	<script src="js/jquery.validate.min.js?var1.14.0"></script>
	<script>
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};

		$("form[type=ajax]").submit(function() {
			form = $(this);
			$.post(window.location, form.serialize(), function(data) {
				if (data != 1) {
					alert("报错");
				} else {
					form.submit();
					return true;
				}
			});
			return false;
		});
	</script>

</body>

</html>