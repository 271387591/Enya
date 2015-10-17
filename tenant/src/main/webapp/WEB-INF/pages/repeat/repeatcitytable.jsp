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
<!DOCTYPE html>
<html>
<head>
    <title>主要会展城市指标对比</title>
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
                主要会展城市指标对比
            </li>

        </ol>
    </div>
</div>
<div id="wrapper" style="margin-top: 40px">
    <div id="content-wrapper">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>主要会展城市指标对比</h5>
                        </div>
                        <div class="ibox-content">
                            <div id="ninecityTable">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script id="ninecitylistTpl" type="text/template">
    {{ if(it) { }}
    <table class="table table-bordered table-hover"  id="ninecitylistTplTable">
        <thead>
        <tr><th>名称</th><th>查看结果</th></tr>
        </thead>
        <tbody>
            {{ for(var i=0;i<it.length;i++){ }}
            {{ var dname=encodeURIComponent(encodeURIComponent(it[i].rname)); }}
            <tr><td>{{=it[i].rname}}</td><td><a target="_blank"  href="<c:url value="/html/web/ninecity/{{=it[i].rid}}?name={{=dname}}"/>">查看评估结果</a></td></tr>
            {{ } }}
        </tbody>

    </table>
    {{ } }}
</script>

<script type="text/javascript">
    jQuery(function(){
        $.get(appPath+'html/web/ninecitylist',function(data){
            var result = $.parseJSON(data);
            var tmpl = document.getElementById('ninecitylistTpl').innerHTML;
            var doTtmpl = doT.template(tmpl);
            $('#ninecityTable').html(doTtmpl(result));
        });
    })
</script>

</body>
</html>
