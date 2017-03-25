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
			<c:forEach  items="${SildeBox}"  var="mymap"> 
			 <a href="${mymap.url}"><img src="${mymap.img}" /></a>
			</c:forEach> 
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
				 <c:forEach  items="${index}"  var="mymap" begin="0" end="7"> 
				    <a href="product?pid=${mymap.goods_id}">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="${mymap.preview_img[0]}" width="160" height="160" />
							</div>
							
							<div class="comdesc">${mymap.goods_name}</div>
							<div class="comprice">￥${mymap.specifition[0].price}</div>
						</div>
					</a> 
				</c:forEach>
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
					 <c:forEach  items="${index}"  var="mymap" begin="8" end="15"> 
				    <a href="product?pid=${mymap.goods_id} ">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="${mymap.preview_img[0]}" width="160" height="160" />
							</div>
							
							<div class="comdesc">${mymap.goods_name}</div>
							<div class="comprice">￥${mymap.specifition[0].price}</div>
						</div>
					</a> 
				</c:forEach>
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
					 <c:forEach  items="${index}"  var="mymap" begin="16" end="23"> 
				    <a href="product?pid=${mymap.goods_id}">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="${mymap.preview_img[0]}" width="160" height="160" />
							</div>
							
							<div class="comdesc">${mymap.goods_name}</div>
							<div class="comprice">￥${mymap.specifition[0].price}</div>
						</div>
					</a> 
				</c:forEach>
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
					 <c:forEach  items="${index}"  var="mymap" begin="24" end="31"> 
				    <a href="product?pid=${mymap.goods_id}">
						<div class="comcargobox">
							<div class="comimg">
						
								<img src="${mymap.preview_img[0]}" width="160" height="160" />
							</div>
							
							<div class="comdesc">${mymap.goods_name}</div>
							<div class="comprice">￥${mymap.specifition[0].price}</div>
						</div>
					</a> 
				</c:forEach>
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