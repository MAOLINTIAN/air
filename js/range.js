var rangeChart;
var option;

$(document).ready(function() {

	rangeChart = echarts.init(document.getElementById('range_main'));

	option = {
		title : {
			 text: '全国过去三年主要区域空气质量大数据显示',
		     subtext: '全国主要区域大数据视图',

			left : 'center',
			textStyle : {
				color : '#fff'
			}
		},
		
		backgroundColor : '#404a59',
		visualMap : {
			min : 10,
			max : 110,
			splitNumber : 5,
			inRange : {
				color : ['purple','maroon','red','orange','yellow','lightgreen' ].reverse()
			},
			textStyle : {
				color : '#fff'
			}
		},
		  toolbox: {
	            show : true,
	            orient : 'vertical',
	            x: 'right',
	            y: 'center',
	            feature : {
	                mark : {show: true},
	                dataView : {show: true, readOnly: false},
	                restore : {show: true},
	                saveAsImage : {show: true}
	            }
	        },
		geo : {
			map : 'china',
			label : {
				emphasis : {
					show : false
				}
			},
			roam : true,
			itemStyle : {
				normal : {
					areaColor : '#323c48',
					borderColor : '#111'
				},
				emphasis : {
					areaColor : '#2a333d'
				}
			}
		},
		series : [ {
			name : 'AQI',
			type : 'heatmap',
			coordinateSystem : 'geo',
			data : []
		} ]
	};
	rangeChart.setOption(option);
});
