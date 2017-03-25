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

<!--特效js  -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/overhang.min.css" />
<link rel="stylesheet" type="text/css" href="css/prism.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/overhang.min.js"></script>
<script type="text/javascript" src="js/prism.js"></script>
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
					<img src="img/store_img/${store.storeImg}" />
					<h4>${store.storename}</h4>
					<input type="hidden" id="storeid" value="${store.storeID}" />
					<div class="sale-info"></div>
					<div class="labels">
						<div class="add_top_cart">
						<span id="delete" class="glyphicon glyphicon-remove-circle"></span>

						</div>


					</div>
				</div>
				<!--一个菜品的结束-->
			</c:forEach>

		</div>
	</div>

</body>
<script>
	//收藏操作的js
	$(".add_top_cart").click(
			function() {
				$.get("collectCanel?store_id=" +storeid, function(data, status) {
						alert(data);
					$("body").overhang({
						type : "error",
						message : "已经取消收藏!",
						duration : 2
					});
					setTimeout(goherf, 2000);
				});
			});

	function goherf() {
		location.href = "user.jsp";
	}
</script>
</html>