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
    <title>不同地区同类型会展对比评估</title>
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
                            <div id="main0" class="chart">

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

                            <div id="comparetable"></div>
                            <div style="min-height: 1px" id="comparetableDesc"></div>

                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>文章总量与媒体数量对比</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main2" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main2Desc"></div>

                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none">
                        <div class="ibox-title">
                            <h5>媒体结构组成对比</h5>
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
                            <h5>宣传力度对比</h5>
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


<script type="text/javascript">

    function exhibitiontable(obj){
        return '<table class="table table-bordered table-hover">'+
                        '<thead>'+
                '<tr><th>会展名称</th><th>'+obj.p1_name+'</th><th>'+obj.p2_name+'</th></tr>'+
                        '</thead>'+
                        '<tbody>'+
                '<tr><th>毛面积对比（平方米）</th><td>'+obj.p1_gross_area+'</td><td>'+obj.p2_gross_area+'</td></tr>'+
                '<tr><th>参展企业涉及的主要行业对比</th><td>'+obj.p1_industry+'</td><td>'+obj.p2_industry+'</td></tr>'+
                '<tr><th>观众人数对比</th><td>'+obj.p1_company+'</td><td>'+obj.p2_company+'</td></tr>'+
                '<tr><th>举办城市</th><td>'+obj.p1_locate+'</td><td>'+obj.p2_locate+'</td></tr>'+
                        '<tbody>'+
                '</table>';
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
                $.getJSON(url+'comparename/${command.id}',function(result){
                    $('#titleDiv').html((result.rname1+'-'+result.rname2));
                    $('title').html(result.rname1+'-'+result.rname2);
                    $('#breadcrumbtitle').html(result.rname1+'-'+result.rname2);
                });
                $.getJSON(url+'diff_compare/control/${command.id}',function(result){
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
                            $.getJSON(url+'diff_compare/table/${command.id}',function(result){
                                $('#comparetable').html(exhibitiontable(result));
                            });
                            $('#comparetable').closest('.ibox').show();

                        }else{
                            $('#comparetable').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control2=='1'){
                            $.getJSON(url+'diff_compare/num/${command.id}',function(result){
                                var name1='${command.name1}',name2='${command.name2}';
                                var names=[name1,name2];
                                var legend=['文章总量','媒体数量'],series1=[result.p1_article_num,result.p2_article_num],series2=[result.p1_media_num,result.p2_media_num];
                                var series=[series1,series2];
                                var yAxis=[{
                                    type : 'value',
                                    name : '文章总量'
                                },
                                    {
                                        type : 'value',
                                        name : '媒体数量'
                                    }];
                                chart(ec,'main2',local_compare_bar('文章总量与媒体数量对比',names,yAxis,legend,series));
                            });
                            $('#main2').closest('.ibox').show();
                        }else{
                            $('#main2').hide();
                            $('#main2').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control3=='1'){
                            $.getJSON(url+'diff_compare/media_structure/${command.id}',function(result){
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
                                chart(ec,'main3',local_compare_pie('媒体结构组成对比',legend,scfg1,scfg2));
                            });
                            $('#main3').closest('.ibox').show();
                        }else{
                            $('#main3').hide();
                            $('#main3').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control4=='1'){
                            $.getJSON(url+'diff_compare/seminate/${command.id}',function(result){
                                var name1='${command.name1}',name2='${command.name2}';
                                var legend=['会前宣传','会间宣传','会后宣传'],series1=[result.p1_before_sum,result.p2_before_sum],series2=[result.p1_during_sum,result.p2_during_sum],series3=[result.p1_after_sum,result.p2_after_sum];
                                var series=[series1,series2,series3];
                                var yAxis=[{
                                    type : 'value',
                                    name : '文章总量'
                                }];
                                var names=[name1,name2];

                                chart(ec,'main4',local_compare_bar('宣传力度对比',names,yAxis,legend,series));
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
