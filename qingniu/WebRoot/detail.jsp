<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/detail.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/detail.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>

<body >

	<!-- 引入网站的通用头部-->
	<%@ include file="head.jsp"%>
	<!-- 网页的主要内容 -->
    
    <div class="formCx">
    
        	<ul class="filter_sort">
                <li class="allsort on">默认排序</li>
                <li class="allsort ">销量<i class="down "></i></li>
                <li class="allsort ">价格<i class="sort_down "></i></li>
                <li class="allsort last">评论<i class="down"></i></li> 
            </ul>
       
    </div>
     
	<input type="hidden" name="searchtxt" id="key" value="" />
     
    <div class="goods_list">
    	<ul>
       <c:choose>
        	<c:when test="${result!=null}">
        		<c:forEach items="${result}" var="RS">
        			<li>
		            	<div class="product">
		                	<div class="addtocar">
                            <input id="pidtxt" type="hidden" value="${RS.goods_id}" />
                            <input id="pricetxt" type="hidden" value="${RS.specifition[0].price}" />
		                    	<span>加入购物车</span>
		                    </div>
		                	<div class="p_img">
		                    	<a href="product?pid=${RS.goods_id}"><img src="${RS.preview_img[0]}" /></a>
		                    </div>
		                    <div class="p_info">
		                    	<div class="p_name">
		                        	<a href="product?pid=${RS.goods_id}">${RS.goods_name}</a>
		                        </div>
		                        <div class="p_price">
		                        	<strong>&yen;<b>${RS.specifition[0].price}</b></strong>                           
		                        </div>
		                    </div>
		                </div>
		            </li>
        		</c:forEach>
        	
        	</c:when>
        	<c:otherwise>
        		<li class='notfound'>未找到此商品！</li>
        	</c:otherwise>
        </c:choose>
        	
 
        	
            
        </ul>
    
    </div>
     
     
</body>
</html>
