/**
 * Created by lihao1 on 8/26/15.
 */
function local_line(xaxis,yaxis,title){
    return {
        title : {
            text: title,
            x:'center'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            y:'bottom',
            data:[title]
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : xaxis
            }
        ],
        yAxis : [
            {
                type : 'value',
                axisLabel : {
                    formatter: '{value}'
                }
            }
        ],
        series : [
            {
                roam:true,
                name:title,
                type:'line',
                data:yaxis,
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name: '平均值'}
                    ]
                }
            }
        ]
    };
}
function local_radar(items,data,title){
    return  {
        title : {
            text: title,
            x:'center'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            orient : 'vertical',
            y : 'bottom',
            data:[title]
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        polar : [
            {
                indicator : items
            }
        ],
        calculable : true,
        series : [
            {
                name: title,
                type: 'radar',
                data : [
                    {
                        value : data,
                        name : title
                    }
                ]
            }
        ]
    };
}
function local_bar(title,xAxis,legend,series){
    var seriescfg=[];
    for(var i=0;i<legend.length;i++){
        var obj={
            name:legend[i],
            type:'bar',
            data:series[i],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            }
        }
        seriescfg.push(obj);
    }
    return {
        title : {
            text: title,
            x:'center'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            y:'bottom',
            data:legend
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : xAxis
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : seriescfg
    };
}
function local_map(title,series){
    return {
        title : {
            text: title,
            x:'center'
        },
        tooltip : {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            x:'left',
            data:[title]
        },
        dataRange: {
            min: 0,
            max: 2500,
            x: 'left',
            y: 'bottom',
            text:['高','低'],           // 文本，默认为数值文本
            calculable : true
        },
        toolbox: {
            show: true,
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
        roamController: {
            show: true,
            x: 'right',
            mapTypeControl: {
                'china': true
            }
        },
        series : [
            {
                name: title,
                type: 'map',
                mapType: 'china',
                roam: false,
                itemStyle:{
                    normal:{label:{show:true}},
                    emphasis:{label:{show:true}}
                },
                data:series
            }
        ]
    };
}
function local_pie(title,legend,series){
    return {
        title : {
            text: title,
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:legend
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:title,
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:series
            }
        ]
    };
}
function local_time(xaxis,yaxis,title,legend,subtext){
    return {
        title : {
            subtext:subtext,
            text : legend[0],
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter : function (params) {
                var date = new Date(params.value[0]);
                var data1 = date.getFullYear() + '-'
                    + (date.getMonth()+1) + '-'
                    + date.getDate() ;//+ ' '
                return params.value[2] + '<br/>'
                    + data1;
            }
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        dataZoom: {
            show: false
        },
        legend : {
            y : 'bottom',
            show : true,
            data : legend
        },
        grid: {
            y2: 80
        },
        xAxis : [
            {
                type : 'time',
                splitNumber:10
            }
        ],
        yAxis : [
            {
                type : 'value',
                show : false,
                max:2,
                min:0
            }
        ],
        series : [
            {
                name: legend[0],
                type: 'line',
                showAllSymbol: true,
                symbolSize: 3,
                data: (function () {
                    var d = [];
                    var value;
                    var yyyy;
                    var mm;
                    var dd;
                    var temp;
                    var i;
                    for(i = 0; i < xaxis.length; i++) {
                        temp =  xaxis[i];
                        yyyy = temp.substr(0,4);
                        mm = temp.substr(5,2);
                        dd = temp.substr(8,2);
                        d.push([
                            new Date(yyyy,mm-1,dd),
                            1,
                            yaxis[i]
                        ]);
                    }
                    return d;
                })()
            }
        ]
    };
}
function local_compare_bar(title,xAxis,yAxis,legend,series){
    var seriescfg=[];
    for(var i=0;i<legend.length;i++){
        var s={
            name:legend[i],
            type:'bar',
            data:series[i]
        }
        if(i==1 && legend.length==2){
            s.yAxisIndex= 1;
        }
        seriescfg.push(s);
    }
    return {
        title : {
            text: title,
            x:'center'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:legend,
            y:'bottom'
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : xAxis
            }
        ],
        yAxis :yAxis,
        series : seriescfg
    };
}
function local_compare_pie(title,legend,seriescfg1,seriescfg2){
    var yAxis=[],seriescfg=[];

    var s1={
        name:seriescfg1.name,
        type:'pie',
        radius : '55%',
        center: ['35%', '60%'],
        data:seriescfg1.data
    };
    var s2={
        name:seriescfg2.name,
        type:'pie',
        radius : '55%',
        center: ['65%', '60%'],
        data:seriescfg2.data
    }
    seriescfg.push(s1);
    seriescfg.push(s2);
    return {
        title : {
            text: title,
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:legend
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : seriescfg
    };
}
function local_compare_radar(title,legend,indicator,series1,series2){
    return  {
        title : {
            x:'center',
            text: title
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            orient : 'vertical',
            x : 'right',
            y : 'bottom',
            data:legend
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        polar : [
            {
                indicator : indicator
            }
        ],
        calculable : true,
        series : [
            {
                name: title,
                type: 'radar',
                data : [
                    {
                        value : series1.data,
                        name : series1.name
                    },
                    {
                        value : series2.data,
                        name : series2.name
                    }
                ]
            }
        ]
    };
}
function local_compare_line(title,legend,xAxis,series1,series2){
    return  {
        title : {
            x:'center',
            text: title
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            y:'bottom',
            data:legend
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : xAxis
            }
        ],
        yAxis : [
            {
                type : 'value',
                axisLabel : {
                    formatter: '{value}'
                }
            }
        ],
        series : [
            {
                name:series1.name,
                type:'line',
                data:series1.data,
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name: '平均值'}
                    ]
                }
            },
            {
                name:series2.name,
                type:'line',
                data:series2.data,
                markPoint : {
                    data : [
                        {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name : '平均值'}
                    ]
                }
            }
        ]
    };
}
function local_compare_time(xaxis1,xaxis2,legend,yaxis1,yaxis2,title){
    return {
        title : {
            text : title,
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter : function (params) {
                var date = new Date(params.value[0]);
                var data1 = date.getFullYear() + '-'
                    + (date.getMonth()+1) + '-'
                    + date.getDate() ;//+ ' '
                return params.value[2] + '<br/>'
                    + data1;
            }
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        dataZoom: {
            show: false
        },
        legend : {
            //show : false,
            y:'bottom',
            data : legend
        },
        grid: {
            y2: 80
        },
        xAxis : [
            {
                type : 'time',
                splitNumber:10
            }
        ],
        yAxis : [
            {
                type : 'value',
                show : false,
                max:2,
                min:0
            }
        ],
        series : [
            {
                name: legend[0],
                type: 'line',
                showAllSymbol: true,
                symbolSize: 3,
                data: (function () {
                    var d = [];
                    var value;
                    var yyyy;
                    var mm;
                    var dd;
                    var temp;
                    var i;
                    for(i = 0; i < xaxis1.length; i++) {
                        temp =  xaxis1[i];
                        yyyy = temp.substr(0,4);
                        mm = temp.substr(5,2);
                        dd = temp.substr(8,2);
                        d.push([
                            new Date(yyyy,mm-1,dd),
                            1,
                            yaxis1[i]
                        ]);
                    }
                    return d;
                })()
            },
             {
                name: legend[1],
                type: 'line',
                showAllSymbol: true,
                symbolSize: 3,
                data: (function () {
                    var d = [];
                    var value;
                    var yyyy;
                    var mm;
                    var dd;
                    var temp;
                    var i;
                    for(i = 0; i < xaxis2.length; i++) {
                        temp =  xaxis2[i];
                        yyyy = temp.substr(0,4);
                        mm = temp.substr(5,2);
                        dd = temp.substr(8,2);
                        d.push([
                            new Date(yyyy,mm-1,dd),
                            1,
                            yaxis2[i]
                        ]);
                    }
                    return d;
                })()
            }

        ]
    };
}



function chart(ec,id,opt){
    var chartContainer = document.getElementById(id);
    var myChart = ec.init(chartContainer);
    myChart.setOption(opt);
}