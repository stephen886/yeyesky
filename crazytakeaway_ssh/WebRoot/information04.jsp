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
    <!--     小金库       -->
    <div class="informantion_or4">
        <div class="mc">
            <div class="coffers-tit">
                <h1>我的小金库</h1>
                <a href="#">产品介绍</a>
                <div class="fr">
                    <span><a href="#">安全中心</a>保护账户资产安全</span>
                </div>
            </div>

            <div class="coffers-info">
                <span>昨日收益：<strong id="income">￥1.00</strong></span>
                <span>小金库余额：<a href="#" id="balance">￥9999.80</a></span>
                <div>
                    <a href="#" id="turn"><strong>转入</strong></a>
                    <a href="#" id="down">转出</a>
                </div>
            </div>

            <hr />

            <div class="coffers-msg">
                <div>累计历史收益：<strong id="totalIncome">￥0.00</strong> 七日年化收益率：
                    <strong id="rate">0.00%</strong></div>
                <div>疯了么小金库由&nbsp;&nbsp;<strong>嘉实基金</strong>&nbsp;&nbsp;和&nbsp;&nbsp;<strong>鹏华基金</strong>&nbsp;&nbsp;共同提供</div>
                <div><a href="#" class=""><strong>查看收益明细</strong></a></div>

            </div>
        </div>

    </div>
</body>
</html>