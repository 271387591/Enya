<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/8/15
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>成都本地会展对比评估报告</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <style>
        .ibox-content > .chart{
            min-height: 400px;
        }
    </style>
    <link rel="stylesheet" href="<c:url value="/resources/lib/echarts/asset/css/runtime.css"/> ">
    <script type="text/javascript">
        var appPath='<c:url value="/"/>';
        var url='${command.url}';
    </script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/plugin.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/echarts.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/repeat.js"/>"></script>


</head>
<body style="background:#f3f3f4">
<div class="row navbar-fixed-top">
    <div class="col-lg-12" >
        <ol class="breadcrumb" style="border-radius:0;padding: 10px;padding-left: 50px">
            <li>
                <a href="<c:url value="/html/web/appraisal"/>">首页</a>
            </li>
            <li>
                <a href="<c:url value="/html/web/repeatcmp"/>">展会对比评估报告</a>
            </li>
            <li id="breadcrumbtitle" class="active">

            </li>


        </ol>
    </div>
</div>
<div id="wrapper" style="margin-top: 40px">
    <div id="content-wrapper">
        <div class="alert alert-info" align="center" style="margin-bottom:1px;border-radius:0">
            <span style="font-size: 20px" id="titleDiv"></span>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox float-e-margins" id="main0Div" style="display: none">
                        <div class="ibox-title">
                            <h5>概要描述</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >
                            <div id="main0">

                            </div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>基础数据对比</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main1" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main1Desc"></div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>报道趋势</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main2" class="chart">

                            </div>
                            <div id="main2_1" class="hr-line-dashed chart">

                            </div>
                            <div style="min-height: 1px" id="main2Desc"></div>


                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>媒体刊发及转载时间分布</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main3" class="chart">

                            </div>
                            <div id="main3_1" class="hr-line-dashed chart">

                            </div>
                            <div style="min-height: 1px" id="main3Desc"></div>

                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>媒体结构组成</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main4" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main4Desc"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>




<%--<div class="container-fluid">--%>
    <%--<div class="row-fluid example" align="center">--%>
        <%--<div align="center">--%>
            <%--<h1> 成都本地会展对比评估报告 </h1>--%>
            <%--<h3> ${command.name} </h3>--%>
        <%--</div>--%>
        <%--<div id="main1" class="main">--%>
        <%--</div>--%>
        <%--<div id="main2" class="main">--%>
        <%--</div>--%>
        <%--<div id="main3" class="main">--%>
        <%--</div>--%>
        <%--<div id="main4" class="main"></div>--%>
    <%--</div>--%>
