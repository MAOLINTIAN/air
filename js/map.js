var myChart;
var option;

$(document).ready(function(){   
	
    myChart = echarts.init(document.getElementById('map_main'));
    
    option = {
    backgroundColor: '#404a59',
    title: {
        text: '全国过去三年主要城市空气质量大数据显示',
        subtext: '历史数据排行榜',
        left: 'center',
        textStyle: {
            color: '#fff'
        }
    },
    tooltip : {
        trigger: 'item'
    },
    legend: {
        orient: 'vertical',
        y: 'bottom',
        x:'right',
        data:['Min10','Top10','pm2.5'],
      
        textStyle: {
            color: '#fff'
        }
    },
  
    dataRange: {
            min : 10,
            max : 110,
            calculable : true,
            color: ['purple','maroon','red','orange','yellow','lightgreen']
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
    geo: {
        map: 'china',
        label: {
            emphasis: {
                show: false
            }
        },
        roam: true,
        itemStyle: {
            normal: {
                areaColor: '#323c48',
                borderColor: '#87cefa'
            },
            emphasis: {
                areaColor: '#1e90ff'
            }
        },
        center: [104.114129, 37.550339],
        zoom: 1

    },
    series : [
        {
            name: 'pm2.5',
            type: 'scatter',
            coordinateSystem: 'geo',
            data: [],
            symbolSize: function (val) {
                return val[2] / 10;
            },
            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: false
                },
                emphasis: {
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#ddb926'
                }
            }
        },
        {
            name: 'Top10',
            type: 'effectScatter',
            coordinateSystem: 'geo',
            data: [
                  /* {name:"邢台",value:[115,37,108.6695]},
                   {name:"保定",value:[115,39,108.411]},
                   {name:"和田",value:[80,37,105.2038]},
                   {name:"石家庄",value:[115,38,99.6245]},
                   {name:"衡水",value:[116,38,99.044]},
                   {name:"邯郸",value:[114,37,95.91]},
                   {name:"枣庄",value:[117,35,87.9766]},
                   {name:"淄博",value:[118,37,86.8121]},
                   {name:"济南",value:[117,37,86.5469]},
                   {name:"郑州",value:[114,35,86.2968]},
                   */
                   ],
            symbolSize: function (val) {
                return val[2] / 10;
            },
            showEffectOn: 'render',
            rippleEffect: {
                brushType: 'stroke'
            },
            hoverAnimation: true,
            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#f4e925',
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            zlevel: 1
        },
        {
            name: 'Min10',
            type: 'effectScatter',
            coordinateSystem: 'geo',
            data: [
                  /* {name:"邢台",value:[115,37,108.6695]},
                   {name:"保定",value:[115,39,108.411]},
                   {name:"和田",value:[80,37,105.2038]},
                   {name:"石家庄",value:[115,38,99.6245]},
                   {name:"衡水",value:[116,38,99.044]},
                   {name:"邯郸",value:[114,37,95.91]},
                   {name:"枣庄",value:[117,35,87.9766]},
                   {name:"淄博",value:[118,37,86.8121]},
                   {name:"济南",value:[117,37,86.5469]},
                   {name:"郑州",value:[114,35,86.2968]},
                   */
                   ],
            symbolSize: function (val) {
                return val[2] / 10;
            },
            showEffectOn: 'render',
            rippleEffect: {
                brushType: 'stroke'
            },
            hoverAnimation: true,
            label: {
                normal: {
                    formatter: '{b}',
                    position: 'right',
                    show: true
                }
            },
            itemStyle: {
                normal: {
                    color: '#f4e925',
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            zlevel: 1
        }
            
    ]
};
    myChart.setOption(option);
});
