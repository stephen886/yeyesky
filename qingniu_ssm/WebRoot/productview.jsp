<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>海买大西洋三文鱼段,青牛网</title>
<meta http-equiv="description" content="全球美食尽在青牛网">

<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" type="text/css" href="css/product.css" />

<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/cailiao.js"></script>
</head>
</head>




<body>

	<!-- 引入网站的通用头部-->
	<%@ include file="head.jsp"%>
	<!-- 网页的主要内容 -->

	<!--右边快速导航栏 -->
	<div class="quick_guide">
		<ul>

			<li><img src="images/arrow_up.png" /></li>
			<li id="shopcart"><img src="images/Shopping_Cart.jpg" />
            	
            </li>
			<li id="backtop"><img src="images/arrow_up.png" /></li>
		</ul>


	</div>

	<div class="w">
		<!--购物框 -->
		<div class="shopbox">
			<!--图片轮播 -->
			<a href="#" name="top"></a>
			<div id="samplebox">
			
				<img src="images/preview_img/${good.previews[0].preImg}" class="bannerImg" />
				<ul>
					<c:forEach items="${good.previews}" var="one">
						<li><img src="images/preview_img/${one.preImg}" class="lable change" /></li>
					</c:forEach>
				</ul>

			</div>
			<!--价格框 -->
			<div class="moneybox">
				<div class="moneytitle">
				</div>
				<div class="pricebox">
					<div id="price">
						<span id="jiage">价格：</span> <span> <em>&yen;</em> <strong>${good.standard[0].price}</strong>
						</span>
					</div>
					<div id="manyi">
						<p>总体满意度</p>
						<p>
							<b>5.0</b>分
						</p>
					</div>
				</div>

				<div class="summary">
				
					<form>
					
					<div class="summary_left">
						<div class="choose">
							<div class="dt">规格：</div>
							<div class="choose_list">
								<ul>
									<c:forEach items="${good.standard}" var="one" begin="0"
										end="2">
										<li class="item"><span>&yen;<b>${one.price}</b>
										</span> <span>${one.specification}</span>
										</li>
									</c:forEach>

								</ul>
							</div>
						</div>

						<div class="post_service">
							满百包邮，<b>20:00</b> 前完成订单 预计明<b>
							<%
								Date date = new Date();  
					            SimpleDateFormat sf = new SimpleDateFormat("MM月dd日");  
					            String nowDate = sf.format(date);
					            Calendar cal = Calendar.getInstance();  
					            cal.setTime(sf.parse(nowDate));  
					            cal.add(Calendar.DAY_OF_YEAR, +1);  
					            String nextDate_1 = sf.format(cal.getTime());
							 %>
							
							(<%=nextDate_1%>)</b>送达
						</div>

						<div class="amount">
							<div class="dt">数量：</div>
							<div class="value">
								<input id="p_number" name="pamount" type="text" maxlength="2" value="1" />
                                <input type="button" class="increase" value="+"/>
								<input type="button" class="reduce" value="-"/>
							</div>
							<div class="add_car">
								<input type="button" id="sendcart"  />
							</div>
						</div>


					</div>
					
						<input type="hidden" name="pprice" id="pprice" />
						<input type="hidden" name="pid" id="pid" value="${product.goods_id}" />
					</form>

					<div class="summary_right">
						<table class="cd">
							<tbody>
								<tr>
									<td>产地:</td>
									<td>阿根廷</td>
								</tr>
								<tr>
									<td>商品编号:</td>
									<td>1001370</td>
								</tr>
								<tr>
									<td>商品状态:</td>
									<td>冷冻</td>
								</tr>
								<tr>
									<td>发货地:</td>
									<td>上海</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>

		</div>

		<div class="contentbox">
			<div class="left_con">
				<div class="hd">猜你喜欢</div>
				<div class="j_product">
					<ul>
						<c:forEach items="${goods}" var="like" begin="0" end="8">
							<li>
								<div class="p_box">
									<div class="addtocar">
										<a href="#"><span>加入购物车</span> </a>
									</div>
									<div class="img">
										<a href="productview?goodID=${like.goodID}"><img src="images/preview_img/${like.previews[0].preImg}" /> </a>
									</div>
									<div class="txt">
										<a href="productview?goodID=${like.goodID}">${like.name}</a> <span>￥${good.standard[0].price}</span>
									</div>
								</div>
							</li>
						</c:forEach>


					</ul>
				</div>
			</div>

			<div class="main_con">
				<div class="hot_sale">
					<div class="rm">当季热卖</div>
					<div class="hs_list">
						<ul>
							<c:forEach items="${goods}" var="like" begin="0" end="3">

								<li>
									<div class="p_img">
										<a href="productview?goodID=${like.goodID}"><img src="images/preview_img/${like.previews[0].preImg}" /> </a>
									</div>
									<div class="p_name">
										<a href="productview?goodID=${like.goodID}">${like.name}</a>
									</div>
									<div class="p_price">
										<strong>¥${like.standard[0].price}</strong>
									</div></li>

							</c:forEach>
						</ul>
					</div>
				</div>


				<div class="product_detail">
					<div class="detail_tab">
						<ul>
							<li id="product_detail" class="active">商品详情</li>
							<li id="user_comment">用户评论</li>
						</ul>
					</div>

					<div class="detail_content">
						<!--商品详情 -->
						<div id="details">
							<div class="detail_img">
								<table width="690" border="1" align="center" cellpadding="0"
									cellspacing="0" class="details_font">
									<tr>
										<td width="106" align="center" valign="middle"
											class="details_font">保质期:</td>
										<td width="224" valign="middle">${good.parameter.shelfLife}</td>
										<td width="106" align="center" valign="middle"
											class="details_font">存储条件:</td>
										<td width="226" valign="middle">${good.parameter.storage}</td>
									</tr>
									<tr>
										<td align="center" valign="middle" class="details_font">商标：</td>
										<td valign="middle">${good.parameter.brand}</td>
										<td align="center" valign="middle" class="details_font">净含量:</td>
										<td valign="middle">${good.parameter.netVolum}</td>
									</tr>
									<tr>
										<td align="center" valign="middle" class="details_font">产地：</td>
										<td valign="middle">${good.parameter.places}</td>
										<td align="center" valign="middle" class="details_font">规格：</td>
										<td valign="middle"></td>
									</tr>
								</table>

								<c:forEach items="${good.details}" var="one">
									<img src="images/desc_img/${one.detailImg}" />
								</c:forEach>


							</div>
						</div>

						<!--用户评论 -->
						<div id="comment">
							<div class="comment_info">
								<div class="score">
									总体满意度 <b>4.6<span>分</span> </b> （共有<strong>7</strong>人评论）
								</div>
								<div class="percent">
									<ul class="slip">
										<li><b>好评</b> <span><span style="width:50%"></span>
										</span> <i>100%</i>
										</li>
										<li><b>中评</b> <span><span style="width:50%"></span>
										</span> <i>0%</i>
										</li>
										<li><b>差评</b> <span><span style="width:50%"></span>
										</span> <i>0%</i>
										</li>
									</ul>
								</div>
								<div class="comment_btn">
									前5位评论用户可获得更高奖励 <a id="commentBtn" class="btn_gn">我要评论</a>
									<p>只有购买过该商品的用户才能评论哦</p>
								</div>
							</div>

							<div class="comment_list">
								<div class="comment_tab">
									<span class="all on">全部评论</span>
								</div>

								<div id="productCommentVote">
									<div class="comment_con">
										<ul>

											<li>
												<div class="comment_item">
													<div class="content_comment">
														<div class="heading">
															<div class="user">user_test</div>
															<div class="date">
																2016-03-24<span>18:07:04</span>
															</div>
														</div>
														<div class="reply">对商品非常满意</div>
														<div class="reply_img"></div>
													</div>
												</div>
											</li>

											<li>
												<div class="comment_item">
													<div class="content_comment">
														<div class="heading">
															<div class="user">user_test</div>
															<div class="date">
																2016-03-24<span>18:07:04</span>
															</div>
														</div>
														<div class="reply">对商品非常满意</div>
														<div class="reply_img"></div>
													</div>
												</div>
											</li>

											<li>
												<div class="comment_item">
													<div class="content_comment">
														<div class="heading">
															<div class="user">user_test</div>
															<div class="date">
																2016-03-24<span>18:07:04</span>
															</div>
														</div>
														<div class="reply">对商品非常满意</div>
														<div class="reply_img"></div>
													</div>
												</div>
											</li>

										</ul>
									</div>
								</div>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>
	</div>
	<!-- 引入网页的底部 -->
	<%@ include file="bottom.html"%>
</body>
</html>
