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
<title>重点城市分析</title>
<link rel="shortcut icon" type="image/x-icon" href="images/cugbIcon.ico" />
<!--核心css文件-->
<link rel="stylesheet" href="css/map.css">
<!--bootstrap需要引入的css文件-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!--需要引入的必要的js文件-->
<script src="js/jquery-1.9.1.min.js "></script>
<script src="js/jquery.form.js"></script><%--ajax提交表单所需要的js--%>
<script src="js/bootstrap.min.js "></script>
<!--全屏滚动需要的js文件-->
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/scrollify.min.js"></script> 
<script src="js/main.js"></script>
<!--需要引入的必要的Echarts文件重点-->
<script src="js/echarts.js"></script> <!-- echarts库文件 -->
<script src="js/xline.js"></script><!-- 横向的柱状图 -->
<script src="js/barline.js"></script><!-- 纵向柱状图 -->
<script src="js/area.js"></script><!-- 大数据量区域图 -->
</head>



<body>
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
	<!--导航栏详细内容设置显示-->
	<div class="collapse navbar-collapse  navbar-responsive-collapse"
		id="navbar-info">
		<div>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="study.jsp"><span
						class="glyphicon glyphicon-home"></span> 首页</a></li>
				<li><a href="index.jsp"><span
						class="glyphicon glyphicon-home"></span> 城市概览</a></li>
				<li><a href="range.jsp"><span
						class="glyphicon glyphicon-home"></span> 区域概览</a></li>
				<li class="active"><a href="cityanal.jsp"><span
						class="glyphicon glyphicon-film"></span> 重点城市分析</a></li>
				<li><a href="about.jsp"><span
						class="glyphicon glyphicon-question-sign"></span><b> 关于</b> </a></li>
			</ul>
		</div>
	</div>
	</nav>

	<%--第二部分：中间内容部分--%>
	<section class="panel home" data-section-name="home"><!-- section表示第一屏-->
	<div class="container-fluid" style="margin-top:70px;">
		<div class="row" style="text-align:center;">
	<!-- 第一行，一个下拉列表选择框和按钮，组成一个表单，用于向后台传输数据 -->
			<form>
				<select id="test" class="select" >
					<option value="1">请选择城市</option>
					<option value="shanghai">上海</option>
					<option value="beijing">北京</option>
					<option value="tianjin">天津</option>
					<option value="chongqing">重庆</option>
					<option value="changchun">长春</option>
					<option value="xingtai">邢台</option>
					<option value="shijiazhuang">石家庄</option>
					<option value="baoding">保定</option>
					<option value="baotou">包头</option>
				</select>
				<button class="btn btn-info">提交</button>
			</form>
		</div>
		<!-- 第二行，放置水平柱状图，和垂直柱状图 -->
		<div class="row">
			<div class="col-lg-5">
				<div id="xline" style="height: 600px;width: 650px; margin-top:30px;"></div>
			</div>
			<%--<div class="container-fluid" style="margin-top:50px;">
					<div class="row " style="margin-top:50px;">
						<div id="d1" style="display:block;">政策咨询</div>
						<div id="d2" style="display:none;" class="thumbnail img_box ">
							<a href=" " class="thumbnail"> <img src="images/gansu.jpg" />
							</a>
						</div>
						<div id="d3" style="display:none;">bbbbbbb</div>
						<div id="d4" style="display:none;">dddddd</div>
						<div id="d5" style="display:none;">eeeeee</div>

					</div>
				</div>
			--%>
			<div class="col-lg-7">
				<div id="barline"
					style="height: 600px;width: 800px; margin-top:60px;margin-left:40px;"></div>
			</div>
		</div>

	</div>
	</section>
	<section class="panel overview" data-section-name="overview"><!-- 第二屏，用于放置大数据量的统计信息 -->
			<div class="container-fluid" style="margin-top:50px;">
				<div class="row " style="margin-top:50px;">
					<%--<div class="col-lg-1">
						<div id="d1" style="display:block;">政策咨询</div>
						<div id="d2" style="display:none;">上海大城市啊</div>
						<div id="d3" style="display:none;">bbbbbbb</div>
						<div id="d4" style="display:none;">dddddd</div>
						<div id="d5" style="display:none;">eeeeee</div>
					</div>

					--%><div class="col-lg-12">
						<div id="area"
							style="height: 600px;width: 1500px; margin-top:20px;margin-left:40px;"></div>
					</div>
				</div>

			</div>
	</section>


    <%--第三部分：参数传递 --%>
	<script type="text/javascript">
		/*$(function() {
			var map = {
				"1" : "d1",
				"shanghai" : "d2",
				"beijing" : "d3",
				"tianjin" : "d4",
				"chongqing" : "d5"
			};
			$("#test").bind("change", function() {
				var divId = map[this.value];
				$("#" + divId).show().siblings().hide(); 
			});
		});*/ //这部分对应于下拉列表动态显示div，由于后来的规划取消这部分功能，先注释掉，后续有可能使用。
		
	
		//点击提交月度数据js
		$('button').on('click', function() {

			$('form').on('submit', function() {
				var city = $("#test").val();

				$(this).ajaxSubmit({
					type : 'POST', // 提交方式 get/post
					url : 'Actiondatamonth.action', // 需要提交的 url

					data : {
						'city' : city

					},
					//contentType : 'application/json; charset=UTF-8',//发送信息至服务器时内容编码类型,这里应该是字符串类型的
					dataType : 'json',
					success : function(data) {
						option = lineChart.getOption();
						option.series[7].data = data['2016s'];
						option.series[6].data = data['2015s'];
						option.series[5].data = data['2014s'];
						option.series[4].data = data['2013s'];
						option.series[3].data = data['2016'];
						option.series[2].data = data['2015'];
						option.series[1].data = data['2014'];
						option.series[0].data = data['2013'];
						lineChart.setOption(option);
						option1 = xlineChart.getOption();
						option1.series[0].data = data['goodday'];
						option1.series[1].data = data['badday'];
						xlineChart.setOption(option1);
					},
					error : function(xhr, type) {
					}

				});
				//点击提交大数据量的datazoom
				$(this).ajaxSubmit({
					type : 'POST', // 提交方式 get/post
					url : 'Actioneveryday.action', // 需要提交的 url

					data : {
						'city' : city

					},
					//contentType : 'application/json; charset=UTF-8',//发送信息至服务器时内容编码类型,这里应该是字符串类型的
					dataType : 'json',
					success : function(data) {
						option = areaChart.getOption();
						option.series[0].data = data['everydaypm'];
						option.series[1].data = data['everydaywind'];
						//console.log(data['everydaywind']);
						areaChart.setOption(option);
					},
					error : function(xhr, type) {
					}

				});

				return false; // 阻止表单自动提交事件
			});
		});

		// 基于准备好的dom，初始化echarts实例
	</script>




</body>
</html>
