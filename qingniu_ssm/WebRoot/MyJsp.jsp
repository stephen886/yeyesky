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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>

	名称：${good.name}
	<p>预览图片：${good.previews[0].preImg}</p>
	<c:forEach items="${good.previews}" var="one">
		${one.preImg}
	</c:forEach>

	<p>商品规格</p>
	${good.standard[0].price}
	<c:forEach items="${good.standard}" var="one">
		${one.specification}
		${one.price}
	</c:forEach>

	<p>详细图片</p>
	<c:forEach items="${good.details}" var="one">
		${one.detailImg}
	</c:forEach>
	
	<p>商品参数</p>
	${good.parameter.brand}
	${good.parameter.storage}
	${good.parameter.shelfLife}
	${good.parameter.netVolum}
	${good.parameter.places}



	<p></p>
</body>
</html>
