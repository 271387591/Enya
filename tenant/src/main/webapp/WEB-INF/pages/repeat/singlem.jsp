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
    <title>成都会展媒体报告</title>
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
                <a href="<c:url value="/html/web/repeatexh"/>">展会评估报告</a>
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
                            <h5>报道趋势</h5>
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
                            <h5>媒体刊发及转载具体时间</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="exhibitiontime_media_list"></div>
                            <div style="min-height: 1px" id="exhibitiontime_media_listDesc"></div>
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
                            <div style="min-height: 1px" id="main3Desc"></div>
                        </div>
                    </div>

                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>媒体传播影响力</h5>
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
                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>媒体地域分布</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main5" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main5Desc"></div>
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

                            <div id="main6" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main6Desc"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function time_media_list(obj){
        var html='<table class="table table-bordered table-hover" xmlns="http://www.w3.org/1999/html"><thead><tr><th style="width: 80px;">序号</th><th>媒体名称</th><th>转载时间</th></tr></thead></tbody>';
        for(var i=0;i<obj.length;i++){
            html+='<tr><td>'+(i+1)+'</td><td>'+obj[i].Media+'</td><td>'+obj[i].Reprinted_time+'</td></tr>'
        }
        html+='</tbody></table>';
        return html;
    }
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

                $.getJSON(url+'singlename/${command.id}',function(result){
                    $('#titleDiv').html((result.rname));
                    $('title').html(result.rname);
                    $('#breadcrumbtitle').html(result.rname);
                });
                $.getJSON(url+'media/control/${command.id}',function(result){
                            var control=result.control;
                            control=control.substr(0,6);
                            var control1=control.substr(0,1),
                                    control2=control.substr(1,1),
                                    control3=control.substr(2,1),
                                    control4=control.substr(3,1),
                                    control5=control.substr(4,1),
                                    control6=control.substr(5,1);
                    $.getJSON(url+'describe/${command.id}',function(result){
                        if(result.zero){
                            $('#main0').html(result.zero);
                            $('#main0').closest('.ibox').show();
                        }
                        if(result.one){
                            $('#main1Desc').html(result.one);
                            $('#main1Desc').closest('.ibox').show();
                        }
                        if(result.two){
                            $('#exhibitiontime_media_listDesc').html(result.two);
                            $('#exhibitiontime_media_listDesc').closest('.ibox').show();
                        }
                        if(result.three){
                            $('#main3Desc').html(result.three);
                            $('#main3Desc').closest('.ibox').show();
                        }

                        if(result.four){
                            $('#main4Desc').html(result.four);
                            $('#main4Desc').closest('.ibox').show();
                        }
                        if(result.five){

                            $('#main5Desc').html(result.five);
                            $('#main5Desc').closest('.ibox').show();
                        }
                        if(result.six){
                            $('#main6Desc').html(result.six);
                            $('#main6Desc').closest('.ibox').show();
                        }
                        if(control1=='1'){
                            $.getJSON(url+'media/trend_report/${command.id}',function(result){
                                if(!result ||result.length<1){
                                    $('#main1').html('暂无数据');
                                    return
                                }
                                var xaxis=[],yaxis=[];
                                for(var i=0;i<result.length;i++){
                                    xaxis.push(result[i].date);
                                    yaxis.push(result[i].num);
                                }
                                chart(ec,'main1',local_line(xaxis,yaxis,'报道趋势'));
                            });
                            $('#main1').closest('.ibox').show();
                        }else{
                            $('#main1').hide();
                            $('#main1').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control2=='1'){
                            $.getJSON(url+'media/time_media_list/${command.id}',function(result){
                                if(!result ||result.length<1){
                                    $('#exhibitiontime_media_list').html('暂无数据');
                                    return
                                }
                                $('#exhibitiontime_media_list').html(time_media_list(result));
                            });
                            $('#exhibitiontime_media_list').closest('.ibox').show();
                        }else{
                            $('#exhibitiontime_media_list').closest('.ibox').find('.ibox-title h5').hide();
                        }
                         if(control3=='1'){
                             $.getJSON(url+'media/time_media/${command.id}',function(result){
                                 if(!result ||result.length<1){
                                     $('#main3').html('暂无数据');
                                     return
                                 }
                                 var xaxis=[],yaxis=[];
                                 for(var i=0;i<result.length;i++){
                                     xaxis.push(result[i].Reprinted_time);
                                     yaxis.push(result[i].Media);
                                 }
                                 var subtext='起止日期：'+xaxis[0]+'到'+xaxis[xaxis.length-1];
                                 chart(ec,'main3',local_time(xaxis,yaxis,'媒体刊发及转载时间分布',['媒体刊发及转载时间分布'],subtext));
                             });
                            $('#main3').closest('.ibox').show();
                        }else{
                             $('#main3').hide();
                             $('#main3').closest('.ibox').find('.ibox-title h5').hide();
                         }
                        if(control4=='1'){
                            $.getJSON(url+'media/media_impact/${command.id}',function(result){
                                if(!result ||result.length<1){
                                    $('#main4').html('暂无数据');
                                    return
                                }
                                var xAxis=[],series1=[],series2=[],series=[],legend=['IP量','PV量'];
                                for(var i=0;i<result.length;i++){
                                    xAxis.push(result[i].Media);
                                    series1.push(result[i].IP);
                                    series2.push(result[i].PV);
                                }
                                series.push(series1);
                                series.push(series2)
                                chart(ec,'main4',local_bar('媒体传播影响力',xAxis,legend,series));
                            });
                            $('#main4').closest('.ibox').show();
                        }else{
                            $('#main4').hide();
                            $('#main4').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control5=='1'){
                            $.getJSON(url+'media/media_location/${command.id}',function(result){
                                if(!result ||result.length<1){
                                    $('#main5').html('暂无数据');
                                    return
                                }
                                var series=[];
                                for(var i=0;i<result.length;i++){
                                    var o={};
                                    o.name=result[i].name;
                                    o.value=result[i].value;
                                    series.push(o);
                                }

                                chart(ec,'main5',local_map('媒体地域分布',series));
                            });
                            $('#main5').closest('.ibox').show();
                        }else{
                            $('#main5').hide();
                            $('#main5').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control6=='1'){
                            $.getJSON(url+'media/media_structure/${command.id}',function(result){
                                if(!result ||result.length<1){
                                    $('#main6').html('暂无数据');
                                    return
                                }
                                var legend=[],series=[];
                                for(var i=0;i<result.length;i++){
                                    legend.push(result[i].name);
                                    series.push(result[i]);
                                }
                                chart(ec,'main6',local_pie('媒体结构组成',legend,series));
                            });
                            $('#main6').closest('.ibox').show();
                        }else{
                            $('#main6').hide();
                            $('#main6').closest('.ibox').find('.ibox-title h5').hide();
                        }
                    });
                });
            }
    );
</script>

</body>
</html>
