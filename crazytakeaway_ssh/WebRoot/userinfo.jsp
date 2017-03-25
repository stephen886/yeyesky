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
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="css/information.css" />
</head>


<body>
	<!--============================个人信息=====================================-->

	<div class="informantion_or3">
		<form action="userupdateinfo.action" method="get"
			>
			<!-- enctype="multipart/form-data" -->
			<input type="hidden" name="user_id" value="${user.user_id}"/>
			<input type="hidden" name="uerInfo.info_id" value="${user.uerInfo.info_id}"/>
			<div class="info_form_img">
				<img style="width:100px;height: 100px;" src="img/logo_left.png" class="info_img" /> <input type="button"
					value="上传头像" onclick="path.click()"> <input type="file"
					id="path" style="display:none">
			</div>
			<div class="info_form">
				<span class="info_form_label">真实姓名：</span> <input type="text"
					name="uerInfo.real_name" value="${us.uerInfo.real_name}">
			</div>

			<div class="info_form1">
				<span class="info_form_label">性别：</span> <label id="info_sex"><input
					type="radio" value="男" name="uerInfo.sex">男</label> <label id="info_sex"><input
					type="radio" value="女" name="uerInfo.sex">女</label>
			</div>

			<div class="info_form">
				<span class="info_form_label">手机号码：</span> <input type="text"
					name="phone" value="${us.phone}">
			</div>

			<div class="info_form">
				<span class="info_form_label">居住地址：</span> <input type="text"
					name="uerInfo.adress" value="${us.uerInfo.adress}">
			</div>
			<div class="info_form">
				<span class="info_form_label">电子邮箱：</span> <input type="text"
					name="email" value="${us.email}">
			</div>

			<div class="info_form">
				<input type="submit" value="修改" id="info_btn">
			</div>
		</form>
	</div>

</body>
</html>