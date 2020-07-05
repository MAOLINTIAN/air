var lineChart;
$(document).ready(
		function() {
			lineChart = echarts.init(document.getElementById('barline'));

			// 指定图表的配置项和数据
			var option = {
				title : {
					subtext : '平均值与方差统计结果(初始柱状图为均值，折线图为方差)',
					
					left : 'center',
					textStyle : {
						color : '#FFFFFF'
					}
				},
				tooltip : {
					trigger : 'axis'
				},
				toolbox : {
					orient : 'vertical',
					x : 'right',
					y : 'center',
					feature : {
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				legend : {
					data : [ '2013', '2014', '2015', '2016','2013s', '2014s', '2015s', '2016s' ]
				},
				xAxis : [ {
					type : 'category',
					data : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月',
							'9月', '10月', '11月', '12月' ]
				} ],
				yAxis : [ {
					type : 'value',
					name : 'PM2.5',
					min : 0,
					max : 300,
					interval : 20,
					axisLabel : {
						formatter : '{value} '
					},
				},
					{
			            type: 'value',
			            name: '标准差 ',
			            min: 0,
			            max: 300,
			            interval: 20,
			            axisLabel: {
			                formatter: '{value} '
			            }
			        }
				

				],
				series : [ {
					name : '2013',
					type : 'bar',
					data : []
				}, {
					name : '2014',
					type : 'bar',
					data : []
				}, {
					name : '2015',
					type : 'bar',
					data : []
				}, {
					name : '2016',
					type : 'bar',
					data : []
				} , {
					name : '2013s',
					type : 'line',
					yAxisIndex: 1,
					data : []
				}, {
					name : '2014s',
					type : 'line',
					yAxisIndex: 1,
					data : []
				}, {
					name : '2015s',
					type : 'line',
					yAxisIndex: 1,
					data : []
				}, {
					name : '2016s',
					type : 'line',
					yAxisIndex: 1,
					data : []
				}]
			};

			// 使用刚指定的配置项和数据显示图表。
			lineChart.setOption(option);
		});