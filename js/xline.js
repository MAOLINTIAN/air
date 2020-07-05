var xlineChart;
$(document).ready(function() {

			xlineChart = echarts.init(document.getElementById('xline'));
			option = {
			    title: {
			        text: '天气概况',
			        subtext:"注：晴朗天表示当天pm2.5指数小于115也就是未出现雾霾预警的情况。",
			        	
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'shadow'
			        }
			    },
			    legend: {
			    	
			    	
			        data: ['晴朗天', '雾霾天']
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis: {
			        type: 'value',
			        boundaryGap: [0, 0.01]
			    },
			    yAxis: {
			        type: 'category',
			        data: ['2013年','2014年','2015年','2016年']
			    },
			    series: [
			        {
			            name: '晴朗天',
			            type: 'bar',
			            data: []
			        },
			        {
			            name: '雾霾天',
			            type: 'bar',
			            data: []
			        }
			    ]
			};

			xlineChart.setOption(option);
		});