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
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>关于</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="shortcut icon" type="image/x-icon" href="images/cugbIcon.ico" />
<link rel="stylesheet" href="css/about.css" />
</head>


<body style="background-color: darkgray;" data-spy="scroll"
	data-target="#myScrollspy">
	<!--第一部分：导航条部分：用于放置重要的页面导航------------------------------------- -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
		
		<!--导航栏与隐藏按钮绑定，屏幕缩小时导航栏隐藏-->
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
						class="glyphicon glyphicon-home"></span> 首页</a>
				</li>
				<li><a href="index.jsp"><span
						class="glyphicon glyphicon-home"></span> 城市概览</a>
				</li>
				<li><a href="range.jsp"><span
						class="glyphicon glyphicon-home"></span> 区域概览</a>
				</li>
				<li><a href="cityanal.jsp"><span
						class="glyphicon glyphicon-film"></span> 重点城市分析</a>
				</li>
				<li class="active"><a href="about.jsp"><span
						class="glyphicon glyphicon-question-sign"></span><b> 关于</b> </a>
				</li>
			</ul>
		</div>
	</div>
</nav>
	<!--第二部分：具体内容------------------------------------- -->
	<div data-spy="scroll" data-target="#myScrollspy"
		style="color:ghostwhite;">
		<div class="container" style="padding-top: 60px;">
			<div class="jumbotron"
				style="background-image: url(images/bg.jpg) ; ">
				<h2>关于</h2>
			</div>
			<div class="row">
				<div class="col-lg-3  hidden-xs col-sm-3" id="myScrollspy">
					<ul id="myAffix" class="nav nav-pills nav-stacked">
						<li><a> <font style="font-size: 25px;">项目介绍</font> </a>
						</li>
						<li><a> <font style="font-size: 25px;">项目实现</font> </a>
						</li>
						<li><a> <font style="font-size: 25px;">项目标准</font> </a>
						</li>
						<li><a> <font style="font-size: 25px;">项目拓展</font> </a>
						</li>


					</ul>
				</div>
				<div class="col-lg-9 col-sm-9 ">
					<h3 id="section-1">项目介绍</h3>
					<pre style="line-height:2">   本网站是基于pm2.5所做的一个大数据量的图表化显示及分析，数据获取自2013年11月1日起到2016年9月30日止的全国重点300余个城市的3年全部数据（注：依据城市开始监测的时间不同，部分城市数据可能少于3年），所有数据来源可靠，可以得出准确的结论。本网站共分为5个部分，第一部分是首页，对空气质量做了一个详尽的科普，第二部分是将所有城市过去三年数据求得平均值显示在中国地图上，并且做了十大污染城市和十大清洁城市的设定。第三部分是通过热力图的方式在中国地图上显示出区域的空气质量状况，由此可以看出分等级的城市空气质量的区域分布。第四部分是核心部分，通过选取城市对该城市的空气质量做了多面分析，首先是统计该城市一年中pm2.5大于115和小于115的各自的空气天数，以此可以看的出一年中晴朗天到底有多少（可以户外活动的程度），其次对过去三年36个月按月显示其均值和方差，以此可以按照季节，月份讨论其时间上的分布规律。最后也是核心功能，作者试图讨论pm2.5与风力的关系，所以获取到过去三年所有pm数据和风力数据，通过大数据量的区域化显示，可以直观的印证当风级高的时候，pm值确实会降低。这一点对于北京的影响尤其高。</pre>
					<h3 id="section-2">项目实现</h3>
					<pre style="line-height:2">   首先用到了爬虫的手段获取到了所有数据，存入数据库后，基于java的struts2和hibernate3的框架方式从数据库按照需求查找到数据，做相应的数据处理后传到action，然后在前台构建页面引入必须的echarts图表插件，将action中的数据以json的格式传到前台，在图表中异步刷新显示，同时前台也可以动态的将参数通过ajax函数传到后台获取相应的数据（citynal.jsp页面用到）。整个网站布局具有高度封装性，可以增加和拆解功能。其中自己写了一些数据处理函数，用来格式化风力级别以量化当天风力，统一编码格式，调用session。相应的数据处理过程均放到了action中处理，数据获取部分均放到了dao.impl中处理。</pre>
					<h3 id="section-2">项目标准</h3>
					<pre style="line-height:2">   本网站首页科普页面信息全部来自百度最新数据以及柴静雾霾调查原文讲稿；城市概览和区域概览里的城市信息数据来源于数据库中分城市平均；重点城市分析中，图表一数据来自于各城市3年全部数据按照pm2.5=115这一标准划分（可以进行户外运动的天数），图表二数据来自于个城市3年间按月取均值和方差，用于判断pm2.5数据按月的均值高低和波动情况，图表3的数据来源于三年pm2.5检测数据和风力数据，其中风力数据的量化标准是：取当天天气预报风力最高值（最高值大风吹散雾霾后，pm2.5会很低，而平均值不能如实反映，所以最后采取了最高值的方式），如果均为3级以下且无持续风力，当天风力赋值为2。</pre>
					<h3 id="section-3">项目拓展</h3>
					<pre style="line-height:2">   由于我们获取到了大量字段的数据，所以我在ssh提供了所有字段实现的框架，只是没有去具体完成这部分功能，除了pm2.5,我们还可以使用当天的so2, no,aqi等数据进行分析和比较，天气也可以比较高低温度对于以上各项的影响等等不一而足。还有就是在cityanal.jsp中下拉列表中的城市可以随意添加和减少，只需要增加或减少对应的option即可，后台会依据option的不同自动传递对应的参数动态生成相应的查询条件。功能在理论上全都可以实现，由于时间问题这里只进行pm2.5的探讨，如果有后续发展，可以将这些功能全部拓展实现，做更加精细化的数据分析，从而得出更多的数据关联结论。</pre>
				</div>

			</div>

		</div>
	</div>

	<script src="js/jquery-1.9.1.min.js "></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/about.js"></script>

</body>
</html>
