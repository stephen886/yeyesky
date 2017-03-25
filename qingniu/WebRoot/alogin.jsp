<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>青牛懂生活,爱美食！</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" type="text/css" href="css/head.css" />
<script type="text/javascript" src="js/head.js"></script>
</head>
<body>
	<%
	byte[] bt = (byte[]) request.getAttribute("why");
	//拿到乱码反向查找 iso-8859-1 码表，获取原始数据，
	//在构造一个字符串让它去查找UTF-8 码表，已得到正常数据
	//String value = new String(why.getBytes("iso-8859-1"));

	String correctStr = new String(bt);
	out.println(correctStr);
%>
</body>
</html>