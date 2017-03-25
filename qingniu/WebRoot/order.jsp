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
<link type="text/css" rel="stylesheet" href="css/showcart.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/order.js"></script>
</head>

<body>

<c:import url="head.jsp"></c:import>

	<div class="content">
    	<div class="cart-bar">
        	<span>全部商品</span>
        </div>
        <div class="ht-cart">
            	<div class="cart-thead">
                	<div class="t-checkbox">
                    	<span>选择</span>
                    </div>
                    <div class="t-goods">商品</div>
                    <div class="t-props"></div>
                    <div class="t-quantity">数量</div>
                    <div class="t-sum">小计（元）</div>
                </div>
                <div id="cart-list">
                	<c:forEach items="${orderlist}" var="list">
                    	<div class="item-form">                       	
                            
                            <div class="p-goods">
                            	<div class="p-img">
                                	<a href="#"><img src="images/preview_img/${list.preview_img}" /></a>
                                </div>
                                <div class="p-msg">
                                	 <a href="#">${list.commodity_name}</a>
                                </div>
                            </div>
                            <div class="p-props">
                            </div>
                          
                            <div class="p-quantity">
                            	<span class="p_number">${list.goods_amount}</span>                      	                          	
                            </div>                          
                            <span class="p-sum">${list.goods_amount*list.goods_price}</span>
                            <input type="hidden" class="goodid" value="${list.cart_id}" />
                          
                        </div>
                     </c:forEach>   
                        
                        
                </div>
                
                <div id="orderinfo">
                	<div>收货人：<input type="text" id="receiver" value="${sessionScope.userinfo.username}" /></div>
                    <div>手机号码：<input type="text" id="rcellphone" value="${sessionScope.userinfo.mobilePhone}" /></div>
                    <div>收货地址：<input type="text" id="raddress"  value="${sessionScope.userinfo.residential}" /></div>
                </div>
                
                <div class="cart-footbar">
                	<div class="f-checkbox">
                    	
                    </div>
                    <div class="f-price">
                    	总价：<span>&yen;<b id="total-price">0.00</b></span>
                    </div>
                    <div class="btn-area" id="confirm">
                    	<a href="#"><span>确认订单</span></a>
                    </div>
                </div>

        </div>
    </div>
    

</body>
</html>
