<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/list.css" />
<script src="js/jquery.min.js" type="text/javascript"
	charset="utf-8"></script>
<link rel="icon" href="img/favicon-16x16.png" size="16x16 32x32">
<script src="js/list.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />

<link rel="stylesheet" type="text/css" href="css/footer.css" />

<!--特效js  -->
<script type="text/javascript" src="js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/overhang.min.css" />
<link rel="stylesheet" type="text/css" href="css/prism.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/cart.css" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/overhang.min.js"></script>
<script type="text/javascript" src="js/prism.js"></script>


</head>

<body>
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
								<a href="user.jsp"><span id="user_name" class="fl top-loginbar-username">欢迎你，${user.userName}</span></a>
							</c:when>
							<c:otherwise>
								<a
									href="userloginOut?continueUrl=storesearch?adress=${sessionScope.adress}"><span
									id="user_name" class="fl top-loginbar-username">请登录</span></a>
								<span
									style="display: block; height: 20px; width: 20px; float: left;"></span>
								<a href="register.jsp"><span id="user_name"
									class="fl top-loginbar-username">注册</span></a>
							</c:otherwise>
						</c:choose>


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
					<input id="totalpage" value="${totalpage}" type="hidden">

				</div>


			</div>
		</div>
		<div class="top_middle">
			<div class="middlenav-wrap clearfix">
				<h1 class="logo fl">
					<a href="index.jsp" title="疯了么外卖"><img
						src="img/normal-new2.png" alt="疯了么外卖"></a>
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
							placeholder="搜索商家，美食"> <input value="搜索" class="doSearch"
							type="submit" style="border: 0;height: 38px;padding: 0;" />


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
	<!--中间部分开始-->

	<div class="inner-wrap">
		<div class="inner-bg">

			<div class="rest-banner">

				<div class="imgsort-wrapper">
					<span class="imgsort-filter-title">商家分类</span>
					<ul class="clearfix imgsort-content">
						<li class="fl selected"><a href="javascript:void(0);"
							data-cate="cate_all" class="imgsort-list" title="全部"> <span
								class="imgsort-info">全部</span>
						</a></li>
						<li class="fl"><a class="imgsort-list" title="鲜花绿植"
							href="javascript:void(0);" data-cate="cate_1001"> <span
								class="imgsort-info">鲜花绿植</span>
						</a></li>
						<li class="fl"><a class="imgsort-list" title="美食"
							href="javascript:void(0);" data-cate="cate_1000"> <span
								class="imgsort-info">美食</span>
						</a></li>
						<li class="fl"><a class="imgsort-list" title="甜点饮品"
							href="javascript:void(0);" data-cate="cate_19"> <span
								class="imgsort-info">甜点饮品</span>
						</a></li>
						<li class="fl"><a class="imgsort-list" title="生鲜果蔬"
							href="javascript:void(0);" data-cate="cate_21"> <span
								class="imgsort-info">生鲜果蔬</span>
						</a></li>
						<li class="fl"><a class="imgsort-list" title="生活超市"
							href="javascript:void(0);" data-cate="cate_20"> <span
								class="imgsort-info">生活超市</span>
						</a></li>
					</ul>
				</div>

				<div class="rest-filter clearfix">
					<span class="rest-filter-title">优惠筛选</span>
					<!--  -->
					<a title="首单立减" href="javascript:void(0);" data-rest="1"> <span
						class="sprite checkbox"></span> <span class="txt"> 首单立减 </span>
					</a>
					<!--  -->
					<a title="满减优惠" href="javascript:void(0);" data-rest="2"> <span
						class="sprite checkbox"></span> <span class="txt"> 满减优惠 </span>
					</a>
					<!--  -->
					<a title="套餐惠赠" href="javascript:void(0);" data-rest="4"> <span
						class="sprite checkbox"></span> <span class="txt"> 套餐惠赠 </span>
					</a>
					<!--  -->
					<a title="满赠活动" href="javascript:void(0);" data-rest="5"> <span
						class="sprite checkbox"></span> <span class="txt"> 满赠活动 </span>
					</a>
					
					<!--  -->
					<a title="满免配送费" href="javascript:void(0);" data-rest="16"> <span
						class="sprite checkbox"></span> <span class="txt"> 满免配送费 </span>
					</a>
					
					<!--  -->
					
					<!--  -->
					<a title="支持发票" href="javascript:void(0);" data-rest="invoice">
						<span class="sprite checkbox"></span> <span class="txt">
							支持发票 </span>
					</a> <a title="在线支付" href="javascript:void(0);" data-rest="online_pay">
						<span class="sprite checkbox "></span> <span class="txt">在线支付</span>
					</a> <a title="疯了么专送" href="javascript:void(0);" data-rest="logistic">
						<span class="sprite checkbox "></span> <span class="txt">疯了么专送</span>
					</a>
				</div>

				<div class="divider"></div>

				<div class="sort-filter" id="sortFilter">
					<a href="javascript:void(0);" data-sort="0"
						class="sort default-sort active">默认排序</a> <a
						href="javascript:void(0);" data-sort="1" class="sort sa-sort">销量<i
						class="icon i-orderdown"></i></a> <a href="javascript:void(0);"
						data-sort="2" class="sort ct-sort">评价<i
						class="icon i-orderdown"></i></a> <a href="javascript:void(0);"
						data-sort="3" class="sort ti-sort">送餐速度<i
						class="icon i-orderup"></i></a>
					<div class="fl clearfix">
						<span class="fl label"> 起送价筛选 </span>
						<div class="prices">
							<a href="javascript:void(0);" class="all"> 全部商家 <i
								class="icon i-triangle-dn"></i>
							</a>
							<ul>
								<li><a data-price="0" href="javascript:void(0);">全部商家</a></li>
								<li><a data-price="1" href="javascript:void(0);">10元以下</a>
								</li>
								<li><a data-price="2" href="javascript:void(0);">20元以下</a>
								</li>
								<li><a data-price="3" href="javascript:void(0);">30元以下</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

			</div>

			<div class="rest-list">
				<ul class="list clearfix">

					<c:choose>
						<c:when test="${not empty storelist}">
							<c:forEach items="${storelist}" var="store">
								<li class="rest-li fl ">
									<div class="rest-outer transition ">
										<a
											href="storeview?store_id=${store.storeID}"
											class="rest-atag">
											<div class="top-content">
												<div class="preview">
													<img src="img/store_img/${store.storeImg}" />
												</div>
												<div class="content">
													<div class="name">
														<span>${store.storename}</span>
													</div>
													<div class="rank clearfix">
														<span class="star-ranking fl"> <span
															class="star-score" style="width: 90%"> </span>
														</span> <span class="score-num fl"> 4.7分 </span> <span
															class="total fr"> 月售226单 </span>

													</div>
													<div class="price">
														<span class="start-price"> 起送￥${store.startPrice}
														</span> <span class=""> 免配送费 </span> <span class="send-time">
															<i class="icon i-poi-timer"></i> 22分钟
														</span>
													</div>
												</div>
												<div class="clear"></div>
											</div>

											<div class="others">
												<div class="discount">
													<i class="icon i-pay"></i> <i class="icon i-reduce"
														title="减价"></i> <i class="icon i-first" title="首订优惠"></i>
													<i class="icon i-discount" title="优惠"></i> <i
														class="icon i-give" title="赠送"></i> <i
														class="icon i-group" title="团购卷"></i>
												</div>

											</div>
										</a>
									</div>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div
								style="width: 910px;height: 310px;text-align: center; line-height: 40px;">

								<p style="font-size: 2em; margin-top: 40px;">对不起！该地址附近没有商家</p>
								<br /> <span style="color: #016FCB;">我们正在努力覆盖中...</span>
							</div>
						</c:otherwise>
					</c:choose>







				</ul>

			</div>

		</div>
	</div>
	<!--中间部分结束-->

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
</body>
</html>
