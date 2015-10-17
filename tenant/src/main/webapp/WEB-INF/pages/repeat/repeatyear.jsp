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
    <title>成都市会展业年度主要指标</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <link rel="stylesheet" href="<c:url value="/resources/lib/echarts/asset/css/runtime.css"/> ">
    <script type="text/javascript">
        var appPath='<c:url value="/"/>';
        var url='${command.url}';
    </script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/plugin.js"/>"></script>
    <style>
        .pagination ul > li > a, .pagination ul > li > span{
            padding: 4px 7px;
            line-height: 14px;
        }
    </style>

</head>
<body style="background:#f3f3f4">
<div class="row navbar-fixed-top">
    <div class="col-lg-12" >
        <ol class="breadcrumb" style="border-radius:0;padding: 10px;padding-left: 50px">
            <li>
                <a href="<c:url value="/html/web/appraisal"/>">首页</a>
            </li>
            <li>
                成都市会展业年度主要指标
            </li>

        </ol>
    </div>
</div>

<div id="wrapper" style="margin-top: 40px">
    <div id="content-wrapper">
        <div class="alert alert-info" align="center" style="margin-bottom:1px;border-radius:0">
            <span style="font-size: 20px">成都市会展业年度主要指标</span>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>成都市会展业年度主要指标</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <form role="form" class="form-inline col-sm-12 m-b-xs" id="yearselect">
                                    <div class="form-group">
                                        <select class="input-sm form-control input-s-sm inline" name="start" style="width:150px;">
                                        </select>
                                    </div>
                                    <span class="green" style="padding-left:10px;padding-right:10px">
                                       对比
                                    </span>
                                    <div class="form-group">
                                        <select class="input-sm form-control input-s-sm inline" name="end"  style="width:150px;">
                                        </select>
                                    </div>

                                    <button style="padding: 4px 12px" class="btn btn-success" type="button" onclick="selectcdyear();">执行</button>
                                </form>
                            </div>
                            <div id="content">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function nyear(obj){
        return '<table class="table table-bordered table-hover">'+
                '<thead>'+
                '<tr><th>主要运行指标</th><th>'+obj.p1_year+'</th><th>'+obj.p2_year+'</th><th>增长率</th></tr>'+
                '</thead>'+
                '<tbody>'+
                '<tr><th>重大会展项目（个）</th><td>'+obj.p1_bigP+'</td><td>'+obj.p2_bigP+'</td><td>'+obj.in_bigP+'</td></tr>'+
                '<tr><th>展览活动（个）</th><td>'+obj.p1_events+'</td><td>'+obj.p2_events+'</td><td>'+obj.in_events+'</td></tr>'+
                '<tr><th>国际会议（个）</th><td>'+obj.p1_interconfer+'</td><td>'+obj.p2_interconfer+'</td><td>'+obj.in_interconfer+'</td></tr>'+
                '<tr><th>展览总面积（万平方米）</th><td>'+obj.p1_area+'</td><td>'+obj.p2_area+'</td><td>'+obj.in_area+'</td></tr>'+
                '<tr><th>其中：国际性展览（万平方米）</th><td>'+obj.p1_area_inter+'</td><td>'+obj.p2_area_inter+'</td><td>'+obj.in_area_inter+'</td></tr>'+
                '<tr><th>参会参展参节总人次（万人次）</th><td>'+obj.p1_viewer+'</td><td>'+obj.p2_viewer+'</td><td>'+obj.in_viewer+'</td></tr>'+
                '<tr><th>其中：外地人（万人次）</th><td>'+obj.p1_veiwer_out+'</td><td>'+obj.p2_veiwer_out+'</td><td>'+obj.in_veiwer_out+'</td></tr>'+
                '<tr><th>直接收入（亿元）</th><td>'+obj.p1_dincome+'</td><td>'+obj.p2_dincome+'</td><td>'+obj.in_dincome+'</td></tr>'+
                '<tr><th>综合收入（亿元）</th><td>'+obj.p1_allincome+'</td><td>'+obj.p2_allincome+'</td><td>'+obj.in_allincome+'</td></tr>'+
                '<tr><th>带动固定就业岗位（个）</th><td>'+obj.p1_jobs+'</td><td>'+obj.p2_jobs+'</td><td>'+obj.in_jobs+'</td></tr>'+
                '<tr><th>商品成交（亿元）</th><td>'+obj.p1_deal+'</td><td>'+obj.p2_deal+'</td><td>'+obj.in_deal+'</td></tr>'+
                '<tr><th>投资协议金额（亿元）</th><td>'+obj.p1_invest+'</td><td>'+obj.p2_invest+'</td><td>'+obj.in_invest+'</td></tr>'+
                '</tbody>'+
                '</table>';
    }

    $.getJSON(url+'year/default',function(data){
                $('#content').html(nyear(data));
            }
    );

    $.getJSON(url+'year/list',function(data){
        var start=$('#yearselect').find('select');
        start.find('option').remove();
        start.append('<option value="">请选择</option>')
        for(var i=0;i<data.length;i++){
            start.append('<option value="'+data[i].year+'">'+data[i].year+'年</option>');
        }
    });
    function selectcdyear(){
        var div=$('#yearselect');
        var start=div.find("select[name=start]").val();
        var end=div.find("select[name=end]").val();
        if(start && end){
            $.getJSON(url+'year/'+start+'-'+end,function(result){
                $('#content').html(nyear(result));
            });
        }
    }
</script>

</body>
</html>
