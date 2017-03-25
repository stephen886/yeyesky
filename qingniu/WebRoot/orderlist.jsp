
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link type="text/css" rel="stylesheet" href="css/orderlist.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/order.js"></script>
</head>

<body>

<c:import url="head.jsp"></c:import>

	<div class="content">
    	<div class="cart-bar">
        	<img src="images/yes_ok.png" /><span>亲...订单已成功下达！正在呼叫镖局接标，宝贝将很快送到你手上，你还可以：<a href="index">继续添加宝贝</a></span>
        </div>
        <div class="cart-bar">
        	<span>订单号：123455</span>
        </div>
        <div class="ht-cart">
            	<div class="cart-thead">
                	<div class="t-checkbox">
                    	<span>商品号</span>
                    </div>
                    <div class="t-goods">商品名</div>
                    <div class="t-props"></div>
                    <div class="t-quantity">数量</div>
                    <div class="t-sum">小计（元）</div>
                </div>
                <div id="cart-list">
                	<c:forEach items="${orderlist}" var="list">
                    	<div class="item-form">                       	
                            
                            <div class="p-goods">
                            	<div class="p-img">
                                	<span>23</span>
                                </div>
                                <div class="p-msg">
                                	 <span>${list.commodity_name}</span>
                                </div>
                            </div>
                            <div class="p-props">
                            </div>
                          
                            <div class="p-quantity">
                            	<span class="p_number">${list.goods_amount}</span>                      	                          	
                            </div>                          
                            <span class="p-sum">${list.goods_amount*list.goods_price}</span>
                          
                        </div>
                     </c:forEach>   
                        
                        
                </div>
                
                <div id="orderinfo">
                	<div id="sum">合计：<span id="total-price"></span></div>
                	<div id="receiver">收货人：${sessionScope.userinfo.username}</div>
                    <div id="rcellphone">手机号码：${sessionScope.userinfo.mobilePhone}</div>
                    <div id="raddress">收货地址：${sessionScope.userinfo.residential}</div>
                </div>
                

        </div>
    </div>
    

</body>
</html>
