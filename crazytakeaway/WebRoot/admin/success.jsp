<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
			#box{
				width: 100%;
				height: 120px;
				color: white;
				background-color: green;
				font-size: 30px;
			}
			#box span{
				display: block;
				padding-top: 40px;
				width: 150px;
				margin: 0 auto;
			}
		</style>
	</head>
	<body>
		
		<div id="box">
			<span>操作成功!</span>
			
		</div>
		
	</body>
</html>
