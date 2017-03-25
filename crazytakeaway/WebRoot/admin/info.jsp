<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=basePath%>admin/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 网站信息</strong></div>
  <div class="body-content">
    <form method="post" enctype="multipart/form-data" class="form-x" action="<c:url value="/admin/updateStoreInfo?storeID=${storeinfo.storeID}"/>">
      <div class="form-group">
        <div class="label">
          <label>店铺名字：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="storename" value="${storeinfo.storename}" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>店铺图片：</label>
        </div>
        <div class="field">
          <input type="file" id="url1" name="file" class="input tips" style="width:25%; float:left;" value="${storeinfo.storeImg}" data-toggle="hover" data-place="right" data-image=""  />
          <input type="button" class="button bg-blue margin-left" id="image1" value="+ 浏览上传" >
        </div>
      </div>
      <div class="form-group start_price">
        <div class="label">
          <label>起送价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="startPrice" value="${storeinfo.startPrice}" />
        </div>
      </div>
      <div class="form-group express">
        <div class="label">
          <label>送餐费用：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="expressFree" value="${storeinfo.expressFree}" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>手机：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="contact" value="${storeinfo.contact}" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group district">
        <div class="label">
          <label>所在区域：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="province" value="${storeinfo.storeAdress.province}" /><span>省</span>
          <input type="text" class="input" name="city" value="${storeinfo.storeAdress.city}" /><span>市</span>
          <input type="text" class="input" name="district" value="${storeinfo.storeAdress.district}" /><span>区</span>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>详细地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="street" value="${storeinfo.storeAdress.street}" />
          <div class="tips"></div>
        </div>
      </div>  
              
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>