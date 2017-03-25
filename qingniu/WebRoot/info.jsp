<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="info.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div id="wrapper">
	<h2>系统信息提示</h2>
    <h1>${msg }</h1>
    <p id="timetext">自动后退：5秒</p>
    <p><a href="${url}">返回首页</a></p>
</div>
<script language="javascript">
var url="${url}";
var i=5;
var t=setInterval(show,1000);
function show(){
	i--;
	document.getElementById("timetext").innerHTML="自动后退："+i+"秒";
	if(i==0){
		clearInterval(t);
		if(url!="JavaScript:history.back()")
		location.href=url;
		else
		history.back();
	}
}
</script>
</body>
</html>