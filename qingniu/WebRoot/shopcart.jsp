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
<script type="text/javascript" src="js/getcart.js"></script>



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
                    <div class="t-price">单价（元）</div>
                    <div class="t-quantity">数量</div>
                    <div class="t-sum">小计（元）</div>
                    <div class="t-action">操作</div>
                </div>
                
                <div id="cart-list">
                        
                </div>
                
                
                
                <div class="cart-footbar">
                	<div class="f-checkbox">
                    	<input type="checkbox" class="selectAll" name="selectAll"  />
                        <span>全选</span>
                    </div>
                    <div class="f-price">
                    	总价：<span>&yen;<b id="total-price">0.00</b></span>
                    </div>
                    <div class="btn-area" id="tosum">
                    	<a href="#"><span>去结算</span></a>
                    </div>
                </div>

        </div>
    </div>
        		

    
<div id="middle">

  <div class="guessyoulike">
  			<div class="youlike" >猜你喜欢</div>
  	<div class="cargos">
    	<div class="cargobox">
        
        
        </div>
    
  		
                 <div class="changeCargo">
   			 		<img src="images/change1.png" alt="" width="200" height="200" /> 
   			 	</div>
           	 <!-- end . cargos-->     
          </div>     
                  
        <!-- end . guessyoulike-->
        </div>

<!-- end .middle -->
</div>

</body>
</html>
