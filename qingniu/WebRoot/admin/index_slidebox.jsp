<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/admin/";
%>
<%
	out.print("路径"+path);
%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">

		<title>天智后台管理系统</title>
		<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
		<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

		<link href="css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
		<link href="font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

		<!-- Morris -->
		<link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

		<!-- Gritter -->
		<link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

		<link href="css/animate.css" rel="stylesheet">
		<link href="css/style.css?v=2.2.0" rel="stylesheet">

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="../dist/js/jquery.min.js"></script>
		<script src="../dist/js/bootstrap.min.js"></script>
		<script src="../dist/js/holder.min.js"></script>

		<script charset="utf-8" src="kindeditor/kindeditor-all.js"></script>
		<script charset="utf-8" src="kindeditor/lang/zh-CN.js"></script>
		<script>
			KindEditor.ready(function(K) {
				window.editor = K.create('#editor_id');
			});
			var options = {
				cssPath: '/css/index.css',
				filterMode: true
			};
			var editor = K.create('textarea[name="content"]', options);
		</script>

	</head>

	<body>
		<div id="wrapper">
			<nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">

                        <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="img/profile_small.jpg" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Beaut-zihan</strong>
                             </span> <span class="text-muted text-xs block">超级管理员 <b class="caret"></b></span> </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="form_avatar.html">修改头像</a>
                                </li>
                                <li><a href="profile.html">个人资料</a>
                                </li>
                                <li><a href="contacts.html">联系我们</a>
                                </li>
                                <li><a href="mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="login.html">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            H+
                        </div>

                    </li>
                    <li class="active">
                        <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">主页管理</span> <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="index_slidebox.jsp">图片轮播设置</a>
                            </li>
                            <li><a href="index_field.jsp">分类板块设置</a>
                            </li>
                           
                        
                        </ul>
                    </li>
                   
                    <li>
                        <a href="index.html#"><i class="fa fa fa-globe"></i> <span class="nav-label">商品管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="toastr_notifications.html">修改商品</a>
                            </li>
                            <li><a href="nestable_list.html">增加商品</a>
                            </li>
                            <li><a href="timeline_v2.html">删除商品</a>
                            </li>
                            <li><a href="forum_main.html">上架商品</a>
                            </li>
                            <li><a href="code_editor.html">库存分析</a>
                            </li>
                            <li><a href="modal_window.html">紧缺商品</a>
                            </li>
                            <li><a href="validation.html">销售分析</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="index.html#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">订单管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="graph_echarts.html">订单列表</a>
                            </li>
                            <li><a href="graph_flot.html">查找订单</a>
                            </li>
                            <li><a href="graph_morris.html">修改订单信息</a>
                            </li>
                          
                        </ul>
                    </li>
                    <li>
                        <a href="mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">广告管理 </span><span class="label label-warning pull-right">16</span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="mailbox.html">主页banner</a>
                            </li>
                            <li><a href="mail_detail.html">开屏广告</a>
                            </li>
                           
                        </ul>
                    </li>
                  
                    <li>
                        <a href="index.html#"><i class="fa fa-edit"></i> <span class="nav-label">广播系统</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="form_basic.html">站内广播</a>
                            </li>
                            <li><a href="form_validate.html">邮件广播</a>
                            </li>
                           
                        </ul>
                    </li>
                    <li>
                        <a href="index.html#"><i class="fa fa-desktop"></i> <span class="nav-label">物流系统</span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="contacts.html">等待发货</a>
                            </li>
                            <li><a href="profile.html">退货处理</a>
                            </li>
                           
                        </ul>
                    </li>
                    <li>
                        <a href="index.html#"><i class="fa fa-files-o"></i> <span class="nav-label">其他页面</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="search_results.html">搜索结果</a>
                            </li>
                            <li><a href="lockscreen.html">登录超时</a>
                            </li>
                            <li><a href="404.html">404页面</a>
                            </li>
                            <li><a href="500.html">500页面</a>
                            </li>
                            <li><a href="empty_page.html">空白页</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="index.html#"><i class="fa fa-flask"></i> <span class="nav-label">促销系统</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="typography.html">限时秒杀</a>
                            </li>
                           
                        </ul>
                    </li>
                </ul>

            </div>
        </nav>

			<div id="page-wrapper" class="gray-bg dashbard-1">
				<div class="row border-bottom">
					<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
						<div class="navbar-header">
							<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="index.html#"><i class="fa fa-bars"></i> </a>
							<form role="search" class="navbar-form-custom" method="post" action="search_results.html">
								<div class="form-group">
									<input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
								</div>
							</form>
						</div>
						<ul class="nav navbar-top-links navbar-right">
							<li class="dropdown">
								<a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
									<i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
								</a>
								<ul class="dropdown-menu dropdown-messages">
									<li>
										<div class="dropdown-messages-box">
											<a href="profile.html" class="pull-left">
												<img alt="image" class="img-circle" src="img/a7.jpg">
											</a>
											<div class="media-body">
												<small class="pull-right">46小时前</small>
												<strong>小四</strong> 项目已处理完结
												<br>
												<small class="text-muted">3天前 2014.11.8</small>
											</div>
										</div>
									</li>
									<li class="divider"></li>
									<li>
										<div class="dropdown-messages-box">
											<a href="profile.html" class="pull-left">
												<img alt="image" class="img-circle" src="img/a4.jpg">
											</a>
											<div class="media-body ">
												<small class="pull-right text-navy">25小时前</small>
												<strong>国民岳父</strong> 这是一条测试信息
												<br>
												<small class="text-muted">昨天</small>
											</div>
										</div>
									</li>
									<li class="divider"></li>
									<li>
										<div class="text-center link-block">
											<a href="mailbox.html">
												<i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
											</a>
										</div>
									</li>
								</ul>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
									<i class="fa fa-bell"></i> <span class="label label-primary">8</span>
								</a>
								<ul class="dropdown-menu dropdown-alerts">
									<li>
										<a href="mailbox.html">
											<div>
												<i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
												<span class="pull-right text-muted small">4分钟前</span>
											</div>
										</a>
									</li>
									<li class="divider"></li>
									<li>
										<a href="profile.html">
											<div>
												<i class="fa fa-qq fa-fw"></i> 3条新回复
												<span class="pull-right text-muted small">12分钟钱</span>
											</div>
										</a>
									</li>
									<li class="divider"></li>
									<li>
										<div class="text-center link-block">
											<a href="notifications.html">
												<strong>查看所有 </strong>
												<i class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul>
							</li>
							<li>
								<a href="login.html">
									<i class="fa fa-sign-out"></i> 退出
								</a>
							</li>
						</ul>

					</nav>
				</div>

				<!--------------->
				<div class="wrapper wrapper-content">
					<h2>图片轮播设置</h2>
					<form class="form-horizontal container" style="max-width: 600px;">
						<div class="form-group">
							<!-- Select Basic -->
							<label class="col-sm-4 control-label">请选择栏位</label>
							<div class="col-sm-8">
								<select class="form-control">
								      <option>轮播图片一</option>
								      <option>轮播图片二</option>
								      <option>轮播图片三</option>
								      <option></option>
									</select>
							</div>

						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-4 control-label">请输入链接地址</label>
							<div class="col-sm-8">
								<input type="email" class="form-control" id="inputEmail3">
							</div>
						</div>
						
						
						<div class="form-group">
								<label class="col-sm-4 control-label">图片文件</label>

								<!-- File Upload -->
								<div class="col-sm-8">
									<input class="btn btn-success" id="fileInput" type="file">
								</div>
							</div>

							<div class="form-group">
								<!-- Button -->
								<div class="col-lg-8 pull-right">
									<button type="submit" class="btn btn-primary btn-block">设置</button>
								</div>
							</div>
						
						
			
					</form>


				</div>

			</div>
		</div>

		<!-- Mainly scripts -->
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/bootstrap.min.js?v=3.4.0"></script>
		<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

		<!-- Custom and plugin javascript -->
		<script src="js/hplus.js?v=2.2.0"></script>
		<script src="js/plugins/pace/pace.min.js"></script>

		<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
		<!--统计代码，可删除-->
	</body>

</html>