var areaChart;
var base = +new Date(2013,9,31);
var oneDay = 24 * 3600 * 1000;
var datearea = [];
var dataarea = [0];
for ( var i = 0; i <1066; i++) {
	var now = new Date(base += oneDay);
	datearea.push([ now.getFullYear(), now.getMonth()+1 , now.getDate() ]
			.join('/'));
	//now.setDate(now.getDate() + 1)
	//data.push(Math.round((Math.random() - 0.5) * 20 + data[i - 1]));
}

$(document).ready(
				function() {
					areaChart = echarts.init(document.getElementById('area'));

					option = {
						tooltip : {
							trigger : 'axis',
							position : function(pt) {
								return [ pt[0], '10%' ];
							}
						},
					
						title : {
							left : 'center',
							text : '该城市全部检测数据',
							subtext:'由于部分城市缺失极少量数据，所以数据偏差在5天内'
						},
						legend : {
							top : 'top',
							left:'left',
							data : [ 'PM2.5','风级']
						},
						toolbox : {
							orient : 'vertical',
							x : 'right',
							y : 'center',
							feature : {
								dataZoom : {
									yAxisIndex : 'none'
								},
								magicType : {
									show : true,
									type : [ 'line', 'bar' ]
								},
								restore : {},
								saveAsImage : {}
							}
						},
						xAxis : {
							type : 'category',
							boundaryGap : ['20%', '20%'],
							data : datearea
						},
						yAxis : [{
							name:'PM2.5',
							min: 0,
					        max: 800,
							type : 'value',
							boundaryGap : [ 0, '100%' ]
						},{ name:'风级',
							min: 1.9,
					        max: 8,
					        interval: 1.1,
							type : 'value',
							boundaryGap : [ 0, '100%' ]
						}],
						dataZoom : [
								{
									type : 'inside',
									start : 0,
									end : 10,
									
								},
								{
									start : 0,
									end : 10,
									handleIcon : 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
									handleSize : '80%',
									handleStyle : {
										color : '#fff',
										shadowBlur : 3,
										shadowColor : 'rgba(0, 0, 0, 0.6)',
										shadowOffsetX : 2,
										shadowOffsetY : 2
									}
								} ],
						series : [ {
							name : 'PM2.5',
							type : 'bar',
							smooth : true,
							symbol : 'none',
							sampling : 'average',
							itemStyle : {
								normal : {
									color : '#595959'
								}
							},
							areaStyle : {
								normal : {
									color : new echarts.graphic.LinearGradient(
											0, 0, 0, 1, [ {
												offset : 0,
												color : 'red'
											}, {
												offset : 1,
												color : 'blue'
											} ])
								}
							},
							data : []
						},
						{
							name : '风级',
							type : 'line',
							smooth : true,
							symbol : 'none',
							yAxisIndex: 1,
							sampling : 'average',
							itemStyle : {
								normal : {
									color : '#556B2F'
								}
							},
							areaStyle : {
								normal : {
									color : new echarts.graphic.LinearGradient(
											0, 0, 0, 1, [ {
												offset : 0,
												color : '#698B22'
											}, {
												offset : 1,
												color : '#8B1C62'
											} ])
								}
							},
							data : []
						}]
					};
					areaChart.setOption(option);
				});
