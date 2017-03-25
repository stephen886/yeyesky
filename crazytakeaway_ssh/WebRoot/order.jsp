<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<base href="<%=basePath%>">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/order.css" />
		<link rel="stylesheet" type="text/css" href="css/footer.css" />
		<link rel="stylesheet" type="text/css" href="css/head.css"/>
		<link rel="stylesheet" type="text/css" href="css/icon.css"/>
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/order.js" type="text/javascript" charset="utf-8"></script>
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
									<span id="user_name" class="fl top-loginbar-username">欢迎你，${user.user_name}</span>
								</c:when>
								<c:otherwise>
									<a
										href="loginAction!login.action?continueUrl=viewStore_StoreAction!viewStore.action?StoreID=${store.store_id}"><span
										id="user_name" class="fl top-loginbar-username">请登录</span></a>
									<span
										style="display: block; height: 20px; width: 20px; float: left;"></span>
									<a href="register.jsp"><span id="user_name"
										class="fl top-loginbar-username">注册</span></a>
								</c:otherwise>
							</c:choose>
                          
                            
                            
							<span id="up_down" class="glyphicon glyphicon-chevron-down"></span>
							<a href="" class="wap fl"><i class="glyphicon glyphicon-phone"></i><span>手机版</span></a>
							<a href="index.html" class="wap fl"><i class="glyphicon glyphicon-home"></i><span>首页</span></a>
							<div id="login_menu">
								<ul>
									<li>
										<a class="wrap" href="/customer/order/list">我的外卖订单</a>
									</li>
									<li>
										<a class="wrap" href="/favorite/restaurant">我的收藏夹</a>
									</li>
									<li>
										<a class="wrap" href="" id="logout">退出</a>
									</li>
								</ul>
							</div>

						</div>

					</div>
					<div class="location">
						<span class="glyphicon glyphicon-map-marker"></span>
						<span class="current-city" id="current-city">${sessionScope.adress}</span>
						<span id="curr-location" class="current-address">战地烧烤场</span>
						<span class="new_location">[切换新地址]</span>
						<span class="glyphicon glyphicon-chevron-down"></span>
						<div class="change" id="changePosition">
							<!--
                                	作者：lyw
                                	时间：2016-10-18
                                	描述：新地址
                                -->
						</div>

					</div>

				</div>
			</div>
			<div class="top_middle">
				<div class="middlenav-wrap clearfix">
					<h1 class="logo fl">
              				<a href="index.html" title="疯了么外卖"><img src="img/normal-new2.png" alt="疯了么外卖"></a>
           				</h1>
					<div class="desire fl">
						<a href="index.html" class="ca-lightgrey"><span>首页</span></a>
						<span class="vertical-line">|</span>
						<a href="/customer/order/list" class="ca-lightgrey" rel="nofollow"><span>我的外卖</span></a>
						<span class="vertical-line">|</span>
						<a href="/contact/contactus" class="ca-lightgrey"><span>加盟合作</span></a>
					</div>
					<div class="search-box fr">
						<input style="height:30px; width: 200px; padding-left: 40px;" type="text" class="header-search" placeholder="搜索商家，美食">
						<a style="height: 38px;" href="" class="doSearch">搜索</a>
						<div id="searchfont"><span class="glyphicon glyphicon-search"></span></div>
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
						<div class="no-result">
							没有找到相关结果，请换个关键字搜索！
						</div>
					</div>
				</div>

			</div>

		</div>
		<!--
        	作者：网页头部结束
        	时间：2016-10-19
        	描述：
        -->

		<div class="page-wrap">
			<div class="inner-wrap">

				<script type="text/template" id="lngLat-info">
					{ "lng": 113.436186, "lat": 23.076394 }
				</script>

				<script type="text/template" id="store-info">
					{ "id": "94801", "hasFirst" : 1, "token" : "2EB29E51FFF14C97B18B35DB2377EB3A", "cannotEditAddress" : false, "city" : "广州" }
				</script>

				<script type="text/template" id="arrival-times">
					立即送出, 22:10, 22:30,
				</script>

				<div id="anti_token"></div>

				<div class="breadcrumb">
					<a class="ca-brown" href="#">${store.store_name}</a><i>&gt;</i><span>确认购买</span>
                    <input type="hidden" class="store_id" value="${store.store_id}" />
                    <input type="hidden" class="start_price" value="${store.start_price}" />
				</div>

				<div class="clearfix order-confirm" id="j-order-confirm">

					<div class="order-info-wrapper j-order-info-wrapper clearfix">
						<div class="fl address">

							<table class="standard-table dishes-table">
								<thead>
									<tr class="bot-border">
										<th class="left" width="240">
											<div class="th-inner align-left">菜品</div>
										</th>
										<th class="right" colspan="2">
											<div class="th-inner align-right">价格/份数</div>
										</th>
									</tr>
								</thead>
								<tbody>
									
									
                                    
									<tr class="delivery" data-total="126">
										<td colspan="3" class="clearfix middle">
											<div class="td-inner clearfix">
												<span class="d-total fl">配送费(不计入起送价)</span>
												<span class="d-number fr">¥<span>0</span></span>
											</div>
										</td>
									</tr>
                                    <tr class="total" data-total="126">
										<td colspan="3" class="clearfix middle">
											<div class="td-inner clearfix">
												<span class="t-total fl">合计</span>
												<span class="t-number fr">¥<span>0</span></span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="privilege">
								<div class="operation clearfix">
									<div class="fr si-input">
										<input type="text" class="pri-input sprite" id="privilegeInput" value="选择优惠券" data-cid="0" readonly>
										<a href="javascript:;" class="drop" id="dropTicket"><i class="icon i-triangle-dn"></i></a>
										<div class="select" style="display: none;">
											<ul>
											</ul>
										</div>
									</div>
									<span class="tip fr">优惠券：</span>
								</div>
							</div>
							<div class="ticket-age"></div>

						</div>
						<div class="dishes">
							<div class="dishes-rap">
								<div class="address-head">
									<h3 class="address-title">
              送餐详情
          </h3>
								</div>

								<form action="OrderAction!addOrder" id="orderForm" class="order-form" method="post">
									<div id="address-list" class="address-list">
										<div id="address-new" class="address-box-empty" data-newuser="1">
											<i class="order-icon i-add-addr"></i>添加新地址
										</div>
										<div id="inputform">
											<div>联系人：<input type="text" name="receiver_name" value="" style="margin-left:12px;"></div>
											<div>手机号码：<input type="text" name="phone" value=""></div>
											<div>收货地址：
                                            	<input type="text" name="province" value="" style="width:50px;">省
                                                <input type="text" name="city" value="" style="width:50px;">市
                                                <input type="text" name="district" value="" style="width:50px;">区
                                                <input type="text" name="street" value="" style="width:200px;">               
                                            
                                            </div>
											
										</div>
									</div>
                                    
                                    <input type="hidden" name="StoreID" value="${store.store_id}">

									<input type="hidden" name="poiid" value="94801">
									<input type="hidden" name="token" value="2EB29E51FFF14C97B18B35DB2377EB3A">
									<input type="hidden" name="buildingid" value="">

									<div class="field clearfix leave-message">
										<label for="message">给商家留言：</label>
										<input class="show-tags sprite" type="text" name="message" placeholder="不要辣，多放盐等口味要求" maxlength="100" value="">
										<input type="text" style="display:none">
									</div>

									<div class="pay-field clearfix">
										<label class="fl" for="pay-method">付款方式：</label>
										<div class="fl pay-option clearfix">
											<a href="javascript:;" data-method="1" class="fl sprite option  ">餐到付款</a>
											<a href="javascript:;" data-method="2" class="fl sprite option option-margin selected ">在线支付</a>
										</div>
									</div>
								</form>

								<script type="text/template" id="addressDialog">
									<div class="add">
										<a href="javascript:;" class="add-address">+ 添加新地址</a>
									</div>
									<ul>
									</ul>
									<div class="btns clearfix">
										<a class="s-btn fr select-address"><span class="s-btn">确认</span></a>
										<span class="error-info fr"></span>
									</div>
								</script>
							</div>
							<div class="pre-order field">
								<span>期望送达时间：</span>
								<a href="javascript:;" id="preorder-time" class="select-input"><span>立即送出</span><i class="icon"></i></a>
								<span class="pre-order-tip"><span class="error-tips"></span></span>
							</div>

							<div class="pay-area">
								<div id="order-address-warning" class="order-address-warning" style="display: none"></div>
								<div class="first-order-tip borderradius-5 fr j-first-order-tip">
									<a href="/mobile/download/preview_toast">
										<div class="left-tip-wrap fl">
											<p>使用App下单<br>享更多优惠</p>
										</div>
										<div class="vertical-line fl"></div>
										<div class="right-tip-wrap fl">
											<i class="icon i-phone fl"></i> 去下载
										</div>
										<div class="code-wrapper qrcode">
											<div class="qrcode"></div>
										</div>
									</a>
								</div>

								<a class="s-btn yellow-btn fr" id="confirmOrder"><span class="s-btn">去付款</span></a>
								<div class="tips ct-black">
									您需支付&nbsp;<span class="price cc-lightred-new">¥<span id="totalPrice">0</span>
									<span class="nodiscount-tip borderradius-2">
                您今日优惠已用完，本单不再享受优惠
                <i class="icon i-discountip"></i>
              </span>
									<span class="nodiscount-tip borderradius-2">
                您今日优惠已用完，使用<a href="/mobile/download/bonus_limited" target="_blank">手机客户端</a>可享更多优惠
                <i class="icon i-discountip"></i>
              </span>
									</span>
									<span id="endfix" class="ct-black hidden">，饭到当面付款</span><br>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

		<!--脚步开始-->
		<div class="page-footer">
			<div class="footer-wrap">
				<div class="column fl help">
					<div class="title">用户帮助</div>
					<ul>
						<li>
							<a href="/help/faq" class="ca-darkgrey" target="_blank" rel="nofollow">常见问题</a>
						</li>
						<li>
							<a href="/help/feedback" class="ca-darkgrey" target="_blank" rel="nofollow">用户反馈</a>
						</li>
						<li>
							<a href="/help/inform" class="ca-darkgrey" target="_blank" rel="nofollow">诚信举报</a>
						</li>
						<li>
							<a href="/restaurant/0" class="ca-darkgrey" target="_blank" rel="nofollow">线上体验店</a>
						</li>
					</ul>
				</div>
				<div class="column fl update">
					<div class="title">获取更新</div>
					<ul>
						<li>
							<a href="/mobile/download/default" class="ca-darkgrey" target="_blank" rel="nofollow">iPhone/Android</a>
						</li>
						<li>
							<a href="http://e.weibo.com/u/3949575070" class="ca-darkgrey" target="_blank" rel="nofollow">美团外卖新浪微博</a>
						</li>
						<li><span class="ct-darkgrey">公众微信号：美团外卖</span></li>
					</ul>
				</div>
				<div class="column fl corp">
					<div class="title">商务合作</div>
					<ul>
						<li>
							<a href="http://kaidian.waimai.meituan.com/open_store/welcome?source=1" class="ca-darkgrey kaidian_address" target="_blank">我要开店</a>
						</li>
						<li>
							<a href="http://page.peisong.meituan.com/apply/join" class="ca-darkgrey" target="_blank" rel="nofollow">配送合作申请入口</a>
						</li>
						<li>
							<a href="/help/agent" class="ca-darkgrey" target="_blank" rel="nofollow">城市代理商申请入口</a>
						</li>
						<li>
							<a href="http://b.retail.meituan.com/zhaoshang/pages/WMInvest.html" class="ca-darkgrey" target="_blank" rel="nofollow">零售招商合作加盟入口</a>
						</li>
						<li>
							<a href="http://developer.meituan.com?applyFrom=waimai_c_pc_contact" class="ca-darkgrey" target="_blank" rel="nofollow">餐饮开放平台</a>
						</li>
					</ul>
				</div>
				<div class="column fl info">
					<div class="title">公司信息</div>
					<ul>
						<li>
							<a href="http://www.meituan.com/about/" class="ca-darkgrey" target="_blank" rel="nofollow">关于美团</a>
						</li>
						<li>
							<a href="http://www.meituan.com/about/press" class="ca-darkgrey" target="_blank" rel="nofollow">媒体报道</a>
						</li>
						<li>
							<a href="/help/job" class="ca-darkgrey" target="_blank" rel="nofollow">加入我们</a>
						</li>
						<li>
							<a href="/help/rule" class="ca-darkgrey" target="_blank" rel="nofollow">美团点评餐饮安全管理办法</a>
						</li>
					</ul>
				</div>
				<div class="column fr service">
					<div><i class="icon i-service-avatar"></i></div>
					<div class="details">
						<p class="w1">美团外卖客服电话</p>
						<p class="w2">10109777</p>
						<!-- <p class="w2">4008508888</p> -->
						<!-- <p class="w2">010-56652722</p> -->

						<p class="w3">周一到周日 9:00-23:00</p>

						<p class="w3">客服不受理商务合作</p>
					</div>
				</div>
				<div class="clear"></div>
				<div class="copyright">©2015 meituan.com
					<a target="_blank" href="http://www.miibeian.gov.cn/">京ICP证070791号</a> 京公网安备11010502025545号</div>
				<div class="sp-ft">
					<a target="_blank" title="备案信息" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202011122700003" class="record"></a>
				</div>
			</div>
		</div>
		<!--脚步结束-->
	</body>

</html>