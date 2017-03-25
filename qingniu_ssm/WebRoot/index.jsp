<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>青牛懂生活,爱美食！</title>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" type="text/css" href="css/head.css" />
<script type="text/javascript" src="js/head.js"></script>


<link rel="stylesheet" type="text/css" href="css/index.css" />

<script type="text/javascript" src="js/index.js"></script>


</head>

<body>
	<!-- 引入头部 -->
	<%@ include file="head.jsp"%>


	<!--图片轮播-->
	<div id="SlideBox">
		<div id="sildeBox_Amax">
			<div id="slideBox_A">
			 
			 <a href="product"><img src="images/sildebox_img/pic1.jpg" /></a>
			 
			 <a href="product"><img src="images/sildebox_img/pic2.jpg" /></a>
			 
			 <a href="product"><img src="images/sildebox_img/pic3.jpg" /></a>
			 
			 <a href="product"><img src="images/sildebox_img/pic4.jpg" /></a>
			 
			</div>
			<div id="nextleft"></div>
			<div id="nextright"></div>
			<div id="slideitem">
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>

		</div>
	</div>


	<div id="midlle">
		<div id="centre4">
			<div class="guessyoulike">
				<div class="youlike">猜你喜欢</div>
				<div class="cargos">
					<a id="chref1" href="product">
						<div id="cargo1" class="cargo">
							<img id="cimg_1" src="images/210x210_w_1800136180_1_7.jpg" width="210"
								height="210" />
							<div id="cdesc1" class="description">果郡王越南火龙果5斤</div>
							<div id="cprice1" class="price">￥79</div>
						</div>
					</a> <a id="chref2" href="product">
						<div id="cargo2" class="cargo">
							<img id="cimg_2" src="images/210x210_1800008955_3_1_8.jpg" width="210"
								height="210" />
							<div id="cdesc2" class="description">荷裕 三文鱼刺身100g</div>
							<div id="cprice2" class="price">￥39.9</div>
						</div>
					</a> <a id="chref3" href="product">
						<div id="cargo3" class="cargo">
							<img id="cimg_3" src="images/cargo5.jpg" width="210" height="210" />
							<div id="cdesc3" class="description">海买大西洋三文鱼段</div>
							<div id="cprice3" class="price">￥35</div>
						</div>
					</a> <a id="chref4" href="product">
						<div id="cargo4" class="cargo">
							<img id="cimg_4" src="images/210x210_w_1800148895_1_5.jpg" width="210"
								height="210" />
							<div id="cdesc4" class="description">花果山 越南青芒5斤装</div>
							<div id="cprice4" class="price">￥55</div>
						</div>
					</a>


					<!-- end . cargos-->
				</div>

				<div class="changeCargo">
					<img src="images/change1.png" alt="" width="200" height="200" />
				</div>

				<!-- end . guessyoulike-->
			</div>
			<!-- end .centre4 -->
		</div>




		<div id="centre5" class="commodity">
			<div class="littletitle">水果蔬菜</div>
			<div class="line5"></div>
			<div class="comm5">
				<div class="comleft">
					<div id="yuan">
						<!--圆-->
						<a href="product.jsp"><div class="circle">火龙果</div></a> <a
							href="product.jsp"><div class="circle">榴莲</div></a> <a
							href="product.jsp"><div class="circle">苹果</div></a> <a
							href="product.jsp"><div class="circle">香梨</div></a> <a
							href="product.jsp"><div class="circle">红提</div></a> <a
							href="product.jsp"><div class="circle">牛提果</div></a> <a
							href="product.jsp"><div class="circle">蔬菜</div></a> <a
							href="product.jsp"><div class="circle">香蕉</div></a> <a
							href="product.jsp"><div class="circle">菠萝</div></a> <img
							src="images/bg23.jpg" width="160" height="160" />
					</div>

				</div>
				
				
				
				
				<div class="comright">
				  
				    <a href="productview?goodID=41">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5041.png" width="160" height="160" />
							</div>
							
							<div class="comdesc">海买大西洋三文鱼段 260g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=1">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1001.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">新西兰羔羊去骨羊肩肉</div>
							<div class="comprice">￥11</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=2">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1002.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">天谱乐食澳洲牛肉块 1000</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=3">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1003.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">丹麦皇冠 天然谷饲猪肋排 500g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=7">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1007.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">海洋兄弟 挪威北极鳕颈肉 500g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=15">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/4007.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">佳尚新蔬 速冻玉米粒 500</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=38">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1014.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">新西兰带骨羊肉块100g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=39">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1015.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">大洋世家oceanfamily 鲳鱼200g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				
				</div>




			</div>


			<!-- end .centre5 -->
		</div>






		<div id="centre6" class="commodity">
			<div class="littletitle">肉类海鲜</div>
			<div class="line5"></div>
			<div class="comm5">
				<div class="comleft">
					<div id="yuan">
						<!--圆-->
						<a href="product.jsp"><div class="circle">羊肉</div></a> <a
							href="product.jsp"><div class="circle">猪肉</div></a> <a
							href="product.jsp"><div class="circle">鸡肉</div></a> <a
							href="product.jsp"><div class="circle">狗肉</div></a> <a
							href="product.jsp"><div class="circle">牛肉</div></a> <a
							href="product.jsp"><div class="circle">兔肉</div></a> <a
							href="product.jsp"><div class="circle">鱼肉</div></a> <a
							href="product.jsp"><div class="circle">虾</div></a> <a
							href="product.jsp"><div class="circle">海威</div></a> <img
							src="images/df25cf5a065ebcef5a35a6c6936e7a5a.jpg" width="220"
							height="230" />
					</div>

				</div>
				<div class="comright">
					  
				    <a href="productview?goodID=4 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1004.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">大原祥 乳羔羊后腿肉坯 500g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=23 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3007.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">五粮液 马到成功 52度</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=32 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5008.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">欧利美食蓝莓果酱 300g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=7 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1007.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">海洋兄弟 挪威北极鳕颈肉 500g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=8 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/1008.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">冻阿根廷红虾20/30 2kg</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=10 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/4002.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">国产新鲜蓝莓4盒*125g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=15 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/4007.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">佳尚新蔬 速冻玉米粒 500</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=16 ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/4008.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">豪棒棒牛奶水果玉米棒</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				
				</div>
			</div>


			<!-- end .centre6 -->
		</div>



		<div class="clean"></div>








		<div id="centre7" class="commodity">
			<div class="littletitle">进口饮料</div>
			<div class="line5"></div>
			<div class="comm5">
				<div class="comleft">
					<div id="yuan">
						<!--圆-->
						<a href="product.jsp"><div class="circle">牛奶</div></a> <a
							href="product.jsp"><div class="circle">羊奶</div></a> <a
							href="product.jsp"><div class="circle">红酒</div></a> <a
							href="product.jsp"><div class="circle">白酒</div></a> <a
							href="product.jsp"><div class="circle">茅台</div></a> <a
							href="product.jsp"><div class="circle">啤酒</div></a> <a
							href="product.jsp"><div class="circle">比利时</div></a> <a
							href="product.jsp"><div class="circle">威士忌</div></a> <a
							href="product.jsp"><div class="circle">鸡尾酒</div></a> <img
							src="images/2a95d0bbf9877aca293b67d8dfd85037.jpg" width="220"
							height="230" />
					</div>

				</div>
				<div class="comright">
					  
				    <a href="productview?goodID=14">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/4006.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">新西兰绿奇异果整箱装</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=18">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3002.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">弗莱斯 罗马起泡葡萄酒</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=19">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3003.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">马代苏 赤霞珠干红750ml</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=20">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3004.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">卡慕 雷岛特酿干邑白兰地</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=21">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3005.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">百佳黄啤酒 330ml*3</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=22">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3006.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">亿纯矿泉水750ml*12</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=23">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3007.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">五粮液 马到成功 52度</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=24">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/3008.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">剑南春 52°500ml</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				
				</div>
			</div>


			<!-- end .centre7 -->
		</div>


		<div class="clean"></div>











		<div id="centre8" class="commodity">
			<div class="littletitle">零食茶饮</div>
			<div class="line5"></div>
			<div class="comm5">
				<div class="comleft">
					<div id="yuan">
						<!--圆-->
						<a href="product.jsp"><div class="circle">开心果</div></a> <a
							href="product.jsp"><div class="circle">干果</div></a> <a
							href="product.jsp"><div class="circle">无花果</div></a> <a
							href="product.jsp"><div class="circle">瓜子</div></a> <a
							href="product.jsp"><div class="circle">花生</div></a> <a
							href="product.jsp"><div class="circle">红茶</div></a> <a
							href="product.jsp"><div class="circle">饼干</div></a> <a
							href="product.jsp"><div class="circle">面包</div></a> <a
							href="product.jsp"><div class="circle">薯片</div></a> <img
							src="images/cb5909aa4228278718de323f11b77437.jpg" width="220"
							height="230" />
					</div>

				</div>
				<div class="comright">
					  
				    <a href="productview?goodID=25">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5001.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">纷时乐美式蜂蜜烤碧根果100g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=26">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5002.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">雅可 花生慕斯夹心巧克力</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=27">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5003.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">啪啪通 虾片烤番茄味</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=28">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5004.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">乐家 扁桃仁糖375g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=29">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5005.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">红色拖拉机原味速食燕麦</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=30">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5006.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">乐维萨欧罗金咖啡豆 250g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=31">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5007.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">迪尔玛 伯爵红茶 100g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				 
				    <a href="productview?goodID=32">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="images/preview_img/5008.jpg" width="160" height="160" />
							</div>
							
							<div class="comdesc">欧利美食蓝莓果酱 300g</div>
							<div class="comprice">￥20</div>
						</div>
					</a> 
				
				</div>




			</div>


			<!-- end .centre8 -->

		</div>



	</div>
	<!-- end .midlle -->
	</div>
	<div class="clean"></div>

	<!-- 引入底部 -->
	<%@ include file="bottom.html"%>

</body>
</html>