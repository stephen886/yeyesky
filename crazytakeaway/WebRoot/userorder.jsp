<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
		<link rel="stylesheet" href="css/userorder.css" />
	</head>

	<body>

		<c:forEach items="${orderlist}" var="order">

			<div class="order">
				<div class="orderinfoborder">
					<p><span>订单时间:</span><span class="orderinfo">${order.orderTime}</span><span>订单号： </span><span class="orderinfo"> 2423516603${order.tradeID}</span></p>
				</div>
				<div class="info">

					<div class="fr">
						<div class="order_storename">${order.storeName}</div>
						<div class="order_price">￥${order.price}</div>
						<div class="order_status">${order.statu}</div>
					</div>

					<c:forEach items="${order.orderDetails}" var="details">
						<div class="fl">
							<img class="img" src="img/menu_img/${details.menu.menuImg}" />
							<div>
								<div class="info_content">
									<span class="info_wenzi">${details.menu.menuName}</span>
									<span class="info_wenzi">${details.amount}</span>
									<a href=""><span class="info_wenzi">退款</span></a>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>

			</div>
		</c:forEach>

	</body>

</html>