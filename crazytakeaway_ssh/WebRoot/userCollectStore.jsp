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

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>收藏的商店</title>
<link rel="stylesheet" type="text/css" href="css/information.css" />
<link rel="stylesheet" href="css/restaurant.css" />
<link rel="stylesheet" href="css/icon.css" />
</head>

<body>
	<!-- 我的收藏  -->
	<div class="informantion_or2">
		<!--<p class="info_dx_p">我的收藏</p>-->
		<div id="info_d">



			<c:forEach items="${storelist}" var="store">
				<!--
                            	作者：lyw
                            	时间：2016-10-19
                            	描述：一个菜品 的开始
                            -->
				<div class="one_food">
					<img src="img/store_img/${store.store_img}" />
					<h4>${store.store_name}</h4>
					<div class="sale-info"></div>
					<div class="labels">
						<div class="add_top_cart">
							<a href="order.html"><span
								class="glyphicon glyphicon-remove-circle"></span></a>

						</div>


					</div>
				</div>
				<!--一个菜品的结束-->
			</c:forEach>

		</div>
	</div>

</body>
</html>