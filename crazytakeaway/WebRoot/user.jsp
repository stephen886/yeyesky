<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>个人中心</title>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="icon" href="img/favicon-16x16.png" size="16x16 32x32">
<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/list.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/information.css" />

<script src="js/list.js" type="text/javascript" charset="utf-8"></script>
<script src="js/infomation.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var html;
				$(".informantion_per ul li").click(
						function() {
							var i = $(this).index();
							$(this).addClass("info_color").siblings()
									.removeClass("info_color");
							$("#embed").remove();
							if (i == 0) {
								html = "userinfo";
							}
							if (i == 1) {
								html = "orderview";
							}
							if (i == 2) {
								html = "collectGetStore";
							}
							if (i == 3) {
								html = "information04.jsp";
							}
							$("#object").append(
									'<embed id="embed" src="' + html + '">');
						});
			});
</script>


<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/list.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/information.css" />
</head>

<body>
	<div class="head">
		<div class="top_nav">
			<div class="topnav-wrap">
				<div class="welcome"  style="width: 300px;">
					<div id="is-login" class="top-loginbar fl">
						<c:choose>
							<c:when test="${not empty user}">
								
								<span id="user_name" class="fl top-loginbar-username">欢迎你，${user.userName}</span>
								<span style="margin-left: 10px;" class="fl top-loginbar-username"><a href="userloginOut?continueUrl=user.jsp">注销</a></span>
							</c:when>
							<c:otherwise>
								<a
									href="userloginOut?continueUrl=user.jsp"><span
									id="user_name" class="fl top-loginbar-username">请登录</span></a>
								<span
									style="display: block; height: 20px; width: 20px; float: left;"></span>
								<a href="register.jsp"><span id="user_name"
									class="fl top-loginbar-username">注册</span></a>
							</c:otherwise>
						</c:choose>





						<span id="up_down" class="glyphicon glyphicon-chevron-down"></span>
						<a href="" class="wap fl"><i class="glyphicon glyphicon-phone"></i><span>手机版</span></a>
						<a href="index.jsp" class="wap fl"><i
							class="glyphicon glyphicon-home"></i><span>首页</span></a>
						<div id="login_menu">
							<ul>
								<li><a class="wrap" href="/customer/order/list">我的外卖订单</a>
								</li>
								<li><a class="wrap" href="/favorite/restaurant">我的收藏夹</a></li>
								<li><a class="wrap" href="" id="logout">退出</a></li>
							</ul>
						</div>

					</div>

				</div>
				<div class="location">
					<span class="glyphicon glyphicon-map-marker"></span><span
						id="curr-location" class="current-address">${sessionScope.adress}</span>
					<span class="new_location"><a href="index.jsp">[切换新地址]</a></span>
					<div class="change" id="changePosition"></div>

				</div>

			</div>
		</div>
		<div class="top_middle">
			<div class="middlenav-wrap clearfix">
				<h1 class="logo fl">
					<a href="index.jsp" title="美团外卖"><img src="img/normal-new2.png"
						alt="美团外卖"></a>
				</h1>
				<div class="desire fl">
					<a href="index.jsp" class="ca-lightgrey"><span>首页</span></a> <span
						class="vertical-line">|</span> <a href="/customer/order/list"
						class="ca-lightgrey" rel="nofollow"><span>我的外卖</span></a> <span
						class="vertical-line">|</span> <a href="/contact/contactus"
						class="ca-lightgrey"><span>加盟合作</span></a>
				</div>
				<form action="storesearch">
					<div class="search-box fr">



						<input name="adress" type="text" class="header-search"
							placeholder="搜索商家，美食"> <input style="height: 38px;border: 0;"  value="搜索" class="doSearch"
							type="submit" style="border: 0;" />
						<div style="margin-left: 10px;" id="searchfont">
							<span class="glyphicon glyphicon-search"></span>
						</div>
						<div class="result-box">
							<div class="result-left fl">
								<div class="rest-words ct-black">餐厅</div>
								<div class="food-words ct-black">美食</div>
							</div>
							<div class="result-right fl">
								<ul class="rest-lists">
								</ul>
								<div class="line"></div>
								<ul class="food-lists">
									<li>即使对方的</li>
									<li>即使对方的</li>
								</ul>
							</div>
						</div>
						<div class="no-result">没有找到相关结果，请换个关键字搜索！</div>
					</div>
				</form>
			</div>

		</div>

	</div>
	<!--
        	作者：网页头部结束
        	时间：2016-10-19
        	描述：
        -->
	<main>
		<div class="information">
			<div class="informantion_per">
				<ul>
					<li >个人信息</li>
					<li>我的订单</li>
					<li>我的收藏</li>
				
					
					<li class="info_color">我的金库</li>
				</ul>
			</div>

			<div class="informantion_order">

				<article>
					<object id="object">
						<embed id="embed" src="information04.jsp">
					</object>
				</article>

			</div>
	</main>

	<div class="page-footer">
		<div class="footer-wrap">
			<div class="column fl help">
				<div class="title">用户帮助</div>
				<ul>
					<li><a href="/help/faq" class="ca-darkgrey" target="_blank"
						rel="nofollow">常见问题</a></li>
					<li><a href="/help/feedback" class="ca-darkgrey"
						target="_blank" rel="nofollow">用户反馈</a></li>
					<li><a href="/help/inform" class="ca-darkgrey" target="_blank"
						rel="nofollow">诚信举报</a></li>
					<li><a href="/restaurant/0" class="ca-darkgrey"
						target="_blank" rel="nofollow">线上体验店</a></li>
				</ul>
			</div>
			<div class="column fl update">
				<div class="title">获取更新</div>
				<ul>
					<li><a href="/mobile/download/default" class="ca-darkgrey"
						target="_blank" rel="nofollow">iPhone/Android</a></li>
					<li><a href="http://e.weibo.com/u/3949575070"
						class="ca-darkgrey" target="_blank" rel="nofollow">疯了么外卖新浪微博</a></li>
					<li><span class="ct-darkgrey">公众微信号：疯了么外卖</span></li>
				</ul>
			</div>
			<div class="column fl corp">
				<div class="title">商务合作</div>
				<ul>
					<li><a
						href="http://kaidian.waimai.meituan.com/open_store/welcome?source=1"
						class="ca-darkgrey kaidian_address" target="_blank">我要开店</a></li>
					<li><a href="http://page.peisong.meituan.com/apply/join"
						class="ca-darkgrey" target="_blank" rel="nofollow">配送合作申请入口</a></li>
					<li><a href="/help/agent" class="ca-darkgrey" target="_blank"
						rel="nofollow">城市代理商申请入口</a></li>
					<li><a
						href="http://b.retail.meituan.com/zhaoshang/pages/WMInvest.html"
						class="ca-darkgrey" target="_blank" rel="nofollow">零售招商合作加盟入口</a>
					</li>
					<li><a
						href="http://developer.meituan.com?applyFrom=waimai_c_pc_contact"
						class="ca-darkgrey" target="_blank" rel="nofollow">餐饮开放平台</a></li>
				</ul>
			</div>
			<div class="column fl info">
				<div class="title">公司信息</div>
				<ul>
					<li><a href="http://www.meituan.com/about/"
						class="ca-darkgrey" target="_blank" rel="nofollow">关于疯了么</a></li>
					<li><a href="http://www.meituan.com/about/press"
						class="ca-darkgrey" target="_blank" rel="nofollow">媒体报道</a></li>
					<li><a href="/help/job" class="ca-darkgrey" target="_blank"
						rel="nofollow">加入我们</a></li>
					<li><a href="/help/rule" class="ca-darkgrey" target="_blank"
						rel="nofollow">点评餐饮安全管理办法</a></li>
				</ul>
			</div>
			<div class="column fr service">
				<div>
					<i class="icon i-service-avatar"></i>
				</div>
				<div class="details">
					<p class="w1">疯了么外卖客服电话</p>
					<p class="w2">10109777</p>
					<!-- <p class="w2">4008508888</p> -->
					<!-- <p class="w2">010-56652722</p> -->

					<p class="w3">周一到周日 9:00-23:00</p>

					<p class="w3">客服不受理商务合作</p>
				</div>
			</div>
			<div class="clear"></div>
			<div class="copyright">
				©2015 meituan.com <a target="_blank"
					href="http://www.miibeian.gov.cn/">京ICP证070791号</a>
				京公网安备11010502025545号
			</div>
			<div class="sp-ft">
				<a target="_blank" title="备案信息"
					href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202011122700003"
					class="record"></a>
			</div>
		</div>
	</div>
	<!--脚步结束-->
</body>

</html>