<%--</div>--%>
<script type="text/javascript">
    require.config({
        paths: {
            echarts: appPath+'resources/lib/echarts'
        }
    });
    require(
            [
                'echarts',
                'echarts/chart/line',
                'echarts/chart/bar',
                'echarts/chart/radar',
                'echarts/chart/map',
                'echarts/chart/pie'
            ],

            function DrawEChart(ec) {

                $.getJSON(url+'comparename/${command.id}',function(result){
                    $('#titleDiv').html((result.rname1+'-'+result.rname2));
                    $('title').html(result.rname1+'-'+result.rname2);
                    $('#breadcrumbtitle').html(result.rname1+'-'+result.rname2);
                });


                $.getJSON(url+'same_compare/control/${command.id}',function(result){
                    var control=result.control;
                    control=control.substr(0,4);
                    var control1=control.substr(0,1),
                            control2=control.substr(1,1),
                            control3=control.substr(2,1),
                            control4=control.substr(3,1);
                    $.getJSON(url+'describe/${command.id}',function(result){
                        if(result.zero){
                            $('#main0').html(result.zero);
                            $('#main0').closest('.ibox').show();
                        }
                        if(result.one){
                            $('#comparetableDesc').html(result.one);
                            $('#comparetableDesc').closest('.ibox').show();
                        }
                        if(result.two){
                            $('#main2Desc').html(result.two);
                            $('#main2Desc').closest('.ibox').show();
                        }
                        if(result.three){
                            $('#main3Desc').html(result.three);
                            $('#main3Desc').closest('.ibox').show();
                        }

                        if(result.four){
                            $('#main4Desc').html(result.four);
                            $('#main4Desc').closest('.ibox').show();
                        }
                        if(control1=='1'){
                            $.getJSON(url+'same_compare/radar/${command.id}',function(result){
                                var indicator =[
                                    { text: '参展企业数', max: parseInt(1.25*(result.p1_company_num > result.p2_company_num?result.p1_company_num:result.p2_company_num))},
                                    { text: '会展观众人数', max: parseInt(1.25*(result.p1_viewer_num > result.p2_viewer_num?result.p1_viewer_num:result.p2_viewer_num))},
                                    { text: '毛面积', max: parseInt(1.25*(result.p1_area_num > result.p2_area_num?result.p1_area_num:result.p2_area_num))},
                                    { text: '展期', max: parseInt(1.25*(result.p1_time_num > result.p2_time_num?result.p1_time_num:result.p2_time_num))}
                                ];
                                var legend=[result.p1_name,result.p2_name];
                                var series1={
                                    data:[result.p1_company_num, result.p1_viewer_num, result.p1_area_num, result.p1_time_num],
                                    name:result.p1_name
                                };
                                var series2={
                                    data:[result.p2_company_num, result.p2_viewer_num, result.p2_area_num, result.p2_time_num],
                                    name:result.p2_name
                                };
                                chart(ec,'main1',local_compare_radar('基础数据',legend,indicator,series1,series2));
                            });
                            $('#main1').closest('.ibox').show();
                        }else{
                            $('#main1').hide();
                            $('#main1').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control2=='1'){
                            $.getJSON(url+'same_compare/trend_report/${command.id}',function(result){
                                var name1='${command.name1}',name2='${command.name2}';

                                var p1=result.P1,p2=result.P2, xaixs1=[],xaixs2=[],series1=[],series2=[];

                                for(var i=0;i<p1.length;i++){
                                    xaixs1.push(p1[i].date);
                                    series1.push(p1[i].num);
                                }
                                for(var i=0;i<p2.length;i++){
                                    series2.push(p2[i].num);
                                    xaixs2.push(p2[i].date);
                                }
                                var legend=[name1,name2];
                                var scfg1={
                                    data:series1,
                                    name:name1
                                };
                                var scfg2={
                                    data:series2,
                                    name:name2
                                };
                                if(series1.length>0){
                                    chart(ec,'main2',local_line(xaixs1,series1,name1));
                                }else{
                                    $('#main2').html('暂无数据');
                                }
                                if(series2.length>0){
                                    chart(ec,'main2_1',local_line(xaixs2,series2,name2));
                                }else{
                                    $('#main2_1').html('暂无数据');
                                }
                            });
                            $('#main2').closest('.ibox').show();
                        }else{
                            $('#main2').hide();
                            $('#main2_1').hide();
                            $('#main2').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control3=='1'){
                            $.getJSON(url+'same_compare/time_media/${command.id}',function(result){
                                var p1=result.P1;
                                var p2=result.P2;
                                var xaxis=[],xaxis2=[],yaxis1=[],yaxis2=[];
                                for(var i=0;i<p1.length;i++){
                                    xaxis.push(p1[i].Reprinted_time);
                                    yaxis1.push(p1[i].Media);
                                }
                                for(var i=0;i<p2.length;i++){
                                    xaxis2.push(p2[i].Reprinted_time)
                                    yaxis2.push(p2[i].Media);
                                }
                                var name1='${command.name1}',name2='${command.name2}';
                                var legend=[name1,name2];
                                var subtext1='起止日期：'+xaxis[0]+'到'+xaxis[xaxis.length-1];
                                var subtext2='起止日期：'+xaxis2[0]+'到'+xaxis2[xaxis2.length-1];
                                if(yaxis1.length>0){
                                    chart(ec,'main3',local_time(xaxis,yaxis1,'媒体刊发及转载时间分布',[name1],subtext1));
                                }else{
                                    $('#main3').html('暂无数据');
                                }
                                if(yaxis2.length>0){
                                    chart(ec,'main3_1',local_time(xaxis2,yaxis2,'媒体刊发及转载时间分布',[name2],subtext2));
                                }else{
                                    $('#main3_1').html('暂无数据');
                                }


                            });
                            $('#main3').closest('.ibox').show();
                        }else{
                            $('#main3').hide();
                            $('#main3_1').hide();
                            $('#main3').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control4=='1'){
                            $.getJSON(url+'same_compare/media_structure/${command.id}',function(result){
                                var legend=[],series1=result.P1,series2=result.P2;
                                for(var i=0;i<series1.length;i++){
                                    legend.push(series1[i].name);
                                }
                                var series=[series1,series2];
                                var name1='${command.name1}',name2='${command.name2}';

                                var scfg1={
                                    name:name1,
                                    data:series1
                                };
                                var scfg2={
                                    name:name2,
                                    data:series2
                                };
                                chart(ec,'main4',local_compare_pie('媒体结构组成',legend,scfg1,scfg2));
                            });
                            $('#main4').closest('.ibox').show();
                        }else{
                            $('#main4').hide();
                            $('#main4').closest('.ibox').find('.ibox-title h5').hide();
                        }
                    });
                });
            }
    );
</script>

</body>
</html>
