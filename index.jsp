<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>城市概览</title>
<link rel="shortcut icon" type="image/x-icon" href="images/cugbIcon.ico" />
<!--核心css文件-->
<link rel="stylesheet" href="css/index.css">
<!--bootstrap需要引入的css文件-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!--需要引入的必要的js文件-->
<script src="js/jquery-1.9.1.min.js "></script>
<script src="js/bootstrap.min.js "></script>
<!--需要引入的必要的Echarts文件重点-->
<script src="js/echarts.js"></script><!-- 因为用到了echarts，所以引入echarts的库文件 -->
<script src="js/china.js"></script><!-- 因为用到了中国地图，所以引入echarts中的中国地图文件 -->
<script src="js/map.js"></script>
</head>


<body style="background-color: black">
    <!-- 第一部分：导航栏部分 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
	<!--导航栏隐藏按钮绑定，屏幕缩小时导航栏隐藏-->
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#navbar-info">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<div>
			<a href="##" class="navbar-brand " style="font-size: 22px;">全国空气质量展示与分析平台&nbsp;</a>
		</div>
	</div>
	<!--导航栏具体内容设置显示-->
	<div class="collapse navbar-collapse  navbar-responsive-collapse"
		id="navbar-info">
		<div>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="study.jsp"><span
						class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li class="active"><a href="index.jsp"><span
						class="glyphicon glyphicon-home"></span> 城市概览</a></li>
				<li><a href="range.jsp"><span
						class="glyphicon glyphicon-home"></span> 区域概览</a></li>
				<li><a href="cityanal.jsp"><span
						class="glyphicon glyphicon-film"></span> 重点城市分析</a></li>
				<li><a href="about.jsp"><span
						class="glyphicon glyphicon-question-sign"></span><b> 关于</b> </a></li>
			</ul>
		</div>
	</div>
</nav>

     <!-- 第二部分：为该echarts图标提供一个容器 -->
	<div id="map_main" class="map col-lg-12 col-md-12 col-sm-12 col-xs-12"></div>
     <!-- 第三部分：异步从后台获取数据所用到的ajax异步刷新技术 -->
	<script>
		$.ajax({
			type : 'POST',
			url : 'ActionCityAddress.action',      //提交到后台的action的url地址
			data : JSON.stringify({                //传递参数的数据格式为json
				'kind' : 'top'
			}),
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',                    //数据返回类型也是json
			success : function(data) {              //回调函数，用来将数据赋值到option
				option = myChart.getOption();
				option.series[0].data = data;
				myChart.setOption(option);
			},
			error : function(xhr, type) {
			}
		});
		$.ajax({
			type : 'POST',
			url : 'ActionCityTop.action',
			data : JSON.stringify({
				'kind' : 'top'
			}),
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			success : function(data) {
				option = myChart.getOption();
				option.series[1].data = data;
				myChart.setOption(option);
			},
			error : function(xhr, type) {
			}
		});
		$.ajax({
			type : 'POST',
			url : 'ActionCityMin.action',     
			data : JSON.stringify({
				'kind' : 'top'
			}),
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			success : function(data) {
				option = myChart.getOption();
				option.series[2].data = data;
				myChart.setOption(option);
			},
			error : function(xhr, type) {
			}
		});
	</script>
</body>
</html>
