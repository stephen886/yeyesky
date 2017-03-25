<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
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

<title>My JSP 'abc.jsp' starting page</title>

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

 
<!--  完全迭代 

<!-- 根据map的key来找到特定的值 -

 <c:forEach  items="${index}"  var="mymap" begin="0" end="7"> 
 
    ${mymap.preview_img}
</c:forEach> 

 --> 
<p> ${product.specifition[0].price}</p>
<c:forEach  items="${product.desc_img}"  var="mymap"> 
								    <img src="${mymap}" />
								</c:forEach> 
								
								
</body>
</html>
