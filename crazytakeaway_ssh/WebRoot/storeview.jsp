<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${store.store_name}</title>
<link rel="icon" href="img/favicon-16x16.png">
<link rel="stylesheet" href="css/restaurant.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />
<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<!--特效js  -->
<script type="text/javascript" src="js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/overhang.min.css" />
<link rel="stylesheet" type="text/css" href="css/prism.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/overhang.min.js"></script>
<script type="text/javascript" src="js/prism.js"></script>

<script type="text/javascript" src="js/restaurant.js"></script>
</head>

<body>
	<!--
        	作者：lyw
        	时间：2016-10-18
        	描述网：页的主体
        	
        -->
	<div class="container">

		<!--
			qiusanxing
        	作者：网页头部
        	时间：2016-10-19
        	描述：
        -->
		<div class="head">
			<div class="top_nav">
				<div class="topnav-wrap">
					<div class="welcome">
						<div id="is-login" class="top-loginbar fl">
							<c:choose>
								<c:when test="${not empty user}">
									<a href="user.jsp"><span id="user_name" class="fl top-loginbar-username">欢迎你，${user.user_name}</span></a>
								</c:when>
								<c:otherwise>
									<a
										href="userloginOut?continueUrl=storeview?store_id=${store.store_id}"><span
										id="user_name" class="fl top-loginbar-username">请登录</span></a>
									<span
										style="display: block; height: 20px; width: 20px; float: left;"></span>
									<a href="register.jsp"><span id="user_name"
										class="fl top-loginbar-username">注册</span></a>
								</c:otherwise>
							</c:choose>





							<span id="up_down" class="glyphicon glyphicon-chevron-down"></span>
							<a href="" class="wap fl"><i
								class="glyphicon glyphicon-phone"></i><span>手机版</span></a> <a
								href="index.jsp" class="wap fl"><i
								class="glyphicon glyphicon-home"></i><span>首页</span></a>
							<div id="login_menu">
								<ul>
									<li><a class="wrap" href="/customer/order/list">我的外卖订单</a>
									</li>
									<li><a class="wrap" href="/favorite/restaurant">我的收藏夹</a>
									</li>
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
						<a href="index.jsp" title="美团外卖"><img
							src="img/normal-new2.png" alt="美团外卖"></a>
					</h1>
					<div class="desire fl">
						<a href="index.jsp" class="ca-lightgrey"><span>首页</span></a> <span
							class="vertical-line">|</span> <a href="/customer/order/list"
							class="ca-lightgrey" rel="nofollow"><span>我的外卖</span></a> <span
							class="vertical-line">|</span> <a href="/contact/contactus"
							class="ca-lightgrey"><span>加盟合作</span></a>
					</div>
					<form action="StoreAction!adressSearch.action">
						<div class="search-box fr">



							<input name="adress" type="text" class="header-search"
								placeholder="搜索商家，美食"> <input value="搜索"
								class="doSearch" type="submit" style="border: 0;" />
							<div id="searchfont">
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

		<!--
            	作者：lyw
            	时间：2016-10-18
            	描述：网页的中间部分
            -->
		<!---->
		<div class="main_boady">

			<div class="inner-wrap">
				<!--商家信息-->
				<div class="rest_info">
					<div id="rest_info_left">
						<img src="img/store_img/${store.store_img}" />
						<div id="store_blok" class="rest_info_left_title">
							<p class="xianzhiwenzi">${store.store_name}</p>
							<p>
								<span style="color: yellow;" class="glyphicon glyphicon-star"></span>
								<span style="color: yellow;" class="glyphicon glyphicon-star"></span>
								<span style="color: yellow;" class="glyphicon glyphicon-star"></span>
								<span style="color: yellow;" class="glyphicon glyphicon-star"></span>
								<span style="color:lightslategray;"
									class="glyphicon glyphicon-star"></span> <span>4.4</span>
							</p>
							<p style="font-size: 0.5em; color: #737373;">${store.start_price}元起送
								免费配送 由商家配送</p>


							<div id="store_hiddle_info">
								<p>
									<strong>商家地址：</strong>${store.storeAdress.adress}
								</p>
								<p>
									<strong>商家电话：</strong>${store.contact}
								</p>
								<p>
									<strong>营业时间：</strong>16:01-18:01,02:41-16:00
								</p>
							</div>
						</div>
					</div>

					<div id="rest_info_right">
						<div id="ack-ti" class="pingfen">
							<div class="nu">
								<strong>4.9</strong>分
							</div>
							<div class="desc">商家评分</div>
						</div>
						<div id="average-speed" class="pingfen">
							<div class="nu">
								<strong>41</strong>分钟 <i class="icon i-triangle-dn up10px"></i>
							</div>
							<div class="desc">平均送餐时间</div>
							<!--<div class="tipbox">
										<i class="icon i-tagtop"></i>
										<p>餐厅大约在41分钟内将美食送达</p>
										<p class="ct-red red-text"><i class="icon i-arrsmallup"></i>快于周边32%的餐厅</p>
									</div>-->
						</div>

						<div id="in-ti" class="pingfen">
							<div class="nu">
								<strong style="">67</strong>% <i
									class="icon i-triangle-dn up10px"></i>
							</div>
							<div class="desc">及时送餐率</div>
							<!--<div class="tipbox">
										<i class="icon i-tagtop"></i>
										<p>67%的订单会在45分钟内送达</p>
										<p class="ct-red red-text"><i class="icon i-arrsmallup"></i>高于周边52%的餐厅</p>
									</div>-->
						</div>

					</div>

				</div>
				<div class="showdow3D"></div>
				<div class="save-up-wrapper">
					<span id="collect"
						style="color: ${StoreCollectColor}; font-size: 1.9em;cursor: pointer;"
						class="glyphicon glyphicon-heart"></span>
					<p class="ct-black">收藏</p>
					<p class="cc-lightred-new j-save-up-people">
						(<span id="collectmun">${countCollect}</span>)
					</p>
					<input id="collectID" type="hidden" value="${StoreCollectID}" /> <input
						id="storeid" type="hidden" value="${store.store_id}" />

				</div>

				<div class="cate-tab-area"></div>

				<div class="food_nav">
					<div class="category">
						<h3 class="title3">炒粉河粉</h3>
					</div>
					<div class="pic-food-cont">

						<c:forEach items="${store.menulist}" var="menu">
							<!--
                            	作者：lyw
                            	时间：2016-10-19
                            	描述：一个菜品 的开始
                            -->
							<div class="one_food">
								<img src="img/menu_img/${menu.menu_img}" />
								<h4>${menu.menu_name}</h4>
								<div class="sale-info">
									<div class="fr zan-count">
										<i class="glyphicon glyphicon-thumbs-up zan"></i> <span
											class="zan_amont">${menu.praise}</span>
									</div>
									<div class="sold-count ct-lightgrey">
										<span>月售56份</span>
									</div>
								</div>
								<div class="labels">
									<div class="add_top_cart">
										<a href="order.jsp"><span
											class="glyphicon glyphicon-plus"></span></a>

									</div>

									<div class="only">¥${menu.price}/份</div>
								</div>
							</div>
							<!--一个菜品的结束-->
						</c:forEach>


					</div>

				</div>

				<div class="widgets">
					<div style="margin-top: -20px;" class="widget broadcaster">
						<div class="title">
							<h2>订餐必读&amp;商家公告</h2>
						</div>
						<div class="content ct-deepgrey">黄船客户请预留黄船短号！本店黄船短号663534</div>
					</div>

					<div class="widget discount">
						<p class="delivery-min-fee">
							<span>起送价：</span>${store.start_price} 元
						</p>
						<p class="delivery-fee">
							<i></i><span class="discount-desc">配送费：${store.express_free}元</span>
						</p>
						<p>
							<i class="icon i-pay"></i><span class="discount-desc">该商家支持在线支付</span>
						</p>
						<p>
							<i class="" style="width:17px;height:17px;background:none;"></i>
							<span class="discount-desc">新用户立减5元<span class="special">(手机客户端专享)</span></span>
						</p>
					</div>

				</div>

			</div>

		</div>
		<!--网页的底部-->

		<!--脚步开始-->
		<div class="page-footer">
			<div class="footer-wrap">
				<div class="column fl help">
					<div class="title">用户帮助</div>
					<ul>
						<li><a href="/help/faq" class="ca-darkgrey" target="_blank"
							rel="nofollow">常见问题</a></li>
						<li><a href="/help/feedback" class="ca-darkgrey"
							target="_blank" rel="nofollow">用户反馈</a></li>
						<li><a href="/help/inform" class="ca-darkgrey"
							target="_blank" rel="nofollow">诚信举报</a></li>
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
							class="ca-darkgrey" target="_blank" rel="nofollow">疯了么外卖新浪微博</a>
						</li>
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
					©2015 crazy.com <a target="_blank"
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

	</div>

</body>
</html>
